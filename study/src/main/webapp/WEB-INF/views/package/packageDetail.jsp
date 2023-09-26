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
	<link rel="stylesheet" href="client/css/package.css" type="text/css">
</head>

<body>
	<!-- Offcanvas Menu Begin -->

	<!-- Offcanvas Menu End -->

	<!-- 강의 상세 정보 Begin -->
	<section class="shop-details">
		<!-- 강의 카테고리, 등급, 강의 이름, 설명 start -->
		<div class="product__details__pic set-bg course_bg">
			<div class="container course_container">
				<div class="row set-bg course_pic" data-setbg="client/img/product/package_thum1.png"></div>
				<div class="course_info_wrap">
					<div>
						<p class="breadcrumb__links course_links"><span>Package</span>
							<span>입문자 패키지</span></p>
						<div class="course_grade_name">
							<p>
								<span class="course_grade">입문</span>
								<span class="course_name">Java 입문자를 위한 패키지</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 강의 카테고리, 등급, 강의 이름, 설명 end -->

		<div class="product__details__content">
			<div class="container">
				<div class="row course_tab_row">
					<!-- 강의소개, 커리큘럽, 수강생리뷰 탭 start -->
					<div class="col-lg-12">
						<div class="product__details__tab">
							<div class="tab-content">
								<!-- 강의소개 탭 start  -->
								<div class="tab-pane active" id="tabs-5" role="tabpanel">
									<div class="product__details__tab__content">
										<div class="course_script_wrap">
											<div class="intro_text"><span>🎓</span>이런분들께<br> 추천드려요!</div>
											<p class="note">
												${course.courseScript }
												넓고 깊은 역량을 가진 풀스택 개발자가 되기 위해서는 각 포지션을 모두 집중적으로 학습해야 합니다. 프론트엔드는 주로 눈에 보이는 UI·UX를 다루기 때문에 상대적으로 쉽게 접근할 수 있죠. [고농축 프론트엔드 코스]에서는 원활한 프론트엔드 개발을 위해 데이터 통신이 가능하도록 실습용 API를 제공하고 있어요. 프론트엔드 코스에서 제공되는 API를 토대로 웹사이트를 구현해 본 후에 [고농축 백엔드 코스]에서 직접 API와 DB등을 구현 및 적용함으로써 실제 서비스를 고도화하는 것이 효율적인 학습 방법입니다.
											</p>
										</div>
										<div class="product__details__tab__content__item">
											<div>
												<img alt="" src="client/img/product/package1.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 강의소개, 커리큘럽, 수강생리뷰 탭 end -->
					
					<!-- 금액, 장바구니 start -->
					<div class="course_price_wrap">
						<div class="course_price_top">
							<c:choose>
								<c:when test="${course.coursePrice <= 0}">
									<h5 class="course_price_free">무료, 지금 바로 수강하세요!</h5>
									<h5 class="course_price">0원</h5>
									<div class="button_wrap">
										<button type="button" class="btn btn-green course-add" onclick="addMemberFreeCourse()">바로 수강신청 하기</button>
									</div>
								</c:when>
								<c:otherwise>
									<c:if test="${course.coursePrice >= 100000 }">
										<h5 class="course_price_pay">3개월 무이자 할부 가능!</h5>
									</c:if>
									<h5 class="course_price">
										<fmt:formatNumber value="${course.coursePrice }" pattern="#,###" />원
									</h5>
									<div class="button_wrap">
										<c:if test="${bucket eq 'notIn' }">
											<button type="button" class="btn btn-green btn-green-p course-add" onclick="addBucketList()">수강신청 하기</button>
											<button type="button" class="btn btn-green btn-green-p" onclick="ajaxAddBucketList()">장바구니 담기</button>
										</c:if>
										<c:if test="${bucket eq 'in' }">
											<a href="bucketlist.do?memberId=${loginId }"><button type="button" class="btn btn-green btn-green-p course-add">장바구니로 이동</button></a>
										</c:if>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<ul class="course_price_bottom">
							<li>수강기한: 무제한</li>
							<li>난이도: 입문</li>
							<li>질문 답변 제공</li>
						</ul>
					</div>
					<!-- 금액, 장바구니 end -->
				</div>
			</div>
		</div>
	</section>
	<!-- 강의 상세 정보 End -->

	<form id="cform" action="courselist.do" method="post">
		<input type="hidden" name="subCate" id="subCate" value="" />
		<input type="hidden" name="grade" id="grade" value="" />
		<input type="hidden" name="nowPage" id="nowPage" value="" />
		<input type="hidden" name="cntPerPage" id="cntPerPage" value="" />
		<input type="hidden" name="message" id="message" value="${message }" />
		<input type="hidden" name="loginId" id="loginId" value="${loginId }" />
	</form>
	
	<form id="bucketform" action="bucketinsert.do" method="post">
		<input type="hidden" name="courseId" id="courseId" value="${course.courseId }" />
		<input type="hidden" name="memberId" id="memberId" value="${loginId }" />
	</form>
	

	<!-- 강의 관련 자바스크립트 연결 -->
	<script type="text/javascript" src="client/js/coursedetail.js"></script>

</body>

</html>