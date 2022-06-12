package parts;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Page;
import mybatis.MybaFactory;

public class PartsDao implements PartsInterface {
	SqlSession session;
	Page page;
	
	public PartsDao() {
		session = MybaFactory.getFactory().openSession();
	}
	
	
	@Override
	public String insert(PartsVo vo) {
		String msg = "자료가 저장되었습니다:)";
		try {
			int cnt = session.insert("parts.insert",vo);
			if(cnt>0) {
				session.commit();
			}else {
				msg = "저장중 오류 발생:(";
				session.rollback();
			}
		}catch (Exception ex) {
			msg = ex.getMessage();
		}
		return msg;
	}

	@Override
	public List<PartsVo> select(Page page) {
		List<PartsVo> list = null;
		
		try {
			int totSize = session.selectOne("parts.tot_size",page);
			page.setTotSize(totSize);
			page.compute();
			this.page = page;
			
			page.setStartNo(page.getStartNo()-1);

			list = session.selectList("parts.select",page);
					
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	@Override
	public PartsVo selectOne(String code) {
		PartsVo vo = null;
		
		try {
			vo = session.selectOne("parts.view",code);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}

	@Override
	public String update(PartsVo vo) {
		String msg = "정상적으로 수정안료:)";
		
		try {
			int cnt = session.update("parts.update",vo);
			if(cnt>0) {
				session.commit();
			}else {
				msg = "제품관리 수정중 오류발생:(";
				session.rollback();
			}
		}catch (Exception ex) {
			ex.printStackTrace();
			msg = ex.getMessage();
		}
		return msg;
	}

	@Override
	public String delete(String code) {
		String msg = "삭제 OK:)";
		try {
			int cnt = session.delete("parts.delete",code);
			if(cnt>0) {
				session.commit();
			}else {
				session.rollback();
				msg = "삭제중 오류 발생:(";
			}
		}catch (Exception ex) {
			msg = ex.getMessage();
			ex.printStackTrace();
		}
			return msg;
	}


	public Page getPage() {
		return page;
	}


	public void setPage(Page page) {
		this.page = page;
	}


	public SqlSession getSession() {
		return session;
	}

	
	
}
