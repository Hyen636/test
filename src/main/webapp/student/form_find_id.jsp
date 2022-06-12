<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>form_find_id</title>
		<link rel='stylesheet' type='text/css' href='./css/student.css'>
	</head>
	<body>
		<form name='frm_find_id' id='frm_find_id' method='post'>
			<h2>아이디 찾기</h2>
			<div id='loginId'>
			<input type="image" src="./images/phone.png" width=19px  align="absmiddle" alt="이메일">
			<input type='text' name='phone' size='15'/>
			</div>
			<br/>
			<div id='loginPwd'>
			<input type="image" src="./images/email.png" width=19px  align="absmiddle" alt="이메일">
			<input type='text' name='email' size='15' onkeyup="enterkey(btn_find_id);"/>
			</div>
			<br>
			<input type='button' id='btn_find_id' value='아이디찾기'/>
		</form>
		<script src='./js/student.js'></script>
	</body>
</html>