<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>form_find_pwd</title>
		<link rel='stylesheet' type='text/css' href='./css/student.css'>
	</head>
	<body>
		<form name='frm_find_pwd' id='frm_find_pwd' method='post'>
			<h2>암호 찾기</h2>
			<div id='loginId'>
			<input type="image" src="./images/id.png"  width=19px  align="absmiddle" alt="아이디">
			<input type='text' name='mId' size='15'/>
			</div>
			<br/>
			<div id='loginPwd'>
			<input type="image" src="./images/email.png"  width=19px  align="absmiddle" alt="이메일">
			<input type='text' name='email' size='15' onkeyup="enterkey(btn_find_pwd);"/>
			</div>
			<br>
			<input type='button' id='btn_find_pwd' value='암호찾기'/>
		</form>
		<script src='./js/student.js'></script>
	</body>
</html>