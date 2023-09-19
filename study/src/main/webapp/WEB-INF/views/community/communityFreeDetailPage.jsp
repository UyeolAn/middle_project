<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    </style>
  </head>

  <body>
    <div class="container col-lg-12">
      <!--Board Title Bar Start-->
      <div class="product__details__tab__content__item">
        <h4 class="col-lg-12">${board.boardTitle}</h4>
        <br>
        <div class="col-lg-12 comm__free__board__detail__etc__info">
          <span class="etc__info__name">${board.memberId}</span>
          <br>
          <span class="etc__info__datehit">작성일 ${board.boardEnterDate} 조회수 ${board.boardHit}</span>
        </div>
      </div>
      <!--Board Title Bar End-->
      <hr>

      <!--Board Content Start-->
      <div class="col-lg-10">
        <p>${board.boardContent}</p>
      </div>
      <!--Board Content End-->
      <hr>
      

    </div>
    

  </body>

  </html>