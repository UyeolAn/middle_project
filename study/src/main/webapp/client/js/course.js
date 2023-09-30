/**
 * 강의 페이지 관련
 */


// 사이드메뉴 강의 조회 Ajax
function courseList(type, value, nowPage, target) {
	$('.sub_menu').css('color','#4e4e4e');
	$('.sub_menu_g').removeClass('active');
	$('option[value="12"]').remove();
	$('option[value="15"]').remove();
	$('.result_no').css('display', 'none');
	
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

// 강의 리스트 태그 생성관련 함수
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
        clone.find('.course-item-pic').css('overflow', 'hidden');
        clone.find('.course-item').attr('onclick', 'courseDetail(' + data[i].courseId + ')');
        
        if(data[i].courseImg == null) {
			clone.find('.product__item__pic').attr('data-setbg', 'client/img/product/basic.png');
        	clone.find('.product__item__pic').css('background-image', 'url(client/img/product/basic.png)' );
		} else {
        	clone.find('.product__item__pic').attr('data-setbg', 'client/img/product/' + data[i].courseImg );
        	clone.find('.product__item__pic').css('background-image', 'url(client/img/product/' + data[i].courseImg + ')' );
		}
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

// 페이징 태그 관련 함수
function appendPaging(result) {
	let data = result[0].paging;
    
	$('.all-list-paging').remove(); // 초기 태그 삭제
	$('.p-result').remove(); // ajax 통신으로 추가된 태그 삭제
    
	$('.paging-row').append(data); // 태그 append
}

//메뉴경로설정(서브카테고리) 함수
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

//메뉴경로설정(grade) 함수
function categoryUpdate(data) {
	$('.mainCate').remove(); // 헤더쪽 메뉴경로 태그 삭제
	$('.subCate').remove(); // 헤더쪽 메뉴경로 태그 삭제
	
	let grade = data[0].courseGrade;
	
	if(grade == 'easy') {
		grade = '입문';
	} else if(grade == 'normal') {
		grade = '초급';
	} else if(grade == 'hard') {
		grade = '중급이상';
	}
	
	$('.breadcrumb__links').append('<span class="mainCate">난이도</span>');
    $('.breadcrumb__links').append('<span class="subCate">'+ grade + '</span>');
}

// 강의상세조회 form 전송
function courseDetail(id) {
	let form = document.getElementById("courseform");
	form.courseId.value = id;
	form.submit();
}