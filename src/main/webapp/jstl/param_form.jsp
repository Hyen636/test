<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>param_form</title>
</head>

<body>
	<h1>param_test</h1>
	<form name='frm' method='post'>
		<label>Name : </label>
		<input type='text' name='irum' value='${param.irum }'/> <%--el = <%request.getParameter("irum") %> --%>
		<br/>
		<label>Gender</label>
		<label><input type='radio' name='gender' value='m' 
					  ${(param.gender == 'm')? 'checked' : ''}/>남자</label>
		<label><input type='radio' name='gender' value='f' 
					  ${(param.gender == 'f')? 'checked' : ''}/>여자</label>
		<br/>
		<label>Hobby</label>
		<label><input type='checkbox' name='hobby' value='축구'/>축구</label>
		<label><input type='checkbox' name='hobby' value='야구'/>야구</label>
		<label><input type='checkbox' name='hobby' value='농구'/>농구</label>
		<label><input type='checkbox' name='hobby' value='배구'/>배구</label>
		<label><input type='checkbox' name='hobby' value='탁구'/>탁구</label>
		<br/>
		<label>Subject</label>
		<select name='subject' size='5'>
			<option value='html'>html</option>
			<option value='css'>css</option>
			<option value='javascript'>javascript</option>
			<option value='jsp'>jsp</option>
		</select>
		<br/>
		<input type='submit'/> 	<!-- form 태그에 action이 없으면 자기 자신을 부름 -->
	</form>
	<hr/>
	<ul>
		<li>Name : ${param.irum}</li>
		<li>Gender : ${param.gender}</li>
		<li>Hobby : 
			<ul>
				<c:forEach var='i' items="${paramValues.hobby}">
					<li>${i}</li>
				</c:forEach>
			</ul>
		</li>
		<li>Subject : ${param.subject}</li>
	</ul>
	<script>
		//let hobby = ${paramValues.hobby};
		let frm = document.frm;
		<c:forEach var='i' items = '${paramValues.hobby}'>
			for(var j=0; j<frm.hobby.length; j++){
				if('${i}' == frm.hobby[j].value){
					frm.hobby[j].checked = true;
					break;
				}
			}
		</c:forEach>
		
		//select 상자 체크
		let sel = frm.subject;
		for(var i=0; i<sel.length; i++){
			if('${param.subject}' == sel.options[i].value){
				sel.options[i].selected = true;
			}
		}
	</script>
	
</body>
</html>