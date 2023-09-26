<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="client/css/package.css">
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
		<!-- 패키지 상품 반복 start -->
		<c:forEach items="${packages}" var="p">
			<div class="col-md-6 col-sm-6 course-col">
		        <div class="product__item course-item" onclick="location.href='packagedetail.do?packageId=${p.packageId}'">
		            <div class="product__item__pic set-bg course-item-pic" 
		            	<c:if test="${p.packageThumbnail == null}">data-setbg="client/img/product/basic.png" </c:if>
                        <c:if test="${p.packageThumbnail != null}">data-setbg="client/img/product/${p.packageThumbnail}" </c:if>
		            >
		                <ul class="product__hover">
		                    <li><a href="#"><img src="client/img/icon/cart.png" alt=""></a></li>
		                    <li><a href="#"><img src="client/img/icon/heart.png" alt=""></a></li>
		                </ul>
		            </div>
		            <div class="product__item__text">
		                <h6>${p.packageTitle }</h6>
		                <c:choose>
                            <c:when test="${p.salePrice <= 0}">
                                <h5 style="color:red;" class="course-price">무료</h5>
                            </c:when>
                            <c:otherwise>
                                <h5 class="course-price">
                                    <fmt:formatNumber value="${p.salePrice }" pattern="#,###" />원
                                </h5>
                            </c:otherwise>
                        </c:choose>
		            </div>
		        </div>
		    </div>
		</c:forEach>
	    <!-- 패키지 상품 반복 end -->
    </div>
    
    <!-- 조회된 결과가 없으면 -->
    <div class="row result_no" style="display:none;">
    	<div class="message_wrap">
	    	<p>
		    	<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#6c757d" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
				  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
				</svg>
		    	조회된 결과가 없습니다!
	    	</p>
    	</div>
    </div>
    
    
    <!-- Ajax용 강의 리스트 start -->
    <div class="row course-row ajax-course-list">
    	<div class="col-md-6 col-sm-6 course-col" style="display:none;">
            <div class="product__item course-item">
                <div class="product__item__pic set-bg course-item-pic">
                    <ul class="product__hover">
                        <li><a href="#"><img src="client/img/icon/cart.png" alt=""></a></li>
                        <li><a href="#"><img src="client/img/icon/heart.png" alt=""></a></li>
                    </ul>
                </div>
                <div class="product__item__text">
                    <h6 class="course-name">패키지 제목</h6>
                    <h5 class="course-price">50,000원</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Ajax용 강의 리스트 end -->
</body>
</html>