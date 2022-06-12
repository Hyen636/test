<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_input</title>
<link rel='stylesheet' href='./css/product.css'>
</head>
<body>
	<div id='product_input'>
		<form name='frm_product_input' id='frm_product_input' method='post'>
		<label>순번</label>
		<input type = 'text' name='sno' value='${vo.sno}' readonly/><br/>
		<label>제품코드</label>
		<input type='text' name='code' value='${vo.code}'/>
		<button type='button' class='btnSearch' onclick='product.findCode()'>검색</button><br/>
		<label>제품명</label>
		<input type='text' name='codeName' value='${vo.codeName}' readonly/><br/>
		<label>생산일자</label>
		<input type="date" name='nal' value='${vo.nal}'/><br/>
		<label>수량</label>
		<input type='text' name='ea' class='ea' value='${vo.ea}' onkeyup='product.compute(this.form)'/><br/>
		<label>단가</label>
		<input type='text' name='price' class='price' value='${vo.price}' onkeyup='product.compute(this.form)'/><br/>
		<hr/>
		<label>금액</label>
		<input type='text' name='amt' class='amt' value='${vo.amt}' readonly/>
		
		<div id='btns'>
				<button type='button' class='btnInsert' onclick='product.insert()'>저장</button>
				<button type='button' class='btnUpdate' onclick='product.update()' disabled>수정</button>
				<button type='button' class='btnDelete' onclick='product.delete()' disabled>삭제</button>
				<button type='button' class='btnCancel' onclick='product.cancel()'>취소</button>
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