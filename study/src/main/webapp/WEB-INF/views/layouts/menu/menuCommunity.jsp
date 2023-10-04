<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <link rel="stylesheet" href="client/css/menu.css">

    <style type="text/css">
      .nice-scroll {
        height: 89px !important;
      }

      .toptop__bar__hr {
        margin-top: 0 !important;
      }
    </style>

  </head>

  <body>
    <div class="col-lg-3">
      <div class="shop__sidebar">
        <div class="shop__sidebar__accordion">
          <div class="accordion" id="accordionExample">
            <div class="card">
              <hr class="toptop__bar__hr">
              <div class="col-lg-12 card-heading">
                <a data-toggle="collapse" data-target="#collapseOne">Community</a>
              </div>
              <hr>
              <div id="collapseOne" class="col-lg-12 collapseshow" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__categories">
                    <ul class="nice-scroll">
                      <li><a href="communityqnapage.do" style="color: #333">질문게시판</a></li>
                      <li><a href="communityfreepage.do" style="color: #333">자유게시판</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <hr>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>

  </html>