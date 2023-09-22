/**
 * 강의 상세페이지 관련
 */

 
// 사이드메뉴 강의 클릭시
function courseList(type, value, nowPage, target) {
	$('.sub_menu').css('color','#b7b7b7');
	$('.sub_menu_g').removeClass('active');
	
	let form = document.getElementById("cform");
	
	if(type == 'subCate'){
		form.subCate.value = value;
		$(target).children().css('color','#e53637');
	} else if(type == 'grade') {
		form.grade.value = value;
		$(target).addClass('active');
	}
	
	form.nowPage.value = nowPage;
	form.cntPerPage.value = 10;
	
	form.submit();
}

// 모달창 열고 닫기
let ifreamWrap;
function playBtn(sid, link) {
	ifreamWrap = $('#iframe_area_' + sid);
	$('#iframe_area_' + sid).empty();
	$('#modalWrap').css('display', 'block');
	$('#modalWrap iframe').attr('src', link);
	$('#iframe_area_' + sid).append(
		'<iframe width="100%" height="500" src="'
		+ link + '" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
	);
}
$('#closeBtn').click(function(){
	$('#modalWrap').css('display', 'none');
	ifreamWrap.empty();
});

$(window).click(function(event){
	let target = $(event.target).attr('id');
	
	if(target == 'modalContent' || target == 'modalWrap'){
		$('#modalWrap').css('display', 'none');
		ifreamWrap.empty();
	}
});

