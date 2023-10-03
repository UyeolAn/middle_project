<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    </head>
    <style>
      .header__top__hover a {
        color: black;
      }

      .header__top__hover li:hover {
        color: black;
      }
    </style>

    <body>
      <header class="header">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-3">
							<div class="header__logo">
								<a href="home.do"><img src="client/img/product/student.png" style="width: 50px;"
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
												<li><a href="logout.do">LOGOUT</a></li>
												<li><a href="mypageprofile.do">MY PAGE</a></li>
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

      <section class="breadcrumb-option">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="breadcrumb__text">
                <c:if test="${menu eq 'course'}">
                  <h4>Course</h4>
                </c:if>
                <c:if test="${menu eq 'mypage'}">
                  <h4>Mypage</h4>
                </c:if>
                <c:if test="${menu eq 'community'}">
                  <h4>Community</h4>
                </c:if>
                <div class="breadcrumb__links">
                  <a href="home.do">Home</a>
                  <c:if test="${menu eq 'course' && cid eq null}">
                    <span>Course</span>
                    <span class="subCate">전체보기</span>
                  </c:if>
                  <c:if test="${menu eq 'course' && cid eq 'it'}">
                    <span>Course</span>
                    <span class="mainCate">IT</span>
                  </c:if>
                  <c:if test="${menu eq 'course' && cid eq 'english'}">
                    <span>Course</span>
                    <span class="mainCate">English</span>
                  </c:if>
                  <c:if test="${menu eq 'package'}">
                    <span>Package</span>
                    <span class="subCate">전체보기</span>
                  </c:if>
                  <c:if test="${menu eq 'mypage' && mid eq null}">
                    <span>My Page</span>
                    <span class="subCate">내 정보</span>
                  </c:if>
                  <c:if test="${menu eq 'mypage' && mid eq 'mycomm'}">
                    <span>My Page</span>
                    <span class="subCate">나의 커뮤니티</span>
                  </c:if>
                  <c:if test="${menu eq 'mypage' && mid eq 'payment'}">
                    <span>My Page</span>
                    <span class="subCate">구매내역</span>
                  </c:if>
                  <c:if test="${menu eq 'mypage' && mid eq 'mycourse'}">
                    <span>My Page</span>
                    <span class="subCate">수강 강좌</span>
                  </c:if>
                  <c:if test="${menu eq 'mypage' && mid eq 'bucket'}">
                    <span>My Page</span>
                    <span class="subCate">장바구니</span>
                  </c:if>
                  <c:if test="${menu eq 'community' && cid eq 'question'}">
                    <span>Community</span>
                    <span class="mainCate">질문게시판</span>
                  </c:if>
                  <c:if test="${menu eq 'community' && cid eq 'free'}">
                    <span>Community</span>
                    <span class="mainCate">자유게시판</span>
                  </c:if>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>


    </body>

    </html>