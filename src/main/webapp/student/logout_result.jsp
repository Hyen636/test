<%@ page import="student.StudentDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>logout_result</title>
	</head>
	
	<body>
		<%
			StudentDao dao = new StudentDao();
			String msg = dao.logout(request);
		%>
		<script>
			alert('<%=msg%>'); 
			location.href='../index.jsp';
		</script>
	</body>
</html>