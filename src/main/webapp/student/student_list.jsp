<%@page import="bean.Page"%>
<%@page import="student.StudentVo"%>
<%@page import="java.util.List"%>
<%@page import="student.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student_list</title>
		<link rel='stylesheet' type='text/css' href='./css/student.css'>
	</head>
	<body>
		<%
			StudentDao dao = new StudentDao();
			int nowPage = 1;
			if(request.getParameter("nowPage") != null){
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			
			String findStr = request.getParameter("findStr");
			if(findStr == null) findStr = "";
			List<StudentVo>list = dao.select(findStr,nowPage);
			Page p = dao.getP();
		%>
	
	
		<div id='student_list'>
			<h2>학생정보 조회</h2>
			<form name='frm_student_list' id='frm_student_list' method='post'>
				<button type='button' id='btnInput'>입력</button>
				<input type='text' name='findStr' size='20'
				       value='${param.findStr}'>
				<button type='button' id='btnFind'>검색</button>
				<input type='hidden' name='nowPage' value='<%=nowPage%>'/>
				<input type='hidden' name='id'/>
			</form>
			<div id='list'>
				<div class='title'>
					<span class='no'>No.</span>
					<span class='id'>아이디</span>
					<span class='mName'>성명</span>
					<span class='gender'>성별</span>
					<span class='phone'>연락처</span>
					<span class='address'>주소</span>
					<span class='email'>이메일</span>
					<span class='zipcode'>우편번호</span>
					<span class='pwd'>암호</span>
				</div>
				<div class='items'>
				<%
					int no = p.getStartNo();
					for(StudentVo v : list){
				%>
					<div class='item' onclick="modify('<%=v.getId()%>')">
					<span class='no'><%=no%></span>
					<span class='id'><%=v.getId()%></span>
					<span class='mName'><%=v.getmName()%></span>
					<span class='gender'><%=v.getGender()%></span>
					<span class='phone'><%=v.getPhone()%></span>
					<span class='address'><%=v.getAddress()%></span>
					<span class='email'><%=v.getEmail()%></span>
					<span class='zipcode'><%=String.format("%05d",v.getZipcode())%></span>
					<span class='pwd'><%=v.getPwd()%></span>
					</div>
					<%
						no++;
						} 
					%>
				</div>
				<div class='paging'>
				<% if(p.getStartPage() > 1) { %>
					<button type='button' class='btnFirst' onclick='movePage(1)'>맨첨</button>
					<button type='button' class='btnPrev' onclick='movePage(<%=p.getStartPage()-1%>)'>이전</button>
				<% } %>
					
				<% for(int i=p.getStartPage(); i<=p.getEndPage();i++){ %>
					<button type='button' class='First' onclick='movePage(<%=i%>)'> <%=i %></button>
				<% } %>
					
				<% if(p.getEndPage() < p.getTotPage()) { %>	
					<button type='button' class='btnNext' onclick = 'movePage(<%=p.getEndPage()+1%>)'>다음</button>
					<button type='button' class='btnLast' onclick='movePage(<%=p.getTotPage()%>)'>맨끝</button>
				<% } %>	
				</div>
			</div>
		</div>
		<script src='./js/student.js'></script>
	

	</body>
</html>