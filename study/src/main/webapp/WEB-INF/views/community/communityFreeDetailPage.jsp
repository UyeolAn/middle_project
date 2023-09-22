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

        .active-like-btn {
          margin-right: 3%;
          padding: 9px 20px;
          font-size: medium;
          background: #E53637;
          border-radius: 20px;
        }

        .like-btn:hover {
          background: #E53637;
        }

        .active-like-btn:hover {
          background: #ffa9a9;
        }

        .dislike-btn {
          margin-right: 3%;
          padding: 9px 20px;
          font-size: medium;
          background: #ccc;
          border-radius: 20px;
        }

        .active-dislike-btn {
          margin-right: 3%;
          padding: 9px 20px;
          font-size: medium;
          background: #777;
          border-radius: 20px;
        }

        .dislike-btn:hover {
          background: #777;
        }

        .active-dislike-btn:hover {
          background: #ccc;
        }

        .reply__info__count {
          font-size: medium;
          font-weight: bold;
          color: #777;
        }

        .comm__free__reply__sort>li {
          margin-left: 5%;
          margin-top: 4%;
          font-size: medium;
          color: #B7B7B7;
          float: left;
        }

        .comm__free__reply__sort>li:hover {
          color: #333;
          cursor: pointer;
        }

        .comm__free__reply__sort>.sort__active {
          color: #333;
        }
      </style>
      <script src="client/js/jquery-3.3.1.min.js"></script>
    </head>

    <body>
      <div class="container col-lg-12">
        <!--Board Title Bar Start-->
        <div class="product__details__tab__content__item">
          <h4 class="col-lg-12" id="boardTitle" style="font-weight: 1000;">${board.boardTitle}</h4>
          <br>
          <div class="col-lg-12 comm__free__board__detail__etc__info">
            <span class="etc__info__name" id="memberId">${board.memberId}</span>
            <br>
            <span class="etc__info__datehit">작성일 ${board.boardEnterDate}</span>
            <span class="etc__info__datehit">수정일
              <c:if test="${empty board.boardUpdateDate}">0000-00-00</c:if>
              <c:if test="${not empty board.boardUpdateDate}">${board.boardUpdateDate}</c:if>
            </span>
            <span class="etc__info__datehit">조회수 ${board.boardHit}</span>
          </div>
        </div>
        <!--Board Title Bar End-->
        <hr>

        <!--Board Main Body Start-->
        <div class="col-lg-12 row" style="margin-top: 5%;">
          <div class="col-lg-10">
            <p class="col-lg-12" id="boardContent" style="white-space:pre;">${board.boardContent}</p>
          </div>
          <div class="col-lg-7 comm__free__board__detail__buttons" style="margin-top: 5%;">
            <button type="button" id="updateBtn" class="site-btn small-btn"
              onclick="location.href='communityfreeupdatepage.do?boardId=${board.boardId}'">수정</button>
            <button type="button" id="deleteBtn" class="site-btn small-btn" style="background: #E53637;"
              onclick="deleteBoard()">삭제</button>
            <form id="deleteForm" action="boarddelete.do">
              <input type="hidden" id="boardId" name="boardId" value="${board.boardId}">
            </form>
          </div>
          <div class="col-lg-5 comm__free__board__detail__like" style="margin-top: 5%;">
            <button type="button" id="dislikeBtn" class="site-btn dislike-btn" style="float: right;">DISLIKE :
              ${board.boardDislike}</button>
            <button type="button" id="likeBtn" class="site-btn like-btn" style="float: right;">LIKE :
              ${board.boardLike}</button>
          </div>
        </div>
        <!--Board Main Body End-->
        <hr>

        <!--Reply Top Bar Start-->
        <div class="col-lg-12 contact__form comm__free__board__reply_topbar">
          <span class="col-lg-12 reply__info__count" id="replyCount">REPLY : 10</span>
          <br>
          <div class="col-lg-12">
            <textarea id="replyContent" name="replyContent" placeholder="댓글을 입력하세요..."
              style="height: 70px; margin-top: 10px; color: #333; "></textarea>
          </div>
          <div class="col-lg-12 row">
            <div class="col-lg-9">
              <ul class="comm__free__reply__sort">
                <li class="sort__active" id="mostRecent">최신순</li>
                <li id="registDate">등록순</li>
              </ul>
            </div>
            <div class="col-lg-3">
              <div class="checkout__input">
                <button type="button" id="writeBtn" class="site-btn" style="float: right; padding: 9px 20px;"
                  onclick="insertReply()">등록</button>
              </div>
            </div>
          </div>
        </div>
        <!--Reply Top Bar End-->
        <hr>

        <!--Reply List Start-->
        <div class="comm__free__reply">
          <!--loadReplies() -> showReplies()-->
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
        let boardId = '${board.boardId}';

        let sortType = 'mostRecent'; // 댓글 정렬 기준

        let totalCount; // 총 댓글 수

        let currentPage = 1; // 댓글 현재 페이지
        let totalPage; // 댓글 전체 페이지 수

        // 처음 로딩
        setLikeBtn();
        setDisLikeBtn();
        setUpdDelBtn();
        loadMemberRecommend();
        setTimeout(() => { }, 500);
        loadReplies();
        setSortBtn();

        // 이 게시글에서 회원이 좋아요/싫어요를 눌렀는지에 대한 정보를 반환하는 함수
        function loadMemberRecommend() {
          if (loginMemberId != 'null') {
            $.ajax({
              url: 'recommendselect.do?boardId=' + boardId + '&recommendValue=like',
              method: 'get',
              success: function (recommendJson) {
                if (recommendJson != null) {
                  $('button.site-btn.like-btn').attr('class', 'site-btn active-like-btn');
                }
              },
              error: function (err) {
                console.log(err);
              }
            });
            $.ajax({
              url: 'recommendselect.do?boardId=' + boardId + '&recommendValue=dislike',
              method: 'get',
              success: function (recommendJson) {
                if (recommendJson != null) {
                  $('button.site-btn.dislike-btn').attr('class', 'site-btn active-dislike-btn');
                }
              },
              error: function (err) {
                console.log(err);
              }
            });
          }
        }

        // 게시글 삭제 함수
        function deleteBoard() {
          if (confirm("정말 삭제하시겠습니까??") == true) {
            $('#deleteForm').submit();
          } else {
            return false;
          }
        }

        // 좋아요 버튼 활성화
        function setLikeBtn() {
          $('#likeBtn').on('click', function () {
            if (loginMemberId != 'null') {
              if ($(this).attr('class') == 'site-btn like-btn') {
                $.ajax({
                  url: 'recommendinsert.do',
                  method: 'post',
                  data: {
                    memberId: loginMemberId,
                    boardId: boardId,
                    recommendValue: 'like'
                  },
                  success: function (messageJson) {
                    alert(messageJson.message);
                    location.replace('communityfreedetailpage.do?boardId=' + boardId);
                  },
                  error: function (err) {
                    console.log(err);
                  }
                });
              } else if ($(this).attr('class') == 'site-btn active-like-btn') {
                $.ajax({
                  url: 'recommenddelete.do',
                  method: 'post',
                  data: {
                    memberId: loginMemberId,
                    boardId: boardId,
                    recommendValue: 'like'
                  },
                  success: function (messageJson) {
                    alert(messageJson.message);
                    location.replace('communityfreedetailpage.do?boardId=' + boardId)
                  },
                  error: function (err) {
                    console.log(err);
                  }
                });
              }
            } else {
              alert('로그인 하셔야 합니다!');
            }
          });
        }

        // 싫어요 버튼 활성화
        function setDisLikeBtn() {
          $('#dislikeBtn').on('click', function () {
            if (loginMemberId != 'null') {
              if ($(this).attr('class') == 'site-btn dislike-btn') {
                $.ajax({
                  url: 'recommendinsert.do',
                  method: 'post',
                  data: {
                    memberId: loginMemberId,
                    boardId: boardId,
                    recommendValue: 'dislike'
                  },
                  success: function (messageJson) {
                    alert(messageJson.message);
                    location.replace('communityfreedetailpage.do?boardId=' + boardId);
                  },
                  error: function (err) {
                    console.log(err);
                  }
                });
              } else if ($(this).attr('class') == 'site-btn active-dislike-btn') {
                $.ajax({
                  url: 'recommenddelete.do',
                  method: 'post',
                  data: {
                    memberId: loginMemberId,
                    boardId: boardId,
                    recommendValue: 'dislike'
                  },
                  success: function (messageJson) {
                    alert(messageJson.message);
                    location.replace('communityfreedetailpage.do?boardId=' + boardId)
                  },
                  error: function (err) {
                    console.log(err);
                  }
                });
              }
            } else {
              alert('로그인 하셔야 합니다!');
            }
          });
        }

        // 수정/삭제 버튼 로그인한 사용자만 보이게 하는 함수
        function setUpdDelBtn() {
          if (loginMemberId == 'null' || loginMemberId != '${board.memberId}') {
            $('#updateBtn').hide();
            $('#deleteBtn').hide();
          }
        }

        // 댓글 불러오는 함수
        function loadReplies() {
          $.ajax({
            url: 'replysortwithpaging.do',
            method: 'post',
            data: {
              boardId: boardId,
              sortType: sortType,
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

        // 댓글 목록을 보여주는 함수
        function showReplies(repliesJson) {
          $('div.comm__free__reply').empty();
          repliesJson.forEach(reply => {
            $('div.comm__free__reply')
              .append(
                $('<div class="col-lg-12 comm__free__board__detail__etc__info" style="margin-top: 3%;"> /')
                  .append($('<span class="etc__info__name" id="memberId"> /').text(`\${reply.memberId}`))
                  .append($('<span class="etc__info__datehit"> /').text(`ㆍ\${reply.replyEnterDate}`))
                  .append($('<br>'))
                  .append(
                    $('<div style="margin-top: 1%; margin-bottom: 3%;"> /')
                      .append($('<p id="boardContent" style="white-space:pre;"> /')
                        .text(`\${reply.replyContent}`))
                  )
              )
              .append($('<hr>'));
          });
        }

        // 댓글 페이지 바 생성 함수
        function showPageList() {
          $.ajax({
            url: 'replycount.do?boardId=' + boardId,
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
            loadBoards();
          });
          $('.product__pagination').append(atag);
        }

        // 정렬 버튼 활성화 함수
        function setSortBtn() {
          $('ul.comm__free__reply__sort>li').on('click', function () {
            sortType = $(this).attr('id');
            let lis = $(this).parent().children();
            lis.each(function (idx, li) {
              if ($(li).attr('id') == sortType) {
                $(li).attr('class', 'sort__active');
              } else {
                $(li).attr('class', 'sort__nonactive');
              }
            });
            loadReplies();
          });
        }

        // 댓글 등록 함수
        function insertReply() {
          let replyContent = $('#replyContent').text();
          $.ajax({
            url: 'replyinsert.do',
            method: 'post',
            data: {
              replyContent: replyContent
            },
            success: function (boardsJson) {
              
            },
            error: function (err) {
              console.log(err);
            }
          });
        }
      </script>

    </body>

    </html>