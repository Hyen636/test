<%@page import="score.ScoreVo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl</title>
<style>
h3{
	background-color:#ddf;
}
</style>
</head>
<body>
	<h1>jstl example</h1>
	
	<h3>c:out (출력)</h3>
	<li>Name : <c:out value="홍길동"/></li>
	<li>Address : <c:out default="서울" value=""/></li>
	<li>Tag : <c:out value="<span>Tag</span>" escapeXml = "true"/></li> <!-- true = 문자로 인식 / false = 태그를 인식 -->
	<li>Tag : <c:out value="<span>Tag</span>" escapeXml = "false"/></li> 
	
	<h3>c:set (변수 설정) | c:remove (변수 삭제)</h3>
	<c:set var='name' value = 'Hong gil dong'/>
	<li>setName : ${name} </li>
	<c:remove var = 'name'/>
	<li>removeName : ${name} </li>
	
	<h3>c:if(조건)</h3>
	<fieldset>
		변수 x에 임의의 값을 대입한 후 x값이 60이상이면 "합격" 출력
	</fieldset><br/>
	<c:set var='x' value = '90'/>
	<li>결과 : <c:out value = '${x}'/>점은
		<c:if test='${x>=60}'>
			<span>합격!</span>
		</c:if>
	</li>
	
	<h3>c:forEach(반복)</h3>
	<fieldset>
		x,y에 임의의 값을 대입한 후 x ~ y까지 출력
	</fieldset><br/>
	<c:set var='x' value='1'/>
	<c:set var='y' value='10'/>
		<div>
			<c:forEach var='i' begin='${x}' end='${y}' step='2' varStatus='st'>
				<li>${i} - ${st.count} - ${st.index}</li>
			</c:forEach>
		</div><br/>
		<fieldset>
			배열에 임의의 값들을 저장한 후 forEach문을 사용하여 출력
		</fieldset><br/>
		<%
			String[] names = {"kim","lee","park","choi","hong"};
			List<String> list = new ArrayList();
			list.add("강아지"); list.add("송아지"); list.add("망아지");
			
			request.setAttribute("names",names);
			request.setAttribute("list",list);
		%>
		<li>배열값 출력</li>
		<c:forEach var='item' items="${requestScope.names}">
			<span>${item}</span>
		</c:forEach>
		
		<li>List 출력</li>
		<c:forEach var='item' items = '${list}'>	
			<span>${item}</span>
		</c:forEach>
		
		<h3>c:forEach(반복)를 사용한 Object</h3>
		<%
			//서버의 처리 결과
			List<ScoreVo> scoreList = new ArrayList<ScoreVo>();
			ScoreVo v1 = new ScoreVo();
			v1.setId("hong"); v1.setSubject("국어");
			ScoreVo v2 = new ScoreVo();
			v2.setId("kim"); v2.setSubject("영어");
			ScoreVo v3 = new ScoreVo();
			v3.setId("nam"); v3.setSubject("수학");
			
			scoreList.add(v1);
			scoreList.add(v2);
			scoreList.add(v3);
			
			request.setAttribute("score",scoreList);
			
		%>
		<table border='1' width='400'>
			<c:forEach var='vo' items='${score}'>
				<tr>
					<td>${vo.id}</td>
					<td>${vo.subject}</td> <!-- vo.getSubject()가 실행되는 것. get없으면 실행 x -->
				</tr>
			</c:forEach>
		</table>
</body>
</html>




