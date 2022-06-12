package socket;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/test")
public class TestWebSocket {
	
	@OnOpen //클라이언트가 접속되면 자동으로 호출됨
	public void onOpen(Session s) {
		System.out.println("클라이언트가 접속됨");
		System.out.println(s.getRequestURI().getHost()); //서버 주소
	}
	
	@OnMessage 
	public void onMessage(String data, Session s) {
		System.out.println("receive data : " + data);
		
		// 수신된 jsonStr(data) 타입의 데이터를 JSONObject로 변환
		JSONParser parser = new JSONParser();
		try {
			JSONObject jsonObj = (JSONObject)parser.parse(data);
			
			System.out.println("message : " + jsonObj.get("msg"));
			System.out.println("command : " + jsonObj.get("command"));
			System.out.println("nowPage : " + jsonObj.get("nowPage"));
			System.out.println("findStr : " + jsonObj.get("findStr"));
			
			// client로 message 전송
			JSONObject sendObj = new JSONObject();
			sendObj.put("command", "receive");
			sendObj.put("id", "web socket server");
			sendObj.put("findStr", "홍길동");
			sendObj.put("nowPage", 50);
			sendObj.put("message", jsonObj.get("msg"));
			
			String sendStr = JSONObject.toJSONString(sendObj);
			s.getBasicRemote().sendText(sendStr);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@OnClose // 브라우저의 URL이 현재위치를 벗어났을 때
	public void onClose(Session s) {
		System.out.println("클라이언트가 종료됨");
	}
}
