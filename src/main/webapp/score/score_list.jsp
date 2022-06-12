<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>socre_list</title>
	<link rel='stylesheet' type='text/css' href='./css/score.css'>
</head>

<body>
	<div id='score_list'>
		<h2>성적정보 조회</h2>
		<form name='frm_score_list' id='frm_score_list' method='post'>
			<button type='button' id='btnInput'>입력</button>
			<input type='text' name='findStr' value='${param.findStr}' size='20'/>
			<button type='button' id='btnFind'>검색</button>
			<input type='hidden' name='nowPage' value='${param.nowPage}'/>
			<input type='hidden' name='sno'/>
		</form>
		<div id='list'>
			<div class='title'>
				<span class = 'sno'>SNO</span>
				<span class = 'id'>아이디</span>
				<span class = 'mName'>성명</span>
				<span class = 'subject'>과목</span>
				<span class = 'score'>성적</span>
				<span class = 'nal'>응시일</span>
			</div>
			<div class='items'>
			<c:forEach var='vo' items='${list}'>
				<div class='item' onclick='view(${vo.sno})'>
					<span class='sno'>${vo.sno}</span>
					<span class = 'id'>${vo.id}</span>
					<span class = 'mName'>${vo.mName}</span>
					<span class = 'subject'>${vo.subject}</span>
					<span class = 'score'>${vo.score}</span>
					<span class = 'nal'>${vo.nal}</span>
				</div>
				</c:forEach>
			</div>
			
			<div class='paging'>
				<c:if test='${page.startPage>1}'>
					<button type='button' class='btnFirst' onclick='movePage(1)'>맨첨</button>
					<button type='button' class='btnPrev' onclick='movePage(${page.startPage-1})'>이전</button>
				</c:if>
				
				<c:forEach var='i' begin='${page.startPage}' end='${page.endPage}'>						
					<button type='button' class='First' onclick='movePage(${i})'>${i}</button>
				</c:forEach>	
							
				<c:if test='${page.totPage > page.endPage}'>	
					<button type='button' class='btnNext' onclick = 'movePage(${page.endPage+1})'>다음</button>
					<button type='button' class='btnLast' onclick='movePage(${page.totPage})'>맨끝</button>
				</c:if>
			</div>
		</div>
	</div>
	<script src='js/score.js'></script>
</body>
</html>