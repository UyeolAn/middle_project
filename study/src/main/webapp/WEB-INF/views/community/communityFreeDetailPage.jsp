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

        .row {

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
      </style>
      <script src="client/js/jquery-3.3.1.min.js"></script>
    </head>

    <body>
      <div class="container col-lg-12">
        <!--Board Title Bar Start-->
        <div class="product__details__tab__content__item">
          <h4 class="col-lg-12" id="boardTitle">${board.boardTitle}</h4>
          <br>
          <div class="col-lg-12 comm__free__board__detail__etc__info">
            <span class="etc__info__name" id="memberId">${board.memberId}</span>
            <br>
            <span class="etc__info__datehit">작성일 ${board.boardEnterDate} 수정일 ${board.boardUpdateDate} 조회수
              ${board.boardHit}</span>
          </div>
        </div>
        <!--Board Title Bar End-->
        <hr>

        <!--Board Main Body Start-->
        <div class="col-lg-12 row">
          <div class="col-lg-10">
            <p class="col-lg-12" id="boardContent" style="white-space:pre;">${board.boardContent}</p>
          </div>
          <div class="col-lg-7 comm__free__board__detail__buttons">
            <button type="button" id="updateBtn" class="site-btn small-btn"
              onclick="location.href='communityfreeupdatepage.do?boardId=${board.boardId}'">수정</button>
            <button type="button" id="deleteBtn" class="site-btn small-btn" style="background: #E53637;"
              onclick="deleteBoard()">삭제</button>
            <form id="deleteForm" action="boarddelete.do">
              <input type="hidden" id="boardId" name="boardId" value="${board.boardId}">
            </form>
          </div>
          <div class="col-lg-5 comm__free__board__detail__like">
            <button type="button" id="likeBtn" class="site-btn like-btn">LIKE :
              ${board.boardLike}</button>
            <button type="button" id="dislikeBtn" class="site-btn dislike-btn">DISLIKE :
              ${board.boardDislike}</button>
          </div>
        </div>
        <!--Board Main Body End-->
        <hr>
      </div>
      <script>
        // 변수 선언
        let loginMemberId = '<%=(String)session.getAttribute("loginId")%>';
        let boardId = '${board.boardId}';

        // 처음 로딩
        setLikeBtn();
        setDisLikeBtn();
        setUpdDelBtn();
        loadMemberRecommend();

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

        function setUpdDelBtn() {
          if (loginMemberId == 'null' || loginMemberId != '${board.memberId}') {
            $('#updateBtn').hide();
            $('#deleteBtn').hide();
          }
        }
      </script>
    </body>

    </html>