<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>each</title>
<script src='../lib/jquery-3.6.0.min.js'></script>
<script>
	$(function(){ //body가 모두 로딩된 후 
		var bg = ['#fbb','#bfb','#bbf','#ffb','#fbf']
		$('div').each(function(index){
			$(this).css('background-color',bg[index])
		})
	})
</script>
</head>

<body>
<h1>each</h1>
<div>A</div>
<div>B</div>
<div>C</div>
<div>D</div>
<div>E</div>
</body>
</html>