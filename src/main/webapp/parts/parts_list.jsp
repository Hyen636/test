<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parts_list</title>
</head>

<body>
	<div id='parts_list'>
		<form name='frm_parts_list' id='frm_parts_list' onsubmit="return false">
			<input type='hidden' name='nowPage' value='${param.nowPage}'/>
			<input type='hidden' name='code'/>
			<input type='text' name='findStr' value='${param.findStr}' onkeypress="if(event.keyCode == 13 ){parts.select();}"/>
			<button type='button' onclick='parts.select()'>조회</button>
		</form>
		
		<div class='title'>
			<span class='no'>NO</span>
			<span class='code'>제품코드</span>
			<span class='codeName'>제품명</span>
			<span class='spec'>제품사양</span>
			<span class='price'>제품단가</span>
		</div>
		
		<div class='items'>
			<c:set var='i' value='${page.startNo+1}'/>
			<c:set var='pos' value='0'/> <!-- //pos = position 하이라이트 기능 때문에 넘겨줌-->
			<c:forEach var='vo' items="${list}"> <!-- vo = PartsVo -->
				<div class='item' onclick='parts.view(${pos},"${vo.code}")'>
					<span class='no'>${i}</span>
					<span class='code'>${vo.code}</span>
					<span class='codeName'>${vo.codeName}</span>
					<span class='spec'>${vo.spec}</span>
					<span class='price'>${vo.price}</span>
				</div>
				<c:set var='i' value='${i=i+1}'/>
				<c:set var='pos' value='${pos=pos+1}'/>
			</c:forEach>
		</div>
		
		<div id='btns'>
			<c:if test='${page.startPage>1}'>
			<button type='button' onclick='parts.movePage(1)'>맨첨</button>
			<button type='button' onclick='parts.movePage(${page.startPage-1})'>이전</button>
			</c:if>
			
			<c:forEach var='i' begin='${page.startPage}' end='${page.endPage}'> 
				<button type='button' onclick="parts.movePage(${i})">${i}</button>
			</c:forEach>
			
			<c:if test='${page.totPage > page.endPage}'>
			<button type='button' onclick = 'parts.movePage(${page.endPage+1})'>다음</button>
			<button type='button' onclick = 'parts.movePage(${page.totPage})'>맨끝</button>
			</c:if>
		</div>
		
		<c:if test="${not empty msg}">
			<script>
				alert("${msg}")
			</script>
		</c:if>
	</div>
</body>
</html>