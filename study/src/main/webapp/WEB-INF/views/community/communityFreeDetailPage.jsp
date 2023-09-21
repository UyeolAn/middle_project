<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <style>
        .comm__free__board__detail__etc__info>.etc__info__name {
          font-size: medium;
          font-weight: bold;
          color: #777;
        }

        .comm__free__board__detail__etc__info>.etc__info__datehit {
          font-size: small;
          color: #B7B7B7;
        }

        .small-btn {
          margin-right: 3%;
          padding: 9px 20px;
          font-size: medium;
        }

        .like-btn {
          margin-right: 3%;
          padding: 9px 20px;
          font-size: medium;
          background: #ffa9a9;
          border-radius: 20px;
        }

        .like-btn:hover {
          background: #E53637;
        }

        .dislike-btn {
          margin-right: 3%;
          padding: 9px 20px;
          font-size: medium;
          background: #ccc;
          border-radius: 20px;
        }

        .dislike-btn:hover {
          background: #777;
        }
      </style>
    </head>

    <body>
      <div class="container col-lg-12">
        <!--Board Title Bar Start-->
        <div class="product__details__tab__content__item">
          <h4 class="col-lg-12" id="boardTitle">${board.boardTitle}</h4>
          <br>
          <div class="col-lg-12 comm__free__board__detail__etc__info">
            <span class="etc__info__name" id="memberId">${board.memberId}</span>
            <br>
            <span class="etc__info__datehit">작성일 ${board.boardEnterDate} 수정일 ${board.boardUpdateDate} 조회수
              ${board.boardHit}</span>
          </div>
        </div>
        <!--Board Title Bar End-->
        <hr>

        <!--Board Main Body Start-->
        <div class="row">
          <div class="col-lg-10">
            <p id="boardContent" style="white-space:pre;"><c:out value="${board.boardContent}"/></p>
          </div>
          <div class="col-lg-7 comm__free__board__detail__buttons">
            <button type="button" class="site-btn small-btn"
              onclick="location.href='communityfreeupdatepage.do?boardId=${board.boardId}'">수정</button>
            <button type="button" class="site-btn small-btn" style="background: #E53637;"
              onclick="deleteBoard()">삭제</button>
            <form id="deleteForm" action="boarddelete.do">
              <input type="hidden" id="boardId" name="boardId" value="${board.boardId}">
            </form>
          </div>
          <div class="col-lg-5 comm__free__board__detail__like">
            <button type="button" class="site-btn like-btn" onclick="">LIKE : ${board.boardLike}</button>
            <button type="button" class="site-btn dislike-btn">DISLIKE : ${board.boardDislike}</button>
          </div>
        </div>
        <!--Board Main Body End-->
        <hr>
      </div>
      <script>
        // 게시글 삭제 함수
        function deleteBoard() {
          if (confirm("정말 삭제하시겠습니까??") == true) {
            $('#deleteForm').submit();
          } else {
            return false;
          }
        }
      </script>
    </body>

    </html>