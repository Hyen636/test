<%@page import="student.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student_input_result</title>
</head>
<body>
<form name='frm_student' id='frm_student' method='post'> 
	<input type='text' name='findStr' value='${param.findStr}'/>
	<input type='text' name='nowPage' value='${param.nowPage}'/>
</form>

<%
	StudentDao dao = new StudentDao();
	String msg = dao.insert(request);
%>


<script>
alert('<%=msg%>');    
	let url = '../index.jsp?inc=student/student_input_form.jsp';
	let frm = document.frm_student;
	frm.action = url;
	frm.submit();
</script>

</body>
</html>