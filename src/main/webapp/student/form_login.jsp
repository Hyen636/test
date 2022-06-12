<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student_login_form</title>
		<link rel='stylesheet' type='text/css' href='./css/student.css'>
	</head>
	<body>
		<form name='frm_login' id='frm_login' method='post' onsubmit="return false">
			
			<h2>로그인</h2>
			
			<div id='loginId'>
			<input type="image" src="./images/id.png" width=19px alt="아이디" align="absmiddle">
			<input type='text' name='mId' size='15'  align="absmiddle"/>
			</div>
			<br/>
			
			<div id='loginPwd'>
			<input type="image" src="./images/password.png" width=20px alt="암호" align="absmiddle">
			<input type='password' name='mPwd' size='15' align="absmiddle" onkeyup="enterkey(btn_login2);"/>
			</div>
			<br>
			
			<input type='button' id='btn_login2' value='로그인' />
			<br/>
			
			<a href='index.jsp?inc=./student/form_find_id.jsp'>아이디 찾기</a> | 
			<a href='index.jsp?inc=./student/form_find_pwd.jsp'>암호 찾기</a>
			</form>
			
			<script src='./js/student.js'></script>
	</body>
</html>