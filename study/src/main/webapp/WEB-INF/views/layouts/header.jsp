<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    </head>

    <body>
      <header class="header">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-3">
              <div class="header__logo">
                <a href="home.do"><img src="client/img/logo.png" style="width: 150px;" alt=""></a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6">
              <nav class="header__menu mobile-menu">
                <ul>
                  <li><a href="home.do">&#127968;Home</a></li>
                  <li name="course"><a href="courselist.do">&#128187;Course</a>
                    <ul class="dropdown">
                      <li><a href="courselist.do?mainCate=it">IT</a></li>
                      <li><a href="courselist.do?mainCate=english">English</a></li>
                      <li><a href="courselist.do?mainCate=career">Career</a></li>
                    </ul>
                  </li>
                  <li name="package"><a href="packagelist.do">&#127873;Package</a>
                    <!-- <ul class="dropdown">
											<li><a href="./about.html">초급</a></li>
											<li><a href="./shop-details.html">중급</a></li>
											<li><a href="./shopping-cart.html">고급</a></li>
										</ul> -->
                  </li>
                  <li name="community"><a href="communityqnapage.do">&#128106;Community</a>
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
                <c:if test="${menu eq 'package'}">
                  <h4>Package</h4>
                </c:if>
                <c:if test="${menu eq 'mypage'}">
                  <h4>Mypage</h4>
                </c:if>
                <c:if test="${menu eq 'community'}">
                  <h4>Community</h4>
                </c:if>
                <div class="breadcrumb__links">
                  <a href="home.do">Home</a>
                  <c:if test="${menu eq 'course' && cid eq null && detail eq null}">
                    <span>Course</span>
                    <span class="subCate">전체보기</span>
                  </c:if>
                  <c:if test="${menu eq 'course' && cid eq null && detail eq 'detail' }">
                    <span>Course</span>
                    <span class="subCate">강의 상세보기</span>
                  </c:if>
                  <c:if test="${menu eq 'course' && cid eq 'it'}">
                    <span>Course</span>
                    <span class="mainCate">IT</span>
                  </c:if>
                  <c:if test="${menu eq 'course' && cid eq 'english'}">
                    <span>Course</span>
                    <span class="mainCate">English</span>
                  </c:if>
                  <c:if test="${menu eq 'package' && detail eq null}">
                    <span>Package</span>
                    <span class="subCate">전체보기</span>
                  </c:if>
                  <c:if test="${menu eq 'package' && detail eq 'detail'}">
                    <span>Package</span>
                    <span class="subCate">패키지 상세보기</span>
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

      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
      <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
        integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous">
        </script>
      <script>
        console.log($(`li[name=${menu}]`));
        $(`li[name=${menu}]`).attr("class","active");
        


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