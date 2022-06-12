<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>score_find_name</title>
<link rel='stylesheet' type='text/css' href='./css/score.css'>
</head>
<body>
	<div id='score'>
		<form name='frm_find_name' id='frm_find_name' method = 'post' action = './score.do?job=findName'>
			<label>아이디</label><br/>
			<input type='text' name='id' value='${param.id}'/>
			<button>검색</button><br/>
			<button type='button' class='btnName' onclick='move(this.innerHTML)'>${mName}</button>
		</form>
		
		<script>
			function move(mName){
				let frm = opener.document.frm_score;
				let localFrm = document.frm_find_name;
				frm.mName.value = mName;
				frm.id.value = localFrm.id.value;
				self.close();
			}
		</script>
	</div>
	
</body>
</html>