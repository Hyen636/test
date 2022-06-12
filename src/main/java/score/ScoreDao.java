package score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Page;
import student.StudentVo;


public class ScoreDao implements ScoreInterface {
	Page page;
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public ScoreDao() {
		conn = new DBConn().getConn();
	}
	
	public void closeDB() {
		try {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	

	@Override
	public String insert(ScoreVo vo) {
		String msg = "";
		String sql = "insert into score (id, nal, subject, score) values( ?, ?, ?, ?)";
				   
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getNal());
			ps.setString(3, vo.getSubject());
			ps.setInt(4,vo.getScore());
			
			conn.setAutoCommit(false);
			int n= ps.executeUpdate();
			if(n>0) {
				msg = "학생성적이 정상적으로 저장되었습니다:)";
				conn.commit();
			}else {
				msg = "학생성적 저장중 오류 발생:(";
				conn.rollback();
			}
		}catch (Exception ex) {
			msg = ex.getMessage();
		}
		//closeDB();
		return msg;
	}

	@Override
	public String update(ScoreVo vo) {
		String msg = "";
		String sql = "update score set id=?, nal=?, subject=?, score=? where sno=?";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getNal());
			ps.setString(3, vo.getSubject());
			ps.setInt(4, vo.getScore());
			ps.setInt(5, vo.getSno());
			
			conn.setAutoCommit(false);
			int n = ps.executeUpdate();
			if(n>0) {
				msg = "학생성적이 수정되었습니다:)";
				conn.commit();
			}else {
				msg = "학생성적 수정중 오류 발생:(";
				conn.rollback();
			}
		} catch (Exception ex) {
			msg = ex.getMessage();
			ex.printStackTrace();
		}
		//closeDB();
		return msg;
	}

	@Override
	public String delete(int sno) {
		String msg = "";
		String sql = "delete from score where sno=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sno);
			
			conn.setAutoCommit(false);
			int n = ps.executeUpdate();
			if(n>0) {
				msg = "학생성적을 삭제하였습니다:)";
				conn.commit();
			}else {
				msg = "학생성적을 삭제중 오류 발생:(";
				conn.rollback();
			}
		}catch(Exception ex) {
			msg = ex.getMessage();
			ex.printStackTrace();
		}
		//closeDB();
		return msg;
	}

	@Override
	public ScoreVo selectOne(int sno) {
		String sql = "";
		ScoreVo vo = null;
		try {
			sql = "select * from score sc join student st "
				+ " on st.id = sc.id "
				+ " where sno = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sno);
			rs = ps.executeQuery();
			if(rs.next()) {
				vo = new ScoreVo();
				vo.setSno(rs.getInt("sno"));
				vo.setId(rs.getString("id"));
				vo.setmName(rs.getString("mName"));
				vo.setSubject(rs.getString("subject"));
				vo.setNal(rs.getString("nal"));
				vo.setScore(rs.getInt("score"));
				vo.setPhone(rs.getString("phone"));
				vo.setEmail(rs.getString("email"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		//closeDB();
		return vo;
	}

	@Override
	public List<ScoreVo> select(Page page) {
		List<ScoreVo> list = new ArrayList<ScoreVo>();
		String sql = "";
		this.page = page;
		int totSize = 0;
		
		try {
			//검색어가 들어 있는 전체 건수
			sql = "select count(sc.sno) cnt from score sc left join student st " 
				+ " on sc.id = st.id "
				+ " where sc.id like ? or mName like ? "
				+ " or subject like? or nal like?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + page.getFindStr() + "%");
			ps.setString(2, "%" + page.getFindStr() + "%");
			ps.setString(3, "%" + page.getFindStr() + "%");
			ps.setString(4, "%" + page.getFindStr() + "%");
			
			rs = ps.executeQuery();
			if(rs.next()) {
				totSize = rs.getInt("cnt");
			}
			
			this.page.setTotSize(totSize);
			this.page.compute();
				
			
			sql = "select * from score sc left join student st " 
					+ " on sc.id = st.id "
					+ " where sc.id like ? or mName like ? "
					+ " or subject like? or nal like? "
					+ " limit ?,?";
		
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + page.getFindStr() + "%");
			ps.setString(2, "%" + page.getFindStr() + "%");
			ps.setString(3, "%" + page.getFindStr() + "%");
			ps.setString(4, "%" + page.getFindStr() + "%");
			ps.setInt(5, this.page.getStartNo()-1);
			ps.setInt(6, this.page.getListSize());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ScoreVo vo = new ScoreVo();
				vo.setSno(rs.getInt("sno"));
				vo.setId(rs.getString("id"));
				vo.setmName(rs.getString("mName"));
				vo.setSubject(rs.getString("subject"));
				vo.setScore(rs.getInt("score"));
				vo.setNal(rs.getString("nal"));
				list.add(vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		//closeDB();
		return list;
	}

	@Override
	public Page getPage() {
		return page;
	}
	
	//아이디 검색
	public String findName(String id) {
		String mName = "";
		try {
			String sql = "select mName from student where id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				mName = rs.getString("mName");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return mName;
	}
	
	
	
	
	
	
	public static void main(String[] args) {
		ScoreDao dao = new ScoreDao();
		ScoreVo vo = new ScoreVo();
		vo.setId("t001");
		vo.setSubject("영어"); 
		vo.setScore(90);
		vo.setNal("2022-05-19");
		String msg = dao.insert(vo);
		System.out.println(msg);
	}
}
