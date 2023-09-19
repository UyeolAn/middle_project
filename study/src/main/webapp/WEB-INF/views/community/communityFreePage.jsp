<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
      /* 해당 페이지 전용 클래스 */
      .comm__free__board__order>li {
        margin-left: 5%;
        margin-top: 4%;
        font-size: smaller;
        color: #B7B7B7;
        float: left;
      }

      .comm__free__board__order>li:hover {
        color: #333;
        cursor: pointer;
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
        <div class="row">
          <div class="col-lg-3">
            <div class="checkout__input">
              <select name="boardSearchType" id="boardSearchType">
                <option value="boardAll">==== 선택하세요 ====</option>
                <option value="boardTitle">게시글 제목</option>
                <option value="boardContent">게시글 내용</option>
                <option value="boardWriter">글 작성자</option>
              </select>
            </div>
          </div>
          <div class="col-lg-7">
            <div class="checkout__input">
              <input type="text" placeholder="검색 내용을 입력하세요..">
            </div>
          </div>
          <div class="col-lg-2">
            <div class="checkout__input">
              <button type="button" class="site-btn">검색</button>
            </div>
          </div>
        </div>
        <!--Search Bar End-->

        <!--Order/Write Bar Start-->
        <div class="row">
          <div class="col-lg-10">
            <ul class="comm__free__board__order">
              <li>최신순</li>
              <li>댓글많은순</li>
              <li>좋아요순</li>
            </ul>
          </div>
          <div class="col-lg-2">
            <div class="checkout__input">
              <button type="button" class="site-btn" onclick="location.href='communityfreeinsertpage.do'">
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
      <!--Board List End-->
    </div>
    <script>
      loadBoards();

      // 처음 로딩 시 불러오는 함수
      function loadBoards() {
        $.ajax({
          url: 'boardall.do',
          method: 'get', // defalut: get
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
        boardsJson.forEach(board => {
          $.ajax({
            url: 'replycnt.do?boardId=' + board.boardId,
            method: 'get', // defalut: get
            success: function (cnt) {
              let cntObj = JSON.parse(cnt);
              makeBoardHtml(board, cntObj);
            },
            error: function (err) {
              console.log(err);
            }
          });
        });
      }

      // 게시글 목록에 대한 html 문서를 만들어주는 함수
      function makeBoardHtml(board, cntObj) {
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
                    .text(`조회수:\${board.boardHit} 좋아요:\${board.boardLike - board.boardDislike} 댓글:\${cntObj.replyCnt}`))
              )
              .on('click', function () {
                let url = 'communityfreedetailpage.do?boardId=' + board.boardId;
                location.replace(url);
              })
          )
          .append($('<hr>'));
      }
    </script>
  </body>

  </html>