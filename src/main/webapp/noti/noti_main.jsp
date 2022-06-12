<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noti_main</title>
<link rel='stylesheet' type='text/css' href='./css/noti.css'>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script defer src='./js/noti.js'></script>
<script>
	let sessionID = '${sessionScope.mId}';
</script>
</head>
<body>
	<div id='noti'>
		<h2>공지사항</h2>
		
		<form name='frm_find' class='frm_find' method='post' onsubmit="return false">
			<button type='button' onclick='noti.showInputForm()'>입력</button>
			<input type='text' name='findStr' id='findStr' onkeypress='if(event.keyCode == 13 ){noti.find(this.form);}' />
			<button type='button' onclick='noti.find(this.form)'>검색</button>
		</form>
		
		<div id='noti_input'>
		<form name='frm_input' class='frm_input' method='post'>
			<label>작성일</label>
			<input type='date' name='nal'/><br/>
			
			<label>작성자</label>
			<input type='text' name='id' readonly value='${sessionScope.mId}'/><br/>
			
			<label>제목</label>
			<input type='text' name='subject'/><br/>
			
			<label></label>
			<textarea name='doc'></textarea><br/>
			<button type='button' onclick='noti.sendInsert(this.form)'>저장</button>
		</form>
		</div>
		
		<div class='msg'>상태메세지~!</div>
		
		<div class = 'btns'>
			<button type='button' class='btnPrev' onclick='noti.movePage(-1)'>&lt</button>
			<button type='button' class='btnNext' onclick='noti.movePage(+1)'>&gt</button>
		</div>
		
		
	
	<div class='items'>
		<!-- <c:forEach var='vo' begin='1' end='15'>
				<form name='frm_view' class='frm_view' method='post'>
					<label>작성일</label>
					<input type='date' name='nal'/><br/>
			
					<label>작성자</label>
					<input type='text' name='id'/><br/>
			
					<label>제목</label>
					<input type='text' name='subject'/><br/>
			
					<label></label>
					<textarea name='doc'></textarea><br/>
				
					<button type='button' onclick='noti.update(this.form)'>수정</button>
					<button type='button' onclick='noti.delete(this.form)'>삭제</button>
					<input type='hidden' name='sno'/>
				</form>
			</c:forEach> --> 
	</div>
	
	<div class = 'btns'>
			<button type='button' class='btnPrev' onclick='noti.movePage(-1)'>&lt</button>
			<button type='button' class='btnNext' onclick='noti.movePage(+1)'>&gt</button>
		</div>
	</div>
	
	<template class='temp'>
		<form name='frm_list' class='frm_list' method='post'>
				<label>작성일</label>
				<input type='date' name='nal'/><br/>
			
				<label>작성자</label>
				<input type='text' name='id'/><br/>
			
				<label>제목</label>
				<input type='text' name='subject'/><br/>
			
				<label></label>
				<textarea name='doc'></textarea>
				<input type='hidden' name='sno'/>
				
				<div class='btnUpDel'>
					<button type='button' onclick='noti.sendUpdate(this.form)'>수정</button>
					<button type='button' onclick='noti.sendDelete(this.form)'>삭제</button>
				</div>
			</form>
	</template>
</body>
</html>