package socket;

import org.json.simple.JSONObject;

import jakarta.websocket.Session;

public interface WebSocketInterface {
	public void onOpen(Session s);
	public void onMessage(String jsonStr, Session s); //어떤메세지(String jsonStr)를 누가(Session s)보냈는가?
	public void onClose(Session s);
	
	// message 내용중 command 가 insert 일때 실행하도록 하는 메서드
	public void insert(JSONObject map);
	
	// target은 데이터를 전송한 클라이언트
	public void select(JSONObject map, Session target); //어떤 데이터를 누가 요청했는가?
	public void update(JSONObject map, Session target); 
	public void delete(JSONObject map, Session target);
}
