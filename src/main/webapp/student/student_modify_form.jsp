<%@page import="student.StudentVo"%>
<%@page import="student.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>student_modify_form</title>
	<link rel='stylesheet' type='text/css' href='./css/student.css'>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			StudentDao dao = new StudentDao();
			StudentVo vo = dao.selectOne(id);
			request.setAttribute("vo",vo);
		%>
	
	
	
		<div id = 'student'>
			<form name='frm_student' id='frm_student' method='post'>
				<h2>학생정보 수정</h2>
				<label>아이디</label>
				<input type='text' name='id' size='10' readonly='readonly' value='${param.id }' ><br/>
				
				<label>성명</label>
				<input type='text' name='mName' size='10' value='${vo.mName}'><br/>
				
				<label>성별</label>
				<span>
					<label class='radio'>
						<input type='radio' name='gender' value='m' 
						   	   ${(vo.gender=='m')? 'checked' : '' }>남자
					</label>
					<label class='radio'>
						<input type='radio' name='gender' value='f'
							   ${(vo.gender=='f')? 'checked' : '' }>여자
						</label>
				</span>
				<br/>			
				<label>연락처</label>
				<input type='text' name='phone' size='10' value='${vo.phone}'><br/>
				
				<label>우편번호</label>
				<input type='text' name='zipcode' size='7' readonly='readonly' value='${vo.zipcode}'>
				<button type='button' id='btnZipFind'>우편번호 검색</button><br/>
				
				<label>주소</label>
				<input type='text' name='address' size='40' value='${vo.address}'><br/>
				
				<label>이메일</label>
				<input type='text' name='email' size='30' autocomplete="none" value='${vo.email}'><br/>
				
				<label></label>
				<div id='btn'>
					<button type='button' id='btnUpdate'>수정</button>
					<button type='button' id='btnDelete'>삭제</button>
					<button type='button' id='btnList'>취소</button>
					<input type='hidden' name='findStr' value='${param.findStr }'/>
					<input type='hidden' name='nowPage' value = '${param.nowPage }'/>
				</div>
				<input type='hidden' name='pwd'/>
			</form>
		</div>
		<script src='./js/student.js'></script>
	</body>
</html>