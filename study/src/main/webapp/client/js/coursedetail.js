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