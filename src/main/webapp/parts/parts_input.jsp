<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parts_input</title>
<link rel='stylesheet' href='./css/parts.css'>
</head>
<body>
	<div id='parts_input'>
		<form name='frm_parts_input' id='frm_parts_input' method='post'>
			<label>제품코드</label>
			<input type='text' name='code' value='${vo.code}'><br/>
			<label>제품명</label>
			<input type='text' name='codeName' value='${vo.codeName}' size='20'><br/>
			<label>제품사양</label>
			<input type='text' name='spec' value='${vo.spec}' size='20'><br/>
			<label>제품단가</label>
			<input type='text' name='price' value='${vo.price}'><br/>
			
			<div id='btns'>
				<button type='button' class='btnInsert' onclick='parts.insert()'>저장</button>
				<button type='button' class='btnUpdate' disabled onclick='parts.update()'>수정</button>
				<button type='button' class='btnDelete' disabled onclick='parts.delete()'>삭제</button>
				<button type='button' class='btnCancel' onclick='parts.cancel()'>취소</button>
			</div>
		</form>
		
		<c:if test="${not empty msg}">
			<script>
				alert("${msg}")
			</script>
		</c:if>
		
	</div>
</body>
</html>