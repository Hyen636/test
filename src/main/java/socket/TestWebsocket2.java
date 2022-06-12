package socket;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/test2")
public class TestWebsocket2 {
	
	@OnOpen
	public void onOpen(Session s) {
		
	}
	
	@OnMessage
	public void onMessage(String jsonStr, Session s) {
		JSONParser parser = new JSONParser();
		System.out.println("jsonStr : " + jsonStr);
		try {
			JSONObject jsonObj = (JSONObject)parser.parse(jsonStr);
			System.out.println("receive data.........");
			System.out.println("id : " + jsonObj.get("id"));
			System.out.println("irum : " + jsonObj.get("irum"));
			System.out.println("phone : " + jsonObj.get("phone"));
			
			//data sending...
			String sendStr = JSONObject.toJSONString(jsonObj);
			s.getBasicRemote().sendText(sendStr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@OnClose
	public void onClose(Session s) {
		
	}
}
