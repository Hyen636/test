package board;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/board.do") // board.do가 불려지면 servlet으로서 정보를 처리할 것임.
public class BoardServlet extends HttpServlet{
   String base = "index.jsp?inc=./board/board_"; // default 경로 지정
   RequestDispatcher rd;

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doPost(req, resp); // get을 받으면 무조건 post로
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String job = "";
      String url = "";
      if(req.getParameter("job") != null) {
         job = req.getParameter("job");
      }
            
      switch(job) {
      case "":
      case "select":
         select(req, resp); // select가 들어오든 공백이 들어오든, 아래의 job이 아닌 다른 유형이 들어올 때는 무조건 select로 고고
         break;				
      case "input":
         input(req, resp);
         break;
      case "view":
         view(req, resp);
         break;
      case "inputR": // R은 result의 준말
         inputR(req, resp);
         break;
      case "modify":
         modify(req, resp);
         break;
      case "deleteR":
         deleteR(req, resp);
         break;
      case "repl":
         repl(req, resp);
         break;
      case "modifyR":
         modifyR(req, resp);
         break;
      case "replR":
         replR(req, resp);
         break;
      default:
         select(req, resp);
      }
   }
   
   //select =  1. 메뉴 , 2. 조회, 3.페이지이동, 4. 취소
   public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String url = base + "list.jsp"; // 매번 url 선언하기 싫다면 필드로 빼줘도 됨. 
      rd = req.getRequestDispatcher(url);
      rd.forward(req, resp);
   }
   
   public void input(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String url = base + "input.jsp";
      rd = req.getRequestDispatcher(url);
      rd.forward(req, resp);
   }
   
   public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String url = base + "view.jsp";
      rd = req.getRequestDispatcher(url);
      rd.forward(req, resp);
   }
   
   public void inputR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // R이 없는 애들은 다 각자의 폼으로 이동하지만, modify -> 수정폼, repl -> 답변폼
      // R 들어간 애들은 다 저장 후 목록으로 돌아가게끔 하는 것이 정석
      String url = base + "list.jsp";
      rd = req.getRequestDispatcher(url);
      rd.forward(req, resp);
   }
   
   public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //삭제 로직
	   
	  String url = base + "modify.jsp";
      rd = req.getRequestDispatcher(url);
      rd.forward(req, resp);
   }
   
   public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String url = base + "list.jsp";
      rd = req.getRequestDispatcher(url);
      rd.forward(req, resp);
   }
   
   public void repl(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String url = base + "repl.jsp";
      rd = req.getRequestDispatcher(url);
      rd.forward(req, resp);
   }
   
   public void modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String url = base + "list.jsp";
      rd = req.getRequestDispatcher(url);
      rd.forward(req, resp);
   }
   
   public void replR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String url = base + "list.jsp";
      rd = req.getRequestDispatcher(url);
      rd.forward(req, resp);
   }
}