/**
 * 게시판 script
 * date : 2022.06
 */

let board={};

// input, modify, repl에서만 호출되게끔 함.
board.init=function(){
   fonts =["맑은고딕", "나눔바른고딕 Light", "나눔손글씨 중학생", "돋움",
         "궁서체", "바탕체", "굴림체"];
   fonts.sort();
   
   $('#summernote').summernote({
      fontNames : fonts
   });
}

board.find = function(frm){
	frm.nowPage.value = 1;
	board.select(frm);
}

board.input = function(frm){
   /*let param = $(frm).serializeArray(); // 첨부파일이 배열로 들어가기 때문에 serialize()로 하지 않고 serializeArray()로 해야 함.
   $.post('board.do?job=input', param);*/
	frm.action = 'board.do?job=input';
	frm.submit();
}

board.select = function(frm){
  // $.post('board.do?job=select');
	frm.action = 'board.do?job=select';
	frm.submit();
}

board.view = function(sno){
	let frm = $('.frm_board_list')[0];
	frm.sno.value = sno;
	frm.action = 'board.do?job=view';
	frm.submit();
  // $.post('board.do?job=view');
}

board.inputR = function(frm){
	frm.action = 'board.do?job=inputR';
	frm.submit();   
//$.post('board.do?job=inputR');
}

board.modify = function(frm){
	frm.action = 'board.do?job=modify';
	frm.submit()
   //$.post('board.do?job=modify');
}

board.deleteR = function(frm){
	let yn = confirm('정말 삭제??');
	if(!yn) return;
	
	frm.action = 'board.do?job=deleteR';
	frm.submit();
  // $.post('board.do?job=deleteR');
}

board.repl = function(frm){
	frm.action = 'board.do?job=repl';
	frm.submit();
   //$.post('board.do?job=repl');
}

board.modifyR = function(frm){
	frm.action = 'board.do?job=modifyR';
	frm.submit();
   // $.post('board.do?job=modifyR');
   // location.href='board.do?job=modifyR'; // 이렇게 적어도 됨. (동일한 작업을 함.)
}

board.replR = function(frm){
	frm.action = 'board.do?job=replR';
	frm.submit();
   //$.post('board.do?job=replR');
}

board.movePage = function(page){
	let frm = $('.frm_board_list')[0];
	frm.nowPage.value = page;
	frm.action = 'board.do?job=select';
	frm.submit();
   //$.post('board.do?job=select');
}