<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인/아웃</title>
		<style>
		@font-face{
			src:url("../font/KOPUBWORLD DOTUM LIGHT.TTF");
			font-family: "KOPUB_L";
		}
		#btn_login, #btn_logout{
			margin: 10px 0 5px 10px;
			background-color: #ffc414;
 			border: none;
 			border-radius: 3px;
  	 		color: white;
 	 		padding: 5px 8px;
 	 		font-size:10pt;
 	 		font-family: "KOPUB_L";
		}
		
		#btn_login:hover, #btn_logout:hover{
			background-color: #ffe697;
		}
		</style>
	</head>
	<body>
		<form name='frm_login_out' method='post'>
			<%
				//session.setAttribute("mId","홍길동");
				//session.setAttribute("mId",null);
				
				String mId = (String)session.getAttribute("mId");
				
				
				if(session.getAttribute("mId") == null){
			%>
			<button type='button' id='btn_login'>로그인</button>
			<% 
				}else{
			%>
			<output class='login_info'>
			<%=mId%>님 방가 :)
			</output>
			<button type='button' id='btn_logout'>로그아웃</button>
			<%
				}
			%>
		</form>
		<script src='./js/student.js'></script>
	</body>
	</html>