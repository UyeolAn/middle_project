<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="client/css/course.css">
    <script src="client/js/jquery.nice-select.min.js"></script>
    <script type="text/javascript">
	    /* 페이징 갯수 옵션 변경시 작동 */
	    function selChange() {
			let sel = $('#cntPerPage').val();
			location.href="courselist.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	    }
    </script>
    <style>
    	/* 배너관련 start */
		.breadcrumb__links span {
			color: #6c757d;
		}
		.breadcrumb-option {
			background: url(client/img/banner/course_banner3.webp) rgba(170, 232, 255, 0.4) no-repeat 0% 70%;
			background-size: 150%;
			background-blend-mode: color;
		}
		/* 배너관련 end */
    </style>
</head>
<body>
    <!-- Shop Section Begin -->
    <div class="shop__product__option">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="shop__product__option__left">
                	<!-- 검색창.. -->
	                <div class="shop__sidebar__search hop__product__option__left">
						<form id="searchForm" action="coursesearch.do" method="post">
							<input type="text" placeholder="찾고싶은 강의 키워드를 입력하세요." id="courseName" name="courseName">
							<button type="submit">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
								  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
								</svg>
							</button>
						</form>
					</div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="shop__product__option__right">
                	<!-- 페이징 옵션 start -->
                    <select id="cntPerPage" name="sel" onchange="selChange()">
                        <option value="9" <c:if test="${paging.cntPerPage == 9}">selected</c:if>>9개씩 보기</option>
                        <option value="12" <c:if test="${paging.cntPerPage == 12}">selected</c:if>>12개씩 보기</option>
                        <option value="15" <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15개씩 보기</option>
                    </select>
                    <!-- 페이징 옵션 end -->
                </div>
            </div>
        </div>
    </div>
    
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
    
    <!-- 강의 리스트 start -->
    <div class="row course-row all-list">
        <c:forEach items="${courses}" var="c">
            <div class="col-lg-4 col-md-6 col-sm-6 course-col">
                <div class="product__item course-item" onclick="courseDetail(${c.courseId})">
                    <div class="product__item__pic set-bg course-item-pic"
                        <c:if test="${c.courseImg == null}">data-setbg="client/img/product/basic.png" </c:if>
                        <c:if test="${c.courseImg != null}">data-setbg="client/img/product/${c.courseImg}" </c:if>
                     >
                    </div>
                    <div class="product__item__text">
                        <h6>${c.courseName }</h6>
                        <div class="rating">
							<c:if test="${c.courseStars > 0 }">
								<c:forEach var="i" begin="1" end="${c.courseStars}">
	                            	<i class="fa fa-star"></i>
								</c:forEach>
								<c:forEach var="i" begin="1" end="${5 - c.courseStars}">
	                            	<i class="fa fa-star-o"></i>
								</c:forEach>
							</c:if>
							<c:if test="${c.courseStars == 0 }">
	                        	<i class="fa fa-star-o"></i>
	                            <i class="fa fa-star-o"></i>
	                            <i class="fa fa-star-o"></i>
	                            <i class="fa fa-star-o"></i>
	                            <i class="fa fa-star-o"></i>
							</c:if>
                        </div>
                        <c:choose>
                            <c:when test="${c.coursePrice <= 0}">
                                <h5 style="color:#e5503c;" class="course-price">무료</h5>
                            </c:when>
                            <c:otherwise>
                                <h5 class="course-price">
                                    <fmt:formatNumber value="${c.coursePrice }" pattern="#,###" />원
                                </h5>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- 강의 리스트 end -->
    
    <!-- 페이징 영역 start -->
    <div class="row paging-row all-list-paging">
        <div class="col-lg-12 col-paging">
            <div class="product__pagination">
            	<c:if test="${paging.startPage != 1 }">
	                <a class="active beforeBtn" href="courselist.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
            	</c:if>
            	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
            		<c:choose>
            			<c:when test="${p == paging.nowPage }"><a class="active">${p }</a></c:when>
            			<c:when test="${p != paging.nowPage }"><a href="courselist.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></c:when>
            		</c:choose>
            	</c:forEach>
            	<c:if test="${paging.endPage != paging.lastPage }">
            		<a class="active afterBtn" href="courselist.do?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
            	</c:if>
            </div>
        </div>
    </div>
    <!-- 페이징 영역 end -->
    
    <!-- Ajax용 강의 리스트 start -->
    <div class="row course-row ajax-course-list">
    	<div class="col-lg-4 col-md-6 col-sm-6 course-col" style="display:none;">
            <div class="product__item course-item">
                <div class="product__item__pic set-bg course-item-pic"
                    data-setbg>
                </div>
                <div class="product__item__text">
                    <h6 class="course-name">${c.courseName }</h6>
                    <div class="rating">
                    	<!-- 별점태그 -->
                    </div>
                    <c:choose>
                        <c:when test="${c.coursePrice <= 0}">
                            <h5 style="color:#e5503c;" class="course-price">무료</h5>
                        </c:when>
                        <c:otherwise>
                            <h5 class="course-price">
                                <fmt:formatNumber value="${c.coursePrice }" pattern="#,###" />원
                            </h5>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    <!-- Ajax용 강의 리스트 end -->
    
    <!-- Ajax용 페이징 영역 start -->
    <div class="row paging-row ajax-paging"></div>
    <!-- Ajax용 페이징 영역 end -->
    
    
    <!-- 강의 상세조회 폼 start -->
    <form id="courseform" action="coursedetail.do" method="post">
		<input type="hidden" id="courseId" name="courseId">
	</form>
    <!-- 강의 상세조회 폼 end -->
    
    <!-- Shop Section End -->
    
    
    <!-- 강의 관련 자바스크립트 연결 -->
    <script type="text/javascript" src="client/js/course.js"></script>
</body>

</html>