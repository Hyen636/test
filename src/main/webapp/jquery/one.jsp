<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>one</title>
<script src='../lib/jquery-3.6.0.min.js'></script>
<script>
	$(function(){
		let cnt = 0;
		$('#btnAccept').one('click',function(){
			cnt++;
			console.log(cnt+'번째 이체됨...')
		})
	})
</script>
</head>

<body>
<h1>one</h1>
<button type='button' id='btnAccept'>이체</button>
</body>
</html>