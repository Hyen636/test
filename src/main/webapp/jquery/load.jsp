<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>load</title>
<script src='../lib/jquery-3.6.0.min.js'></script>
<style>
	section>div{
		display:inline-block;
		width: 300px;
		height: 250px;
		border: 2px solid #888;
		padding:20px;
		box-sizing:border-box;
		vertical-align:top;
	}
</style>
<script>
	$(function(){
		$('#btnA').on('click',function(){
			let param = $('#frm_load').serialize(); //P=V&P=V...
			$('#a').load('load_sub.jsp #a',param);
		})
		$('#btnB').on('click',function(){
			let param = $('#frm_load').serialize();
			$('#b').load('load_sub.jsp #b',param);
		})
		$('#btnC').on('click',function(){
			let param = $('#frm_load').serialize();
			$('#c').load('load_sub.jsp #c',param);
		})
			
	})
</script>
</head>
<body>
<h1>load</h1>
<form name='frm_load' id='frm_load' method='post'>
	<label>아이디</label>
	<input type='text' name='id'/><br/>
	<label>암호</label>
	<input type='password' name='pwd'/><br/>
	<button type='button' id='btnA'>로그인</button>
	<button type='button' id='btnB'>암호찾기</button>
	<button type='button' id='btnC'>아이디찾기</button>
</form>
<section>
	<div id='a'></div>
	<div id='b'></div>
	<div id='c'></div>
</section>
</body>
</html>