<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>STUDY | MyCourse</title>
      <style type="text/css">
        .mypage__title {
          margin-bottom: 27px;
          font-weight: 900;
        }

        .toptop__bar__hr {
          margin-top: 0 !important;
        }

        .top__bar__hr {
          margin-top: 8px !important;
        }

        .mycourse__sort__type>li {
          margin-left: 2%;
          margin-right: 2%;
          padding-bottom: 6px;
          color: #B7B7B7;
          font-weight: 900;
          float: left;
          list-style: none;
        }

        .mycourse__sort__type>li:hover {
          color: #333;
          cursor: pointer;
          border-bottom: 2px solid #3188DB;
        }

        .mycourse__sort__type>.type__active {
          color: #333;
          border-bottom: 2px solid #3188DB;
        }

        .product__item {
          box-shadow: 1px 2px 3px 0px #ddd;
          border-radius: 5px !important;
        }
      </style>
      <link rel="stylesheet" href="client/css/course.css">
      <script src="client/js/jquery-3.3.1.min.js"></script>
      <script src="client/js/jquery.nice-select.min.js"></script>
    </head>

    <body>
      <div class="container">
        <div class="row col-lg-12">
          <img src="client/img/icon/mycourse.png" alt="아이콘" style="width: 30px; height: 30px;">
          <h4 class="mypage__title">&nbsp;&nbsp;수강 강좌</h4>
        </div>
        <hr class="toptop__bar__hr">

        <!--My Course Top Bar Start-->
        <div class="mypage__mycourse__head">
          <!--Sort Bar Start-->
          <div class="row" style="margin-top: 0.5%;">
            <div class="col-lg-12">
              <ul class="mycourse__sort__type">
                <li class="type__active" id="mostRecent">최신순</li>
                <li id="mostOld">오래된순</li>
              </ul>
            </div>
          </div>
          <hr class="toptop__bar__hr">
          <!--Sort Bar End-->
        </div>
        <!--My Course Top Bar End-->

        <br>

        <!--My Course List Start-->
        <div class="row mypage__mycourse__body">
          <!--loadCourses()-->
        </div>
        <!--My Course List End-->

        <!--Page Bar Start-->
        <div class="row">
          <div class="col-lg-12">
            <div class="product__pagination">
              <!-- <a class="active" href="#">1</a> -->
            </div>
          </div>
        </div>
        <!--Page Bar End-->

      </div>
      <script>
        // 변수
        let loginMemberId = '<%=(String)session.getAttribute("loginId")%>';
        console.log(loginMemberId);

        let totalCount; // 강의 개수

        let sortType = 'mostRecent'

        let currentPage = 1; // 현재 페이지
        let totalPage; // 전체 페이지 수

        setSortBtn();
        loadCourses();

        function setSortBtn() {
          $('ul.mycourse__sort__type>li').on('click', function () {
            console.log('log')
            sortType = $(this).attr('id');

            let lis = $(this).parent().children();
            lis.each(function (idx, li) {
              if ($(li).attr('id') == sortType) {
                $(li).attr('class', 'type__active');
              } else {
                $(li).attr('class', 'type__non__active');
              }
            });
            currentPage = 1;
            loadCourses();
          });
        }

        // 내 강의 바디 부분을 불러오는 함수
        function loadCourses() {
          $.ajax({
            url: 'membercoursewithpaging.do',
            method: 'post',
            data: {
              memberId: loginMemberId,
              sortType: sortType,
              page: currentPage
            },
            success: function (coursesJson) {
              showCourses(coursesJson);
              showPageList();
            },
            error: function (err) {
              console.log(err);
            }
          });
        }

        // 내 강의 출력하는 함수
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
                      )
                      .append(
                        $(`<div class="product__item__text"> /`)
                          .append($(`<h6 class="mycourse__course__title">\${course.courseName}</h6>`))
                      )
                  )
              )
          });
        }

        // 페이지 바 생성 함수
        function showPageList() {
          $.ajax({
            url: 'membercoursecount.do',
            method: 'post',
            data: {
              memberId: loginMemberId,
              page: currentPage
            },
            success: function (countJson) {
              totalCount = countJson.totalCount;
              let totalPage = Math.ceil(totalCount / 9);

              let endPage = totalPage < Math.ceil(currentPage / 10) * 10 ? totalPage : Math.ceil(currentPage / 10) * 10;
              let startPage = Math.floor(currentPage / 10) * 10 + 1;

              let prev = startPage > 1;
              let next = endPage < totalPage;

              console.log(totalCount);
              console.log(endPage);
              console.log(startPage);
              console.log(currentPage);
              console.log(prev);
              console.log(next);

              $('.product__pagination').empty();
              if (prev) {
                makePageAtag("&laquo", startPage - 1);
              }
              for (let i = startPage; i <= endPage; i++) {
                makePageAtag(i, i);
              }
              if (next) {
                makePageAtag("&raquo", endPage + 1);
              }
            },
            error: function (err) {
              console.log(err);
            }
          });
        }

        // 페이지 a태그 생성 함수
        function makePageAtag(inner, page) {
          let atag = $('<a />');
          atag.removeAttr('href');
          if (page == currentPage) {
            atag.attr('class', 'active')
          }
          atag.attr('style', 'cursor: pointer;');
          atag.html(inner);
          atag.on('click', function () {
            currentPage = page;
            loadCourses();
          });
          $('.product__pagination').append(atag);
        }

      </script>
      <script>
				let lgck = `${loginId}`;
				if (lgck = null) {
                alert("로그인을 해주세요")
                location.href = "home.do"
            }
			</script>
    </body>

    </html>