<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>score_modify</title>
	<link rel='stylesheet' type='text/css' href='./css/score.css'>
</head>
<body>
<div id = 'score'>
		<form name = 'frm_score' id='frm_score' method='post'>
			<h2>성적정보 수정</h2>
			<label>날짜</label>
			<input type='date' name='nal' value='${vo.nal}'><br/>
			
			<label>아이디</label>
			<input type='text' name='id' value='${vo.id}' size='11'>
			<button type='button' name='btnFindName' id='btnFindName'>검색</button><br/>
			
			<label>성명</label>
			<input type='text' name='mName' value='${vo.mName}' size='11'><br/>
			
			<label>과목</label>
			<input type='text' name='subject' value='${vo.subject}'  size='11'><br/>
			
			<label>성적</label>
			<input type='text' name='score' value='${vo.score}' size='11'><br/>
			<div id = 'btn'>
				<button type='button' id='btnModify'>수정</button>
				<button type='button' id='btnList'>취소</button>
			</div>
			
			<input type='hidden' name='findStr' value='${param.findStr}'/>
			<input type='hidden' name='nowPage' value='${param.nowPage}'/>
			<input type='hidden' name='sno' value='${vo.sno}'/>
		</form>
	</div>
	<script src='js/score.js'></script>
</body>
</html>