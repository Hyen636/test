<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ajax</title>
	<script src='../lib/jquery-3.6.0.min.js'></script>
</head>

<body>
	<h1>ajax</h1>

<script>
function run (url){
	let xhr = new XMLHttpRequest();
	xhr.open('GET',url); //비동기 방식으로 selector.jsp를 실행함
	xhr.send();
	xhr.onreadystatechange = function(){
		console.log('readyState=', xhr.readyState);
		console.log('status',xhr.status);
		if(xhr.status == 200 && xhr.readyState == 4){ //request(요청정보) && respose(응답정보)
			$('#result').html(xhr.responseText);
		}
	}
}

$(function(){
	$('#btnSelect').on('click',function(){
		//run('selector.jsp');
		$('#result').load('selector.jsp');
	})
	$('#btnEffect').on('click',function(){
		//run('effect.jsp');
		$('#result').load('effect.jsp');
	})
	$('#btnEach').on('click',function(){
		$('#result').load('each.jsp');
	})
	$('#btnScoreInput').on('click',function(){
		$('#result').load('../score/score_input.jsp');
	})
	$('#btnScoreList').on('click',function(){
		$('#result').load('../score/score_list.jsp');
	})
})

</script>
	<button type='button' id='btnSelect'>select</button>
	<button type='button' id='btnEffect'>effect</button>
	<button type='button' id='btnEach'>each</button>
	<button type='button' id='btnScoreInput'>학생성적 입력</button>
	<button type='button' id='btnScoreList'>학생성적 조회</button>
	<div id='result'></div>
</body>
</html>