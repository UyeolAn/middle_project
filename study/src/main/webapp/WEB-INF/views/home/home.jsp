<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="description" content="Male_Fashion Template">
			<meta name="keywords" content="Male_Fashion, unica, creative, html">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta http-equiv="X-UA-Compatible" content="ie=edge">
			<title>Male-Fashion | Template</title>

			<!-- Google Font -->
			<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
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
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
			<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
			<link rel="icon" href="/favicon.ico" type="image/x-icon">
			<style>
				.recommend__course__container {
					margin: 5%;
				}

				.header__top__hover ul a{
					color: black;
        }
				* {
				font-family: 'NanumSquareRound';
				}
				
				h5, h6{
				font-family: 'NanumSquareRound' !important;
				}
			</style>
		</head>

		<body>
			<!-- Page Preloder -->
			<div id="preloder">
				<div class="loader"></div>
			</div>		
			<!-- Header Section Begin -->
			<header class="header">
				<div class="header__top"  style="background-color: white;">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 col-md-7">
								<div class="header__top__left">
									<p>인터넷 강의 사이트</p>
								</div>
							</div>
							<div class="col-lg-6 col-md-5">
								<div class="header__top__right">
									<div class="header__top__links">
										<c:if test="${empty loginId}">
											<a href="login.do" style="color: black;">Sign in</a>
										</c:if>
									</div>
									<c:if test="${not empty loginId}">
										<div class="header__top__hover">
											<span>${loginName} 님 접속중<i class="arrow_carrot-down"></i></span>
											<ul>
												<li onclick="logout()">LOGOUT</li>
												<!-- <li><a href="logout.do">LOGOUT</a></li> -->
												<li><a href="mypageprofile.do">MY PAGE</a></li>
											</ul>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-3">
							<div class="header__logo">
								<a href="home.do"><img src="client/img/product/student.png" style="width: 50px;" alt=""></a>
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
							<div class="header__nav__option">
								<a href="#" class="search-switch"><img src="client/img/icon/search.png" alt=""></a> <a href="#"><img
										src="client/img/icon/heart.png" alt=""></a> <a href="#"><img src="client/img/icon/cart.png" alt="">
									<span>0</span></a>
								<div class="price">$0.00</div>
							</div>
						</div>
					</div>
					<div class="canvas__open">
						<i class="fa fa-bars"></i>
					</div>
				</div>
			</header>
			<!-- Header Section End -->

			<!-- Hero Section Begin -->
			<div class="hero__slider owl-carousel" style="height: 300px;" >
				<div class="hero__items set-bg" style="padding: 30px; height: 300px;  background-color: pink;" >
					<a href="packagelist.do">
						<div class="container">
							<div class="row">
								<div class="col-lg-7">
									<div class="hero__text">
										<h6>SALE PACKAGE</h6>
										<h2 style="font-family: 'NanumSquareRound';">현재 할인하는 패키지&#128176;</h2>
										<p style="font-family: 'NanumSquareRound'; color: black;">다양한 강의들을 할인된 가격으로 만나보세요!</p>
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
				<div class="hero__items set-bg" style="padding: 30px; height: 300px; background-color: #3188DB;" >
					<a href="courselist.do">
						<div class="container">
							<div class="row">
								<div class="col-lg-7">
									<div class="hero__text">
										<h6>IT COURSES</h6>
										<h2 style="font-family: 'NanumSquareRound'; color: white;">IT 강의들 잔뜩&#128218;</h2>
										<p style="font-family: 'NanumSquareRound'; color: white;">예비 개발자들을 위한 강의들을 골라 들어보세요</p>
									</div>
								</div>
								<div class="col-lg-5" style="padding: 30px;">
									<img src="client/img/banner/code.png" style="width:200px;">
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="hero__items set-bg" style="padding: 30px; height: 300px;  background-color: greenyellow;" >
					<a href="communityqnapage.do">
						<div class="container">
							<div class="row">
								<div class="col-lg-7">
									<div class="hero__text">
										<h6>QUESTION COMMUNITY</h6>
										<h2 style="font-family: 'NanumSquareRound';">질문이 있다면 바로 &#128587;</h2>
										<p style="font-family: 'NanumSquareRound'; color: black;">다양한 사람들과 소통을 하며 궁금증을 해소!</p>
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
								<li class="active" data-filter=".mix" style="width: 150px;"><img src="client/img/home/all.png" style="width: 30px;" title="All"> ALL</li>
								<li data-filter=".hot" style="width: 150px;"><img src="client/img/home/heart.png" style="width: 30px;" title="Best Hot"> HOT</li>
								<li data-filter=".review" style="width: 150px;"><img src="client/img/home/star.png" style="width: 30px;" title="Best Review"> REVIEW</li>
								<li data-filter=".it"  style="width: 150px;"><img src="client/img/home/computer.png" style="width: 30px;" title="Best IT"> IT</li>
							</ul>
						</div>
					</div>
					<div class="row product__filter">
						<c:forEach items="${reviewList}" var="r">
							<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix review course-col">
								<a href="coursedetail.do?courseId=${r.courseId}">
									<div class="product__item course-item">
										<img src="client/img/product/${r.courseImg}" style="width: 330px; height: 200px;">
										<div class="product__item__text">
											<h6>${r.courseName}</h6>
											<div class="d-flex justify-content-space-between small text-warning mb-2" class="stars">
												<c:forEach var = "star1" begin = "1" end = "${r.courseStars}">
												  <div class="bi-star-fill"></div>
												</c:forEach>
												<c:forEach var = "star1" begin = "1" end = "${5 - r.courseStars}">
												  <div class="bi-star"></div>
												</c:forEach>
											</div>
											<c:choose>
												<c:when test="${r.coursePrice eq 0}">
													<h5 class="text-danger">무료</h5>
												</c:when>
												<c:otherwise>
													<h5>${r.coursePrice}원</h5>
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
										<img src="client/img/product/${h.courseImg}" style="width: 330px; height: 200px;">
										<div class="product__item__text">
											<h6>${h.courseName}</h6>
											<div class="d-flex justify-content-space-between small text-warning mb-2" class="stars">
												<c:forEach var = "star2" begin = "1" end = "${h.courseStars}">
												  <div class="bi-star-fill"></div>
												</c:forEach>
												<c:forEach var = "star2" begin = "1" end = "${5 - h.courseStars}">
												  <div class="bi-star"></div>
												</c:forEach>
											</div>
											<c:choose>
												<c:when test="${h.coursePrice eq 0}">
													<h5 class="text-danger">무료</h5>
												</c:when>
												<c:otherwise>
													<h5>${h.coursePrice}원</h5>
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
										<img src="client/img/product/${l.courseImg}" style="width: 330px; height: 200px;">
										<div class="product__item__text">
											<h6>${l.courseName}</h6>
											<div class="d-flex justify-content-space-between small text-warning mb-2" class="stars">
												<c:forEach var = "star3" begin = "1" end = "${l.courseStars}">
												  <div class="bi-star-fill"></div>
												</c:forEach>
												<c:forEach var = "star3" begin = "1" end = "${5 - l.courseStars}">
												  <div class="bi-star"></div>
												</c:forEach>
											</div>
											<c:choose>
												<c:when test="${l.coursePrice eq 0}">
													<h5 class="text-danger">무료</h5>
												</c:when>
												<c:otherwise>
													<h5>${l.coursePrice}원</h5>
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

			<section class="latest spad">

				<div class="row" style="justify-content: space-around;">
					<div class="card col-lg-5 shadow" style="padding: 0; border: 0;">
						<div class="card-head" style="padding: 20px;" >
							<div style="display: flex; justify-content: space-between;">
								<h4 style="font-family: 'NanumSquareRound'; text-align: left; line-height: 100%; display: inline-block; flex: 3;">질문게시판</h4>
								<a href="communityqnapage.do">
									<h6 style="text-align: right; display: inline-block; line-height: 24px; flex: 1;">+더보기</h6>
								</a>
							</div>
						</div>
						<hr style="border: 3px solid salmon; margin: 0;">
						<div class="card-body" style="padding: 20px;">
							<c:forEach items="${qlist}" var="q">
								<a href="communityqnadetailpage.do?questionId=${q.questionId}">
									<div class="mb-2" style="display: flex; justify-content: space-between;">
										<span style="text-align: left; flex: 1;">${q.questionTitle}</span>
										<span style="text-align: right; flex: 1;">${q.questionEnterDate}</span>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
					<div class="card col-lg-5 shadow" style="padding: 0; border: 0;">
						<div class="card-head" style="padding: 20px;" >
							<div style="display: flex; justify-content: space-between;">
								<h4 style="font-family: 'NanumSquareRound'; text-align: left; line-height: 100%; display: inline-block; flex: 3;">자유게시판</h4>
								<a href="communityfreepage.do">
									<h6 style="text-align: right; display: inline-block; line-height: 24px; flex: 1;">+더보기</h6>
								</a>
							</div>
						</div>
						<hr style="border: 3px solid salmon; margin: 0;">
						<div class="card-body" style="padding: 20px;">
							<c:forEach items="${blist}" var="b">
								<a href="communityfreedetailpage.do?boardId=${b.boardId}">
									<div class="mb-2" style="display: flex; justify-content: space-between;">
										<span style="text-align: left; flex: 1;">${b.boardTitle}</span>
										<span style="text-align: right; flex: 1;">${b.boardEnterDate}</span>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>




				<!-- Footer Section Begin -->
				<footer style="padding-top: 70px; background-color: #3188DB;">
					<div class="container">
						<div class="row">
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="footer__about">
									<div class="footer__logo">
										<a href="#"><img src="client/img/product/student.png" style="width: 100px;" alt=""></a>
									</div>
									<h6 class="font-weight-bold" style="color: white;">&#129293;방문해주셔서 감사합니다!!&#129293;</h6>
								</div>
							</div>
							<div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
								<div class="footer__widget">
									<h6>약과 4조</h6>
									<ul>
										<li>송민주</li>
										<li>안우열</li>
										<li>양진우</li>
										<li>전유진</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-2 col-md-3 col-sm-6">
								<div class="footer__widget">
									<h6>Shopping</h6>
									<ul>
										<li><a href="#">Contact Us</a></li>
										<li><a href="#">Payment Methods</a></li>
										<li><a href="#">Delivary</a></li>
										<li><a href="#">Return & Exchanges</a></li>
									</ul>
								</div>
							</div>
							<div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
								<div class="footer__widget">
									<h6>NewLetter</h6>
									<div class="footer__newslatter">
										<p>Be the first to know about new arrivals, look books, sales
											& promos!</p>
										<form action="#">
											<input type="text" placeholder="Your email">
											<button type="submit">
												<span class="icon_mail_alt"></span>
											</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 text-center">
								<div class="footer__copyright__text">
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									<p>
										Copyright ©
										<script>
											document.write(new Date().getFullYear());
										</script>
										2020 All rights reserved | This template is made with <i class="fa fa-heart-o"
											aria-hidden="true"></i>
										by <a href="https://colorlib.com" target="_blank">Colorlib</a>
									</p>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								</div>
							</div>
						</div>
					</div>
				</footer>
				<!-- Footer Section End -->


				<script>
					let loginMsg = `${loginmsg}`;
					if (loginMsg != "") {
						alert(loginMsg)
						loginMsg = "";
					}


					let logoutMsg = `${altmsg}`;
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
				var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
				(function(){
				var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
				s1.async=true;
				s1.src='https://embed.tawk.to/63bd6d55c2f1ac1e202cb159/1gmdv669s';
				s1.charset='UTF-8';
				s1.setAttribute('crossorigin','*');
				s0.parentNode.insertBefore(s1,s0);
				})();
				</script>
				<!--End of Tawk.to Script-->

				<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
				<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
				integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous">
			</script>
				<script>
					Kakao.init('9c1eb3ec967ca14a10ddab8621bdddef');

					
					function logout() {
						const isKakaoUser = <%= session.getAttribute("isKakaoUser") %>;
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
							// Kakao.Auth.logout()
							// .then(function(response) {
							// 	console.log(Kakao.Auth.getAccessToken()); // null
							// })
							// .catch(function(error) {
							// 	console.log('Not logged in.');
							// });
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