package student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.AES;
import bean.Page;
import student.StudentVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class StudentDao implements StudentInterface {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	Page p;
	AES aes;
	
	public StudentDao(){
		this.conn = new DBConn().getConn();
		aes = new AES();
	}
	
	//로그인
	public String login(HttpServletRequest req) {
		String mId = req.getParameter("mId");
		String mPwd = req.getParameter("mPwd");
		mPwd = aes.enc(mPwd);
		String msg = String.format("id:%s, pwd:%s", mId, mPwd);
		HttpSession session = req.getSession();
		String sql = "select * from student where id=? and pwd=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, mPwd);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				msg = mId + "님 방가:)";
				session.setAttribute("mId", mId);
			}else {
				msg = "아이디 또는 암호를 확인해주세요:(";
			}
		}catch (Exception ex) {
			msg = ex.getMessage();
			session.setAttribute("mId", null);
		}
		return msg;
	}
	
	//로그아웃
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String msg ="로그아웃 완료 빠이:)";
		session.setAttribute("mId", null);
		return msg;
	}
	
	//아이디찾기
	public String findId(HttpServletRequest req) {
		String msg = "";
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		
		try {
			String sql = "select id from student where phone=? and email=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, phone);
			ps.setString(2, email);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				msg = rs.getString("id");
			}else {
				msg = null;
			}
	}catch (Exception ex) {
		msg = ex.getMessage();
		
	}
	return msg;
}
	
	//암호찾기
		public String findPwd(HttpServletRequest req) {
			String msg = "";
			String id = req.getParameter("mId");
			String email = req.getParameter("email");
			
			try {
				String sql = "select pwd from student where id=? and email=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, email);
				
				rs = ps.executeQuery();
				if(rs.next()) {
					//복호화된 암호 전달
					msg = aes.dec(rs.getString("pwd"));
				}else {
					msg = null;
				}
		}catch (Exception ex) {
			msg = ex.getMessage();
			
		}
		return msg;
		}
		
		public String insert(HttpServletRequest req) {
			String msg = "";
			String id = req.getParameter("id");
			String mName = req.getParameter("mName");
			String gender = req.getParameter("gender");
			String pwd = req.getParameter("pwd");
			String phone = req.getParameter("phone");
			int zipcode = Integer.parseInt(req.getParameter("zipcode"));
			String address = req.getParameter("address");
			String email = req.getParameter("email");
			
			try {
				//암호화
				pwd = aes.enc(pwd);
				
				String sql = "insert into student(id,mName,gender,pwd,phone,zipcode,address,email) "
						   + "values(?,?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, mName);
				ps.setString(3, gender);
				ps.setString(4, pwd);
				ps.setString(5, phone);
				ps.setInt(6, zipcode);
				ps.setString(7, address);
				ps.setString(8, email);
				
				conn.setAutoCommit(false);
				int n = ps.executeUpdate();
				if(n>0) {
					conn.commit();
					msg = "학생정보가 저장되었습니다:)";
				}else {
					msg = "학생정보 저장중 오류 발생:(";
					conn.rollback();
				}
			}catch (Exception ex) {
				msg = ex.getMessage();
				
			}
			
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return msg;
		}
	
	
	
	@Override
	public boolean insert(StudentVo vo) {
		boolean b=false;
		String sql = "insert into student(id, mName, pwd, email, phone) "
				   + " values(?, ?, ?, ?, ?)";
				
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getmName());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getPhone());
			
			conn.setAutoCommit(false);
			int n = ps.executeUpdate();
			if(n>0) {
				b = true;
				conn.commit();
			}else{
				conn.rollback();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}		
		return b;
	}
	
	
	//학생관리조회 검색
	@Override
	public List<StudentVo> select(String findStr, int nowPage) {
		List<StudentVo> list = new ArrayList<StudentVo>();
		String sql = "";
		this.p = new Page();
		int totSize = 0;
		
		try {
			//검색어가 들어 있는 전체 건수
			sql = "select count(id) cnt from student " 
					   + " where id like ? or mName like ? or email like ? or phone like ? or address like ? or zipcode like ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setString(4, "%" + findStr + "%");
			ps.setString(5, "%" + findStr + "%");
			ps.setString(6, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			if(rs.next()) {
				totSize = rs.getInt("cnt");
			}
			
			p.setTotSize(totSize);
			p.setNowPage(nowPage);
			p.compute();
				
			
			sql = "select * from student " 
				+ " where id like ? or mName like ? or email like ? or phone like ? or address like ? or zipcode like ? "
				+ " limit ?,?";
		
		
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setString(4, "%" + findStr + "%");
			ps.setString(5, "%" + findStr + "%");
			ps.setString(6, "%" + findStr + "%");
			ps.setInt(7, p.getStartNo()-1);
			ps.setInt(8, p.getListSize());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StudentVo vo = new StudentVo();
				vo.setId(rs.getString("id"));
				vo.setmName(rs.getString("mName"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vo.setZipcode(rs.getInt("zipcode"));
				vo.setPwd(rs.getString("pwd"));
				
				list.add(vo);
				
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	@Override
	public StudentVo selectOne(String id) {
		String sql = "";
		StudentVo vo = null;
		
		try {
			sql = "select * from student where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				vo = new StudentVo();
				vo.setId(rs.getString("id"));
				vo.setmName(rs.getString("mName"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vo.setZipcode(rs.getInt("zipcode"));
				vo.setPwd(rs.getString("pwd"));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}

	
	// 수정
	public String update(HttpServletRequest req) {
		String msg = "";
		String sql = "update student set mName=?, email=?, "
				   + " phone=?, address=?, gender=?, zipcode=? "
				   + " where id=? and pwd=?";
		String id = req.getParameter("id");
		String mName = req.getParameter("mName");
		String gender = req.getParameter("gender");
		String phone = req.getParameter("phone");
		String pwd = req.getParameter("pwd");
		int zipcode = Integer.parseInt(req.getParameter("zipcode"));
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		
		try {
			//암호화
			pwd = aes.enc(pwd);
			
			ps = conn.prepareStatement(sql);
			ps.setString(1,  mName);
			ps.setString(2,  email);
			ps.setString(3,  phone);
			ps.setString(4,  address);
			ps.setString(5,  gender);
			ps.setInt(6, zipcode);
			
			ps.setString(7, id);
			ps.setString(8, pwd);
			
			conn.setAutoCommit(false);
			
			int n = ps.executeUpdate();
			if(n>0) {
				msg= "학생정보가 수정되었습니다:)";
				conn.commit();
			}else {
				msg = "학생정보 수정중 오류발생:(";
				conn.rollback();
			}
			
		}catch(Exception ex) {
			msg = ex.getMessage();
		}
		
		try {
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return msg;
	}
	
	
	@Override
	public boolean update(StudentVo vo) {
		boolean b=false;
		String sql = "update student set mName=?, email=?, phone=? where id=? and pwd=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmName());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getId());
			ps.setString(5, vo.getPwd());
			
			conn.setAutoCommit(false);
			
			int n = ps.executeUpdate();
			if(n>0) {
				b=true;
				conn.commit();
			}else {
				conn.rollback();
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return b;
	}

	
	//삭제
	public String delete(HttpServletRequest req) {
		String msg = "학생정보를 삭제하였습니다:)";
		
		try {
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			pwd = aes.enc(pwd);
			boolean b = delete(id,pwd);
			if(!b) {
				msg = "학생정보 삭제중 오류가 발생했습니다:(";
			}
			
		}catch(Exception ex) {
			msg = ex.getMessage();
		}
		
		return msg;
	}
	
	@Override
	public boolean delete(String id, String pwd) {
		boolean b = false;
		String sql = "delete from student where id=? and pwd=?";
		try {	
			//암호화
			
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			
			conn.setAutoCommit(false);
			
			int n = ps.executeUpdate();
			if(n>0) {
				b=true;
				conn.commit();
			}else {
				conn.rollback();
			}
		}catch (Exception ex){
			ex.printStackTrace();
		}
		try {
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return b;
	}

	
	// p getter 
	public Page getP() {
		return p;
	}

}
