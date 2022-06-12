package noti;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;

import bean.Page;
import mybatis.MybaFactory;

public class NotiDao implements NotiInterface {
	SqlSession session;
	Page page;
	
	public NotiDao() {
		session = MybaFactory.getFactory().openSession();
	}
	
	public Page getPage() {
		return this.page;
	}
	
	
	@Override
	public boolean insert(JSONObject map) {
		boolean b = false;
		
		try {
			int cnt = session.insert("noti.insert", map);
			if(cnt>0) {
				session.commit();
				b = true;
			}else {
				session.rollback();
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}

	@Override
	public List<Map> select(Page page) {
		List<Map> list = null;
		
		try {
			int totSize = session.selectOne("noti.totSize", page);
			page.setTotSize(totSize);
			page.compute();
			this.page = page;
			page.setStartNo(page.getStartNo()-1);
			list = session.selectList("noti.select", page);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Map selectLastOne() {
		Map map = null;
		try {
			map = session.selectOne("noti.selectLastOne");
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return map;
	}

	@Override
	public boolean update(JSONObject map) {
		boolean b = false;
		try {
			int cnt = session.update("noti.update", map);
			if(cnt>0) {
				session.commit();
				b = true;
			}else {
				session.rollback();
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean delete(JSONObject map) {
		boolean b = false;
		try {
			int cnt = session.delete("noti.delete", map);
			if(cnt>0) {
				session.commit();
				b = true;
			}else {
				session.rollback();
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}
	
}
