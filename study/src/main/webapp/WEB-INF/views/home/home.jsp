<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<meta name="description" content="Male_Fashion Template">
					<meta name="keywords" content="Male_Fashion, unica, creative, html">
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<meta http-equiv="X-UA-Compatible" content="ie=edge">
					<title>STUDY | MAIN</title>

					<!-- Google Font -->
					<link
						href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
						rel="stylesheet">

					<!-- Css Styles -->
					<link rel="stylesheet" href="client/css/bootstrap.min.css" type="text/css">
					<link rel="stylesheet" href="client/css/font-awesome.min.css" type="text/css">
					<link rel="stylesheet" href="client/css/elegant-icons.css" type="text/css">
					<link rel="stylesheet" href="client/css/magnific-popup.css" type="text/css">
					<link rel="stylesheet" href="client/css/nice-select.css" type="text/css">
					<link rel="stylesheet" href="client/css/owl.carousel.min.css" type="text/css">
					<link rel="stylesheet" href="client/css/slicknav.min.css" type="text/css">
					<link rel="stylesheet" href="client/css/style.css" type="text/css">
					<link rel="stylesheet" href="client/css/course.css">
					<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
					<link rel="stylesheet"
						href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
					<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
					<link rel="icon" href="/favicon.ico" type="image/x-icon">
					<style>
						.recommend__course__container {
							margin: 5%;
						}

						h5,
						h6 {
							font-family: 'NanumSquareRound' !important;
						}

						* {
							font-family: 'NanumSquareRound';
						}

						.latest {
							max-width: 1200px;
							margin: 0 auto;
						}

						/* 20231004 전유진추가 시작 */
						.footer__about {
							height: 100%;
							display: flex;
							flex-direction: column;
							justify-content: space-around;
						}

						/* 20231004 전유진추가 끝 */
					</style>
				</head>

				<body>
					<!-- Page Preloder -->
					<div id="preloder">
						<div class="loader"></div>
					</div>
					<!-- Header Section Begin -->
					<header class="header">
						<div class="container">
							<div class="row">
								<div class="col-lg-3 col-md-3">
									<div class="header__logo">
										<a href="home.do"><img src="client/img/logo.png" style="width: 150px;"
												alt=""></a>
									</div>
								</div>
								<div class="col-lg-6 col-md-6">
									<nav class="header__menu mobile-menu">
										<ul>
											<li class="active"><a href="home.do">&#127968;Home</a></li>
											<li><a href="courselist.do">&#128187;Course</a>
												<ul class="dropdown">
													<li><a href="courselist.do?mainCate=it">IT</a></li>
													<li><a href="courselist.do?mainCate=english">English</a></li>
													<li><a href="courselist.do?mainCate=career">Career</a></li>
												</ul>
											</li>
											<li><a href="packagelist.do">&#127873;Package</a>
												<!-- <ul class="dropdown">
								<li><a href="./about.html">초급</a></li>
								<li><a href="./shop-details.html">중급</a></li>
								<li><a href="./shopping-cart.html">고급</a></li>
							</ul> -->
											</li>
											<li><a href="communityqnapage.do">&#128106;Community</a>
												<ul class="dropdown">
													<li><a href="communityqnapage.do">질문게시판</a></li>
													<li><a href="communityfreepage.do">자유게시판</a></li>
												</ul>
											</li>

										</ul>
									</nav>
								</div>
								<div class="col-lg-3 col-md-3">
									<nav class="header__menu mobile-menu">
										<ul>
											<c:if test="${not empty loginId}">
												<li><a href="mypageprofile.do"><span>${loginName} 님 접속중</span></a>
													<ul class="dropdown">
														<li><a href="#" onclick="logout()">LOGOUT</a></li>
														<li><a href="mypageprofile.do">MY PAGE</a></li>
														<c:if test="${loginAuthor eq 'admin'}">
															<li><a href="adminhome.do">ADMIN PAGE</a></li>
														</c:if>
													</ul>
												</li>
											</c:if>
											<c:if test="${empty loginId}">
												<li>
													<a href="login.do" style="color: black;">Sign in</a>
												</li>
											</c:if>
										</ul>
									</nav>
								</div>
							</div>
							<div class="canvas__open">
								<i class="fa fa-bars"></i>
							</div>
						</div>
					</header>
					<!-- Header Section End -->

					<!-- Hero Section Begin -->
					<div class="hero__slider owl-carousel" style="height: 300px;">
						<div class="hero__items set-bg" style="padding: 30px; height: 300px;  background-color: pink;">
							<a href="packagelist.do">
								<div class="container">
									<div class="row">
										<div class="col-lg-7">
											<div class="hero__text">
												<h6>SALE PACKAGE</h6>
												<h2 style="font-family: 'NanumSquareRound';">현재 할인하는 패키지&#128176;</h2>
												<p style="font-family: 'NanumSquareRound'; color: black;">다양한 강의들을 할인된
													가격으로
													만나보세요!</p>
												<!-- <a href="#" class="primary-btn">신청하러가기<span class="arrow_right"></span></a> -->
											</div>
										</div>
										<div class="col-lg-5" style="padding: 30px;">
											<img src="client/img/banner/surprise.png" style="width:200px;">
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="hero__items set-bg"
							style="padding: 30px; height: 300px; background-color: #3188DB;">
							<a href="courselist.do">
								<div class="container">
									<div class="row">
										<div class="col-lg-7">
											<div class="hero__text">

												<h6>IT COURSES</h6>
												<h2 style="font-family: 'NanumSquareRound'; color: white;">IT 강의들
													잔뜩&#128218;</h2>
												<p style="font-family: 'NanumSquareRound'; color: white;">예비 개발자들을 위한
													강의들을
													골라 들어보세요</p>

											</div>
										</div>
										<div class="col-lg-5" style="padding: 30px;">
											<img src="client/img/banner/code.png" style="width:200px;">
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="hero__items set-bg"
							style="padding: 30px; height: 300px;  background-color: greenyellow;">
							<a href="communityqnapage.do">
								<div class="container">
									<div class="row">
										<div class="col-lg-7">
											<div class="hero__text">
												<h6>QUESTION COMMUNITY</h6>
												<h2 style="font-family: 'NanumSquareRound';">질문이 있다면 바로 &#128587;</h2>
												<p style="font-family: 'NanumSquareRound'; color: black;">다양한 사람들과 소통을
													하며
													궁금증을 해소!</p>
											</div>
										</div>
										<div class="col-lg-5" style="padding: 30px;">
											<img src="client/img/banner/board.png" style="width:200px;">
										</div>
									</div>
								</div>
							</a>
						</div>







					</div>

					<section class="product spad">
						<div class="container">
							<div class="row">
								<div class="col-lg-12" style="margin: 30px;">
									<ul class="filter__controls">
										<li class="active" data-filter=".mix" style="width: 150px;"><img
												src="client/img/home/all.png" style="width: 30px;" title="All"> ALL</li>
										<li data-filter=".hot" style="width: 150px;"><img
												src="client/img/home/heart.png" style="width: 30px;" title="Best Hot">
											HOT</li>
										<li data-filter=".review" style="width: 150px;"><img
												src="client/img/home/star.png" style="width: 30px;" title="Best Review">
											REVIEW</li>
										<li data-filter=".it" style="width: 150px;"><img
												src="client/img/home/computer.png" style="width: 30px;" title="Best IT">
											IT</li>

									</ul>
								</div>
							</div>
							<div class="row product__filter">
								<c:forEach items="${reviewList}" var="r">
									<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix review course-col">
										<a href="coursedetail.do?courseId=${r.courseId}">
											<div class="product__item course-item">
												<img src="client/img/product/${r.courseImg}"
													style="width: 330px; height: 150px;">
												<div class="product__item__text">
													<h6>${r.courseName}</h6>
													<div class="d-flex justify-content-space-between small text-warning mb-2"
														class="stars">
														<c:forEach var="star1" begin="1" end="${r.courseStars}">
															<div class="bi-star-fill"></div>
														</c:forEach>
														<c:forEach var="star1" begin="1" end="${5 - r.courseStars}">
															<div class="bi-star"></div>
														</c:forEach>
													</div>
													<c:choose>
														<c:when test="${r.coursePrice eq 0}">
															<h5 class="text-danger">무료</h5>
														</c:when>
														<c:otherwise>
															<h5>
																<fmt:formatNumber value="${r.coursePrice }"
																	pattern="#,###" />원
															</h5>
														</c:otherwise>
													</c:choose>
												</div>

											</div>
										</a>
									</div>
								</c:forEach>
								<c:forEach items="${hotList}" var="h">
									<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot course-col">
										<a href="coursedetail.do?courseId=${h.courseId}">
											<div class="product__item course-item">
												<img src="client/img/product/${h.courseImg}"
													style="width: 330px; height: 150px;">
												<div class="product__item__text">
													<h6>${h.courseName}</h6>
													<div class="d-flex justify-content-space-between small text-warning mb-2"
														class="stars">
														<c:forEach var="star2" begin="1" end="${h.courseStars}">
															<div class="bi-star-fill"></div>
														</c:forEach>
														<c:forEach var="star2" begin="1" end="${5 - h.courseStars}">
															<div class="bi-star"></div>
														</c:forEach>
													</div>
													<c:choose>
														<c:when test="${h.coursePrice eq 0}">
															<h5 class="text-danger">무료</h5>
														</c:when>
														<c:otherwise>
															<h5>
																<fmt:formatNumber value="${h.coursePrice }"
																	pattern="#,###" />원
															</h5>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
								<c:forEach items="${itList}" var="l">
									<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix it course-col">
										<a href="coursedetail.do?courseId=${l.courseId}">
											<div class="product__item course-item">
												<img src="client/img/product/${l.courseImg}"
													style="width: 330px; height: 150px;">
												<div class="product__item__text">
													<h6>${l.courseName}</h6>
													<div class="d-flex justify-content-space-between small text-warning mb-2"
														class="stars">
														<c:forEach var="star3" begin="1" end="${l.courseStars}">
															<div class="bi-star-fill"></div>
														</c:forEach>
														<c:forEach var="star3" begin="1" end="${5 - l.courseStars}">
															<div class="bi-star"></div>
														</c:forEach>
													</div>
													<c:choose>
														<c:when test="${l.coursePrice eq 0}">
															<h5 class="text-danger">무료</h5>
														</c:when>
														<c:otherwise>
															<h5>
																<fmt:formatNumber value="${l.coursePrice }"
																	pattern="#,###" />원
															</h5>
														</c:otherwise>
													</c:choose>
												</div>

											</div>
										</a>
									</div>
								</c:forEach>
							</div>
						</div>
					</section>
					<!-- Hero Section End -->

					<section class="latest">

						<div class="row" style="justify-content: space-around;">
							<div class="card shadow" style="width:560px; padding: 0; border: 0;">
								<div class="card-head" style="padding: 20px;">
									<div style="display: flex; justify-content: space-between;">
										<h4
											style="font-family: 'NanumSquareRound'; text-align: left; line-height: 100%; display: inline-block; flex: 3;">
											<img src="client/img/icon/qna.png" alt="아이콘"
												style="width: 30px; height: 30px;">
											질문게시판
										</h4>
										<a href="communityqnapage.do">
											<h6
												style="text-align: right; display: inline-block; line-height: 24px; flex: 1;">
												+더보기</h6>
										</a>
									</div>
								</div>
								<hr style="border: 2px solid salmon; margin: 0;">
								<div class="card-body" style="padding: 20px;">
									<c:forEach items="${qlist}" var="q">
										<a href="communityqnadetailpage.do?questionId=${q.questionId}">
											<div class="mb-3" style="display: flex; justify-content: space-between;">
												<span style="text-align: left; flex: 2;">
													<c:choose>
														<c:when test="${fn:length(q.questionTitle) gt 25}">
															<c:out value="${fn:substring(q.questionTitle, 0, 24)}" />...
														</c:when>
														<c:otherwise>
															<c:out value="${q.questionTitle}">
															</c:out>
														</c:otherwise>
													</c:choose>
												</span>
												<span style="text-align: right; flex: 1;">${q.questionEnterDate}</span>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
							<div class="card shadow" style="width:560px; padding: 0; border: 0;">
								<div class="card-head" style="padding: 20px;">
									<div style="display: flex; justify-content: space-between;">
										<h4
											style="font-family: 'NanumSquareRound'; text-align: left; line-height: 100%; display: inline-block; flex: 3;">
											<img src="client/img/icon/free.png" alt="아이콘"
												style="width: 30px; height: 30px;">
											자유게시판
										</h4>
										<a href="communityfreepage.do">
											<h6
												style="text-align: right; display: inline-block; line-height: 24px; flex: 1;">
												+더보기</h6>
										</a>
									</div>
								</div>
								<hr style="border: 2px solid salmon; margin: 0;">
								<div class="card-body" style="padding: 20px;">
									<c:forEach items="${blist}" var="b">
										<a href="communityfreedetailpage.do?boardId=${b.boardId}">
											<div class="mb-3" style="display: flex; justify-content: space-between;">
												<span style="text-align: left; flex: 2;">
													<c:choose>
														<c:when test="${fn:length(b.boardTitle) gt 25}">
															<c:out value="${fn:substring(b.boardTitle, 0, 24)}" />...
														</c:when>
														<c:otherwise>
															<c:out value="${b.boardTitle}">
															</c:out>
														</c:otherwise>
													</c:choose>
												</span>
												<span style="text-align: right; flex: 1;">${b.boardEnterDate}</span>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</section>



					<!-- Footer Section Begin -->
					<footer style="padding: 43px 0; background-color: #343a40;">
						<div class="container">
							<div class="row" style="justify-content: space-between;">
								<div class="col-lg-3 col-md-6 col-sm-6" style="max-width: 60%; flex: none;">
									<div class="footer__about" style="margin-bottom: 0;">
										<h6 class="font-weight-bold" style="color: white; font-size: 22px;">Today Course
											(주)TOCO</h6>
										<div>
											<p style="margin-bottom: 0; margin-top: 50px;">팀장: 송민주 / 팀원: 안우열, 양진우, 전유진
											</p>
											<p style="margin-bottom: 0;">대구광역시 중구 중앙대로 403 (남일동 135-1, 5층)</p>
											<p style="margin-bottom: 0;">사업자번호:123-45-67890 / Tel:053-111-2345 /
												Fax:053-123-5678</p>
										</div>
									</div>
								</div>

								<img src="client/img/footer-logo.png" alt="푸터로고" style="max-width: 150px;">
							</div>

						</div>
					</footer>
					<!-- Footer Section End -->
					<% String blockedUserMessage=(String) session.getAttribute("blockedUser"); if (blockedUserMessage
						!=null) { %>
						<script>
							alert("<%= blockedUserMessage %>");
						</script>
						<% } %>

							<script>
								let loginMsg = `${loginmsg}`;
								if (loginMsg != "") {
									alert(loginMsg)
									loginMsg = "";
								}



								let logoutMsg = `${msg}`;
								if (logoutMsg != "") {
									alert(logoutMsg)
									logoutMsg = "";
								}



							</script>
							<!-- Js Plugins -->
							<script src="client/js/jquery-3.3.1.min.js"></script>
							<script src="client/js/bootstrap.min.js"></script>
							<script src="client/js/jquery.nice-select.min.js"></script>
							<script src="client/js/jquery.nicescroll.min.js"></script>
							<script src="client/js/jquery.magnific-popup.min.js"></script>
							<script src="client/js/jquery.countdown.min.js"></script>
							<script src="client/js/jquery.slicknav.js"></script>
							<script src="client/js/mixitup.min.js"></script>
							<script src="client/js/owl.carousel.min.js"></script>
							<script src="client/js/main.js"></script>
							<!--Start of Tawk.to Script-->
							<script type="text/javascript">
								var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
								(function () {
									var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
									s1.async = true;
									s1.src = 'https://embed.tawk.to/63bd6d55c2f1ac1e202cb159/1gmdv669s';
									s1.charset = 'UTF-8';
									s1.setAttribute('crossorigin', '*');
									s0.parentNode.insertBefore(s1, s0);
								})();
							</script>
							<!--End of Tawk.to Script-->

							<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
							<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
								integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
								crossorigin="anonymous">
								</script>
							<script>


								Kakao.init('9c1eb3ec967ca14a10ddab8621bdddef');


								function logout() {
									const isKakaoUser = <%=session.getAttribute("isKakaoUser") %>;
									console.log(isKakaoUser);
									if (isKakaoUser) {
										// 카카오 로그아웃 처리 코드
										if (Kakao.Auth.getAccessToken()) {
											Kakao.API.request({
												url: '/v1/user/unlink',
												success: function (response) {
													console.log(response)
												},
												fail: function (error) {
													console.log(error)
												},
											})
											Kakao.Auth.setAccessToken(undefined)
										}

										Kakao.Auth.logout()
											.then(function (response) {
												console.log(Kakao.Auth.getAccessToken()); // null
											})
											.catch(function (error) {
												console.log('Not logged in.');
											});

										fetch('logout.do', {
											method: 'POST',
											headers: {
												'Content-Type': 'application/x-www-form-urlencoded'
											}
										})
											.then(response => {
												if (response.ok) {
													console.log('카카오 로그아웃 성공');
													window.location.href = 'home.do';
												} else {
													console.error('카카오 로그아웃 실패');
												}
											})
											.catch(error => {
												console.error('로그아웃 오류: ' + error);
											});
									} else {
										// 일반 로그아웃 처리 코드
										fetch('logout.do', {
											method: 'POST',
											headers: {
												'Content-Type': 'application/x-www-form-urlencoded'
											}
										})
											.then(response => {
												if (response.ok) {
													console.log('일반 로그아웃 성공');
													window.location.href = 'home.do';
												} else {
													console.error('일반 로그아웃 실패');
												}
											})
											.catch(error => {
												console.error('로그아웃 오류: ' + error);
											});
									}
								}


							</script>
				</body>


				</html>