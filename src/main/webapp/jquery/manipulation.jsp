<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>manipulation</title>
	<script src='../lib/jquery-3.6.0.min.js'></script>
	<script>
		$(function(){
			$('div').css({
				'border' : '2px solid #999',
				'padding' : '10px',
				'margin' : '10px',
				'display' : 'inline-block',
				'width' : '250px'
			})
			let div = "<div id='me'>ME</div>";
			$('#btnWrap').on('click',function(){
				$('#here').wrap(div);
			})
			$('#btnAppend').on('click',function(){
				$('#here').append(div);
			})
			$('#btnPrepend').on('click',function(){
				$('#here').prepend(div);
			})
			$('#btnBefore').on('click',function(){
				$('#here').before(div);
			})
			$('#btnAfter').on('click',function(){
				$('#here').after(div);
			})
		})
	</script>
</head>

<body>
	<h1>manipulation</h1>
	<div id='here'>here</div>
	<hr/>
	<button type='button' id='btnWrap'>WRAP</button>
	<button type='button' id='btnAppend'>APPEND</button>
	<button type='button' id='btnPrepend'>PREPEND</button>
	<button type='button' id='btnBefore'>BEFORE</button>
	<button type='button' id='btnAfter'>AFTER</button>
</body>
</html>