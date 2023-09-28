<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <style type="text/css">
        input[type=text] {
          color: #333;
        }

        select {
          padding: 14.5px;
          color: #5D5D5D;
          border: 1px solid #b7b7b7;
          border-radius: 5px;
        }

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
          cursor: pointer;
        }

        .comm__qna__question__issolved>.solve__active {
          color: #333;
        }

        .comm__qna__question__sort>li {
          margin-left: 5%;
          margin-top: 4%;
          font-size: small;
          font-weight: 900;
          color: #B7B7B7;
          float: left;
        }

        .comm__qna__question__sort>li:hover {
          color: #333;
          cursor: pointer;
        }

        .comm__qna__question__sort>.sort__active {
          color: #333;
        }

        .comm__qna__question__content {
          width: 100%;
          height: 25px;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        .qna__not__solved {
          padding: 0.5% 1%;
          padding-right: 1%;
          margin-right: 1%;
          color: white;
          font-size: small;
          background-color: #B7B7B7;
          border-radius: 20px;
        }

        .qna__solved {
          padding: 0.5% 1%;
          margin-right: 1%;
          color: white;
          font-size: small;
          background-color: #3188DB;
          border-radius: 20px;
        }

        .comm__qna__question__etc__info>span {
          font-size: smaller;
          color: #B7B7B7;
        }

        .comm__qna__question__etc__info>.etc__info__left {
          font-weight: 600;
          float: left;
        }

        .comm__qna__question__etc__info>.etc__info__right {
          font-weight: 900;
          float: right;
        }

        /* 외부 탬플릿 클래스 */
        .product__details__tab__content__item:hover {
          background-color: #F3F2EE;
          cursor: pointer;
        }
      </style>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
      <script src="client/js/jquery-3.3.1.min.js"></script>
      <script src="client/js/jquery.nice-select.min.js"></script>
    </head>

    <body>
      <div class="container">
        <!--Community Top Bar Start-->
        <div>
          <!--IsSolved Bar Start-->
          <div class="row">
            <div class="col-lg-12">
              <ul class="comm__qna__question__issolved">
                <li class="solve__active" id="solveAll">전체</li>
                <li id="solveNotSolved">미해결</li>
                <li id="solveSolved">해결됨</li>
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
                    <option value="questionAll">==== 전체 보기 ====</option>
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
                    style="padding: 14px 20px; background: #3188DB; border-radius: 8px;">
                    <i class="bi bi-search" style="font-size: large !important;"></i></button>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-10">
                <div class="checkout__input">
                  <input type="text" id="searchCourse" name="searchCourse"
                    placeholder="어떤 강의의 질문을 원하시나요?(강의 외 질문 : '기타/홈페이지 질문')">
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
                <button type="button" id="writeBtn" class="site-btn" onclick="location.href='communityqnainsertpage.do'"
                  style="padding: 9px 15px; background: #333; border-radius: 8px; font-size: small;"><i
                    class="bi bi-pencil"></i>&nbsp;&nbsp;글쓰기</button>
              </div>
            </div>
          </div>
          <!--Order/Write Bar End-->
          <hr>
        </div>
        <!--Community Top Bar End-->

        <!--Community Question List Start-->
        <div class="comm__qna__question">
          <!-- loadQuestions() -> showQuestions(questionsJson) -->
        </div>
        <!--Community Question List End-->

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
        // 변수
        let loginMemberId = '<%=(String)session.getAttribute("loginId")%>';

        let searchContent = $('#searchContent').val();
        let solveType = 'solveAll'
        let sortType = 'mostRecent';

        let totalCount; // 총 개시글 수

        let currentPage = 1; // 현재 페이지
        let totalPage; // 전체 페이지 수

        // 처음 로딩
        setSolveBtn();
        setSortBtn();
        setInsertBtn();
        loadQuestions();

        // 처음 로딩 시 질문 리스트를 불러오는 함수
        function loadQuestions() {
          let searchData = convertToObject($("#searchForm").serializeArray());
          searchData.solveType = solveType;
          searchData.sortType = sortType;
          $.ajax({
            url: 'questionsearchwithpaging.do',
            method: 'post',
            data: {
              searchType: searchData.searchType,
              searchContent: searchData.searchContent,
              searchCourse: searchData.searchCourse,
              solveType: searchData.solveType,
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
            $('div.comm__qna__question')
              .append(
                $('<div class="product__details__tab__content__item"> /')
                  .append($(
                    `<h5 class="col-lg-12"><span class="` +
                    (question.questionSolve == 'not_solved' ? 'qna__not__solved' : 'qna__solved') + `">` +
                    (question.questionSolve == 'not_solved' ? '미해결' : '해결됨') +
                    `</span>\${question.questionTitle}</h5>`
                  ))
                  .append($('<p class="col-lg-9 comm__qna__question__content"> /').text(`\${question.questionContent}`))
                  .append($('<br>'))
                  .append(
                    $('<div class="col-lg-12 comm__qna__question__etc__info"> /')
                      .append($('<span class="etc__info__left"> /')
                        .text(
                          (question.memberId == null ? `[탈퇴 회원] ㆍ ` : `[\${question.memberId}] ㆍ `) +
                          (question.courseName == null ? '기타/홈페이지 질문' : question.courseName) + 
                          ` ㆍ \${question.questionEnterDate}`
                        )
                      )
                      .append($(
                        `<span class="etc__info__right">` +
                        `<i class="bi bi-eye"></i> \${question.questionHit}&nbsp;&nbsp;&nbsp;` +
                        `<i class="bi bi-reply"></i> \${question.answerCount} ` +
                        `</span>`)
                      )
                  )
                  .on('click', function () {
                    let url = 'communityqnadetailpage.do?questionId=' + question.questionId;
                    $(location).attr('href', url);
                  })
              )
              .append($('<hr>'));
          });
        }

        // 페이지 바 생성 함수
        function showPageList() {
          let searchData = convertToObject($("#searchForm").serializeArray());
          searchData.solveType = solveType;
          searchData.sortType = sortType;
          $.ajax({
            url: 'questioncount.do',
            method: 'post',
            data: {
              searchType: searchData.searchType,
              searchContent: searchData.searchContent,
              searchCourse: searchData.searchCourse,
              solveType: searchData.solveType,
              sortType: searchData.sortType,
            },
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
            loadQuestions();
          });
          $('.product__pagination').append(atag);
        }

        // 해결여부 버튼 활성화 함수
        function setSolveBtn() {
          $('ul.comm__qna__question__issolved>li').on('click', function () {
            console.log('log')
            solveType = $(this).attr('id');

            let lis = $(this).parent().children();
            lis.each(function (idx, li) {
              if ($(li).attr('id') == solveType) {
                $(li).attr('class', 'solve__active');
              } else {
                $(li).attr('class', 'solve__nonactive');
              }
            });
            loadQuestions();
          });
        }

        // 정렬 버튼 활성화 함수
        function setSortBtn() {
          $('ul.comm__qna__question__sort>li').on('click', function () {
            console.log('log')
            sortType = $(this).attr('id');

            let lis = $(this).parent().children();
            lis.each(function (idx, li) {
              if ($(li).attr('id') == sortType) {
                $(li).attr('class', 'sort__active');
              } else {
                $(li).attr('class', 'sort__nonactive');
              }
            });
            loadQuestions();
          });
        }

        // Form 데이터 -> Javascript Object 변환 함수
        function convertToObject(arrayData) {
          let object = {};
          for (let i = 0; i < arrayData.length; i++) {
            object[arrayData[i]['name']] = arrayData[i]['value'];
          }
          return object;
        }

        // 글쓰기 버튼 관련 함수
        function setInsertBtn() {
          if (loginMemberId == 'null') {
            $('#writeBtn').hide();
          }
          // onclick 은 태그에 정의해놓았음
        }

        // 질문 검색 함수
        function searchQuestions() {
          let searchData = convertToObject($("#searchForm").serializeArray());
          searchData.solveType = solveType;
          searchData.sortType = sortType;
          $.ajax({
            url: 'questionsearchwithpaging.do',
            method: 'post',
            data: {
              searchType: searchData.searchType,
              searchContent: searchData.searchContent,
              searchCourse: searchData.searchCourse,
              solveType: searchData.solveType,
              sortType: searchData.sortType,
              page: 1
            },
            success: function (questionsJson) {
              console.log(questionsJson);
              showQuestions(questionsJson);
              showPageList();
            },
            error: function (err) {
              console.log(err);
            }
          });
        }
      </script>
    </body>

    </html>