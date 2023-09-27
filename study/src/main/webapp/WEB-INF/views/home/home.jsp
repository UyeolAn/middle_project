<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
												<li><a href="logout.do">LOGOUT</a></li>
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
								<a href="./index.html"><img src="client/img/product/student.png" style="width: 50px;" alt=""></a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<nav class="header__menu mobile-menu">
								<ul>
									<li class="active"><a href="home.do">Home</a></li>
									<li><a href="courselist.do">Course</a>
										<ul class="dropdown">
											<li><a href="courselist.do?mainCate=it">IT</a></li>
											<li><a href="courselist.do?mainCate=english">English</a></li>
										</ul>
									</li>
									<li><a href="packagelist.do">Package</a>
										<!-- <ul class="dropdown">
											<li><a href="./about.html">초급</a></li>
											<li><a href="./shop-details.html">중급</a></li>
											<li><a href="./shopping-cart.html">고급</a></li>
										</ul> -->
									</li>
									<li><a href="communityqnapage.do">Community</a>
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
			<div class="hero__slider owl-carousel" style="height: 500px;">
				<div class="hero__items set-bg" style="padding: 30px;" >
					<div class="container">
						<div class="row">
							<div class="col-lg-7">
								<div class="hero__text">
									<h6>SALE COURSE</h6>
									<h2 style="font-family: 'NanumSquareRound';">현재 할인하는 패키지&#128176;</h2>
									<p>A specialist label creating luxury essentials. Ethically
										crafted with an unwavering commitment to exceptional quality.</p>
									<a href="#" class="primary-btn">수업 들으러가기<span class="arrow_right"></span></a>
								</div>
							</div>
							<div class="col-lg-5" style="padding: 30px;">
								<img src="client/img/banner/code.png" style="width:200px;">
							</div>
						</div>
					</div>
				</div>
				<div class="hero__items set-bg" data-setbg="client/img/home/banner2.jpg">
					<div class="container">
						<div class="row">
							<div class="col-xl-5 col-lg-7 col-md-8">
								<div class="hero__text">
									<h6>SALE COURSE</h6>
									<h2>약과 4조 짱</h2>
									<p>A specialist label creating luxury essentials. Ethically
										crafted with an unwavering commitment to exceptional quality.</p>
									<a href="#" class="primary-btn">수업 들으러가기<span class="arrow_right"></span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<section class="product spad">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<ul class="filter__controls">
								<li class="active" data-filter="*">Best Sellers</li>
								<li data-filter=".new-arrivals">New Arrivals</li>
								<li data-filter=".hot-sales">Hot Sales</li>
							</ul>
						</div>
					</div>
					<div class="row product__filter">
						<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
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
						<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
							<div class="product__item">
								<div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
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
										<label for="pc-4">
											<input type="radio" id="pc-4">
										</label>
										<label class="active black" for="pc-5">
											<input type="radio" id="pc-5">
										</label>
										<label class="grey" for="pc-6">
											<input type="radio" id="pc-6">
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
							<div class="product__item sale">
								<div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
									<span class="label">Sale</span>
									<ul class="product__hover">
										<li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
										<li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
										<li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>Multi-pocket Chest Bag</h6>
									<a href="#" class="add-cart">+ Add To Cart</a>
									<div class="rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o"></i>
									</div>
									<h5>$43.48</h5>
									<div class="product__color__select">
										<label for="pc-7">
											<input type="radio" id="pc-7">
										</label>
										<label class="active black" for="pc-8">
											<input type="radio" id="pc-8">
										</label>
										<label class="grey" for="pc-9">
											<input type="radio" id="pc-9">
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
							<div class="product__item">
								<div class="product__item__pic set-bg" data-setbg="img/product/product-4.jpg">
									<ul class="product__hover">
										<li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
										<li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
										<li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>Diagonal Textured Cap</h6>
									<a href="#" class="add-cart">+ Add To Cart</a>
									<div class="rating">
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
									</div>
									<h5>$60.9</h5>
									<div class="product__color__select">
										<label for="pc-10">
											<input type="radio" id="pc-10">
										</label>
										<label class="active black" for="pc-11">
											<input type="radio" id="pc-11">
										</label>
										<label class="grey" for="pc-12">
											<input type="radio" id="pc-12">
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
							<div class="product__item">
								<div class="product__item__pic set-bg" data-setbg="img/product/product-5.jpg">
									<ul class="product__hover">
										<li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
										<li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
										<li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>Lether Backpack</h6>
									<a href="#" class="add-cart">+ Add To Cart</a>
									<div class="rating">
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
									</div>
									<h5>$31.37</h5>
									<div class="product__color__select">
										<label for="pc-13">
											<input type="radio" id="pc-13">
										</label>
										<label class="active black" for="pc-14">
											<input type="radio" id="pc-14">
										</label>
										<label class="grey" for="pc-15">
											<input type="radio" id="pc-15">
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
							<div class="product__item sale">
								<div class="product__item__pic set-bg" data-setbg="img/product/product-6.jpg">
									<span class="label">Sale</span>
									<ul class="product__hover">
										<li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
										<li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
										<li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>Ankle Boots</h6>
									<a href="#" class="add-cart">+ Add To Cart</a>
									<div class="rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o"></i>
									</div>
									<h5>$98.49</h5>
									<div class="product__color__select">
										<label for="pc-16">
											<input type="radio" id="pc-16">
										</label>
										<label class="active black" for="pc-17">
											<input type="radio" id="pc-17">
										</label>
										<label class="grey" for="pc-18">
											<input type="radio" id="pc-18">
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
							<div class="product__item">
								<div class="product__item__pic set-bg" data-setbg="img/product/product-7.jpg">
									<ul class="product__hover">
										<li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
										<li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
										<li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>T-shirt Contrast Pocket</h6>
									<a href="#" class="add-cart">+ Add To Cart</a>
									<div class="rating">
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
									</div>
									<h5>$49.66</h5>
									<div class="product__color__select">
										<label for="pc-19">
											<input type="radio" id="pc-19">
										</label>
										<label class="active black" for="pc-20">
											<input type="radio" id="pc-20">
										</label>
										<label class="grey" for="pc-21">
											<input type="radio" id="pc-21">
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
							<div class="product__item">
								<div class="product__item__pic set-bg" data-setbg="img/product/product-8.jpg">
									<ul class="product__hover">
										<li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
										<li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
										<li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>Basic Flowing Scarf</h6>
									<a href="#" class="add-cart">+ Add To Cart</a>
									<div class="rating">
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
										<i class="fa fa-star-o"></i>
									</div>
									<h5>$26.28</h5>
									<div class="product__color__select">
										<label for="pc-22">
											<input type="radio" id="pc-22">
										</label>
										<label class="active black" for="pc-23">
											<input type="radio" id="pc-23">
										</label>
										<label class="grey" for="pc-24">
											<input type="radio" id="pc-24">
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Hero Section End -->


			<!-- Recommend Course Section Start-->
			<!-- <div class="col-lg-12 recommend__course__container">
				<h4 style="font-weight: 900;">추천 강의</h4>
				<br>
				<div class="col-lg-12 row">
					<div class="col-lg-2 col-md-4 col-sm-6 course-col">
						<div class="product__item course-item" onclick="">
							<div class="product__item__pic set-bg course-item-pic">
								<ul class="product__hover">
									<li><a href="#"><img src="client/img/icon/cart.png" alt=""></a></li>
									<li><a href="#"><img src="client/img/icon/heart.png" alt=""></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>강의 이름</h6>
								<div class="rating">
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
								</div>
								<h5 class="course-price">
									10,000 원
								</h5>
							</div>
						</div>
					</div>

				</div> -->
				<!-- Recommend Course Section End-->

				<!-- Footer Section Begin -->
				<footer class="footer">
					<div class="container">
						<div class="row">
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="footer__about">
									<div class="footer__logo">
										<a href="#"><img src="client/img/footer-logo.png" alt=""></a>
									</div>
									<p>The customer is at the heart of our unique business model,
										which includes design.</p>
									<a href="#"><img src="client/img/payment.png" alt=""></a>
								</div>
							</div>
							<div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
								<div class="footer__widget">
									<h6>Shopping</h6>
									<ul>
										<li><a href="#">Clothing Store</a></li>
										<li><a href="#">Trending Shoes</a></li>
										<li><a href="#">Accessories</a></li>
										<li><a href="#">Sale</a></li>
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

				<!-- Search Begin -->
				<div class="search-model">
					<div class="h-100 d-flex align-items-center justify-content-center">
						<div class="search-close-switch">+</div>
						<form class="search-model-form">
							<input type="text" id="search-input" placeholder="Search here.....">
						</form>
					</div>
				</div>
				<!-- Search End -->
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
		</body>

		</html>