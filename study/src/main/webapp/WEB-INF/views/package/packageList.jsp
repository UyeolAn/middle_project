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
	/* 배너관련 start */
	.breadcrumb__links span {
		color: #6c757d;
	}
	.breadcrumb-option {
		background: url(client/img/banner/package_banner7.png) rgba(220, 219, 255, 0.3) no-repeat 95% 45%;
		background-size: 100%;
		background-blend-mode: color;
	}
	/* 배너관련 end */
  	.course-item {
	    border: 1px solid #e6e6e6;
	    border-radius: 10px;
	    padding: 15px;
	}
</style>
</head>
<body>
	<!-- 조회된 결과가 없으면 -->
	<c:if test="${result eq 'empty' }">
	    <div class="row result_no ">
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
	</c:if>
    
	<div class="row course-row all-list">
		<!-- 패키지 상품 반복 start -->
		<c:forEach items="${packages}" var="p">
			<div class="col-md-6 col-sm-6 course-col">
		        <div class="product__item course-item" onclick="location.href='packagedetail.do?packageId=${p.packageId}'">
		            <div class="product__item__pic set-bg course-item-pic" 
		            	<c:if test="${p.packageThumbnail == null}">data-setbg="client/img/product/basic.png" </c:if>
                        <c:if test="${p.packageThumbnail != null}">data-setbg="client/img/product/${p.packageThumbnail}" </c:if>
		            >
		            	<div class="course_discount">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-fire" viewBox="0 0 16 16">
							  <path d="M8 16c3.314 0 6-2 6-5.5 0-1.5-.5-4-2.5-6 .25 1.5-1.25 2-1.25 2C11 4 9 .5 6 0c.357 2 .5 4-2 6-1.25 1-2 2.729-2 4.5C2 14 4.686 16 8 16Zm0-1c-1.657 0-3-1-3-2.75 0-.75.25-2 1.25-3C6.125 10 7 10.5 7 10.5c-.375-1.25.5-3.25 2-3.5-.179 1-.25 2 1 3 .625.5 1 1.364 1 2.25C11 14 9.657 15 8 15Z"/>
							</svg>
							${p.packageDiscount }% 할인
						</div>
		            </div>
		            <div class="product__item__text">
		                <h6>${p.packageTitle }</h6>
		                <c:choose>
                            <c:when test="${p.salePrice <= 0}">
                                <h5 style="color:red;" class="course-price">무료</h5>
                            </c:when>
                            <c:otherwise>
                                <h5 class="course-price">
                                	<span class="course-wonga"><fmt:formatNumber value="${p.coursesPrice }" pattern="#,###" />원</span>
                                    <span><fmt:formatNumber value="${p.salePrice }" pattern="#,###" />원</span>
                                </h5>
                            </c:otherwise>
                        </c:choose>
		            </div>
		        </div>
		    </div>
		</c:forEach>
	    <!-- 패키지 상품 반복 end -->
    </div>
    
    <!-- Ajax 조회된 결과가 없으면 -->
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