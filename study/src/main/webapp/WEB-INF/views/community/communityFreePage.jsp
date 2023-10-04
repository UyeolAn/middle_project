<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="client/css/community.css" type="text/css">
    <style type="text/css">
      input[type=text] {
        height: 40px !important;
        margin-bottom: 15px !important;
        color: #333;
      }

      select {
        padding: 9.5px;
        color: #B7B7B7;
        border: 1px solid #b7b7b7;
        border-radius: 5px;
      }

      /* 해당 페이지 전용 클래스 */
      .community__title {
        margin-bottom: 27px;
        font-weight: 900;
      }

      .toptop__bar__hr {
        margin-top: 0 !important;
      }

      .top__bar__hr {
        margin-top: 8px !important;
      }

      .comm__free__board__sort>li {
        margin-left: 5%;
        margin-top: 4%;
        font-size: small;
        font-weight: 900;
        color: #B7B7B7;
        float: left;
      }

      .comm__free__board__sort>li:hover {
        color: #333;
        cursor: pointer;
      }

      .comm__free__board__sort>.sort__active {
        color: #333;
      }

      .comm__free__board__content {
        width: 100%;
        height: 25px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }

      .comm__free__board__etc__info>span {
        font-size: smaller;
        color: #B7B7B7;
      }

      .comm__free__board__etc__info>.etc__info__left {
        font-weight: 600;
        float: left;
      }

      .comm__free__board__etc__info>.etc__info__right {
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
      <!--Community Title Start-->
      <div class="row col-lg-12">
        <img src="client/img/icon/free.png" alt="아이콘" style="width: 30px; height: 30px;">
        <h4 class="community__title">&nbsp;&nbsp;자유게시판</h4>
      </div>
      <!--Community Title End-->

      <!--Top Bar Start-->
      <div>
        <hr class="toptop__bar__hr">
        <!--Search Bar Start-->
        <form id="searchForm" class="col-lg-12" name="searchForm">
          <div class="row">
            <div class="col-lg-3">
              <div class="checkout__input">
                <select id="searchType" name="searchType">
                  <option value="boardAll">==== 전체 보기 ====</option>
                  <option value="boardTitle">게시글 제목</option>
                  <option value="boardContent">게시글 내용</option>
                  <option value="boardWriter">글 작성자</option>
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
                <button type="button" class="site-btn" onclick="searchBoards()"
                  style="margin-left: 10%; padding: 9.5px 15px; background: #3188DB; border-radius: 8px;">
                  <i class="bi bi-search" style="font-size: large !important;"></i></button>
              </div>
            </div>
          </div>
        </form>
        <!--Search Bar End-->

        <!--Order/Write Bar Start-->
        <div class="row">
          <div class="col-lg-10">
            <ul class="comm__free__board__sort">
              <li class="sort__active" id="mostRecent">최신순</li>
              <li id="mostHit">조회순</li>
              <li id="mostLike">좋아요순</li>
            </ul>
          </div>
          <div class="col-lg-2">
            <div class="checkout__input">
              <button type="button" id="writeBtn" class="site-btn" onclick="location.href='communityfreeinsertpage.do'"
                style="padding: 9px 15px; background: #333; border-radius: 8px; font-size: small;"><i
                  class="bi bi-pencil"></i>&nbsp;&nbsp;글쓰기</button>
            </div>
          </div>
        </div>
        <!--Order/Write Bar End-->
        <hr class="top__bar__hr">
      </div>
      <!--Top Bar End-->

      <!--Board List Start-->
      <div class="comm__free__board">
        <!-- loadBoards() -> showBoards(boardsJson) -->
      </div>
      <!--Board List End-->

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
      let sortType = 'mostRecent';

      let totalCount; // 총 개시글 수

      let currentPage = 1; // 현재 페이지
      let totalPage; // 전체 페이지 수


      // 처음 로딩
      setSortBtn();
      setInsertBtn();
      loadBoards();

      // 처음 로딩 시 게시글 리스트를 불러오는 함수
      function loadBoards() {
        let searchData = convertToObject($("#searchForm").serializeArray());
        searchData.sortType = sortType;
        $.ajax({
          url: 'boardsearchwithpaging.do',
          method: 'post',
          data: {
            searchType: searchData.searchType,
            searchContent: searchData.searchContent,
            sortType: searchData.sortType,
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

      // 게시글 목록을 보여주는 함수
      function showBoards(boardsJson) {
        $('div.comm__free__board').empty();
        boardsJson.forEach(board => {
          $('div.comm__free__board')
            .append(
              $('<div class="product__details__tab__content__item"> /')
                .append($('<h5 class="col-lg-12"> /').text(`\${board.boardTitle}`))
                .append($('<p class="col-lg-9 comm__free__board__content"> /').text(`\${board.boardContent}`))
                .append($('<br>'))
                .append(
                  $('<div class="col-lg-12 comm__free__board__etc__info"> /')
                    .append($('<span class="etc__info__left"> /')
                      .text(
                        (board.memberId == null ? `탈퇴 회원 ㆍ ` : `\${board.memberId} ㆍ `) +
                        ` \${board.boardEnterDate}`
                      ))
                    .append($(
                      `<span class="etc__info__right">` +
                      `<i class="bi bi-eye"></i> \${board.boardHit}&nbsp;&nbsp;&nbsp;` +
                      `<i class="bi bi-hand-thumbs-up"></i> \${board.boardLike}&nbsp;&nbsp;&nbsp;` +
                      `<i class="bi bi-chat-dots"></i> \${board.replyCount}` +
                      `</span>`)
                    )
                )
                .on('click', function () {
                  let url = 'communityfreedetailpage.do?boardId=' + board.boardId;
                  $(location).attr('href', url);
                })
            )
            .append($('<hr>'));
        });
      }

      // 페이지 바 생성 함수
      function showPageList() {
        let searchData = convertToObject($("#searchForm").serializeArray());
        searchData.sortType = sortType;
        $.ajax({
          url: 'boardcount.do',
          method: 'post',
          data: {
            searchType: searchData.searchType,
            searchContent: searchData.searchContent,
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
          loadBoards();
        });
        $('.product__pagination').append(atag);
      }

      // 정렬 버튼 활성화 함수
      function setSortBtn() {
        $('ul.comm__free__board__sort>li').on('click', function () {
          sortType = $(this).attr('id');

          let lis = $(this).parent().children();
          lis.each(function (idx, li) {
            if ($(li).attr('id') == sortType) {
              $(li).attr('class', 'sort__active');
            } else {
              $(li).attr('class', 'sort__nonactive');
            }
          });
          loadBoards();
        });
      }

      // 글쓰기 버튼 관련 함수
      function setInsertBtn() {
        if (loginMemberId == 'null') {
          $('#writeBtn').hide();
        }
        // onclick 은 태그에 정의해놓았음
      }

      // 게시글 검색 함수
      function searchBoards() {
        let searchData = convertToObject($("#searchForm").serializeArray());
        searchData.sortType = sortType;
        $.ajax({
          url: 'boardsearchwithpaging.do',
          method: 'post',
          data: {
            searchType: searchData.searchType,
            searchContent: searchData.searchContent,
            sortType: searchData.sortType,
            page: 1
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