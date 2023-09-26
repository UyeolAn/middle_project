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

        .answer__info__count {
          font-size: medium;
          font-weight: bold;
          color: #777;
        }

        .comm__qna__answer__sort>li {
          margin-left: 5%;
          margin-top: 4%;
          font-size: medium;
          color: #B7B7B7;
          float: left;
        }

        .comm__qna__answer__sort>li:hover {
          color: #333;
          cursor: pointer;
        }

        .comm__qna__answer__sort>.sort__active {
          color: #333;
        }

        .answer-btn {
          margin-right: 1%;
          padding: 3px 7px;
          font-size: x-small;
          background: #aaa;
          border-radius: 5px;
          float: right;
        }

        .answer-solve-btn {
          background: #ffa9a9;
        }

        .answer-solve-btn:hover {
          background: #E53637;
        }

        .active-answer-solve-btn {
          background: #E53637;
        }

        .active-answer-solve-btn:hover {
          background: #ffa9a9;
        }

        .answer__textarea {
          width: 100%;
          border: 1px solid #e1e1e1;
          padding-left: 20px;
          padding-top: 12px;
          font-size: 15px;
          margin-bottom: 24px;
          resize: none;
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
            <c:if test="${not empty question.questionImg}">
              <div class="col-lg-10">
                <img src="client/img/question/${question.questionImg}" alt="질문 이미지">
              </div>
            </c:if>
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

        <!--Reply Top Bar Start-->
        <div class="col-lg-12 contact__form comm__qna__question__answer_topbar">
          <span class="col-lg-12 answer__info__count" id="answerCount">ANSWER : 10</span>
          <br>
          <div class="col-lg-12">
            <textarea id="answerInput" name="answerInput" placeholder="답변을 입력하세요..."
              style="height: 70px; margin-top: 10px; color: #333; "></textarea>
          </div>
          <div class="col-lg-12 row">
            <div class="col-lg-9">
              <ul class="comm__qna__answer__sort">
                <li class="sort__active" id="mostRecent">최신순</li>
                <li id="registDate">등록순</li>
              </ul>
            </div>
            <div class="col-lg-3">
              <div class="checkout__input">
                <button type="button" id="writeBtn" class="site-btn small-btn"
                  style="float: right; padding: 9px 20px; font-size: medium;" onclick="insertAnswer()">등록</button>
              </div>
            </div>
          </div>
        </div>
        <!--Reply Top Bar End-->
        <hr>

        <!--Reply List Start-->
        <div class="comm__qna__answer">
          <!--loadReplies() -> showAnswers()-->
        </div>
        <!--Reply List End-->

        <!--Page Bar Start-->
        <div class="row">
          <div class="col-lg-12">
            <div class="product__pagination">
              <!-- <a class="active" href="#">1</a> -->
            </div>
          </div>
        </div>
        <!--Page Bar End-->

      </div>
      <script>
        // 변수 선언
        let loginMemberId = '<%=(String)session.getAttribute("loginId")%>';
        let questionId = '${question.questionId}';

        let sortType = 'mostRecent'; // 답변 정렬 기준

        let totalCount; // 총 답변 수

        let currentPage = 1; // 답변 현재 페이지
        let totalPage; // 전체 페이지 수

        setUpdDelBtn();
        loadAnswerCount();
        loadAnswers();
        setSortBtn();

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

        // 댓글수를 불러오는 함수
        function loadAnswerCount() {
          $.ajax({
            url: 'answercount.do?questionId=' + questionId,
            method: 'get',
            success: function (countJson) {
              let answerCount = countJson.totalCount;
              $('.answer__info__count').empty();
              $('.answer__info__count').text('ANSWER : ' + answerCount);
            },
            error: function (err) {
              console.log(err);
            }
          });
        }

        // 답변 불러오는 함수
        function loadAnswers() {
          $.ajax({
            url: 'answersortwithpaging.do',
            method: 'post',
            data: {
              questionId: questionId,
              sortType: sortType,
              page: currentPage
            },
            success: function (answersJson) {
              showAnswers(answersJson);
              showPageList();
              setAnswerUpdDelBtn();
              setSolveBtn();
            },
            error: function (err) {
              console.log(err);
            }
          });
        }



        // 댓글 목록을 보여주는 함수
        function showAnswers(answersJson) {
          $('div.comm__qna__answer').empty();
          answersJson.forEach(answer => {
            $('div.comm__qna__answer')
              .append(
                $('<div class="col-lg-12 comm__qna__question__detail__etc__info" style="margin-top: 3%;"> /')
                  .append()
                  .append(
                    (answer.memberAuthor == 'client' ?
                      $('<span class="etc__info__name"> /').text(`\${answer.memberId}`) :
                      $('<span class="etc__info__name" style="color: #fb7f7f"> /').text(`\${answer.memberId}(관리자)`))
                  )
                  .append($(
                    `<button type="button" class="site-btn answer-btn ` +
                    (answer.answerSolve == 'not_solved' ? 'answer-solve-btn' : 'active-answer-solve-btn') +
                    `">`)
                    .text('SOLVE').val(`\${answer.answerSolve}`))
                  .append($('<button type="button" class="site-btn answer-btn answer-delete-btn">')
                    .text('삭제').val(`\${answer.memberId}`))
                  .append($('<button type="button" class="site-btn answer-btn answer-update-btn">')
                    .text('수정').val(`\${answer.memberId}`))
                  .append($(`<button type="button" class="site-btn answer-btn answer-update-check-btn" style="background: #E53637">`)
                    .text('수정').val(`\${answer.memberId}`).hide())
                  .append($('<br>'))
                  .append(
                    $('<div class="answer-content-box" style="margin-top: 1%; margin-bottom: 3%;"> /')
                      .append($('<p class="answer-content" style="white-space:pre;"> /')
                        .text(`\${answer.answerContent}`))
                  )
                  .append($('<input type="hidden" class="answer-id-hidden">').val(`\${answer.answerId}`))
              )
              .append($('<hr>'));
          });
        }

        // 댓글 페이지 바 생성 함수
        function showPageList() {
          $.ajax({
            url: 'answercount.do?questionId=' + questionId,
            method: 'get',
            success: function (countJson) {
              totalCount = countJson.totalCount;
              let totalPage = Math.ceil(totalCount / 5);

              let endPage = totalPage < Math.ceil(currentPage / 10) * 10 ? totalPage : Math.ceil(currentPage / 10) * 10;
              let startPage = Math.floor(currentPage / 10) * 10 + 1;

              let prev = startPage > 1;
              let next = endPage < totalPage;

              console.log(totalCount);
              console.log(endPage);
              console.log(startPage);
              console.log(currentPage);
              console.log(prev);
              console.log(next);

              $('.product__pagination').empty();
              if (prev) {
                makePageAtag("&laquo", startPage - 1);
              }
              for (let i = startPage; i <= endPage; i++) {
                makePageAtag(i, i);
              }
              if (next) {
                makePageAtag("&raquo", endPage + 1);
              }
            },
            error: function (err) {
              console.log(err);
            }
          });
        }

        // 페이지 a태그 생성 함수
        function makePageAtag(inner, page) {
          let atag = $('<a />');
          atag.removeAttr('href');
          if (page == currentPage) {
            atag.attr('class', 'active')
          }
          atag.attr('style', 'cursor: pointer;');
          atag.html(inner);
          atag.on('click', function () {
            currentPage = page;
            loadAnswers();
          });
          $('.product__pagination').append(atag);
        }

        // 정렬 버튼 활성화 함수
        function setSortBtn() {
          $('ul.comm__qna__answer__sort>li').on('click', function () {
            sortType = $(this).attr('id');
            let lis = $(this).parent().children();
            lis.each(function (idx, li) {
              if ($(li).attr('id') == sortType) {
                $(li).attr('class', 'sort__active');
              } else {
                $(li).attr('class', 'sort__nonactive');
              }
            });
            loadAnswers();
          });
        }

        // 댓글 등록 함수
        function insertAnswer() {
          if (loginMemberId != 'null') {
            let answerContent = $('#answerInput').val();
            if (answerContent != '') {
              $.ajax({
                url: 'answerinsert.do',
                method: 'post',
                data: {
                  questionId: questionId,
                  answerContent: answerContent
                },
                success: function (messageJson) {
                  alert(messageJson.message);
                  location.replace('communityqnadetailpage.do?questionId=' + questionId);
                },
                error: function (err) {
                  console.log(err);
                }
              });
            } else {
              alert('댓글 내용을 입력해주세요.');
            }
          } else {
            alert('로그인 하셔야 합니다!!');
          }
        }

        // 댓글 수정/삭제 버튼 관련 함수
        function setAnswerUpdDelBtn() {
          $('.answer-update-btn').each(function () {
            if ($(this).val() != loginMemberId) {
              $(this).hide();
            }
            $(this).on('click', function () {
              let answerId = $(this).parent().find('.answer-id-hidden').val();
              let answerBox = $(this).parent().find('.answer-content-box');
              let answerContent = answerBox.find('.answer-content').text();

              answerBox.empty();
              answerBox.append($('<textarea class="col-lg-12 answer__textarea" style="height: 70px; color: #333;" />').text(answerContent));
              $(this).hide();
              $(this).parent().find('.answer-delete-btn').attr('disabled', true);

              let updateBtn = $(this).parent().find('.answer-update-check-btn');
              updateBtn.show();
              updateBtn.on('click', function () {
                let updateContent = $('.answer__textarea').val();
                $.ajax({
                  url: 'answerupdate.do',
                  method: 'post',
                  data: {
                    answerId: answerId,
                    answerContent: updateContent
                  },
                  success: function (messageJson) {
                    alert(messageJson.message);
                    location.replace('communityqnadetailpage.do?questionId=' + questionId);
                  },
                  error: function (err) {
                    console.log(err);
                  }
                });
              });
            });
          });
          $('.answer-delete-btn').each(function () {
            if ($(this).val() != loginMemberId) {
              $(this).hide();
            }
            $(this).on('click', function () {
              let answerId = $(this).parent().find('.answer-id-hidden').val();
              $.ajax({
                url: 'answerdelete.do',
                method: 'post',
                data: {
                  answerId: answerId
                },
                success: function (messageJson) {
                  alert(messageJson.message);
                  location.replace('communityqnadetailpage.do?questionId=' + questionId);
                },
                error: function (err) {
                  console.log(err);
                }
              });
            });
          });
        }

        // 해결여부 버튼 관련 함수
        function setSolveBtn() {
          $('.answer-solve-btn').each(function () {
            if ('${question.memberId}' != loginMemberId) {
              $(this).hide();
            }
            $(this).on('click', function () {
              let answerId = $(this).parent().find('.answer-id-hidden').val();
              $.ajax({
                url: 'answersolved.do',
                method: 'post',
                data: {
                  questionId: questionId,
                  answerId: answerId
                },
                success: function (messageJson) {
                  alert(messageJson.message);
                  location.replace('communityqnadetailpage.do?questionId=' + questionId);
                },
                error: function (err) {
                  console.log(err);
                }
              });
            });
          });
          $('.active-answer-solve-btn').each(function () {
            if ('${question.memberId}' != loginMemberId) {
              $(this).hide();
            }
            $(this).on('click', function () {
              let answerId = $(this).parent().find('.answer-id-hidden').val();
              $.ajax({
                url: 'answernotsolved.do',
                method: 'post',
                data: {
                  questionId: questionId,
                  answerId: answerId
                },
                success: function (messageJson) {
                  alert(messageJson.message);
                  location.replace('communityqnadetailpage.do?questionId=' + questionId);
                },
                error: function (err) {
                  console.log(err);
                }
              });
            });
          });
        }
      </script>
    </body>

    </html>