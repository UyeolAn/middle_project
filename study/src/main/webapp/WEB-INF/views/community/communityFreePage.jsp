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
        font-size: smaller;
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
                <button type="button" class="site-btn" onclick="searchBoards()">검색</button>
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
              <button type="button" id="writeBtn" class="site-btn" onclick="location.href='communityfreeinsertpage.do'">
                글쓰기
              </button>
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
      <div class="row">
        <div class="col-lg-12">
          <div class="product__pagination">
            <a class="active" href="#">1</a>
          </div>
        </div>
        <!--Board List End-->
      </div>
    </div>
    <script>
      // 변수
      let loginMemberId = '<%=(String)session.getAttribute("loginId")%>';

      let searchContent = $('#searchContent').val();
      let sortType = 'mostRecent';

      let currentPage = 1;
      let totalPage;

      // 처음 로딩
      setOrderBtn();
      setInsertBtn();
      loadBoards();

      // 처음 로딩 시 게시글 리스트를 불러오는 함수
      function loadBoards() {
        let searchData = convertToObject($("#searchForm").serializeArray());
        searchData.sortType = sortType;
        $.ajax({
          url: 'boardsearch.do',
          method: 'post',
          data: {
            searchType: searchData.searchType,
            searchContent: searchData.searchContent,
            sortType: searchData.sortType
          },
          success: function (boardsJson) {
            showBoards(boardsJson);
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
                      .text(`[\${board.memberId}] \${board.boardEnterDate}`))
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

      // 정렬 버튼 활성화 함수
      function setOrderBtn() {
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
          url: 'boardsearch.do',
          method: 'post',
          data: {
            searchType: searchData.searchType,
            searchContent: searchData.searchContent,
            sortType: searchData.sortType
          },
          success: function (boardsJson) {
            showBoards(boardsJson);
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