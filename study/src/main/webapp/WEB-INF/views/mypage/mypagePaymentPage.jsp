<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>STUDY | pay</title>
    <style type="text/css">
      .mypage__title {
        margin-bottom: 27px;
        font-weight: 900;
      }

      .toptop__bar__hr {
        margin-top: 0 !important;
      }

      .top__bar__hr {
        margin-top: 8px !important;
      }

      .payment__sort__type>li {
        margin-left: 2%;
        margin-right: 2%;
        padding-bottom: 6px;
        color: #B7B7B7;
        font-weight: 900;
        float: left;
        list-style: none;
      }

      .payment__sort__type>li:hover {
        color: #333;
        cursor: pointer;
        border-bottom: 2px solid #3188DB;
      }

      .payment__sort__type>.type__active {
        color: #333;
        border-bottom: 2px solid #3188DB;
      }

      .payment__etc__info {
        margin-top: 0.5%;
        color: #B7B7B7;
      }
    </style>
    <script src="client/js/jquery-3.3.1.min.js"></script>
  </head>

  <body>
    <div class="container">
      <div class="row col-lg-12">
        <img src="client/img/icon/payment.png" alt="아이콘" style="width: 30px; height: 30px;">
        <h4 class="mypage__title">&nbsp;&nbsp;구매내역</h4>
      </div>
      <hr class="toptop__bar__hr">

      <!--Payment Top Bar Start-->
      <div class="mypage__payment__head">
        <!--Sort Bar Start-->
        <div class="row" style="margin-top: 0.5%;">
          <div class="col-lg-12">
            <ul class="payment__sort__type">
              <li class="type__active" id="mostRecent">최신순</li>
              <li id="mostOld">오래된순</li>
            </ul>
          </div>
        </div>
        <!--Sort Bar End-->
        <hr class="toptop__bar__hr">
      </div>
      
      <!--Payment Top Bar End-->

      <!--Payment Body Start-->
      <div class="col-lg-12 mypage__payment__body">
        <div class="product__details__tab__content__item">
          <h5 class="col-lg-12">스프링 입문 - 코드로 배우는 스프링 부트, 웹 MVC, DB 접근 기술</h5>
          <h6 class="col-lg-12 payment__etc__info">STATUS : 결제완료</h6>
          <h6 class="col-lg-12 payment__etc__info">PRICE : 10,000 ₩</h6>
          <h6 class="col-lg-12 payment__etc__info">DATE : 2023-09-26</h6>
        </div>
        <hr>
      </div>
      <!--Payment Body End-->

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
      console.log(loginMemberId);

      let sortType = 'mostRecent'

      let totalCount; // 글 개수

      let currentPage = 1; // 현재 페이지
      let totalPage; // 전체 페이지 수

      setSortBtn();
      loadPayment();

      function setSortBtn() {
        $('ul.payment__sort__type>li').on('click', function () {
          console.log('log')
          sortType = $(this).attr('id');

          let lis = $(this).parent().children();
          lis.each(function (idx, li) {
            if ($(li).attr('id') == sortType) {
              $(li).attr('class', 'type__active');
            } else {
              $(li).attr('class', 'type__non__active');
            }
          });
          currentPage = 1;
          loadPayment();
        });
      }

      // 구매내역 불러오는 함수
      function loadPayment() {
        $.ajax({
          url: 'memberpaymentwithpaging.do',
          method: 'post',
          data: {
            memberId: loginMemberId,
            sortType: sortType,
            page: currentPage
          },
          success: function (paymentsJson) {
            showPayments(paymentsJson);
            showPageList();
          },
          error: function (err) {
            console.log(err);
          }
        });
      }

      // 구매내역 출력하는 함수
      function showPayments(paymentsJson) {
        $('.mypage__payment__body').empty();
        paymentsJson.forEach(payment => {
          $('.mypage__payment__body')
            .append(
              $('<div class="product__details__tab__content__item"> /')
                .append($(`<h5 class="col-lg-12">\${payment.courseName}</h5>`))
                .append($(`<h6 class="col-lg-12 payment__etc__info">STATUS : 결제완료</h6>`))
                .append($(`<h6 class="col-lg-12 payment__etc__info">PRICE : \${payment.coursePrice} ₩</h6>`))
                .append($(`<h6 class="col-lg-12 payment__etc__info">DATE : ` +
                  `\${payment.enterDate[0]}년 \${payment.enterDate[1]}월 \${payment.enterDate[2]}일 - ` +
                  `\${payment.enterDate[3]}시\${payment.enterDate[4]}분</h6>`))
            )
            .append('<hr>')
        });
      }

      // 페이지 바 생성 함수
      function showPageList() {
        $.ajax({
          url: 'memberpaymentcount.do',
          method: 'post',
          data: {
            memberId: loginMemberId,
            page: currentPage
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
          loadPayment();
        });
        $('.product__pagination').append(atag);
      }
    </script>
  </body>

  </html>