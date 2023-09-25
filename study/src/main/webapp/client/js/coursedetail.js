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
}
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

// 무료강의 수강신청하기
function addMemberFreeCourse() {
	const courseId = $('#courseId').val();
	const memberId = $('#loginId').val();
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
				$('.nav nav-tabs li:nth-child(1) a').removeClass('active');
				$('.nav nav-tabs li:nth-child(2) a').addClass('active');
			} else {
				return true;
			}
		}
	})
}

function addBucketList() {
	const courseId = $('#courseId').val();
	const memberId = $('#loginId').val();
	
	if(memberId != null || memberId != '') {
		$.ajax({
			url: 'bucketinsert.do',
			method: 'post',
			data: {courseId: courseId, memberId: memberId},
			success: function(result) {
				
			}
		})
	} else {
		alert('로그인 후 이용하실 수 있습니다.');
	}
}

