<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="client/css/course.css">
</head>
<body>
    <!-- Breadcrumb Section Begin -->

    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <div class="shop__product__option">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="shop__product__option__left">
                    <p class="course-count">조회건수 : ${tcnt }</p>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="shop__product__option__right">
                    <select>
                        <option value="">10개씩 보기</option>
                        <option value="">15개씩 보기</option>
                        <option value="">20개씩 보기</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    
  	<!-- Ajax용 태그 start -->
    <div class="row course-row course-list">
    	<div class="col-lg-4 col-md-6 col-sm-6 course-col" style="display:none;">
            <div class="product__item course-item">
                <div class="product__item__pic set-bg course-item-pic"
                    data-setbg>
                    <img alt="강의이미지" src="" class="course-thum">
                    <ul class="product__hover">
                        <li><a href="#"><img src="client/img/icon/cart.png" alt=""></a></li>
                        <li><a href="#"><img src="client/img/icon/heart.png" alt=""></a></li>
                    </ul>
                </div>
                <div class="product__item__text">
                    <h6 class="course-name">${c.courseName }</h6>
                    <!-- <a href="#" class="add-cart">장바구니 담기</a> -->
                    <div class="rating">
                        <i class="fa fa-star-o"></i>
                        <i class="fa fa-star-o"></i>
                        <i class="fa fa-star-o"></i>
                        <i class="fa fa-star-o"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <c:choose>
                        <c:when test="${c.coursePrice <= 0}">
                            <h5 style="color:red; class="course-price">무료</h5>
                        </c:when>
                        <c:otherwise>
                            <h5 class="course-price">
                                <fmt:formatNumber value="${c.coursePrice }" pattern="#,###" />원
                            </h5>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    <!-- Ajax용 태그 end -->
    
    <div class="row course-row all-list">
        <c:forEach items="${courses}" var="c">
            <div class="col-lg-4 col-md-6 col-sm-6 course-col">
                <div class="product__item course-item">
                    <div class="product__item__pic set-bg course-item-pic"
                        data-setbg="client/img/product/${c.courseImg }">
                        <ul class="product__hover">
                            <li><a href="#"><img src="client/img/icon/cart.png" alt=""></a></li>
                            <li><a href="#"><img src="client/img/icon/heart.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>${c.courseName }</h6>
                        <!-- <a href="#" class="add-cart">장바구니 담기</a> -->
                        <div class="rating">
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <c:choose>
                            <c:when test="${c.coursePrice <= 0}">
                                <h5 style="color:red;" class="course-price">무료</h5>
                            </c:when>
                            <c:otherwise>
                                <h5 class="course-price">
                                    <fmt:formatNumber value="${c.coursePrice }" pattern="#,###" />원
                                </h5>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="product__pagination">
                <a class="active" href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <span>...</span>
                <a href="#">21</a>
            </div>
        </div>
    </div>
    <!-- Shop Section End -->
    
    <!-- 제이쿼리 사용 -->
    <script type="text/javascript">
        function selectList(target) {
            let subCate = $(target).attr('data-c');
            console.log(target);
            $.ajax({
                url: 'ajaxCourseList.do',
                method: 'post',
                data: { subCate: subCate },
                success: function (result) {
                    console.log(result);
                    insertTag(result);
                },
                error: function (result) {
                    console.log("오류났어요");
                }
            })
        }

        function insertTag(result) {
        	$('.all-list').remove(); // 초기 태그 삭제
        	$('.result').remove(); // ajax 통신으로 추가한 태그 삭제
        	$('.subCate').remove(); // 헤더쪽 메뉴경로 태그 삭제
        	
        	/* 메인카테고리, 서브카테고리 가져오기 start */
        	let mainCate = result[0].courseMainCategory;
        	let subCate = result[0].courseSubCategory;
        	mainCate = mainCate.toUpperCase();
        	subCate = subCate.toUpperCase();
        	
            $('.breadcrumb__links').append('<span class="subCate">'+ subCate + '</span>');
         	/* 메인카테고리, 서브카테고리 가져오기 end-- */
            
         	
            for (let i = 0; i < result.length; i++) {
                let clone = $('.course-col:eq(0)').clone(); // 태그 create
                
                /* 강의 금액 처리하기 start */
                let coursePrice = result[i].coursePrice;
                let priceText = '무료';
                if(coursePrice > 0) {
                	// 0보다 크면 '가격' 표시 (ex. 33,000원)
                	priceText = coursePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                }
                /* 강의 금액 처리하기 end-- */
                
                
                /* 생성된 태그에 값 셋팅 start */
                $('.course-count').text('조회건수 : ' + result.length);
                clone.addClass('result');
                clone.css('display', 'block');
                clone.find('.course-item-pic').attr('data-setbg','client/img/product/' + result[i].courseImg);
                clone.find('.course-thum').attr('src', 'client/img/product/' + result[i].courseImg);
                clone.find('.course-name').text(result[i].courseName);
                clone.find('.course-price').text(priceText);
                if(priceText == '무료') {
                	clone.find('.course-price').css('color', 'red');
                }
                /* 생성된 태그에 값 셋팅 end-- */
                
                
                $('.course-row').append(clone); // 태그 append
                
            }
        }

    </script>
</body>

</html>