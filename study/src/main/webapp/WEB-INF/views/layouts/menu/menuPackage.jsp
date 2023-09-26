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
           <a href="#">전체보기</a>
         </div>
        	</div>
          <div class="card">
            <div class="card-heading">
              <a data-toggle="collapse" data-target="#collapseOne">입문</a>
            </div>
          </div>
          <div class="card">
            <div class="card-heading">
              <a data-toggle="collapse" data-target="#collapseTwo">초급</a>
            </div>
          </div>
          <div class="card">
            <div class="card-heading">
              <a data-toggle="collapse" data-target="#collapseFour">중급이상</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>