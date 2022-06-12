<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>socket_test</title>
</head>
<body>
	<button type='button' onclick='connect()'>연결</button>
	<button type='button' onclick='disconnect()'>종료</button>
	<input type='text' name='msg' id='msg' size='50'/>
	<button type='button' onclick='send()'>전송</button>
	
	<script>
		//소켓 생성
		let socket;
		
		function connect(){
			socket = new WebSocket("ws://192.168.45.139:5555/web_project2/test");
			
			socket.onopen=function(){
				console.log('socket open...')
			}
			
			// ws로 부터 메시지가 전달되었을 때
			socket.onMessage = function(resp){
				console.log('receive data : ', resp.data);
			}
			socket.onclose = function(){}
		}
		
		function send(){
			let msg = document.getElementById('msg').value;
			let jsonObj = {};
			jsonObj.msg = msg;
			jsonObj.command = 'select';
			jsonObj.nowPage = 12;
			jsonObj.findStr = 'abc';
			console.log(jsonObj);
			
			// ws 에게 json object를 바로 보내지 않고 json string 으로 변환하여 전송
			let jsonStr = JSON.stringify(jsonObj);
			console.log('jsonStr : ', jsonStr);
			
			// ws에게 값 전송
			socket.send(jsonStr);
		}
		
		
	</script>
</body>
</html>