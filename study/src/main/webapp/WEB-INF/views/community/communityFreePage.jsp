<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style type="text/css">
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

    .comm__free__board__order>li {
      margin-left: 5%;
      margin-top: 4%;
      font-size: smaller;
      color: #B7B7B7;
      float: left;
    }

    .comm__free__board__order>li:hover {
      color: #333;
    }

    .product__details__tab__content__item:hover {
      background-color: #eee;
    }
  </style>
</head>

<body>
  <div class="container">
    <!--Community Top Bar Start-->
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
      <!--Search Bar Start-->

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
            <button type="button" class="site-btn">글쓰기</button>
          </div>
        </div>
      </div>
      <!--Order/Write Bar End-->
      <hr>
    </div>
    <!--Community Top Bar End-->


    <!--Community Board List Start-->
    <div class="product__details__tab__content__item">
      <h5>게시글 제목1</h5>
      <p>게시글 내용1 입니다...</p>
      <br>
      <div class="comm__free__board__etc__info">
        <span class="etc__info__left">[uyeol] 1시간 전</span>
        <span class="etc__info__right">조회수:19 좋아요:5 댓글:3</span>
      </div>
    </div>
    <hr>
    <div class="product__details__tab__content__item">
      <h5>게시글 제목2</h5>
      <p>게시글 내용2 입니다...</p>
      <br>
      <div class="comm__free__board__etc__info">
        <span class="etc__info__left">[uyeol] 3시간 전</span>
        <span class="etc__info__right">조회수:200 좋아요:30 댓글:17</span>
      </div>
    </div>
    <hr>
    <div class="product__details__tab__content__item">
      <h5>게시글 제목3</h5>
      <p>게시글 내용3 입니다...</p>
      <br>
      <div class="comm__free__board__etc__info">
        <span class="etc__info__left">[uyeol] 12시간 전</span>
        <span class="etc__info__right">조회수:2023 좋아요:150 댓글:100</span>
      </div>
    </div>
    <hr>
    <!--Community Board List End-->
  </div>

</body>

</html>