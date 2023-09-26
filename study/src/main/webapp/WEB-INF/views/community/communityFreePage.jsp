<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
      input[type=text] {
        color: #333;
      }

      /* 해당 페이지 전용 클래스 */
      .comm__free__board__sort>li {
        margin-left: 5%;
        margin-top: 4%;
        font-size: medium;
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
        float: left;
      }

      .comm__free__board__etc__info>.etc__info__right {
        float: right;
      }

      /* 외부 탬플릿 클래스 */
      .product__details__tab__content__item:hover {
        background-color: #F3F2EE;
        cursor: pointer;
      }
    </style>
    <script src="client/js/jquery-3.3.1.min.js"></script>
    <script src="client/js/jquery.nice-select.min.js"></script>
  </head>

  <body>
    <div class="container">
      <!--Top Bar Start-->
      <div>
        <!--Search Bar Start-->
        <form id="searchForm" name="searchForm">
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
                  style="border-radius: 10px; font-size: medium;">검색</button>
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
                style="border-radius: 10px; font-size: medium;">글쓰기</button>
            </div>
          </div>
        </div>
        <!--Order/Write Bar End-->
        <hr>
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
                        (board.memberId == null ? `[탈퇴 회원]` : `[\${board.memberId}]`) + 
                        ` \${board.boardEnterDate}`
                      ))
                    .append($('<span class="etc__info__right"> /')
                      .text(`조회수:\${board.boardHit}   좋아요:\${board.boardLike}   댓글:\${board.replyCount}`))
                )
                .on('click', function () {
                  let url = 'communityfreedetailpage.do?boardId=' + board.boardId;
                  location.replace(url);
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