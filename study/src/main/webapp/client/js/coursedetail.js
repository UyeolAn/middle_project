/**
 * 강의 상세페이지 관련
 */

// 강의 미리보기 
$(document).ready(function() {
	let link = $('#free_iframe_area_1').attr('data_link');
	
	$('#free_iframe_area_1').append(
		'<iframe width="100%" height="328" src="'
		+ link + '" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
	);
});

// 사이드메뉴 강의 클릭시
function courseList(type, value, nowPage, target) {
	$('.sub_menu').css('color', '#b7b7b7');
	$('.sub_menu_g').removeClass('active');

	let form = document.getElementById("cform");

	if (type == 'subCate') {
		form.subCate.value = value;
		$(target).children().css('color', '#e53637');
	} else if (type == 'grade') {
		form.grade.value = value;
		$(target).addClass('active');
	}

	form.nowPage.value = nowPage;
	form.cntPerPage.value = 10;

	form.submit();
}

// 재성버튼 클릭 시 모달창 열고 닫기(회원인 경우 가능)
let ifreamWrap;
let modalWrap;
function playBtn(sid, link) {
	const loginId = $('#loginId').val();
	const message = $('#message').val();
	if(loginId == '' || loginId == null || loginId == undefined) {
		const check = confirm('로그인 후 수강신청을 먼저 진행해주세요. 로그인 하시겠습니까?');
		if(check ==  true) {
			location.href = 'login.do';
		}
		return true;
	}
	if(message == 'impossible') {
		alert('수강 신청 후 재생이 가능합니다.');
		$('.course-add').css('background-color', '#3188db');
		$('.course-add').css('color', '#fff');
		return true;
	}
	
	ifreamWrap = $('#iframe_area_' + sid);
	modalWrap = $('#modalWrap_' + sid);
	
	$('#iframe_area_' + sid).empty();
	$('#modalWrap_' + sid).css('display', 'block');
	$('#modalWrap_' + sid + ' iframe').attr('src', link);
	$('#iframe_area_' + sid).append(
		'<iframe width="100%" height="500" src="'
		+ link + '" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
	);
	
	close();
}

function close() {
	$('.closeBtn').click(function() {
		modalWrap.css('display', 'none');
		ifreamWrap.empty();
	});
	
	$(window).click(function(event) {
		let target = $(event.target).attr('id');
		let sid = modalWrap.attr('data-s');
	
		if (target == ('modalContent_' + sid) || target == ('modalWrap_' + sid)) {
			modalWrap.css('display', 'none');
			ifreamWrap.empty();
		}
	});
	
	jindoCount();
}

//진도율 올리기..
function jindoCount() {
	const memberId = $('#memberId').val();
	const courseId = $('#courseId').val();
	$.ajax({
		url: 'ajaxmemberjindocount.do',
		method: 'post',
		data: {courseId: courseId, memberId: memberId},
		success: function(result) {
			if(result.message == 'success') {
				console.log('진도율 반영됨.');
			} else if(result.message == 'fail') {
				console.log('진도율 반영 못함');
			} else if(result.message == 'full') {
				console.log('진도율 100%');
			}
		}
	})
}

// 무료강의 수강신청하기
function addMemberFreeCourse() {
	const courseId = $('#courseId').val();
	const memberId = $('#loginId').val();
	
	if(memberId == null || memberId == '' || memberId == 'undefined') {
		const check = confirm('로그인 후 수강신청을 먼저 진행해주세요. 로그인 하시겠습니까?');
		if(check ==  true) {
			location.href = 'login.do';
		}
		return true;
	} else {
		$.ajax({
			url: 'ajaxAddmembercourse.do',
			method: 'post',
			data: {courseId: courseId, memberId: memberId},
			success: function(result) {
				$('#message').val('possible');
				$('.course_price_wrap').css('display', 'none');
				$('.col-lg-12').css('max-width', '100%');
				$('.play_btn svg').attr('fill', 'currentColor');
				
				const check = confirm('수강신청이 완료되었습니다.\n바로 학습하시겠습니까?');
				if(check == true) {
					/*$('.tab-menu-1').removeClass('active');
					$('.tab-menu-3').removeClass('active');
					$('#tabs-5').removeClass('active');
					$('#tabs-7').removeClass('active');
					$('.tab-menu-2').addClass('active');
					$('#tabs-6').addClass('active');*/
					location.reload();
				} else {
					return true;
				}
			}
		})
	}
}

/* 수강신청 버튼 클릭 */
function addBucket() {
	let form = document.getElementById("bucketform");
	const memberId = form.memberId.value;
	console.log("memberId 값::::: " + memberId);
	
	if(memberId == null || memberId == ''){
		let check = confirm('로그인 후 수강신청을 먼저 진행해주세요. 로그인 하시겠습니까?');
		if(check ==  true) {
			location.href = 'login.do';
		}
		return true;
	} else {
		let alert = confirm('패키지 상품에 포함된 강의를 신청하실 경우,\n장바구니에 담긴 패키지는 삭제됩니다.\n계속해서 진행하시려면 확인을 눌러주세요.');
	
		if(alert == true) {
			form.submit();
		} else {
			alert('수강신청이 취소되었습니다.');
		}
	}
}

/* 장바구니 버튼 클릭 */
function ajaxAddBucket() {
	//ajaxbucketinsert.do
	let memberId = $('#bucketform #memberId').val();
	let courseId = $('#bucketform #courseId').val();
	
	if(memberId == null || memberId == ''){
		const check = confirm('로그인 후 수강신청을 먼저 진행해주세요. 로그인 하시겠습니까?');
		if(check ==  true) {
			location.href = 'login.do';
		}
		return true;
	} else {
		let alert = confirm('패키지 상품에 포함된 강의를 신청하실 경우,\n장바구니에 담긴 패키지는 삭제됩니다.\n계속해서 진행하시려면 확인을 눌러주세요.');

		if(alert == true) {
			$.ajax({
				url: 'ajaxbucketinsert.do',
			    method: 'post',
			    data: { courseId: courseId, memberId: memberId},
			    success: function (result) {
					let message = result.message;
					
					if(message = 'success') {
				        const check = confirm('장바구니에 추가되었습니다! 장바구니로 이동하시려면 확인을 눌러주세요.');
						if(check ==  true) {
							location.href = 'bucketlist.do?memberId=' + memberId;
						} else {
							$('.button_wrap').empty();
							$('.button_wrap').append('<a href="bucketlist.do?memberId=' + memberId +'"><button type="button" class="btn btn-green btn-green-p course-add">장바구니로 이동</button></a>');
							return true;
						}
					} else if (message = 'fail') {
						alert('죄송합니다, 오류가 발생했습니다. 다시 시도 부탁드립니다.\n오류가 지속적으로 반복된다면 고객센터로 연락바랍니다.');
					}
			    }
			})
		} else {
			alert('수강신청이 취소되었습니다.');
		}
	}
	
}

/* 리뷰탭 클릭 */
function showReviewList(courseId) {
	$('.review_tab_content .col_7').remove();
	$.ajax({
		url: 'ajaxreviewlist.do',
	    method: 'post',
	    data: { courseId: courseId },
	    success: function (result) {
			for(let i=0; i<result.length; i++){
				makeReviwTags(result[i]);
			}
			$('.review_count').text(result.length);
	    }
	})//ajax end
}

/* 리뷰등록 클릭 */
function reviewInsert() {
	//ajaxreviewinsert.do
	const reviewStars = $('#reviewStars').val();
	const reviwContent = $('#reviwContent').val();
	const memberId = $('#memberId').val();
	const courseId = $('#courseId').val();
	
	$.ajax({
		url: 'ajaxreviewinsert.do',
	    method: 'post',
	    data: { courseId: courseId, memberId: memberId, reviewStars: reviewStars, reviwContent: reviwContent},
	    success: function (result) {
			let message = result[0].message;
			let count = result[0].count;
			
			if(message == 'success') {
				makeReviwTags(result[1]); //작성한 리뷰 추가해서 보여주기
				alert('리뷰가 정상적으로 등록되었습니다!');
			} else {
				alert('이미 등록된 리뷰가 있습니다.');
			}
			
			$('.review_count').text(count);
			$('#reviwContent').val(''); //작성한 내용 지우기
			$('#reviewStars').val(5).prop("selected", true); //리뷰별점 5로 고정하기
	    }
	})//ajax end
	console.log($('.col_7').length);
	$('.review_count').text($('.col_7').length);
	
}

/* 리뷰수정 클릭 */
function edit(target) {
	let reviewId = $(target).attr('data-edit');
	let reviewStars = $(target).closest('div.col_7').find('.rating').attr('data-star');
	let reviewContent = $(target).closest('div.col_7').find('.reviw_content').text();
	
	$('#reviewStars').val(reviewStars).prop("selected", true);
	$('#reviwContent').val(reviewContent);
	$('.review_submit').text('수정');
	$('.review_submit').attr('onclick', 'reviewEdit(' + reviewId + ')');
	
}

/* 리뷰수정 처리 */
function reviewEdit(reviewId) {
	$.ajax({
		url: 'ajaxreviewupdate.do',
		method: 'post',
		data: {reviewId: reviewId, reviwContent: $('#reviwContent').val(), reviewStars: $('#reviewStars').val(), courseId: $('#courseId').val()},
		success: function (result) {
			$('.review_' + reviewId).remove();
			
			let message = result[0].message;
			let count = result[0].count;
			
			if(message == 'success') {
				makeReviwTags(result[1]); //작성한 리뷰 추가해서 보여주기
				alert('리뷰가 정상적으로 수정되었습니다!');
				$('.review_submit').text('등록');
				$('.review_submit').attr('onclick', 'reviewInsert()');
			} else {
				alert('오류 발생, 리뷰를 수정하지 못했습니다.');
			}
			
			$('.review_count').text(count);
			$('#reviwContent').val(''); //작성한 내용 지우기
			$('#reviewStars').val(5).prop("selected", true); //리뷰별점 5로 고정하기
		}
	})
	
}

/* 리뷰삭제 처리 */
function reviewDelete(target, courseId) {
	let reviewId = $(target).attr('data-del');
	
	$.ajax({
		url: 'ajaxreviewdelete.do',
		method: 'post',
		data: {reviewId: reviewId, courseId: courseId},
		success: function (result) {
			let message = result[0].message;
			let count = result[0].count;
			
			if(message == 'success') {
				$('.review_' + reviewId).remove();
				alert('리뷰가 정상적으로 삭제되었습니다!');
			} else {
				alert('죄송합니다, 리뷰를 삭제하지 못했습니다.\n오류가 계속 된다면 고객센터로 연락바랍니다.');
			}
			
			$('.review_count').text(count);
		}
	})
}

function makeReviwTags(data) {
	let clone = $('.review_tab_content .ajax_col_7:eq(0)').clone();
	clone.css('display', 'block');
	clone.removeClass();
	clone.addClass('col_7');
	clone.addClass('review_' + data.reviewId);
	clone.removeClass('.ajax_col_7'); //ajax용 태그에만 있는 클래스
	
	//별점 그리기
	clone.find('.rating').empty();
	clone.find('.rating').attr('data-star', data.reviewStars);
	const fillstar = data.reviewStars;
	const spacestar = 5-fillstar;
	for(let fs = 1; fs <= fillstar; fs++){
		clone.find('.rating').append('<i class="fa fa-star" style="margin-right: 0;"></i>');
	}
	for(let ss = 1; ss <= spacestar; ss++) {
		clone.find('.rating').append('<i class="fa fa-star-o" style="margin-right: 0;"></i>');
	}
	
	//아이디
	clone.find('.member_id').text(data.memberId + " | ");
	
	//날짜
	if(data.reviewUpdateDate != null) {
		const date = formatDate(data.reviewUpdateDate);
		clone.find('.review_date').text(date);
	} else {
		const date = formatDate(data.reviewEnterDate);
		clone.find('.review_date').text(date);
	}
	
	//수정, 삭제버튼
	const loginId = $('#loginId').val();
	clone.find('.review_edit').attr('data-edit', data.reviewId);
	clone.find('.review_del').attr('data-del', data.reviewId);
	
	if(data.memberId == loginId) {
		clone.find('.review_edit').css('display', 'inline-block');
		clone.find('.review_del').css('display', 'inline-block');
	} else {
		clone.find('.review_edit').css('display', 'none');
		clone.find('.review_del').css('display', 'none');
	}
	
	//리뷰 내용
	clone.find('.reviw_content').text(data.reviewContent);
	
	$('.review_tab_content').prepend(clone); // 태그 append
}

function formatDate(date) {
    let d = new Date(date),
    
    month = '' + (d.getMonth() + 1) , 
    day = '' + d.getDate(), 
    year = d.getFullYear();
    
    if (month.length < 2) month = '0' + month; 
    if (day.length < 2) day = '0' + day; 
    
    return [year, month, day].join('-');
}

