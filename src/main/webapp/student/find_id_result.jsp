<%@ page import="student.StudentDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find_id_result</title>
</head>
<body>
<%
StudentDao dao = new StudentDao();
String msg = dao.findId(request);
%>
<script>
	<% if(msg != null){
	%>	
	alert('회원님의 아이디는 <%=msg%> 입니다:)');
	location.href='index.jsp?inc=student/form_login.jsp';
	<%
	}else{
	%>
	alert('연락처 또는 이메일을 확인해주세요:(');
	location.href='index.jsp?inc=student/form_find_id.jsp';
	<%
	}
	%>
</script>
</body>
</html>