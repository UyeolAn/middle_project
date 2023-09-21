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
    <script type="text/javascript">
	    /* 페이징 갯수 옵션 변경시 작동 */
	    function selChange() {
			let sel = $('#cntPerPage').val();
			location.href="courseList.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	    }
		
		/* 강의 상세조회 Ajax */
		function courseDetail(id) {
			console.log("here!! detail!")
			let form = document.getElementById("courseform");
			form.courseId.value = id;
			form.submit();
		}
    </script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->

    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <div class="shop__product__option">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="shop__product__option__left">
                    <%-- <p class="course-count">조회건수 : ${tcnt }</p> --%>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="shop__product__option__right">
                	<!-- 페이징 옵션 start -->
                    <select id="cntPerPage" name="sel" onchange="selChange()">
                        <option value="10" <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개씩 보기</option>
                        <option value="15" <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15개씩 보기</option>
                        <option value="20" <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개씩 보기</option>
                    </select>
                    <!-- 페이징 옵션 end -->
                </div>
            </div>
        </div>
    </div>
    
    <!-- 강의 리스트 start -->
    <div class="row course-row all-list">
        <c:forEach items="${courses}" var="c">
            <div class="col-lg-4 col-md-6 col-sm-6 course-col">
                <div class="product__item course-item" onclick="courseDetail(${c.courseId})">
                    <div class="product__item__pic set-bg course-item-pic"
                        data-setbg="client/img/product/${c.courseImg }">
                        <ul class="product__hover">
                            <li><a href="#"><img src="client/img/icon/cart.png" alt=""></a></li>
                            <li><a href="#"><img src="client/img/icon/heart.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>${c.courseName }</h6>
                        <div class="rating">
								<c:if test="${c.courseStars > 0 }">
									<c:forEach var="i" begin="1" end="${c.courseStars}">
		                            	<i class="fa fa-star"></i>
									</c:forEach>
									<c:forEach var="i" begin="1" end="${5 - c.courseStars}">
		                            	<i class="fa fa-star-o"></i>
									</c:forEach>
								</c:if>
								<c:if test="${c.courseStars == 0 }">
		                        	<i class="fa fa-star-o"></i>
		                            <i class="fa fa-star-o"></i>
		                            <i class="fa fa-star-o"></i>
		                            <i class="fa fa-star-o"></i>
		                            <i class="fa fa-star-o"></i>
								</c:if>
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
    <!-- 강의 리스트 end -->
    
    <!-- 페이징 영역 start -->
    <div class="row paging-row all-list-paging">
        <div class="col-lg-12 col-paging">
            <div class="product__pagination">
            	<c:if test="${paging.startPage != 1 }">
	                <a class="active beforeBtn" href="courseList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
            	</c:if>
            	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
            		<c:choose>
            			<c:when test="${p == paging.nowPage }"><a class="active">${p }</a></c:when>
            			<c:when test="${p != paging.nowPage }"><a href="courseList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></c:when>
            		</c:choose>
            	</c:forEach>
            	<c:if test="${paging.endPage != paging.lastPage }">
            		<a class="active afterBtn" href="courseList.do?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
            	</c:if>
            </div>
        </div>
    </div>
    <!-- 페이징 영역 end -->
    
    <!-- Ajax용 강의 리스트 start -->
    <div class="row course-row ajax-course-list">
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
                    <div class="rating">
                    	<!-- 별점태그 -->
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
    </div>
    <!-- Ajax용 강의 리스트 end -->
    
    <!-- Ajax용 페이징 영역 start -->
    <div class="row paging-row ajax-paging"></div>
    <!-- Ajax용 페이징 영역 end -->
    
    
    <!-- 강의 상세조회 폼 start -->
    <form id="courseform" action="coursedetail.do" method="post">
		<input type="hidden" id="courseId" name="courseId">
	</form>
    <!-- 강의 상세조회 폼 end -->
    
    <!-- Shop Section End -->
    
    
    <!-- 제이쿼리 사용 -->
    <script type="text/javascript">
    
    	/* 사이드메뉴 강의 조회 Ajax */
    	function courseList(type, value, nowPage, target) {
    		$('.sub_menu').css('color','#b7b7b7');
    		$('.sub_menu_g').removeClass('active');
    		
    		let sel = $('#cntPerPage').val();
    		let subCateVal = '';
    		let gradeVal = '';
    		
    		if(type == 'subCate'){
    			subCateVal = value;
    			$(target).children().css('color','#e53637');
    		} else if(type == 'grade') {
    			gradeVal = value;
    			$(target).addClass('active');
    		}
    		
    		$.ajax({
    			url: 'ajaxCourseList.do',
                method: 'post',
                data: { subCate: subCateVal, grade: gradeVal, nowPage: nowPage, cntPerPage: sel },
                success: function (result) {
                    appendCourseList(result); // [func] 강의 리스트 태그 생성
                    appendPaging(result); // [func] 페이징 태그 생성
                }
    		})
    	}

        function appendCourseList(result) {
        	$('.all-list').remove(); // 초기 태그 삭제
        	$('.result').remove(); // ajax 통신으로 추가된 태그 삭제
        	
        	let data = result[1];
        	console.log(data);
        	categoryUpdate(data); // [func] 메인카테고리, 서브카테고리 가져오기
         	
            for (let i = 0; i < data.length; i++) {
                let clone = $('.course-col:eq(0)').clone(); // 태그 create
                
             	// 강의 금액 처리하기 start
                let coursePrice = data[i].coursePrice;
                let priceText = '무료';
                if(coursePrice > 0) {
                	// 0보다 크면 '가격' 표시 (ex. 33,000원)
                	priceText = coursePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                }
                // 강의 금액 처리하기 end
                
                // 생성된 태그에 값 셋팅 start
                $('.course-count').text('조회건수 : ' + data.length);
                clone.addClass('result');
                clone.css('display', 'block');
                clone.find('.course-item').attr('onclick', 'courseDetail(' + data[i].courseId + ')');
                clone.find('.course-item-pic').attr('data-setbg','client/img/product/' + data[i].courseImg);
                clone.find('.course-thum').attr('src', 'client/img/product/' + data[i].courseImg);
                clone.find('.course-name').text(data[i].courseName);
                if(data[i].courseStars > 0){
                	let endNum = data[i].courseStars;
                	console.log(data[i].courseStars);
	                for(let i=1; i<=endNum; i++){
		                clone.find('.rating').append('<i class="fa fa-star" style="margin-right: -1px;"></i>');
	                }
	                for(let i=1; i<=(5-endNum); i++) {
	                	clone.find('.rating').append('<i class="fa fa-star-o" style="margin-right: -1px;"></i>');
	                }
                } else {
                	for(let i=1; i<=5; i++){
                		clone.find('.rating').append('<i class="fa fa-star-o" style="margin-right: -1px;"></i>');
                	}
                }
                
                clone.find('.course-price').text(priceText);
                if(priceText == '무료') {
                	clone.find('.course-price').css('color', 'red');
                }
                // 생성된 태그에 값 셋팅 end
                
                $('.course-row').append(clone); // 태그 append
            }
        }
        
        function appendPaging(result) {
        	let data = result[0].paging;
            
        	$('.all-list-paging').remove(); // 초기 태그 삭제
        	$('.p-result').remove(); // ajax 통신으로 추가된 태그 삭제
            
    		$('.paging-row').append(data); // 태그 append
        }
        
        function categoryUpdate(data) {
        	$('.mainCate').remove(); // 헤더쪽 메뉴경로 태그 삭제
        	$('.subCate').remove(); // 헤더쪽 메뉴경로 태그 삭제
        	
        	let mainCate = data[0].courseMainCategory;
        	let subCate = data[0].courseSubCategory;
        	subCate = subCate.toUpperCase();
        	if(mainCate == 'it') {
        		mainCate = mainCate.toUpperCase();
        	} else {
        		mainCate = mainCate.substring(0, 1).toUpperCase() + mainCate.substring(1);
        		console.log(mainCate);
        	}
        	
        	$('.breadcrumb__links').append('<span class="mainCate">'+ mainCate + '</span>');
            $('.breadcrumb__links').append('<span class="subCate">'+ subCate + '</span>');
        }

    </script>
</body>

</html>