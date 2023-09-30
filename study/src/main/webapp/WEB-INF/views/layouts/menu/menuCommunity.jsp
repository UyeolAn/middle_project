<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="client/css/menu.css">
  </head>

  <body>
    <div class="col-lg-3">
      <div class="shop__sidebar">
        <div class="shop__sidebar__accordion">
          <div class="accordion" id="accordionExample">
            <div class="card">
              <div class="card-heading">
                <a data-toggle="collapse" data-target="#collapseOne">Community</a>
              </div>
              <div id="collapseOne" class="collapseshow" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__categories">
                    <ul class="nice-scroll">
                      <li><a href="communityqnapage.do">질문게시판</a></li>
                      <li><a href="communityfreepage.do">자유게시판</a></li>
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