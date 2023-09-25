<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <style type="text/css">

      </style>
      <link rel="stylesheet" href="client/css/course.css">
      <script src="client/js/jquery-3.3.1.min.js"></script>
      <script src="client/js/jquery.nice-select.min.js"></script>
    </head>

    <body>
      <div class="container">
        <h5 class="col-lg-12" style="margin-bottom: 2%; font-weight: 900;">수강 강좌</h5>
        <div class="mypage__mycourse__body">
          <div class="col-lg-4 col-md-6 col-sm-6 course-col">
            <div class="product__item course-item" onclick="location.href='coursedetail.do?courseId='">
              <div class="product__item__pic set-bg course-item-pic" data-setbg="client/img/product/basic.png">
                <ul class="product__hover">
                  <li><a href="#"><img src="client/img/icon/cart.png" alt=""></a></li>
                  <li><a href="#"><img src="client/img/icon/heart.png" alt=""></a></li>
                </ul>
              </div>
              <div class="product__item__text">
                <h6>강의이름</h6>
                <div class="rating">
                  <i class="fa fa-star-o"></i>
                  <i class="fa fa-star-o"></i>
                  <i class="fa fa-star-o"></i>
                  <i class="fa fa-star-o"></i>
                  <i class="fa fa-star-o"></i>
                </div>
                <h5 class="course-price">
                  <fmt:formatNumber value="10000" pattern="#,###" />원
                </h5>
              </div>
            </div>
          </div>
        </div>
      </div>
      <script>
        // 변수
        let loginMemberId = '<%=(String)session.getAttribute("loginId")%>';
        console.log(loginMemberId);

        let totalCount; // 강의 개수

        let currentPage = 1; // 현재 페이지
        let totalPage; // 전체 페이지 수

        loadCourses();

        // 내 강의 바디 부분을 불러오는 함수
        function loadCourses() {
          $.ajax({
            url: 'membercoursewithpaging.do',
            method: 'post',
            data: {
              memberId: loginMemberId,
              page: currentPage
            },
            success: function (coursesJson) {
              showCourses(coursesJson);
              // showPageList();
            },
            error: function (err) {
              console.log(err);
            }
          });
        }

        function showCourses(coursesJson) {
          $('.mypage__mycourse__body').empty();
          coursesJson.forEach(course => {
            $('.mypage__mycourse__body')
              .append(
                $(`<div class="col-lg-4 col-md-6 col-sm-6 course-col"> /`)
                  .append(
                    $(`<div class="product__item course-item" onclick="location.href='coursedetail.do?courseId=\${course.courseId}'"> /`)
                      .append(
                        $(`
                        <div class="product__item__pic set-bg course-item-pic" data-setbg="client/img/product/` +
                        (course.courseImg != null ? `\${course.courseImg}` : 'basic.png') + `" ` + 
                        `style="background-image: url(&quot;client/img/product/` + 
                        (course.courseImg != null ? `\${course.courseImg}` : 'basic.png') +
                        `&quot;);">`)
                          .append($(`
                            <ul class="product__hover">
                              <li><a href="#"><img src="client/img/icon/cart.png" alt=""></a></li>
                              <li><a href="#"><img src="client/img/icon/heart.png" alt=""></a></li>
                            </ul>
                          `))
                      )
                      .append(
                        $(`<div class="product__item__text"> /`)
                          .append($(`<h6>\${course.courseName}</h6>`))
                          .append($(`
                            <div class="rating">
                              <i class="fa fa-star-o"></i>
                              <i class="fa fa-star-o"></i>
                              <i class="fa fa-star-o"></i>
                              <i class="fa fa-star-o"></i>
                              <i class="fa fa-star-o"></i>
                            </div>
                          `))
                          .append(
                            $(`<h5 class="course-price"> /`)
                              .append(
                                course.coursePrice <= 0 ? 
                                $(`<h5 style="color:red;" class="course-price">무료</h5>`) :
                                $(`<h5 class="course-price">\${course.coursePrice}원</h5>`)
                              )
                          )
                      )
                  )
              )
          });
        }


      </script>
    </body>

    </html>