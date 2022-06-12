package product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Page;
import mybatis.MybaFactory;
import parts.PartsVo;

public class ProductDao implements ProductInterface {
	SqlSession session;
	Page page;
	
	public ProductDao() {
		session = MybaFactory.getFactory().openSession();
	}
	
	
	@Override
	public String insert(ProductVo vo) {
		String msg = "생산정보가 저장되었습니다:)";
		try {
			int cnt = session.insert("product.insert", vo);
			if(cnt>0) {
				session.commit();
			}else {
				session.rollback();
				msg = "저장중 오류 발생:(";
			}
		}catch (Exception ex) {
			ex.printStackTrace();
			msg = ex.getMessage();
		}
		return msg;
	}

	@Override
	public List<ProductVo> select(Page p) {
		List<ProductVo> list = null;
		
		try {
			int totSize = session.selectOne("product.tot_size", p);
			p.setTotSize(totSize);
			p.compute();
			p.setStartNo(p.getStartNo()-1);
			this.page = p;
			
			list = session.selectList("product.select",page);
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	@Override
	public ProductVo selectOne(int sno) {
		ProductVo vo = null;
		try {
			vo = session.selectOne("product.view",sno);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	@Override
	public List<PartsVo> findCode(String code) {
		List<PartsVo> list = null; //바로 만들지 않고 null로 가져가는 이유는 쓸데없이 객체를 만들지 않기 위해
		try {
			list = session.selectList("product.find_code",code);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	@Override
	public String update(ProductVo vo) {
		String msg = "생산정보가 수정되었습니다:)";
		try {
			int cnt = session.update("product.update", vo);
			if(cnt>0) {
				session.commit();
			}else {
				session.rollback();
				msg = "수정중 오류발생:(";
			}
		}catch (Exception ex) {
			ex.printStackTrace();
			msg = ex.getMessage();
		}
		return msg;
	}

	@Override
	public String delete(int sno) {
		String msg = "생산정보가 삭제되었습니다:)";
		try {
			int cnt = session.delete("product.delete",sno);
			if(cnt>0) {
				session.commit();
			}else {
				session.rollback();  //table 하나만 쓸때는 굳이 안해도 상관 x // 여러개 쓸때는 필수!
				msg = "삭제중 오류발생:(";
			}
		}catch (Exception ex) {
			ex.printStackTrace();
			msg = ex.getMessage();
		}
		return msg;
	}

	 	
	public Page getPage() {
		return this.page;
	}
}
