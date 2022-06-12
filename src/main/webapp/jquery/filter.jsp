<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>filter</title>
		<script src='../lib/jquery-3.6.0.min.js'></script>
		<script>
			$(document).ready(function(){
				//짝수번째 요소의 글자색을 파랑. 
				$('.mnt:even').css('color','#00f'); //eve: 0부터 시작 index의 짝수번째
				//홀수번째 요소의 글자색을 빨강.
				$('.mnt:odd').css('color','#f00'); //odd: 0부터 시작 index의홀수번째
				//첫번째 요소의 윗쪽 테두리를 표시
				$('.mnt:first').css('border-top','solid 5px #ccf');
				//마지막번째 요소의 아래쪽 테두리를 표시
				$('.mnt:last').css('border-bottom','solid 5px #ccf');
				
				//모든 강이름의 점을 제거한 후 외각선과 마진, 패딩을 지정
				$('ul>li').css({
					'list-style' : 'none',	
					'border' : '2px solid #aaf',
					'margin' : '1px',
					'padding' : '3px 6px'
				});
				//강이름 중 첫번째와 마지막번째 외각선의 모양을 라운드처리
				$('li:first-child').css('border-radius','10px 10px 0 0');
				$('li:last-child').css('border-radius','0 0 10px 10px');
				//강이름들 중 홀수번째의 바탕색과 짝수번째의 바탕색을 다르게
				$('li:nth-child(2n)').css('background-color','#ccf'); //nth-child(2n): 1부터 시작 짝수
				$('li:nth-child(2n-1)').css('background-color','#fcc'); //nth-child(2n-1): 1부터 시작 홀수
			})
		</script>
	</head>
	
	<body>
		<h1>filter</h1>
		<div class='mnt'>백두산</div>
		<div class='mnt'>한라산</div>
		<div class='mnt'>금강산</div>
		<div class='mnt'>치악산</div>
		<div class='mnt'>내장산</div>
		<div class='mnt'>설악산</div>
		
		<ul>강이름
			<li>두만강</li>
			<li>낙동강</li>
			<li>한강</li>
			<li>소금강</li>
			<li>섬진강</li>
			<li>동강</li>
		</ul>
	</body>
</html>