<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_find_code</title>
<!-- <link rel='stylesheet' href='../css/product.css'> -->
<style>

/* product_find_code */

@font-face{
	src: url("./font/KOPUBWORLD DOTUM MEDIUM.TTF");
    font-family: "KOPUB_M";
}
 
@font-face{
	src:url("./font/KOPUBWORLD DOTUM LIGHT.TTF");
	font-family: "KOPUB_L";
}

@font-face{
	src:url("./font/KOPUBWORLD DOTUM BOLD.TTF");
	font-family: "KOPUB_B";
}

*{
	box-sizing: border-box;
	padding: 0;
	margin: 0;
	font-family: "KOPUB_L";
}

h2{
	text-align:center;
	margin-top:20px;
	color:  #fe620d;
	font-family: "KOPUB_B";
	font-size: 30px;
}

label{
	color:#5a5a5a;
}

input{
	margin:10px 5px 0 0;
	border: 1.5px solid #fe620d;
	border-radius: 3px;
	font-family: "KOPUB_M";
	width: 150px;
	padding: 1px 8px;
}

button{
	margin: 20px auto 5px auto;
	background-color: #fe620d;
 	border: none;
 	border-radius: 3px;
  	color: white;
 	padding: 2px 10px;
 	font-size:11pt;
}

button:hover{
	background-color: #fea676;
}

#frm_find_code{
	text-align:center;
}

#frm_find_code label{
	width:100px;
	font-size:13pt;
	margin-right: 5px;
	font-family: "KOPUB_M";
}

#frm_find_code input[type=text]{
	width:200px;
}

#product select{
	width:300px;
	height:330px;
	border: solid 1px #fe620d;
	padding: 10px;
	margin-top:10px;
}

#product select option:hover{
	background: #fea676;
}

#product select option:checked{
	background: linear-gradient(#fea676,#fea676);
	background-color: #fea676 !important;
}

#product select::-webkit-scrollbar{
	width: 13px;
	height: 5px;
	border: solid 2px #eee;
 	background-color: #eee;
}

#product select::-webkit-scrollbar-thumb{
	background-color:#fe620d;
}

/*  스크롤의 화살표가 포함된 영역   */
#product select::-webkit-scrollbar-button:start:decrement, 
::-webkit-scrollbar-button:end:increment {
  height:15px;
  background-color: #ddd;
} 
</style>
</head>
<body>
<div id='product'>
	<form name='frm_find_code' id='frm_find_code' method='post' action='/web_project2/product.do?job=findCode'>
		<h2>제품코드 조회</h2>
		<label>코드</label>
		<input type='text' name='find_code' value='${param.code}'/>
		<button>검색</button><br/>
		
		<select name='sel' size='20' class='sel' ondblclick='choice()' id='sel'><!-- ondblclick = 더블클릭 -->
			<c:forEach var='vo' items='${list}'> <!-- == requestScope.list -->
				<option class='item' value='${vo.code}/${vo.codeName}/${vo.price}'>
					${vo.codeName} | ${vo.price}</option>
			</c:forEach>
		</select>
	
	</form>
	
</div>

<script>
	let openFrm = opener.document.frm_product_input;
	let localFrm = document.frm_find_code;
	
	choice = function(){
		let index = localFrm.sel.selectedIndex; /* 선택된 index */
		let array = localFrm.sel[index].value.split('/'); /* 선택된 index의 value를 '/'로 split */
		openFrm.code.value = array[0];
		openFrm.codeName.value = array[1];
		openFrm.price.value = array[2];
		self.close();
	}
</script>
</body>
</html>