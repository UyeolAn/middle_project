<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
      /* 해당 페이지 전용 클래스 */
      .comm__qna__board__issolved>li {
        margin-left: 2%;
        margin-right: 2%;
        color: #B7B7B7;
        font-weight: bold;
        float: left;
        list-style: none;
      }

      .comm__qna__board__issolved>li:hover {
        color: #333;
      }

      .comm__qna__board__sort>li {
        margin-left: 5%;
        margin-top: 4%;
        font-size: medium;
        color: #B7B7B7;
        float: left;
      }

      .comm__qna__board__sort>li:hover {
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

      .comm__qna__board__etc__info>span {
        font-size: smaller;
        color: #B7B7B7;
      }

      .comm__qna__board__etc__info>.etc__info__left {
        float: left;
      }

      .comm__qna__board__etc__info>.etc__info__right {
        float: right;
      }

      /* 외부 탬플릿 클래스 */
      .product__details__tab__content__item:hover {
        background-color: #F3F2EE;
      }
    </style>
  </head>

  <body>
    <div class="container">
      <!--Community Top Bar Start-->
      <div>
        <!--IsSolved Bar Start-->
        <div class="row">
          <div class="col-lg-12">
            <ul class="comm__qna__board__issolved">
              <li>전체</li>
              <li>미해결</li>
              <li>해결됨</li>
            </ul>
          </div>
        </div>
        <!--IsSolved Bar End-->
        <hr>

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
              <button type="button" class="site-btn" style="border-radius: 10px; font-size: medium;">검색</button>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-10">
            <div class="checkout__input">
              <input type="text" placeholder="어떤 강의에 대한 질문인가요? (사이트질문 : 사이트, 기타질문 : 기타)">
            </div>
          </div>
        </div>
        <!--Search Bar End-->

        <!--Order/Write Bar Start-->
        <div class="row">
          <div class="col-lg-10">
            <ul class="comm__qna__board__sort">
              <li>최신순</li>
              <li>답변많은순</li>
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

      <!--Community Board List Start-->
      <div class="product__details__tab__content__item">
        <h5 class="col-lg-12"><span class="qna__not__solved">미해결</span>질문 게시글 제목1</h5>
        <p class="col-lg-9">질문 게시글 내용1 입니다...</p>
        <br>
        <div class="col-lg-12 comm__qna__board__etc__info">
          <span class="etc__info__left">[uyeol] · 예제로 배우는 스프링 입문 (개정판) · 1시간 전</span>
          <span class="etc__info__right">조회수:19 답변:3</span>
        </div>
      </div>
      <hr>
      <div class="product__details__tab__content__item">
        <h5 class="col-lg-12"><span class="qna__not__solved">미해결</span>질문 게시글 제목2</h5>
        <p class="col-lg-9">질문 게시글 내용2 입니다...</p>
        <br>
        <div class="col-lg-12 comm__qna__board__etc__info">
          <span class="etc__info__left">[uyeol] · Kevin의 알기 쉬운 Java 개발자 로드맵 이야기 · 3시간 전</span>
          <span class="etc__info__right">조회수:200 답변:1</span>
        </div>
      </div>
      <hr>
      <div class="product__details__tab__content__item">
        <h5 class="col-lg-12"><span class="qna__solved">해결됨</span>질문 게시글 제목3</h5>
        <p class="col-lg-9">질문 게시글 내용3 입니다...</p>
        <br>
        <div class="col-lg-12 comm__qna__board__etc__info">
          <span class="etc__info__left">[uyeol] · 자바 ORM 표준 JPA 프로그래밍 - 기본편 · 12시간 전</span>
          <span class="etc__info__right">조회수:202 답변:10</span>
        </div>
      </div>
      <hr>
      <!--Community Board List End-->
    </div>

    <script>
      // 변수
      let loginMemberId = '<%=(String)session.getAttribute("loginId")%>';

      let searchContent = $('#searchContent').val();
      let sortType = 'mostRecent';

      let totalCount; // 총 개시글 수

      let currentPage = 1; // 현재 페이지
      let totalPage; // 전체 페이지 수
    </script>
  </body>

  </html>