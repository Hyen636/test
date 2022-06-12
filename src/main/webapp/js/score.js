/**
 * 성적 관리
 */

function getId(id){
	return document.getElementById(id);
}

//리스트 검색
if(getId('btnFind') != null){
	getId('btnFind').onclick = function(){
		let frm = document.frm_score_list;
		frm.action = 'score.do?job=list';
		frm.submit();
	}
}

//입력
if(getId('btnInput') != null){
	getId('btnInput').onclick = function(){
		let frm = document.frm_score_list;
		frm.action = 'score.do?job=input';
		frm.submit();
	}
}

//저장
if(getId('btnSave') != null){
	getId('btnSave').onclick = function(){
		let frm = document.frm_score;
		frm.action = 'score.do?job=inputR'
		frm.submit();
	}
}

//취소
if(getId('btnList') != null){
	getId('btnList').onclick = function(){
		let frm = document.frm_score;
		frm.action = 'score.do?job=list';
		frm.submit();
	}
}

//상세보기(리스트에서 선택)
function view(sno){
	let frm = document.frm_score_list;
	frm.sno.value = sno;
	frm.action = 'score.do?job=view';
	frm.submit();
}

//상세보기 -> 수정
if(getId('btnUpdate') != null){
	getId('btnUpdate').onclick = function(){
		let frm = document.frm_score;
		frm.action = 'score.do?job=modify';
		frm.submit();
	}
}

//삭제
if(getId('btnDelete') != null){
	getId('btnDelete').onclick = function(){
		let frm = document.frm_score;
		frm.action = 'score.do?job=deleteR';
		frm.submit();
	}
}

//수정
if(getId('btnModify') != null){
	getId('btnModify').onclick = function(){
		let frm = document.frm_score;
		frm.action = 'score.do?job=modifyR';
		frm.submit();
	}
}

//페이지
function movePage(page){
	let frm = document.frm_score_list;
	frm.nowPage.value = page;
	frm.action='score.do?job=list';
	frm.submit();
}

//아이디검색
if(getId('btnFindName') != null){
	getId('btnFindName').onclick = function(){
		let url = 'score.do?job=findName';
		let win = window.open(url,'win','width=300, height=200');
	}
}
