<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="client/css/coursedetail.css" type="text/css">
<link rel="stylesheet" href="client/css/course.css" type="text/css">
</head>
<body> 
    <!-- Offcanvas Menu Begin -->
    
    <!-- Offcanvas Menu End -->

    <!-- 강의 상세 정보 Begin -->
    <section class="shop-details">
    	<!-- 강의 카테고리, 등급, 강의 이름, 설명 start -->
        <div class="product__details__pic set-bg course_bg" >
            <div class="container course_container">
                <div class="row set-bg course_pic" data-setbg="client/img/product/${course.courseImg }"></div>
                <div class="course_info_wrap">
	                <div>
	                	<p class="breadcrumb__links course_links"><span>${fn:toUpperCase(course.courseMainCategory)}</span> <span>${fn:toUpperCase(course.courseSubCategory)}</span></p>
		                <div class="course_grade_name">
		                	<p>
		                		<c:if test="${course.courseGrade eq 'easy' }"><span class="course_grade">중급이상</span></c:if>
			                	<c:if test="${course.courseGrade eq 'normal' }"><span class="course_grade">초급</span></c:if>
			                	<c:if test="${course.courseGrade eq 'hard' }"><span class="course_grade">중급이상</span></c:if>
		                		<c:if test="${course.courseGrade ne 'hard' }"><span class="c_space"></span></c:if>
		                		<c:if test="${course.courseGrade eq 'hard' }"><span class="c_space"></span></c:if>
		                		<span class="course_name">${course.courseName }</span>
		                	</p>
		                </div>
	                </div>
	                <div class="course_info_etc">
	                	<!-- 별점 가져오기 -->
	                	<div class="rating">
                            <c:if test="${course.courseStars > 0 }">
								<c:forEach var="i" begin="1" end="${course.courseStars}">
	                            	<i class="fa fa-star"></i>
								</c:forEach>
								<c:forEach var="i" begin="1" end="${5 - course.courseStars}">
	                            	<i class="fa fa-star-o"></i>
								</c:forEach>
							</c:if>
							<c:if test="${course.courseStars == 0 }">
	                        	<i class="fa fa-star-o"></i>
	                            <i class="fa fa-star-o"></i>
	                            <i class="fa fa-star-o"></i>
	                            <i class="fa fa-star-o"></i>
	                            <i class="fa fa-star-o"></i>
							</c:if>
                            <span> - 5 Reviews</span>
                        </div>
                        
                        <!-- 강사 이름 -->
                        <div class="course_teacher">
                        	<span class="infd-icon"><svg width="19" xmlns="http://www.w3.org/2000/svg" height="19" viewBox="0 0 16 16"><path fill="#343a40" fill-rule="evenodd" d="M8 1.667c-2.025 0-3.667 1.641-3.667 3.666 0 1.26.636 2.371 1.603 3.031-2.243.822-3.859 2.945-3.933 5.454-.009.277.209.507.485.515.276.008.506-.209.514-.485C3.082 11.158 5.29 9 8 9c2.71 0 4.918 2.157 4.998 4.848.008.276.238.493.514.485.276-.008.493-.239.485-.514-.074-2.51-1.69-4.633-3.933-5.455.967-.66 1.603-1.771 1.603-3.03 0-2.026-1.642-3.667-3.667-3.667zM5.333 5.333c0-1.472 1.194-2.666 2.667-2.666 1.473 0 2.667 1.194 2.667 2.666C10.667 6.806 9.473 8 8 8 6.527 8 5.333 6.806 5.333 5.333z" clip-rule="evenodd"></path></svg></span>
                        	<p>${course.courseTeacher }</p>
                        </div>
	                </div>
                </div>
            </div>
        </div>
        <!-- 강의 카테고리, 등급, 강의 이름, 설명 end -->
        
        <div class="product__details__content">
            <div class="container">
                <!-- <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4>Hooded thermal anorak</h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span> - 5 Reviews</span>
                            </div>
                            <h3>$270.00 <span>70.00</span></h3>
                            <p>Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                                cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.</p>
                            <div class="product__details__option">
                                <div class="product__details__option__size">
                                    <span>Size:</span>
                                    <label for="xxl">xxl
                                        <input type="radio" id="xxl">
                                    </label>
                                    <label class="active" for="xl">xl
                                        <input type="radio" id="xl">
                                    </label>
                                    <label for="l">l
                                        <input type="radio" id="l">
                                    </label>
                                    <label for="sm">s
                                        <input type="radio" id="sm">
                                    </label>
                                </div>
                                <div class="product__details__option__color">
                                    <span>Color:</span>
                                    <label class="c-1" for="sp-1">
                                        <input type="radio" id="sp-1">
                                    </label>
                                    <label class="c-2" for="sp-2">
                                        <input type="radio" id="sp-2">
                                    </label>
                                    <label class="c-3" for="sp-3">
                                        <input type="radio" id="sp-3">
                                    </label>
                                    <label class="c-4" for="sp-4">
                                        <input type="radio" id="sp-4">
                                    </label>
                                    <label class="c-9" for="sp-9">
                                        <input type="radio" id="sp-9">
                                    </label>
                                </div>
                            </div>
                            <div class="product__details__cart__option">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                                <a href="#" class="primary-btn">add to cart</a>
                            </div>
                            <div class="product__details__btns__option">
                                <a href="#"><i class="fa fa-heart"></i> add to wishlist</a>
                                <a href="#"><i class="fa fa-exchange"></i> Add To Compare</a>
                            </div>
                            <div class="product__details__last__option">
                                <h5><span>Guaranteed Safe Checkout</span></h5>
                                <img src="img/shop-details/details-payment.png" alt="">
                                <ul>
                                    <li><span>SKU:</span> 3812912</li>
                                    <li><span>Categories:</span> Clothes</li>
                                    <li><span>Tag:</span> Clothes, Skin, Body</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div> -->
                <!-- 여기까지 필요없을듯 -->
                <div class="row course_tab_row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                    role="tab">강의소개</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">커리큘럼</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">수강생리뷰</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                            	<!-- 강의소개 탭 start  -->
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                    	<div class="course_script_wrap">
                                    		<div class="intro_text"><span>🎓</span>이런분들께<br> 추천드려요!</div>
	                                        <p class="note">${course.courseScript }</p>
                                    	</div>
                                        <div class="product__details__tab__content__item">
	                                    	<h5><span>🧐</span> 미리보기를 통해 콘텐츠를 확인해보세요.</h5>
                                            <div id="free_iframe_area_1" data_link="${free.subcourseLink }"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 커리큘럼 탭 start -->
                                <div class="tab-pane" id="tabs-6" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <h5><span>✍️</span> 이런 걸 배워요!</h5>
                                            <ul class="subcourse_list_wrap">
                                            	<c:forEach items="${subCourses}" var="s">
	                                            	<li class="subcourse_data">
	                                            		<!-- 서브강의 리스트 생성 start -->
	                                            		<div class="col_7">
	                                            			<div class="col_left">
		                                            			<p>${s.rwm }.</p>
		                                            			<p>${s.subcourseName }</p>
		                                            			<p>(${s.subcourseTime }분)</p>
	                                            			</div>
	                                            			<button onclick="playBtn(${s.subcourseId }, '${s.subcourseLink }')" class="play_btn">
	                                            				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-play-circle-fill" viewBox="0 0 16 16">
																  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814l-3.5-2.5z"/>
																</svg>
	                                            			</button>
	                                            		</div>
	                                            		<!-- 서브강의 리스트 생성 end -->
	                                            		<!-- 강의 모달창 start -->
	                                            		<div id="modalWrap_${s.subcourseId }" class="modalWrap" data-s="${s.subcourseId }">
	                                            			<div id="modalContent_${s.subcourseId }" class="modalContent">
																<div id="modalBody_${s.subcourseId }" class="modalBody">
																	<div class="modalBody_top">
																    	<p class="bold_text"><span class="bold_text">[${s.rwm }강] </span>${s.subcourseName }</p>
																    	<span class="closeBtn">&times;</span>
																	</div>
															    	<div id="iframe_area_${s.subcourseId }">
															    		<!-- 동영상 태그 넣기.. -->
															    	</div>
															    </div>
														 	</div>
	                                            		</div>
	                                            		<!-- 강의 모달창 end -->
	                                            	</li>
	                                            </c:forEach>	
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- 수강생리뷰 탭 start -->
                                <div class="tab-pane" id="tabs-7" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <h5>리뷰불러오기..</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 금액, 장바구니.. -->
                	<div class="course_price_wrap">
                		<c:choose>
                            <c:when test="${course.coursePrice <= 0}">
                                <h5 style="color:red;" class="course_price">무료</h5>
                            </c:when>
                            <c:otherwise>
                                <h5 class="course_price">
                                    <fmt:formatNumber value="${course.coursePrice }" pattern="#,###" />원
                                </h5>
                            </c:otherwise>
                        </c:choose>
                		<div class="button_wrap">
                			<button>수강신청 하기</button>
                			<button>장바구니 담기</button>
                		</div>
                	</div>
                </div>
            </div>
        </div>
    </section>
    <!-- 강의 상세 정보 End -->

    <!-- 다른 강의 추천 Begin -->
    <!-- <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Piqué Biker Jacket</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$67.24</h5>
                            <div class="product__color__select">
                                <label for="pc-1">
                                    <input type="radio" id="pc-1">
                                </label>
                                <label class="active black" for="pc-2">
                                    <input type="radio" id="pc-2">
                                </label>
                                <label class="grey" for="pc-3">
                                    <input type="radio" id="pc-3">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- 다른 강의 추천 End -->
    
    <form id="cform" action="courseList.do" method="post">
    	<input type="hidden" name="subCate" id="subCate" value="" />
    	<input type="hidden" name="grade" id="grade" value="" />
    	<input type="hidden" name="nowPage" id="nowPage" value="" />
    	<input type="hidden" name="cntPerPage" id="cntPerPage" value="" />
    </form>
    
    
    <!-- 강의 관련 자바스크립트 연결 -->
    <script type="text/javascript" src="client/js/coursedetail.js"></script>
    
    
</body>
</html>