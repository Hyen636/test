<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>scope</title>
	</head>

	<body>	
		<h1>Scope</h1>
		<%
		//servlet에서 실행되는 코드
		String msg = "정상적으로 저장:)"; //db처리 결과를 리턴 받음
		request.setAttribute("msg",msg);
		
		session.setAttribute("mid","hong");
		
		request.setAttribute("email","request@korea.com");
		session.setAttribute("email","session@korea.com");
		%>
		
		<h3>result</h3>
		<hr/>
		<li>처리결과 : ${requestScope.msg}</li>
		<li> [ ${sessionScope.mid} ] 님 방가:)</li>
		
		<li>${mid}</li> 
		<li>${email}</li> <!-- 똑같은 키값이 있을때 page->request->session->application 순으로 찾는다 -->
		<li>R : ${requestScope.email}</li> <!-- 똑같은 키값이 있을때 다이렉트로 지정해야 원하는 값을 가져올 수 있다. -->
		<li>S : ${sessionScope.email}</li>
	</body>
</html>