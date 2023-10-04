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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
	<style>
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
	</style>
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
				>
					<div class="course_discount">
						<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-fire" viewBox="0 0 16 16">
						  <path d="M8 16c3.314 0 6-2 6-5.5 0-1.5-.5-4-2.5-6 .25 1.5-1.25 2-1.25 2C11 4 9 .5 6 0c.357 2 .5 4-2 6-1.25 1-2 2.729-2 4.5C2 14 4.686 16 8 16Zm0-1c-1.657 0-3-1-3-2.75 0-.75.25-2 1.25-3C6.125 10 7 10.5 7 10.5c-.375-1.25.5-3.25 2-3.5-.179 1-.25 2 1 3 .625.5 1 1.364 1 2.25C11 14 9.657 15 8 15Z"/>
						</svg>
						${data.packageDiscount }% 할인
					</div>
				</div>
				<div class="course_info_wrap">
					<div class="course_grade_name">
						<p>
							<c:if test="${data.packageGrade eq 'easy' }"><span class="course_grade">입문</span></c:if>
							<c:if test="${data.packageGrade eq 'normal' }"><span class="course_grade">초급</span></c:if>
							<c:if test="${data.packageGrade eq 'hard' }"><span class="course_grade">중급이상</span></c:if>
							<span class="course_name">${data.packageTitle }</span>
						</p>
						<div class="tag">
							<c:if test="${data.packageGrade eq 'easy' }"><span># 입문</span></c:if>
							<c:if test="${data.packageGrade eq 'normal' }"><span># 초급</span></c:if>
							<c:if test="${data.packageGrade eq 'hard' }"><span># 중급이상</span></c:if>
							<span># ${fn:toUpperCase(data.packageCategory)}</span>
						</div>
					</div>
					<div class="course_info_etc">
						<h5 class="course-price">
                        	<span class="course-wonga"><fmt:formatNumber value="${data.coursesPrice }" pattern="#,###" />원</span>
                        	<span><fmt:formatNumber value="${data.salePrice }" pattern="#,###" />원</span>
                       	</h5>
					</div>
				</div>
			</div>
		</div>
		<!-- 강의 카테고리, 등급, 강의 이름, 설명 end -->

		<c:if test="${message eq 'impossible' }">
			<div class="impossible_alert">
				<div class="animate__animated animate__flash">
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
											<p class="note_info">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-check" viewBox="0 0 16 16">
												  <path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
												  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
												  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
												</svg>
												강의 이름을 클릭하면 강의 상세정보를 확인 할 수 있어요!
											</p>
											<c:forEach items="${courses}" var="c">
												<p class="note course_data" data-c="${c.courseId }" onclick="window.open('coursedetail.do?courseId=${c.courseId }')">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#266fb5" class="bi bi-patch-question-fill" viewBox="0 0 16 16">
													  <path d="M5.933.87a2.89 2.89 0 0 1 4.134 0l.622.638.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636zM7.002 11a1 1 0 1 0 2 0 1 1 0 0 0-2 0zm1.602-2.027c.04-.534.198-.815.846-1.26.674-.475 1.05-1.09 1.05-1.986 0-1.325-.92-2.227-2.262-2.227-1.02 0-1.792.492-2.1 1.29A1.71 1.71 0 0 0 6 5.48c0 .393.203.64.545.64.272 0 .455-.147.564-.51.158-.592.525-.915 1.074-.915.61 0 1.03.446 1.03 1.084 0 .563-.208.885-.822 1.325-.619.433-.926.914-.926 1.64v.111c0 .428.208.745.585.745.336 0 .504-.24.554-.627z"/>
													</svg>
													${c.courseName }
												</p>
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
										<h5 class="course_price_pay">할인된 가격으로 수강시작하기</h5>
										<!-- 장바구니 버튼 영역 -->
										<div class="button_wrap">
											<c:if test="${pbucket eq 'notIn' }">
												<button type="button" class="btn btn-green btn-green-p course-add" onclick="addPackageBucket()">수강신청 하기</button>
												<button type="button" class="btn btn-green btn-green-p" onclick="ajaxAddPackageBucket()">장바구니 담기</button>
											</c:if>
											<c:if test="${pbucket eq 'in' }">
												<a href="bucketlist.do?memberId=${loginId }"><button type="button" class="btn btn-green btn-green-p course-add">장바구니로 이동</button></a>
											</c:if>
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
	
	<form id="pform" action="packagelist.do" method="post">
		<input type="hidden" name="grade" id="grade"/>
		<input type="hidden" name="category" id="category"/>
	</form>
	<form id="bucketform" action="packagebucketinsert.do" method="post">
		<input type="hidden" name="packageId" id="packageId" value="${data.packageId }" />
		<input type="hidden" name="memberId" id="memberId" value="${loginId }" />
	</form>
	

	<!-- 강의 관련 자바스크립트 연결 -->
	<script type="text/javascript" src="client/js/coursedetail.js"></script>
	<script type="text/javascript">
		function packageList(category, grade, target) {
			
			let form  = document.getElementById("pform");
			console.log("category = " + category);
			console.log("grade = " + grade);
			$('.sub_menu').css('color','#4e4e4e');
			$('.sub_menu_g').removeClass('active');
			$(target).children().css('color','#e53637');
			
			form.category.value = category;
			form.grade.value = grade;
			
			form.submit();
		}
	
		function addPackageBucket() {
			let form = document.getElementById("bucketform");
			const memberId = form.memberId.value;
			console.log("memberId 값::::: " + memberId);
			
			if(memberId == null || memberId == ''){
				let check = confirm('로그인 후 수강신청을 먼저 진행해주세요. 로그인 하시겠습니까?');
				if(check ==  true) {
					location.href = 'login.do';
				}
				return true;
			} else {
				let alert = confirm('패키지에 포함된 강의가 장바구니에 있을 경우,\n기존에 담긴 강의는 삭제됩니다.\n계속해서 진행하시려면 확인을 눌러주세요.');
				
				if(alert == true) {
					form.submit();
				} else {
					alert('수강신청이 취소되었습니다.');
				}
			}
		}
	
		function ajaxAddPackageBucket() {
			//ajaxpackagebucketinsert.do
			const memberId = $('#bucketform #memberId').val();
			const packageId = $('#bucketform #packageId').val();
			
			if(memberId == null || memberId == ''){
				const check = confirm('로그인 후 수강신청을 먼저 진행해주세요. 로그인 하시겠습니까?');
				if(check ==  true) {
					location.href = 'login.do';
				}
				return true;
			} else {
				let alert = confirm('패키지에 포함된 강의가 장바구니에 있을 경우,\n기존에 담긴 강의는 삭제됩니다.\n계속해서 진행하시려면 확인을 눌러주세요.');
				
				if(alert == true) {
					$.ajax({
					url: 'ajaxpackagebucketinsert.do',
					    method: 'post',
					    data: { packageId: packageId, memberId: memberId},
					    success: function (result) {
							let message = result.message;
							
							if(message = 'success') {
						        const check = confirm('장바구니에 추가되었습니다! 장바구니로 이동하시려면 확인을 눌러주세요.');
								if(check ==  true) {
									location.href = 'bucketlist.do?memberId=' + memberId;
								} else {
									$('.button_wrap').empty();
									$('.button_wrap').append('<a href="bucketlist.do?memberId=' + memberId +'"><button type="button" class="btn btn-green btn-green-p course-add">장바구니로 이동</button></a>');
									return true;
								}
							} else if (message = 'fail') {
								alert('죄송합니다, 오류가 발생했습니다. 다시 시도 부탁드립니다.\n오류가 지속적으로 반복된다면 고객센터로 연락바랍니다.');
							}
					    }
					})
				} else {
					alert('수강신청이 취소되었습니다.');
				}
			}
		}
	</script>

</body>

</html>