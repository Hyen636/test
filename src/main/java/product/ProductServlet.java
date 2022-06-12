package product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import bean.Page;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import parts.PartsVo;

@WebServlet(urlPatterns = {"/product.do", "/pro.do"}) //2개 사용하고 싶을 땐 = (urlPatterns = {"/product.do", "/pro.do"} ) => { } 사용
public class ProductServlet extends HttpServlet{
	ProductDao dao;
	RequestDispatcher rd;
	String base = "product/product_";
	
	public ProductServlet() {
		dao = new ProductDao();
		//System.out.println("ProductServlet loading....");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("call............");
		//PrintWriter out = resp.getWriter();   // ==	<% out.print(false); %>
		//out.print("result.jsp");
		
		String job="/";
		if(req.getParameter("job") != null) {
			job = req.getParameter("job");
		}
		switch(job) {
		// job = "/" or "select" 일때 (코드가 중복되면 한번에 사용 가능)
		case "/" : 
		case "select" :
			select(req,resp);
			break;
		
		case "view" : 
			selectOne(req, resp);
			break;
		
		case "findCode" :
			findCode(req, resp);
			break;
		
		case "update" : 
			update(req,resp);
			break;
			
		case "delete" :
			delete(req,resp);
			break;
			
		case "insert" : 
			insert(req,resp);
			break;
		}
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1page 목록을 가져와 반환한다.
		String url = base + "list.jsp";
		Page p = new Page();
		String temp = req.getParameter("nowPage");
		int nowPage = 1;
		
		try {
			nowPage = Integer.parseInt(temp);
		}catch (Exception ex) {
			nowPage = 1;
		}
		p.setNowPage(nowPage);
		
		String findStr = req.getParameter("findStr");
		if(findStr == null) {
			p.setFindStr("");
		}else {
			p.setFindStr(findStr);
		}
		
		List<ProductVo> list = dao.select(p);
		p = dao.getPage();
		
		req.setAttribute("list", list);
		req.setAttribute("page", p);
		
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	public void selectOne(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String url = base + "input.jsp";
		int sno = Integer.parseInt(req.getParameter("sno"));
		ProductVo vo = dao.selectOne(sno);
		
		req.setAttribute("vo", vo);
		rd = req.getRequestDispatcher(url);
		
		rd.forward(req, resp);
	}
	
	public void findCode(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//전달받은 code를 사용하여 parts 테이블에서 자료 검색
		String code = req.getParameter("find_code");
		List<PartsVo> list = dao.findCode(code);
		req.setAttribute("list", list);
		
		String url = base + "find_code.jsp";
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	public void update (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductVo vo = new ProductVo();
		vo.setSno(Integer.parseInt(req.getParameter("sno")));
		vo.setNal(req.getParameter("nal"));
		vo.setCode(req.getParameter("code"));
		vo.setEa(Integer.parseInt(req.getParameter("ea")));
		vo.setPrice(Integer.parseInt(req.getParameter("price")));
		
		String msg = dao.update(vo);
		String url = base + "input.jsp";
		
		req.setAttribute("msg", msg);
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	public void delete (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sno = Integer.parseInt(req.getParameter("sno"));
		String msg = dao.delete(sno);
		String url = base + "input.jsp";
		
		req.setAttribute("msg", msg);
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	public void insert (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductVo vo = new ProductVo();
		vo.setNal(req.getParameter("nal"));
		vo.setCode(req.getParameter("code"));
		vo.setEa(Integer.parseInt(req.getParameter("ea")));
		vo.setPrice(Integer.parseInt(req.getParameter("price")));
		
		String msg = dao.insert(vo);	
		String url = base + "input.jsp";
		
		req.setAttribute("msg", msg);
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
		
	}
}
