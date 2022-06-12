package score;

import java.io.IOException;
import java.util.List;

import bean.Page;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import student.StudentDao;

@WebServlet(urlPatterns = "/score.do")
public class ScoreServlet extends HttpServlet{
	String base = "index.jsp?inc=score/score_"; //사용자에게 되돌려줄 url
	String job="/"; //사용자의 요청처리(score.do?job=input)
	ScoreDao dao;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		dao = new ScoreDao();
		String job = req.getParameter("job");
		String url = "";
		RequestDispatcher rd = null;
		ScoreVo vo = null;
		String id="", mName="", subject="", nal="", msg="";
		int sno = 0, score=0;
		
		
		if(job == null) job="/";
		
		switch(job) {
		case"list": //score.do?job=list
			//url = base + "list.jsp"; //url=index.jsp?inc=score/score_list
			select(req,resp);
			break;
			
		case "input"://score.do?job=input
			url = base + "input.jsp"; //url=index.jsp?inc=score/score_input.jsp
			rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
			break;
			
		case "modify":
			sno = Integer.parseInt(req.getParameter("sno"));
			vo = dao.selectOne(sno);
			req.setAttribute("vo",vo);
			url = base + "modify.jsp";
			rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
			break;
			
		case "inputR": //데이터를 저장한 후 score_list로 전환
			vo = new ScoreVo();
			nal = req.getParameter("nal");
			id = req.getParameter("id");
			subject = req.getParameter("subject");
			score = Integer.parseInt(req.getParameter("score"));
			
			vo.setNal(nal);
			vo.setId(id);
			vo.setSubject(subject);
			vo.setScore(score);
			msg = dao.insert(vo);
			System.out.println(msg);
			select(req,resp);
			break;
			
		case "modifyR": //데이터를 수정한 후 score_list로 전환
			vo = new ScoreVo();
			nal = req.getParameter("nal");
			id = req.getParameter("id");
			subject = req.getParameter("subject");
			score = Integer.parseInt(req.getParameter("score"));
			sno = Integer.parseInt(req.getParameter("sno"));
			
			vo.setNal(nal);
			vo.setId(id);
			vo.setSubject(subject);
			vo.setScore(score);
			vo.setSno(sno);
			msg = dao.update(vo);
			System.out.println(msg);
			select(req,resp);
			break;
			
		case "deleteR": //데이터를 삭제한 후 score_likst로 전환
			url = base + "list.jsp";
			sno = Integer.parseInt(req.getParameter("sno"));
			msg = dao.delete(sno);
			//req.setAttribute("msg",msg);
			select(req,resp);
			break;
			
		case "view":
			sno = Integer.parseInt(req.getParameter("sno"));
			vo = dao.selectOne(sno);
			req.setAttribute("vo",vo);
			url = base + "view.jsp";
			rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
			break;
		
		case "findName":
			id = req.getParameter("id");
			mName = dao.findName(id);
			req.setAttribute("mName", mName);
			url = "score/score_find_name.jsp";
			rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
			break;
			
		default:
			select(req,resp);
		}
	}
	
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String url = "";
		Page page = new Page();
		int nowPage = 1;
		String findStr = "";
		
		
		if(req.getParameter("nowPage") == null 
		   || req.getParameter("nowPage").equals("")) {
			nowPage = 1;
		}else {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		
		System.out.println(findStr);
		page.setNowPage(nowPage);
		page.setFindStr(findStr);
		List<ScoreVo> list = dao.select(page);
		page = dao.getPage();
		
		url = base + "list.jsp";
		req.setAttribute("list",list);
		req.setAttribute("page",page);
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
}
