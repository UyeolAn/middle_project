<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="client/css/coursedetail.css" type="text/css">
	<link rel="stylesheet" href="client/css/course.css" type="text/css">
	<link rel="stylesheet" href="client/css/packagedetail.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>

<body>
	<!-- Offcanvas Menu Begin -->

	<!-- Offcanvas Menu End -->

	<!-- 강의 상세 정보 Begin -->
	<section class="shop-details">
		<!-- 강의 카테고리, 등급, 강의 이름, 설명 start package -->
		<div class="product__details__pic set-bg course_bg">
			<div class="container course_container">
				<div class="row set-bg course_pic" 
					<c:if test="${data.packageThumbnail == null}">data-setbg="client/img/product/basic.png" </c:if>
                    <c:if test="${data.packageThumbnail != null}">data-setbg="client/img/product/${data.packageThumbnail}" </c:if>
				></div>
				<div class="course_info_wrap">
					<div>
						<p class="breadcrumb__links course_links">
							<span>Package</span>
							<c:if test="${data.packageGrade eq 'easy' }"><span>입문</span></c:if>
							<c:if test="${data.packageGrade eq 'normal' }"><span>초급</span></c:if>
							<c:if test="${data.packageGrade eq 'hard' }"><span>중급이상</span></c:if>
						</p>
						<div class="course_grade_name">
							<p>
								<c:if test="${data.packageGrade eq 'easy' }"><span class="course_grade">입문</span></c:if>
								<c:if test="${data.packageGrade eq 'normal' }"><span class="course_grade">초급</span></c:if>
								<c:if test="${data.packageGrade eq 'hard' }"><span class="course_grade">중급이상</span></c:if>
								<span class="course_name">${data.packageTitle }</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 강의 카테고리, 등급, 강의 이름, 설명 end -->

		<c:if test="${message eq 'impossible' }">
			<div class="impossible_alert">
				<div class="animate__animated animate__flash animate__repeat-2 2">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#fff" class="bi bi-patch-check-fill" viewBox="0 0 16 16">
					  <path d="M10.067.87a2.89 2.89 0 0 0-4.134 0l-.622.638-.89-.011a2.89 2.89 0 0 0-2.924 2.924l.01.89-.636.622a2.89 2.89 0 0 0 0 4.134l.637.622-.011.89a2.89 2.89 0 0 0 2.924 2.924l.89-.01.622.636a2.89 2.89 0 0 0 4.134 0l.622-.637.89.011a2.89 2.89 0 0 0 2.924-2.924l-.01-.89.636-.622a2.89 2.89 0 0 0 0-4.134l-.637-.622.011-.89a2.89 2.89 0 0 0-2.924-2.924l-.89.01-.622-.636zm.287 5.984-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7 8.793l2.646-2.647a.5.5 0 0 1 .708.708z"/>
					</svg>
					<p class="message">이미 수강중인 강의가 포함되어 있어요!</p>
				</div>
			</div>
		</c:if>

		<div class="product__details__content">
			<div class="container">
				<div class="row course_tab_row">
					<!-- 강의소개, 커리큘럽, 수강생리뷰 탭 start -->
					<div class="col-lg-12" <c:if test="${message eq 'impossible' }">style="max-width:100%"</c:if>>
						<div class="product__details__tab">
							<div class="tab-content">
								<!-- 강의소개 탭 start  -->
								<div class="tab-pane active" id="tabs-5" role="tabpanel">
									<div class="product__details__tab__content">
										<!-- 패키지에 포함된 강의 이름 -->
										<div class="course_script_wrap course_name_wrap_sgap">
											<div class="intro_text"><span>🎓</span>이런 강의들이<br> 포함되어 있어요!</div>
											<c:forEach items="${courses}" var="c">
												<p class="note course_data" data-c="${c.courseId }">${c.courseName }</p>
											</c:forEach>
										</div>
										<!-- 패키지 스크립트(설명글) -->
										<div class="course_script_wrap course_script_border_none">
											<div class="intro_text"><span>🎓</span>이런분들께<br> 추천드려요!</div>
											<p class="note">
												${data.packageScript }
											</p>
										</div>
										<!-- 패키지 이미지 -->
										<div class="product__details__tab__content__item">
											<div>
												<c:if test="${data.packageImg ne null }">
													<img alt="" src="client/img/product/${data.packageImg }">
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 강의소개, 커리큘럽, 수강생리뷰 탭 end -->
					
					<!-- 금액, 장바구니 start -->
					<c:if test="${message eq 'possible' }">
						<div class="course_price_wrap">
							<div class="course_price_top">
								<c:choose>
									<c:when test="${data.salePrice <= 0}">
										<h5 class="course_price_free">무료, 지금 바로 수강하세요!</h5>
										<h5 class="course_price">0원</h5>
										<div class="button_wrap">
											<button type="button" class="btn btn-green course-add" onclick="addMemberFreeCourse()">바로 수강신청 하기</button>
										</div>
									</c:when>
									<c:otherwise>
										<c:if test="${data.salePrice >= 300000 }">
											<h5 class="course_price_pay">6개월 무이자 할부 가능!</h5>
										</c:if>
										<h5 class="course_price">
											<fmt:formatNumber value="${data.salePrice }" pattern="#,###" />원
										</h5>
										<!-- 장바구니 버튼 영역 -->
										<div class="button_wrap">
											<button type="button" class="btn btn-green btn-green-p course-add" onclick="addBucketList()">수강신청 하기</button>
											<button type="button" class="btn btn-green btn-green-p" onclick="ajaxAddBucketList()">장바구니 담기</button>
										</div>
										
										<!-- 장바구니 버튼 영역 -->
									</c:otherwise>
								</c:choose>
							</div>
							<ul class="course_price_bottom">
								<li>수강기한: 무제한</li>
								<li>난이도: 입문</li>
								<li>질문 답변 제공</li>
							</ul>
						</div>
					</c:if>
					<!-- 금액, 장바구니 end -->
				</div>
			</div>
		</div>
	</section>
	<!-- 강의 상세 정보 End -->
	
	<form id="bucketform" action="packagebucketinsert.do" method="post">
		<input type="hidden" name="packageId" id="packageId" value="${data.packageId }" />
		<input type="hidden" name="memberId" id="memberId" value="${loginId }" />
	</form>
	

	<!-- 강의 관련 자바스크립트 연결 -->
	<script type="text/javascript" src="client/js/coursedetail.js"></script>

</body>

</html>