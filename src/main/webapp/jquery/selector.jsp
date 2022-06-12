<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>slector</title>
		<script src='../lib/jquery-3.6.0.min.js'></script>
	</head>
	
	<body>
		<h1>selector</h1>
			<button type='button' onclick='funcRed()'>RED</button>
			<button type='button' onclick='funcBlue()'>BLUE</button>
			<div id='first'>first</div>
			<div id='second'>second</div>
			<div id='items'>
				<span name='hong'>hong</span>
				<span name='park'>park</span>
				<span name='lee'>lee</span>
			</div>
			
		<script>
			function funcRed(){
				$('h1').css('color','#f00'); //h1{color : #f00;}
			}
			function funcBlue(){
				$('h1').css('color','#00f');
			}
			
			//() 는 한가지만, {} 두가지 이상
			$('#first').css({
				'padding' : '20px',
				'background-color' : '#66f',
				'color' : '#ff0',
				'margin' : '20px'
			});
			
			//#second에 margin, border, padding을 지정하시오.
			$('#second').css({
				'margin' : '20px',
				'border' : 'solid 5px #bbf',
				'padding' : '10px'
			});
			
			//#items안에 있는 모든 span에 border, padding 지정
			$('#items span').css({
				'border' : 'solid 2px #aaa',
				'padding' : '30px'
			});
			
			//#items안에 있는 span 태그중 name 속성에 따른 바탕색을 red, green, blue로 지정
			$('#items').css('padding','20px');
			$('#items span[name=hong]').css('background-color','#fbb');
			$('#items span[name=park]').css('background-color','#bfb');
			$('#items span[name=lee]').css('background-color','#bbf');
		</script>
	</body>
</html>