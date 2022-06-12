<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_list</title>
</head>
<body>
<div id='product_list'>
		<form name='frm_product_list' id='frm_product_list' onsubmit="return false">
			<input type='text' name='nowPage' value='${param.nowPage}'/>
			<input type='text' name='sno'/>
			<input type='text' name='findStr' value='${param.findStr}' onkeypress="if(event.keyCode == 13 ){product.select(this.form);}"/>
			<button type='button' onclick='product.select(this.form)'>조회</button>
		</form>
		
		<div class='title'>
			<span class='sno'>순번</span>
			<span class='code'>제품코드</span>
			<span class='codeName'>제품명</span>
			<span class='nal'>생산일자</span>
			<span class='ea'>수량</span>
			<span class='price'>단가</span>
			<span class='amt'>금액</span>
		</div>
		
		<div class='items'>
			<c:forEach var='vo' items='${list}' varStatus='sts'>
				<div class='item' onclick='product.view(${sts.index}, ${vo.sno})'>
					<span class='sno'>${vo.sno}</span>
					<span class='code'>${vo.code}</span>
					<span class='codeName'>${vo.codeName}</span>
					<span class='nal'>${vo.nal}</span>
					<span class='ea'><fmt:formatNumber>${vo.ea}</fmt:formatNumber></span>
					<span class='price'><fmt:formatNumber>${vo.price}</fmt:formatNumber></span>
					<span class='amt'><fmt:formatNumber>${vo.amt}</fmt:formatNumber></span>
				</div>
			</c:forEach>
		</div>
		
		<div id='btns'>
			<c:if test="${page.startPage>1}">
				<button type='button' onclick='product.movePage(1)'>맨첨</button>
				<button type='button' onclick='product.movePage(${page.startPage-1})'>이전</button>
			</c:if>
			
			<c:forEach var='i' begin='${page.startPage}' end='${page.endPage}'> 
				<button type='button' onclick="product.movePage(${i})">${i}</button>
			</c:forEach>
			
			<c:if test="${page.totPage>page.endPage}">
				<button type='button' onclick = 'product.movePage(${page.endPage+1})'>다음</button>
				<button type='button' id='btnLast' onclick = 'product.movePage(${page.totPage})'>맨끝</button>
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