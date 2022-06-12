<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_modify</title>

<!-- libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 

<!-- summernote css/js -->
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>

</head>
<body>
   <div id='board'>
      <h2>게시글 수정</h2>
      <form name='frm_board' class='frm_board' id='frm_board' method='post'>
         <label>작성일</label>
         <input type='date' name='nal'/>
         <br/>
         <label>작성자</label>
         <input type='text' name='id' size='18' value='${mId}'/>
         <br/>
         <label>제목</label>
         <input type='text' name='subject'/>
         <br/>
         <textarea rows='5' name='doc' id='summernote'></textarea>
         <br/>
         <label>첨부파일</label>
         <input type='file' name='attFile' class='attFile' multiple/>
         <br/>
         <div class='attList'></div>
         <div class='btns'>
            <button type='button' class='btnSave' onclick='board.modifyR(this.form)'>저장</button>
            <button type='button' class='btnCancel' onclick='board.select(this.form)'>취소</button>
         </div>
          <input type='text' name='findStr' value='${param.findStr}'/>
        	<input type='text' name='nowPage' value='${param.nowPage}'/>
      </form>
   </div>
   <script>
      board.init();
   </script>
</body>
</html>