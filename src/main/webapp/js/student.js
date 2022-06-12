/**
 * 학생관리와 관련된 스클립트
 */



/* 로그인/ 로그아웃/ 아이디찾기/ 암호찾기---------*/
var btn_login = document.getElementById('btn_login');
var btn_login2 = document.getElementById('btn_login2');
var btn_logout = document.getElementById('btn_logout');
var btn_find_id = document.getElementById('btn_find_id');
var btn_find_pwd = document.getElementById('btn_find_pwd');


//로그인에서 엔터
function enterkey(btn) {
	if (window.event.keyCode == 13) {
    	btn.click();
	}
}


// index에서 로그인 버튼이 클릭된 경우
if(btn_login != null) {
	btn_login.onclick = function(){
		let url = 'index.jsp?inc=./student/form_login.jsp';
		location.href=url; //페이지만 이동(단순이동)
	}
}

// index에서 로그아웃 버튼이 클릭된 경우
if(btn_logout != null){
	btn_logout.onclick = function(){
	}
}

// 로그인폼(form_login)에서 로그인 버튼이 클릭된 경우
if(btn_login2 != null){
	btn_login2.onclick = function(){
		let url = './student/login_result.jsp';
		let frm = document.frm_login;
		frm.action = url;
		frm.submit(); //폼에있는 정보를 url로 전달
	}
}

// 로그인된 상태에서 로그아웃 버튼이 클릭된 경우
if(btn_logout != null){
	btn_logout.onclick = function(){
		let url = './student/logout_result.jsp';
		let frm = document.frm_login_out;
		frm.action = url;
		frm.submit();
	}
}

//아이디 찾기
if(btn_find_id != null){
	btn_find_id.onclick = function(){
		let frm = document.frm_find_id; //name
		let url = 'index.jsp?inc=./student/find_id_result.jsp';
		frm.action = url;
		frm.submit();
	}
}

//암호 찾기
if(btn_find_pwd != null){
	btn_find_pwd.onclick = function(){
		let frm = document.frm_find_pwd; //name
		let url = 'index.jsp?inc=./student/find_pwd_result.jsp';
		frm.action = url;
		frm.submit();
	}
}




/*학생 정보*/
var btnInput = document.getElementById('btnInput');
var btnSave = document.getElementById('btnSave');
var btnList = document.getElementById('btnList');
var btnDelete = document.getElementById('btnDelete');
var btnFind = document.getElementById('btnFind'); 
var btnUpdate = document.getElementById('btnUpdate');
var btnZipFind = document.getElementById('btnZipFind');


// 입력
if(btnInput != null){
	btnInput.onclick = function(){
		let frm = document.frm_student_list;
		let url = 'index.jsp?inc=student/student_input_form.jsp';
		frm.action = url;
		frm.submit();
	}
}


//저장
if(btnSave != null){
	btnSave.onclick = function(){
		let frm = document.frm_student;
		let url = 'student/student_input_result.jsp';
		frm.action = url;
		frm.submit();
	}
}


//취소
if(btnList != null){
	btnList.onclick = function(){
		let frm = document.frm_student;
		let url = 'index.jsp?inc=student/student_list.jsp';
		frm.action = url;
		frm.submit();
	}
}


//수정
if(btnUpdate != null){
	btnUpdate.onclick = function(){
		let pwd = prompt("학생정보를 수정하려면 암호를 입력하세요:)");
		if(pwd == null){
			return;
		}
		
		let frm = document.frm_student;
		let url = './student/student_modify_result.jsp';
		frm.pwd.value = pwd;
		frm.action = url;
		frm.submit();
	}
}

// 삭제
if(btnDelete != null){
	btnDelete.onclick = function(){
		let url = 'student/student_delete_result.jsp';
		let frm = document.frm_student;
		let pwd = prompt("학생정보를 삭제하려면 암호를 입력하세요:)");
		if(pwd == null){
			return;
		}
		frm.pwd.value = pwd;
		frm.action = url;
		frm.submit();
	}
}

// 검색
if(btnFind != null){
	btnFind.onclick = function(){
		let frm = document.frm_student_list;
		let url = 'index.jsp?inc=student/student_list.jsp';
		frm.nowPage.value = 1;
		frm.action = url;
		frm.submit();
	}
}


//페이지 이동 버튼
function movePage(page){
	let frm = document.frm_student_list;
		let url = 'index.jsp?inc=student/student_list.jsp';
		frm.nowPage.value = page;
		frm.action = url;
		frm.submit();
}

// 리스트에서 클릭시 수정할 데이터 가져오기
function modify(id){
	let url = 'index.jsp?inc=student/student_modify_form.jsp'
	let frm = document.frm_student_list;
	frm.id.value = id;
	frm.action = url;
	frm.submit();
}

// 우편번호 검색
var frm = document.frm_student;
if(btnZipFind != null){
	frm.btnZipFind.onclick = function(){
   	 	new daum.Postcode({
    		oncomplete : function(data){
   			 	frm.zipcode.value = data.zonecode;
    			frm.address.value = data.address; 
   	 		}
    	}).open();
	}
}






