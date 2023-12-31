<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>STUDY | MyCommunity</title>
    <style type="text/css">
      /* 해당 페이지 전용 클래스 */
      .mypage__title {
        margin-bottom: 27px;
        font-weight: 900;
      }

      .toptop__bar__hr {
        margin-top: 0 !important;
      }

      .mycomm__type>li {
        margin-top: 1%;
        margin-bottom: 0;
        margin-left: 2%;
        margin-right: 2%;
        padding-bottom: 7px;
        color: #B7B7B7;
        font-weight: 900;
        float: left;
        list-style: none;
      }

      .mycomm__type>li:hover {
        color: #333;
        cursor: pointer;
        border-bottom: 2px solid #3188DB;
      }

      .mycomm__type>.type__active {
        color: #333;
        border-bottom: 2px solid #3188DB;
      }

      .comm__qna__board__order>li {
        margin-left: 5%;
        margin-top: 4%;
        font-size: smaller;
        color: #B7B7B7;
        float: left;
      }

      .comm__qna__board__order>li:hover {
        color: #333;
      }

      .qna__not__solved {
        padding: 0.5% 1%;
        padding-right: 1%;
        margin-right: 2%;
        color: white;
        font-size: small;
        background-color: #B7B7B7;
        border-radius: 20px;
      }

      .qna__solved {
        padding: 0.5% 1%;
        margin-right: 2%;
        color: white;
        font-size: small;
        background-color: #3188DB;
        border-radius: 20px;
      }

      .list__title {
        width: 100%;
        font-size: medium;
        font-weight: bold;
        float: left;
        overflow: hidden;
        white-space: nowrap;
      }

      .list__content {
        width: 80%;
        font-size: medium;
        font-weight: bold;
        float: left;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }

      .list__date {
        color: #B7B7B7;
        font-size: small;
        font-weight: normal;
      }

      .list__etc {
        color: #B7B7B7;
        font-size: medium;
        float: right;
      }

      .mycomm__qna__solve>li {
        margin-left: 5%;
        margin-top: 4%;
        font-size: small;
        font-weight: bold;
        color: #B7B7B7;
        float: left;
      }

      .mycomm__qna__solve>li:hover {
        color: #333;
        cursor: pointer;
      }

      .mycomm__qna__solve>.type__active {
        color: #333;
      }

      /* 외부 탬플릿 클래스 */
      .product__details__tab__content__item {
        margin-top: 2%;
        margin-bottom: 2%;
        padding-top: 1%;
        padding-bottom: 1%;
        border-bottom: 1px solid rgba(0, 0, 0, .1);
      }

      .product__details__tab__content__item:hover {
        background-color: #F3F2EE;
        cursor: pointer;
      }
    </style>
    <script src="client/js/jquery-3.3.1.min.js"></script>
  </head>

  <body>
    <div class="container">
      <div class="row col-lg-12">
        <img src="client/img/icon/mycomm.png" alt="아이콘" style="width: 30px; height: 30px;">
        <h4 class="mypage__title">&nbsp;&nbsp;나의 커뮤니티</h4>
      </div>
      <hr class="toptop__bar__hr">

      <!--My Community Top Bar Start-->
      <div class="mypage__mycomm__head"
        style="margin-bottom: 3%; border: 1px solid rgba(0,0,0,.1); border-radius: 5px;">
        <!--IsSolved Bar Start-->
        <div class="row" style="margin-top: 0.5%; margin-bottom: 0;">
          <div class="col-lg-12">
            <ul class=" col-lg-12 mycomm__type">
              <li class="type__active" id="typeQuestion">질문글</li>
              <li id="typeAnswer">답변</li>
              <li id="typeFreeBoard" style="margin-left: 7%;">자유글</li>
              <li id="typeReply">댓글</li>
            </ul>
          </div>
        </div>
        <!--IsSolved Bar End-->
      </div>
      <!--My Community Top Bar End-->

      <!--My Community Body Start-->
      <div class="mypage__mycomm__body"
        style="padding-bottom: 3%; border: 1px solid rgba(0,0,0,.1); border-radius: 5px;">

        <!--My Board List Start-->
        <div class="col-lg-12 mypage__mycomm__body__content">
          <!--loadBody()-->
        </div>
        <!--My Board List End-->

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
      <!--My Community Body End-->

    </div>
    <script>
      // 변수
      let loginMemberId = '<%=(String)session.getAttribute("loginId")%>';
      console.log(loginMemberId);

      let commType = 'typeQuestion';
      let solveType = 'solveAll'

      let totalCount; // 글 개수

      let currentPage = 1; // 현재 페이지
      let totalPage; // 전체 페이지 수

      setCommTypeBtn();
      loadBody();

      // 내 커뮤니티 타입 버튼 활성화 함수
      function setCommTypeBtn() {
        $('ul.mycomm__type>li').on('click', function () {
          console.log('log')
          commType = $(this).attr('id');

          let lis = $(this).parent().children();
          lis.each(function (idx, li) {
            if ($(li).attr('id') == commType) {
              $(li).attr('class', 'type__active');
            } else {
              $(li).attr('class', 'type__non__active');
            }
          });
          currentPage = 1;
          loadBody();
        });
      }

      // 해결여부 버튼 활성화 함수
      function setSolveBtn() {
        $('ul.mycomm__qna__solve>li').each(function (idx, li) {
          if ($(li).attr('id') == solveType) {
            $(li).attr('class', 'type__active');
          } else {
            $(li).attr('class', 'type__non__active');
          }
        });
        $('ul.mycomm__qna__solve>li').on('click', function () {
          console.log('log')
          solveType = $(this).attr('id');
          loadBody();
        });
      }

      // 내 커뮤니티 바디 부분을 불러오는 함수
      function loadBody() {
        if (commType == 'typeQuestion') {
          loadQuestions();
        } else if (commType == 'typeAnswer') {
          loadAnswers();
        } else if (commType == 'typeFreeBoard') {
          loadFreeBoards();
        } else if (commType == 'typeReply') {
          loadReplies();
        }
      }

      // 질문 불러오는 함수
      function loadQuestions() {
        $.ajax({
          url: 'memberquestionwithpaging.do',
          method: 'post',
          data: {
            memberId: loginMemberId,
            solveType: solveType,
            page: currentPage
          },
          success: function (questionsJson) {
            showQuestions(questionsJson);
            setSolveBtn();
            showPageList();
          },
          error: function (err) {
            console.log(err);
          }
        });
      }

      function showQuestions(questionsJson) {
        $('.mypage__mycomm__body__content').empty();
        $('.mypage__mycomm__body__content')
          .append($(`
            <div class="col-lg-12 row">
              <div class="col-lg-9">
                <ul class="mycomm__qna__solve">
                  <li id="solveAll">전체</li>
                  <li id="solveNotSolved">미해결</li>
                  <li id="solveSolved">해결됨</li>
                </ul>
              </div>
            </div>
          `))
        questionsJson.forEach(question => {
          $('.mypage__mycomm__body__content')
            .append(
              $('<div class="product__details__tab__content__item"> /')
                .append(
                  $('<div class="mycomm__qna__info" style="overflow: hidden;"> /')
                    .append(
                      $('<span class="col-lg-12 list__title"> /')
                        .append($(
                          `<span class="` +
                          (question.questionSolve == 'not_solved' ? 'qna__not__solved' : 'qna__solved') + `">` +
                          (question.questionSolve == 'not_solved' ? '미해결' : '해결됨') +
                          `</span>\${question.questionTitle}` +
                          `<span class="list__date">ㆍ\${question.questionEnterDate[0]}-\${question.questionEnterDate[1]}-\${question.questionEnterDate[2]}</span>`
                        ))
                    )
                ).on('click', function () {
                  let url = 'communityqnadetailpage.do?questionId=' + question.questionId;
                  location.replace(url);
                })
            )
        });
      }

      // 답변 불러오는 함수
      function loadAnswers() {
        $.ajax({
          url: 'memberanswerwithpaging.do',
          method: 'post',
          data: {
            memberId: loginMemberId,
            page: currentPage
          },
          success: function (answersJson) {
            showAnswers(answersJson);
            showPageList();
          },
          error: function (err) {
            console.log(err);
          }
        });
      }

      function showAnswers(answersJson) {
        $('.mypage__mycomm__body__content').empty();
        answersJson.forEach(answer => {
          $('.mypage__mycomm__body__content')
            .append(
              $('<div class="product__details__tab__content__item"> /')
                .append(
                  $('<div class="mycomm__qna__info" style="overflow: hidden;"> /')
                    .append($(`<span class="col-lg-10 list__content" style="font-weight: normal;">\${answer.answerContent}</span>`))
                    .append($(
                      `<span class="col-lg-2 list__etc" style="font-size: small; font-weight: 900; float: right;">` +
                      `\${answer.answerEnterDate[0]}-\${answer.answerEnterDate[1]}-\${answer.answerEnterDate[2]}</span>`
                    ))
                )
                .on('click', function () {
                  let url = 'communityqnadetailpage.do?questionId=' + answer.questionId;
                  location.replace(url);
                })
            )
        });
      }

      // 자유게시글 불러오는 함수
      function loadFreeBoards() {
        $.ajax({
          url: 'memberboardwithpaging.do',
          method: 'post',
          data: {
            memberId: loginMemberId,
            page: currentPage
          },
          success: function (boardsJson) {
            showBoards(boardsJson);
            showPageList();
          },
          error: function (err) {
            console.log(err);
          }
        });
      }

      function showBoards(boardsJson) {
        $('.mypage__mycomm__body__content').empty();
        boardsJson.forEach(board => {
          $('.mypage__mycomm__body__content')
            .append(
              $('<div class="product__details__tab__content__item"> /')
                .append(
                  $('<div class="mycomm__free__info" style="overflow: hidden;"> /')
                    .append(
                      $('<span class="col-lg-12 list__title"> /')
                        .append($(
                          `<span>\${board.boardTitle}</span>` +
                          `<span class="list__date">ㆍ\${board.boardEnterDate[0]}-\${board.boardEnterDate[1]}-\${board.boardEnterDate[2]}</span>`
                        ))
                    )
                ).on('click', function () {
                  let url = 'communityfreedetailpage.do?boardId=' + board.boardId;
                  location.replace(url);
                })
            )
        });
      }

      // 댓글 불러오는 함수
      function loadReplies() {
        $.ajax({
          url: 'memberreplywithpaging.do',
          method: 'post',
          data: {
            memberId: loginMemberId,
            page: currentPage
          },
          success: function (repliesJson) {
            showReplies(repliesJson);
            showPageList();
          },
          error: function (err) {
            console.log(err);
          }
        });
      }

      function showReplies(repliesJson) {
        $('.mypage__mycomm__body__content').empty();
        repliesJson.forEach(reply => {
          $('.mypage__mycomm__body__content')
            .append(
              $('<div class="product__details__tab__content__item"> /')
                .append(
                  $('<div class="mycomm__free__info" style="overflow: hidden;"> /')
                    .append($(`<span class="col-lg-10 list__content" style="font-weight: normal;">\${reply.replyContent}</span>`))
                    .append($(
                      `<span class="col-lg-2 list__etc" style="font-size: small; font-weight: 900; float: right;">` +
                      `\${reply.replyEnterDate[0]}-\${reply.replyEnterDate[1]}-\${reply.replyEnterDate[2]}</span>`
                    ))
                )
                .on('click', function () {
                  let url = 'communityfreedetailpage.do?boardId=' + reply.boardId;
                  location.replace(url);
                })
            )
        });
      }

      // 페이지 바 생성 함수
      function showPageList() {
        if (commType == 'typeQuestion') {
          url = 'questioncount.do';
        } else if (commType == 'typeAnswer') {
          url = 'memberanswercount.do';
        } else if (commType == 'typeFreeBoard') {
          url = 'boardcount.do';
        } else if (commType == 'typeReply') {
          url = 'memberreplycount.do';
        }

        $.ajax({
          url: url,
          method: 'post',
          data: {
            memberId: loginMemberId,
            solveType: solveType,
            page: currentPage
          },
          success: function (countJson) {
            totalCount = countJson.totalCount;
            let totalPage = Math.ceil(totalCount / 10);

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
          loadBody();
        });
        $('.product__pagination').append(atag);
      }

    </script>
   <script>
    let lgck = `${loginId}`;
    if (lgck = null) {
            alert("로그인을 해주세요")
            location.href = "home.do"
        }
  </script>
  </body>

  </html>