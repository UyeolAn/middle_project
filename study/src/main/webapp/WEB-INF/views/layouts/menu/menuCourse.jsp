<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
    	.course-all a {
    		color: #111111;
		    font-size: 16px;
		    font-weight: 700;
		    text-transform: uppercase;
		    display: block;
    	}
    </style>
  </head>

  <body>
    <div class="col-lg-3">
      <div class="shop__sidebar">
        <div class="shop__sidebar__search">
          <form action="#">
            <input type="text" placeholder="Search...">
            <button type="submit"><span class="icon_search"></span></button>
          </form>
        </div>
        <div class="shop__sidebar__accordion">
          <div class="accordion" id="accordionExample">
          	<div class="card">
          	  <div class="course-all">
	            <a href="#list">전체보기</a>
	          </div>
          	</div>
            <div class="card">
              <div class="card-heading">
                <a data-toggle="collapse" data-target="#collapseOne">IT</a>
              </div>
              <div id="collapseOne" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__categories">
                    <ul class="nice-scroll">
                      <li><a href="#">JAVA (20)</a></li>
                      <li><a href="#">C (20)</a></li>
                      <li><a href="#">C# (20)</a></li>
                      <li><a href="#">C++ (20)</a></li>
                      <li><a href="#">Python (20)</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-heading">
                <a data-toggle="collapse" data-target="#collapseTwo">English</a>
              </div>
              <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__brand">
                    <ul>
                      <li><a href="#">TOEIC</a></li>
                      <li><a href="#">TOEFL</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-heading">
                <a data-toggle="collapse" data-target="#collapseFour">Grade</a>
              </div>
              <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__size">
                    <label for="xs">초급
                      <input type="radio" id="xs">
                    </label>
                    <label for="sm">중급
                      <input type="radio" id="sm">
                    </label>
                    <label for="md">고급
                      <input type="radio" id="md">
                    </label>
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