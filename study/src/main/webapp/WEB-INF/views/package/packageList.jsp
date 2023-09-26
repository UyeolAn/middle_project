<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
  	.course-item {
	    border: 1px solid #e6e6e6;
	    border-radius: 10px;
	    padding: 15px;
	}
</style>
</head>
<body>
	<div class="row course-row all-list">
	    <div class="col-lg-4 col-md-6 col-sm-6 course-col">
	        <div class="product__item course-item" onclick="location.href='packagedetail.do'">
	            <div class="product__item__pic set-bg course-item-pic" data-setbg="client/img/product/basic.png">
	                <ul class="product__hover">
	                    <li><a href="#"><img src="client/img/icon/cart.png" alt=""></a></li>
	                    <li><a href="#"><img src="client/img/icon/heart.png" alt=""></a></li>
	                </ul>
	            </div>
	            <div class="product__item__text">
	                <h6>패키지 이름</h6>
					<h5 class="course-price">
					    <fmt:formatNumber value="360000" pattern="#,###" />원
					</h5>
	            </div>
	        </div>
	    </div>
    </div>
</body>
</html>