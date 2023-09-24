<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
        </head>



        <body>
            <!-- Header Section Begin -->
            <header class="header">
                <div class="header__top">
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
                                            <a href="login.do">Sign in</a>
                                        </c:if>
                                        <a href="#">FAQs</a>
                                    </div>
                                    <c:if test="${not empty loginId}">
                                        <div class="header__top__hover">
                                            <span>${loginName} 님 접속중<i class="arrow_carrot-down"></i></span>
                                            <ul>
                                                <li><a href="logout.do">LOGOUT</a></li>
                                                
                                                <li><a href="mypagemain.do">MY PAGE</a></li>
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
                                <a href="home.do"><img src="client/img/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <nav class="header__menu mobile-menu">
                                <ul>
                                    <li><a href="home.do">Home</a></li>
                                    <li class="<c:if test=" ${menu eq 'course' }">active</c:if>"><a
                                            href="courseList.do">Course</a>
                                        <ul class="dropdown">
                                            <li><a href="courseList.do?cid=it">IT</a></li>
                                            <li><a href="courseList.do?cid=english">English</a></li>
                                        </ul>
                                    </li>
                                    <li class="<c:if test=" ${menu eq 'package' }">active</c:if>"><a href="">Package</a>
                                        <ul class="dropdown">
                                            <li><a href="./about.html">초급</a></li>
                                            <li><a href="./shop-details.html">중급</a></li>
                                            <li><a href="./shopping-cart.html">고급</a></li>
                                        </ul>
                                    </li>
                                    <li class="<c:if test=" ${menu eq 'community' }">active</c:if>"><a
                                            href="communitymainpage.do">Community</a>
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
                                <a href="#" class="search-switch"><img src="client/img/icon/search.png" alt=""></a>
                                <a href="#"><img src="client/img/icon/heart.png" alt=""></a>
                                <a href="#"><img src="client/img/icon/cart.png" alt=""> <span>0</span></a>
                                <div class="price">$0.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="canvas__open"><i class="fa fa-bars"></i></div>
                </div>
            </header>
            <!-- Header Section End -->

            <section class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__text">
                                <h4>Course</h4>
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
                                    </c:if> <c:if test="${menu eq 'mypage'}">
                                        <span>My Page</span>
                                        <span class="subCate">전체보기</span>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


        </body>

        </html>