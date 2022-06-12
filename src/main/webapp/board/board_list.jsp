<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <!-- summernote에서 가져온 jquery를 input 페이지에 붙여놨으므로 
                                                       종합세트인 list 페이지에도 똑같이 복붙해서 사용해야 충돌이 일어나지 않음. 
                                                       input 페이지에서 사용한 제이쿼리와 버전이 다르면 충돌이 일어날 수 있음. -->
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
</head>
<body>
   <div id='board_list'>
      <h2>게시판</h2>
      <form name='frm_board_list' class='frm_board_list' id='frm_board_list' method='post' onsubmit='return false'>
         <button type='button' class='btnInput' onclick='board.input(this.form)'>신규입력</button>
         <input type='search' name='findStr' id='findStr' value='${param.findStr}' onkeypress='if(event.keyCode == 13){board.select(this.form);}'/>
         <button type='button' class='btnFind' onclick='board.find(this.form)'>조회</button>
         <input type='hidden' name='nowPage' value='${param.nowPage }'/>
         <input type='hidden' name='sno'/> <%-- value='${param.sno}' --%>
      </form>
      <br/>
      <div id='lists'>
         <div class='titles'>
            <span class='sno'>No.</span>
            <span class='subject'>제목</span>
            <span class='nal'>작성일</span>
            <span class='id'>작성자</span>
            <span class='hit'>조회수</span>
         </div>
         
         <div class='items'>
            <c:forEach var='vo' begin='1' end='10'>
               <div class='item' onclick='board.view(1)'>
                  <span class='sno'>No.</span>
                  <span class='subject'>제목</span>
                  <span class='nal'>작성일</span>
                  <span class='id'>작성자</span>
                  <span class='hit'>조회수</span>
               </div>
            </c:forEach>
         </div>
         <br/>
         
         <div class='paging'>
            <button type='button' onclick='board.movePage(1)'>처음</button>
            <button type='button' onclick='board.movePage(-1)'>이전</button>
            
            <c:forEach var='i' begin='1' end='4'>
               <button type='button' onclick='board.movePage(${i})'>${i}</button>
            </c:forEach>
            
            <button type='button' onclick='board.movePage(1)'>다음</button>
            <button type='button' onclick='board.movePage(1)'>끝</button>
         </div>
      </div>
   </div>
</body>
</html>