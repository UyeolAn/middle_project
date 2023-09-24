<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <style>
        .qna__not__solved {
          padding: 0.5% 1%;
          padding-right: 1%;
          margin-right: 1%;
          color: white;
          font-size: medium;
          background-color: #B7B7B7;
          border-radius: 10%;
        }

        .qna__solved {
          padding: 0.5% 1%;
          margin-right: 1%;
          color: white;
          font-size: medium;
          background-color: #E53637;
          border-radius: 10%;
        }

        .comm__qna__question__detail__etc__info>.etc__info__name {
          font-size: medium;
          font-weight: bold;
          color: #777;
        }

        .comm__qna__question__detail__etc__info>.etc__info__datehit {
          font-size: small;
          color: #B7B7B7;
        }

        .small-btn {
          margin-right: 3%;
          padding: 9px 20px;
          font-size: medium;
          border-radius: 10px;
        }
      </style>
      <script src="client/js/jquery-3.3.1.min.js"></script>
    </head>

    <body>
      <div class="container col-lg-12">
        <!--Question Title Bar Start-->
        <div class="product__details__tab__content__item">
          <h4 class="col-lg-12" id="questionTitle" style="font-weight: 1000;">
            <c:if test="${question.questionSolve eq 'not_solved'}">
              <span class="qna__not__solved">미해결</span>
            </c:if>
            <c:if test="${question.questionSolve eq 'solved'}">
              <span class="qna__solved">해결됨</span>
            </c:if>
            ${question.questionTitle}
          </h4>
          <br>
          <div class="col-lg-12 comm__qna__question__detail__etc__info">
            <span class="etc__info__name" id="memberId">${question.memberId}</span>
            <c:if test="${not empty question.courseName}">
              <span class="etc__info__datehit"> ㆍ ${question.courseName}</span>
            </c:if>
            <c:if test="${empty question.courseName}">
              <span class="etc__info__datehit"> ㆍ 기타/홈페이지 질문</span>
            </c:if>
            <br>
            <span class="etc__info__datehit">작성일 ${question.questionEnterDate}</span>
            <span class="etc__info__datehit">수정일
              <c:if test="${empty question.questionUpdateDate}">0000-00-00</c:if>
              <c:if test="${not empty question.questionUpdateDate}">${question.questionUpdateDate}</c:if>
            </span>
            <span class="etc__info__datehit">조회수 ${question.questionHit}</span>
          </div>
        </div>
        <!--Question Title Bar End-->
        <hr>

        <!--Question Main Body Start-->
        <div class="col-lg-12 row" style="margin-top: 5%;">
          <div class="col-lg-10">
            <p class="col-lg-12" id="questionContent" style="white-space:pre;">${question.questionContent}</p>
          </div>
          <div class="col-lg-7 comm__qna__question__detail__buttons" style="margin-top: 5%;">
            <button type="button" id="updateBtn" class="site-btn small-btn"
              onclick="location.href='communityqnaupdatepage.do?questionId=${question.questionId}'">수정</button>
            <button type="button" id="deleteBtn" class="site-btn small-btn" style="background: #E53637;"
              onclick="deleteQuestion()">삭제</button>
            <form id="deleteForm" action="questiondelete.do">
              <input type="hidden" id="questionId" name="questionId" value="${question.questionId}">
            </form>
          </div>
        </div>
        <!--Question Main Body End-->
        <hr>

      </div>
      <script>
        // 변수 선언
        let loginMemberId = '<%=(String)session.getAttribute("loginId")%>';
        let boardId = '${board.boardId}';

        let sortType = 'mostRecent'; // 댓글 정렬 기준

        let totalCount; // 총 댓글 수

        let currentPage = 1; // 댓글 현재 페이지
        let totalPage; // 댓글 전체 페이지 수

        setUpdDelBtn();

        // 수정/삭제 버튼 로그인한 사용자만 보이게 하는 함수
        function setUpdDelBtn() {
          if (loginMemberId == 'null' || loginMemberId != '${question.memberId}') {
            $('#updateBtn').hide();
            $('#deleteBtn').hide();
          }
        }

        // 게시글 삭제 함수
        function deleteQuestion() {
          if (confirm("정말 삭제하시겠습니까??") == true) {
            $('#deleteForm').submit();
          } else {
            return false;
          }
        }
      </script>
    </body>

    </html>