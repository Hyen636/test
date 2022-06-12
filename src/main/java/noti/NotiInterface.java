package noti;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import bean.Page;

public interface NotiInterface {
	public boolean   insert(JSONObject map);
	public List<Map> select(Page page);
	public Map 		 selectLastOne();
	public boolean	 update(JSONObject map);
	public boolean 	 delete(JSONObject map);
}
