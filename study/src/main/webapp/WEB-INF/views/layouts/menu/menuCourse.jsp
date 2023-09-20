<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    	.shop__sidebar__categories ul {
    		height: auto;
    	}
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
	            <a href="courseList.do">전체보기</a>
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
                      <c:forEach items="${it}" var="it" >
                    	<li onclick="selectList(this)" data-c="${it.courseSubCategory }">
                    	  <span>${it.courseSubCategory } (${it.subCategoryCount })</span>
                    	</li>
                      </c:forEach>
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
                  <div class="shop__sidebar__categories">
                    <ul class="nice-scroll">
                      <c:forEach items="${english}" var="eng" >
                    	<li onclick="selectList(this)" data-c="${eng.courseSubCategory }">
                    	  <span>${eng.courseSubCategory } (${eng.subCategoryCount })</span>
                    	</li>
                      </c:forEach>
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
                  <div class="shop__sidebar__tags">
                  	<span id="easy" class="active">초급</span>
                  	<span id="normal">중급</span>
                  	<span id="hard">고급</span>
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