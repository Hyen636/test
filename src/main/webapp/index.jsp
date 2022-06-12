<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Index</title>
		<link rel='stylesheet' type='text/css' href='./css/index.css'>
	</head>
	
	<body>
		<%
			String inc = request.getParameter("inc");
			
			if(inc == null){
			inc = "./temp.jsp";
			}
		%>
		<div id='main'>
			<header id='header'>
				<!-- 정적 include = 변수 사용 X / 
					코드가 복사된 후 tomcat이 컴파일하면 servlet code(java code) 생성됨-->
				<%@ include file="./student/login_out.jsp" %>
			</header>
			<div id='top'>
				<div id='ci'><a href='index.jsp'>Welcome</a></div>
				<nav id='nav'>
					<ul>
						<li><a href='index.jsp'>HOME</a></li>
						<li><a href='index.jsp?inc=student/student_list.jsp'>학생관리</a></li>
						<li><a href='./score.do'>성적관리</a></li>
						<li><a href='index.jsp?inc=parts/parts_main.jsp'>제품관리</a></li>
						<li><a href='index.jsp?inc=product/product_main.jsp'>생산관리</a></li>
						<li><a href='index.jsp?inc=noti/noti_main.jsp'>공지사항</a></li>
						<li><a href='board.do'>게시판</a></li>
					</ul>
				</nav>
			</div>
			
			<section id='section'>
				<!-- 동적 include = 변수로 설정된 페이지를 로딩할 수 있음 -->
				<jsp:include page="<%=inc%>"/> 
			</section>
			
			<footer id='footer'>
				서울 봉천 노랑달걀 7층<br/>
				tel : 02-1111-1111<br/>
				fax : 02-1111-1111
			</footer>
		</div>
	</body>
	
</html>