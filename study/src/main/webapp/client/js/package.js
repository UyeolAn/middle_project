/**
 * 패키지 리스트 페이지
 */

//서브메뉴 클릭시
function packageList(category, grade, target) {
	$('.sub_menu').css('color','#b7b7b7');
	$('.sub_menu_g').removeClass('active');
	$(target).children().css('color','#e53637');
	
	$.ajax({
		url: 'ajaxpackagelist.do',
	    method: 'post',
	    data: {category: category, grade: grade},
	    success: function (result) {
	        console.log(result);
	        
	        appendCourseList(result); // [func] 강의 리스트 태그 생성
	    }
	})
	
}

function appendCourseList(result) {
	$('.all-list').remove(); // 초기 태그 삭제
	$('.result').remove(); // ajax 통신으로 추가된 태그 삭제
 	$('.result_no').css('display', 'none');
 	console.log(result.length);
 	
 	if(result.length == 0) {
		 $('.result_no').css('display', 'flex');
	 } else {
	    for (let i = 0; i < result.length; i++) {
	        let clone = $('.course-col:eq(0)').clone(); // 태그 create
	        
	     	// 강의 금액 처리하기 start
	        let coursePrice = result[i].salePrice;
	        let priceText = '무료';
	        if(coursePrice > 0) {
	        	// 0보다 크면 '가격' 표시 (ex. 33,000원)
	        	priceText = coursePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	        }
	        // 강의 금액 처리하기 end
	        
	        // 생성된 태그에 값 셋팅 start
	        clone.addClass('result');
	        clone.css('display', 'block');
	        clone.find('.course-item-pic').css('overflow', 'hidden');
	        clone.find('.course-item').attr('onclick', 'packageDetail(' + result[i].packageId + ')');
	        if(result[i].packageThumbnail == null) {
	        	clone.find('.course-item-pic').css('background-image', 'url(client/img/product/basic.png)');
			} else {
	        	clone.find('.course-item-pic').css('background-image', 'url(client/img/product/' + result[i].packageThumbnail + ')');
			}
	        clone.find('.course-name').text(result[i].packageTitle);
	        clone.find('.course-price').text(priceText);
	        if(priceText == '무료') {
	        	clone.find('.course-price').css('color', 'red');
	        }
	        // 생성된 태그에 값 셋팅 end
	        
	        $('.course-row').append(clone); // 태그 append
	    }
	 }
}