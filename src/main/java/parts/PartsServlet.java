package parts;

import java.io.IOException;
import java.util.List;

import bean.Page;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/parts.do")
public class PartsServlet extends HttpServlet{
	RequestDispatcher rd;
	String base = "parts/parts_";
	PartsDao dao;
	
	//servlet이 실행될때 dao 만들기
	public PartsServlet() {
		dao = new PartsDao();
	}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String job = req.getParameter("job");
		int nowPage = 0;
		Page page = null;
		List<PartsVo> list = null;
		String url = "";
		String code = null;
		PartsVo vo = null;
		String msg = "";
		
		//메뉴에서 제품관리를 클릭했을 경우 => job = null 이기 때문에 처리
		if(job == null || job.equals("")) {
			job="/";
		}
		
	switch (job) {
		case "select":
			String findStr = req.getParameter("findStr");
			
			try{
				nowPage = Integer.parseInt(req.getParameter("nowPage"));
			}catch(Exception ex) {
				nowPage = 1;
			}
			
			page = new Page();
			page.setFindStr(findStr);
			page.setNowPage(nowPage);
			
			list = dao.select(page);
			page = dao.getPage();
			
			
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			
			url = base + "list.jsp";
			rd = req.getRequestDispatcher(url);
			
			break;
		
			
		case "view":
			url = base + "input.jsp";
			rd = req.getRequestDispatcher(url);
			code = req.getParameter("code");
			vo = dao.selectOne(code);
			req.setAttribute("vo", vo);
			
			break;
			
		case "update":
			vo = new PartsVo();
			vo.setCode(req.getParameter("code"));
			vo.setCodeName(req.getParameter("codeName"));
			vo.setSpec(req.getParameter("spec"));
			try {
				vo.setPrice(Integer.parseInt(req.getParameter("price")));
			}catch (Exception ex) {
				vo.setPrice(0);
			}
			
			msg = dao.update(vo);
			url = base+"input.jsp";
			req.setAttribute("vo",vo);
			req.setAttribute("msg", msg);
			
			rd = req.getRequestDispatcher(url);
			
			break;
		
		case "delete":
			code = req.getParameter("code");
			msg = dao.delete(code);
			
			url = base + "input.jsp";
			req.setAttribute("msg", msg);
			rd = req.getRequestDispatcher(url);
					
			break;
			
		case "insert":
			vo = new PartsVo();
			vo.setCode(req.getParameter("code"));
			vo.setCodeName(req.getParameter("codeName"));
			vo.setSpec(req.getParameter("spec"));
			try {
				vo.setPrice(Integer.parseInt(req.getParameter("price")));
			}catch (Exception ex) {
				vo.setPrice(0);
			}
			
			msg = dao.insert(vo);
			
			req.setAttribute("msg", msg);
			url = base + "input.jsp";
			rd = req.getRequestDispatcher(url);
			
			break;
			
		default:
			
			page = new Page();
			page.setFindStr(""); //js에서 parts.do로 불렀을때 바꿔주기
			page.setNowPage(1);  //js에서 parts.do로 불렀을때 바꿔주기
			
			list = dao.select(page);
			page = dao.getPage();
			
			
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			
			url = base + "list.jsp";
			rd = req.getRequestDispatcher(url);
		
			break;
	}
		
		rd.forward(req,resp); 
	}
	
}
