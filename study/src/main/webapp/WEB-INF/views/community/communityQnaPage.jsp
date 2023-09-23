<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <style type="text/css">
        /* 해당 페이지 전용 클래스 */
        .comm__qna__question__issolved>li {
          margin-left: 2%;
          margin-right: 2%;
          color: #B7B7B7;
          font-weight: bold;
          float: left;
          list-style: none;
        }

        .comm__qna__question__issolved>li:hover {
          color: #333;
        }

        .comm__qna__question__sort>li {
          margin-left: 5%;
          margin-top: 4%;
          font-size: medium;
          color: #B7B7B7;
          float: left;
        }

        .comm__qna__question__sort>li:hover {
          color: #333;
        }

        .qna__not__solved {
          padding: 0.5% 1%;
          padding-right: 1%;
          margin-right: 1%;
          color: white;
          font-size: small;
          background-color: #B7B7B7;
          border-radius: 10%;
        }

        .qna__solved {
          padding: 0.5% 1%;
          margin-right: 1%;
          color: white;
          font-size: small;
          background-color: #E53637;
          border-radius: 10%;
        }

        .comm__qna__question__etc__info>span {
          font-size: smaller;
          color: #B7B7B7;
        }

        .comm__qna__question__etc__info>.etc__info__left {
          float: left;
        }

        .comm__qna__question__etc__info>.etc__info__right {
          float: right;
        }

        /* 외부 탬플릿 클래스 */
        .product__details__tab__content__item:hover {
          background-color: #F3F2EE;
        }
      </style>
      <script src="client/js/jquery-3.3.1.min.js"></script>
    </head>

    <body>
      <div class="container">
        <!--Community Top Bar Start-->
        <div>
          <!--IsSolved Bar Start-->
          <div class="row">
            <div class="col-lg-12">
              <ul class="comm__qna__question__issolved">
                <li>전체</li>
                <li>미해결</li>
                <li>해결됨</li>
              </ul>
            </div>
          </div>
          <!--IsSolved Bar End-->
          <hr>

          <!--Search Bar Start-->
          <form id="searchForm" name="searchForm">
            <div class="row">
              <div class="col-lg-3">
                <div class="checkout__input">
                  <select id="searchType" name="searchType">
                    <option value="questionAll">==== 선택하세요 ====</option>
                    <option value="questionTitle">게시글 제목</option>
                    <option value="questionContent">게시글 내용</option>
                    <option value="questionWriter">글 작성자</option>
                  </select>
                </div>
              </div>
              <div class="col-lg-7">
                <div class="checkout__input">
                  <input type="text" id="searchContent" name="searchContent" placeholder="검색 내용을 입력하세요..">
                </div>
              </div>
              <div class="col-lg-2">
                <div class="checkout__input">
                  <button type="button" class="site-btn" onclick="searchQuestions()"
                    style="border-radius: 10px; font-size: medium;">검색</button>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-10">
                <div class="checkout__input">
                  <input type="text" id="searchCourse" name="searchCourse"
                    placeholder="어떤 강의에 대한 질문인가요? (강의 외 질문 : '기타/홈페이지 질문')">
                </div>
              </div>
            </div>
          </form>
          <!--Search Bar End-->

          <!--Order/Write Bar Start-->
          <div class="row">
            <div class="col-lg-10">
              <ul class="comm__qna__question__sort">
                <li class="sort__active" id="mostRecent">최신순</li>
                <li id="mostHit">조회순</li>
              </ul>
            </div>
            <div class="col-lg-2">
              <div class="checkout__input">
                <button type="button" class="site-btn" style="border-radius: 10px; font-size: medium;">글쓰기</button>
              </div>
            </div>
          </div>
          <!--Order/Write Bar End-->
          <hr>
        </div>
        <!--Community Top Bar End-->

        <!--Community Question List Start-->
        <div class="comm__qna__question">
          <div class="product__details__tab__content__item">
            <h5 class="col-lg-12"><span class="qna__not__solved">미해결</span>질문 게시글 제목1</h5>
            <p class="col-lg-9">질문 게시글 내용1 입니다...</p>
            <br>
            <div class="col-lg-12 comm__qna__question__etc__info">
              <span class="etc__info__left">[uyeol] · 예제로 배우는 스프링 입문 (개정판) · 1시간 전</span>
              <span class="etc__info__right">조회수:19 답변:3</span>
            </div>
          </div>
          <hr>
          <div class="product__details__tab__content__item">
            <h5 class="col-lg-12"><span class="qna__solved">해결됨</span>질문 게시글 제목3</h5>
            <p class="col-lg-9">질문 게시글 내용3 입니다...</p>
            <br>
            <div class="col-lg-12 comm__qna__question__etc__info">
              <span class="etc__info__left">[uyeol] · 자바 ORM 표준 JPA 프로그래밍 - 기본편 · 12시간 전</span>
              <span class="etc__info__right">조회수:202 답변:10</span>
            </div>
          </div>
          <hr>
        </div>

        <!--Community Question List End-->
      </div>

      <script>
        // 변수
        let loginMemberId = '<%=(String)session.getAttribute("loginId")%>';

        let searchContent = $('#searchContent').val();
        let sortType = 'mostRecent';

        let totalCount; // 총 개시글 수

        let currentPage = 1; // 현재 페이지
        let totalPage; // 전체 페이지 수

        // 처음 로딩
        loadQuestions();

        // 처음 로딩 시 질문 리스트를 불러오는 함수
        function loadQuestions() {
          let searchData = convertToObject($("#searchForm").serializeArray());
          searchData.sortType = sortType;
          $.ajax({
            url: 'questionsearchwithpaging.do',
            method: 'post',
            data: {
              searchType: searchData.searchType,
              searchContent: searchData.searchContent,
              searchCourse: searchData.searchCourse,
              sortType: searchData.sortType,
              page: currentPage
            },
            success: function (questionsJson) {
              showQuestions(questionsJson);
              showPageList();
            },
            error: function (err) {
              console.log(err);
            }
          });
        }

        // 질문 목록을 보여주는 함수
        function showQuestions(questionsJson) {
          $('div.comm__qna__question').empty();
          questionsJson.forEach(question => {
            console.log(`\${question.questionSolve}`);
            $('div.comm__qna__question')
              .append(
                $('<div class="product__details__tab__content__item"> /')
                  .append($(`
                    <c:if test="\${question.questionSolve eq 'not_solved'}">
                      <h5 class="col-lg-12"><span class="qna__not__solved">미해결</span>\${question.questionTitle}</h5>
                    </c:if>
                    <c:if test="\${question.questionSolve eq 'solved'}">
                      <h5 class="col-lg-12"><span class="qna__solved">해결됨</span>\${question.questionTitle}</h5>
                    </c:if>
                    `))
                  .append($('<p class="col-lg-9 comm__qna__question__content"> /').text(`\${question.questionContent}`))
                  .append($('<br>'))
                  .append(
                    $('<div class="col-lg-12 comm__qna__question__etc__info"> /')
                      .append($('<span class="etc__info__left"> /')
                        .text(`[\${question.memberId}] \${question.courseName}`))
                      .append($('<span class="etc__info__right"> /')
                        .text(`조회수:\${question.questionHit}   답변:\${question.answerCount}`))
                  )
                  .on('click', function () {
                    let url = 'communityqnadetailpage.do?questionId=' + question.questionId;
                    location.replace(url);
                  })
              )
              .append($('<hr>'));
          });
        }

        // 페이지 바 생성 함수
        function showPageList() {

        }

        // Form 데이터 -> Javascript Object 변환 함수
        function convertToObject(arrayData) {
          let object = {};
          for (let i = 0; i < arrayData.length; i++) {
            object[arrayData[i]['name']] = arrayData[i]['value'];
          }
          return object;
        }
      </script>
    </body>

    </html>