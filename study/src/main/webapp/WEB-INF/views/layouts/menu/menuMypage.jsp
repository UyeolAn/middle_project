<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="client/css/menu.css">
  </head>
  <style>
    .shop__sidebar__categories ul {
      height: auto;
    }
  </style>

  <body>

    <div class="col-lg-3">
      <div class="shop__sidebar">
        <div class="shop__sidebar__accordion">
          <div class="accordion" id="accordionExample">
            <div class="card">
              <div class="card-heading">
                <a data-toggle="collapse" data-target="#collapseOne">MY PAGE</a>
              </div>
              <div id="collapseOne" class="collapseshow" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__categories">
                    <ul class="nice-scroll">
                      <li><a href="mypageprofile.do">프로필</a></li>
                      <li><a href="bucketlist.do">장바구니</a></li>
                      <li><a href="mypagemycoursepage.do">수강 강좌</a></li>
					            <li><a href="mypagepaymentpage.do">구매내역</a></li>
                      <li><a href="mypagemycommunitypage.do">나의 커뮤니티</a></li>
                      <li><a href="mypagecancel.do" style="font-size: 8px;">회원탈퇴</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>




  </body>

  </html>