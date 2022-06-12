<%@page import="student.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student_modify_result</title>
</head>
<body>
<form name = 'frm_student' method = 'post'>
	<input type ='hidden' name='findStr' value = '${param.findStr }'/>
	<input type = 'hidden' name = 'nowPage' value = '${param.nowPage }'/>
</form>
<%
	StudentDao dao = new StudentDao();
	String msg = dao.update(request);
	
%>

	<script>
	alert('<%=msg%>');
	let url = '../index.jsp?inc=student/student_list.jsp';
	let frm = document.frm_student;
	frm.action = url;
	frm.submit();
	</script>
	<ul>
	<li> id : ${param.id} </li>
	<li> mName : ${param.mName }</li>
	<li> gender : ${param.gender }</li>
	<li> findStr : ${param.findStr }</li>
	<li> nowPage : ${param.nowPage }</li>
	</ul>

</body>
</html>