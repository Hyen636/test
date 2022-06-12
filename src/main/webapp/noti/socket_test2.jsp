<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>socket_test2</title>
</head>
<body>
	<h2>socket test2</h2>
	<form name='frm'>
		<label>아이디</label>
		<input type='text' name='id' value='hong'/><br/>
		
		<label>성명</label>
		<input type='text' name='irum' value='홍길동씨'/><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' value='010-1111-1111'/><br/>
		
		<button type='button' onclick='connect()'>연결</button>
		<button type='button' onclick='send(this.form)'>전송</button>
		<div>수신 결과를 console창에서 확인바람...!</div>
	</form>
	
	<script>
	let socket;
		function connect(){
			socket = new WebSocket("ws://192.168.45.139:5555/web_project2/test2");
			socket.onopen = function(){}
			socket.onclose = function(){}
			socket.onmessage = function(resp){
				let jsonStr = resp.data;
				let jsonObj = JSON.parse(jsonStr);
				console.log('id: ', jsonObj.id);
				console.log('irm: ', jsonObj.irum);
				console.log('phone: ', jsonObj.phone);
				console.log('------------------');
			}
		}
		function send(frm){
			let jsonStr;
			let jsonObj = {};
			jsonObj.id = frm.id.vlaue;
			jsonObj.irum = frm.irum.value;
			jsonObj.phone = frm.phone.value;
			
			jsonStr = JSON.stringify(jsonObj);
			socket.send(jsonStr);
		}
	</script>
</body>
</html>