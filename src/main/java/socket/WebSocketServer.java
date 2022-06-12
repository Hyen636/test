package socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import bean.Page;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import noti.NotiDao;


@ServerEndpoint("/noti") //끝자락 명령어 지정

public class WebSocketServer implements WebSocketInterface {

	// 접속된 클라이언트(Session)을 서버의 공유자원(정적형)에 등록하여 사용
	private static Set<Session> clients = 
			Collections.synchronizedSet(new HashSet<Session>());
	
	NotiDao dao;
	
	public WebSocketServer() {
		dao = new NotiDao();
	}
	
	@Override
	@OnOpen
	public void onOpen(Session s) {
		// 신규 접속자인 경우
		if(clients.contains(s)) return;
		
		// 신규 접속자를 clients에 추가(등록)
		clients.add(s);
		System.out.println("클라이언트가 접속됨");
		// 기존 등록된 공지사항 목록을 신규 접속자에게 전달
		Page page = new Page();
		page.setNowPage(1);
		page.setFindStr("");
		List list = dao.select(page);
		page = dao.getPage(); //새롭게 계산된 페이지 정보
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("command", "init");
		jsonObj.put("totPage", page.getTotPage());
		jsonObj.put("list", list);
		
		String jsonStr = JSONObject.toJSONString(jsonObj);
		//System.out.println("init data.....");
		//System.out.println(jsonStr);
		
		try {
			s.getBasicRemote().sendText(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	@OnMessage
	public void onMessage(String jsonStr, Session s) {
		JSONParser jParser = new JSONParser();
		try {
			JSONObject jsonObj = (JSONObject)jParser.parse(jsonStr);
			String command = (String)jsonObj.get("command");
			
			switch(command) {
			case "insert":
				insert(jsonObj);
				break;
			case "update":
				update(jsonObj, s);
				break;
			case "delete":
				delete(jsonObj, s);
				break;
			case "select":
				select(jsonObj, s);
				break;
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	@Override
	@OnClose
	public void onClose(Session s) {
		clients.remove(s);
		System.out.println("접속 해제됨.....");
	}

	@Override
	public void insert(JSONObject jsonObj) {
		JSONObject vo   = (JSONObject) jsonObj.get("vo");
		Map last = null;
		
		if(dao.insert(vo)) {
			last = dao.selectLastOne();
			jsonObj.put("vo", last);
			
			String jsonStr = JSONObject.toJSONString(jsonObj);
			
			for(Session s : clients) {
				try {
					s.getBasicRemote().sendText(jsonStr);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}else {
			System.out.println("저장중 오류발생:(");
		}
	}


	@Override
	public void update(JSONObject map, Session target) {
		String jsonStr = "";
		JSONObject vo = (JSONObject) map.get("vo");
		
		try {
			if(dao.update(vo)) {
				jsonStr = JSONObject.toJSONString(map);
				for(Session s : clients) {
					s.getAsyncRemote().sendText(jsonStr);
				}
			}else {
				map.put("command", "공지 수정중 오류발생:(");
				map.put("result", "reject");
				jsonStr = JSONObject.toJSONString(map);
				
				target.getBasicRemote().sendText(jsonStr);
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public void delete(JSONObject map, Session target) {
		String jsonStr = "";
		JSONObject vo = (JSONObject) map.get("vo");
		try {
			if(dao.delete(vo)) {
				jsonStr = JSONObject.toJSONString(map);
				for(Session s : clients) {
					s.getBasicRemote().sendText(jsonStr);
				}
			}else {
				map.put("message","!공지 삭제중 오류 발생:(");
				map.put("result", "reject");
				jsonStr = JSONObject.toJSONString(map);
				
				target.getBasicRemote().sendText(jsonStr);
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public void select(JSONObject map, Session target) {
		String jsonStr = "";
		try {
			Page page = new Page();
			Long tempLong = (Long)map.get("nowPage");
			int nowPage = tempLong.intValue();
			String findStr = (String)map.get("findStr");
			
			page.setNowPage(nowPage);
			page.setFindStr(findStr);
			//page.compute(); //삭제
			
			List<Map> list = dao.select(page);
			page = dao.getPage(); //추가
			
			map.put("totPage", page.getTotPage());
			map.put("list", list);
			
			jsonStr = JSONObject.toJSONString(map);
			target.getBasicRemote().sendText(jsonStr);
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
