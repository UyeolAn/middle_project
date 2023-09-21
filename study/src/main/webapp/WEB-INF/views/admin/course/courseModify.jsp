<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<div class="section-body container py-5">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">강의 수정</h1>
	<p class="mb-4">
		수정할 강의의 정보를 입력해주세요.
	</p>
		<div class="row">
		  <div class="col-12 col-md-6 col-lg-12">
			<div class="card">
			  <div class="card-header">
				<h6 class="m-0 font-weight-bold text-primary">${c.courseName}</h6>
			  </div>
			  <div class="card-body">
				<form id="frm" action="admincourseupdate.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
				<label class="font-weight-bold">강의 아이디</label>
				  <input type="text" class="form-control" name="courseId" value="${c.courseId }" placeholder="${c.courseId}" readonly>
				</div>
				<div class="form-group">
				  <label class="font-weight-bold">강의 이름</label>
				  <input type="text" class="form-control" name="courseName" value="${c.courseName}">
				</div>
				<div class="form-group">
					<label class="font-weight-bold">강의 설명</label>
					<textarea class="form-control" name="courseScript" value="${c.courseScript}">${c.courseScript}</textarea>
				  </div>
				  <div class="col-lg-12 row">
				<div class="form-group col-lg-6">
				  <label class="font-weight-bold">강의 가격 (원)</label>
				  <div class="input-group">
					<div class="input-group-prepend">
					  <div class="input-group-text">
						<i class="fa fa-credit-card"></i>
					  </div>
					</div>
					<input type="text" class="form-control" name="coursePrice" value="${c.coursePrice}">
				  </div>
				</div>
				<div class="form-group col-lg-6">
					<label class="font-weight-bold">강의 강사(채널)</label>
					<div class="input-group">
					  <div class="input-group-prepend">
						<div class="input-group-text">
						  <i class="fa fa-user"></i>
						</div>
					  </div>
					  <input type="text" class="form-control" name="courseTeacher" value="${c.courseTeacher}">
					</div>
				  </div>
				</div>
				<div class="row">
					<div class="form-group col-lg-6">
						<label class="font-weight-bold">메인 카테고리</label>
						<select class="form-control select2 main" id="courseMainCategory" name="courseMainCategory" onchange="changeSub()">
							<option value="it" id="it">IT</option>
							<option value="english" id="english">ENGLISH</option>
						</select>
					</div>
					<div class="form-group col-lg-6">
						<label class="font-weight-bold">서브 카테고리</label>
						<select class="form-control select2" id="courseSubCategory" name="courseSubCategory">
							<option value="java" id="java">JAVA</option>
							<option value="python" id="python">PYTHON</option>
							<option value="c" id="c">C</option>
							<option value="c++" id="c++">C++</option>
							<option value="c#" id="c#">C#</option>
						</select>
					</div>
				</div>
				<div class="form-group col-lg-6">
					<label class="form-label font-weight-bold">난이도</label>
					<div class="selectgroup w-100" id="grade">
					  <label class="selectgroup-item">
						<input type="radio" name="courseGrade" value="easy" class="selectgroup-input" checked="">
						<span class="selectgroup-button">초급</span>
					  </label>
					  <label class="selectgroup-item">
						<input type="radio" name="courseGrade" value="normal" class="selectgroup-input">
						<span class="selectgroup-button">중급</span>
					  </label>
					  <label class="selectgroup-item">
						<input type="radio" name="courseGrade" value="hard" class="selectgroup-input">
						<span class="selectgroup-button">고급</span>
					  </label>
					</div>
				  </div>
				  <div class="form-group col-lg-6">
					<label class="font-weight-bold">이미지를 수정하시겠습니까?</label>
					<input type="checkbox" style="display: block;" id="ckImg" name="ckImg" onchange="ck()">				 
				  </div>
				  <div id="hid" style="display: none;">
					<div class="form-group col-lg-6" id="imgForm">
					  <label class="font-weight-bold">강의 이미지</label>
					  <input type="file" style="display: block;" id="courseImg" name="courseImg">
					</div>
					<div class="form-group col-lg-6" id="delForm">
					  <label class="font-weight-bold">기존 이미지를 삭제하실거면 체크하시오.</label>
					  <input type="checkbox" style="display: block;" id="ckDel" name="ckDel" onchange="ckdel()" >				 
					  <input type="hidden" value="false" id="ckRealDel" name="ckRealDel" >				 
					</div>
				  </div>
				  <div class="row">
					<div class="col-lg-4"></div>
					<div class="col-lg-4" >
						<div style="text-align: center;">
					  <button type="submit"  class="btn btn-primary btn-circle btn-lg" style="margin-right: 20px;" onclick="alarm()">
						<i class="fas fa-check"></i>
						</button>
					  <button type="reset" class="btn btn-danger btn-circle btn-lg" style="margin-left: 20px;">
						<i class="fas fa-trash"></i>
					  </button>
					</div>
					</div>
				  </div>
				</form>
			  </div>
			</div>
		  </div>
		</div>
	  </div>


<script>
	// console.log($('input[type=file]'));

	let it =['java', 'python', 'c', 'c++', 'c#'];
	let english = ['비즈니스/마케팅', 'toeic', 'toefl'];

	let mainCategory = $('.main');
	let mainCategoryOpt = $('#courseMainCategory option[value='+'"${c.courseMainCategory}"'+']');

	mainCategoryOpt.attr("selected", "selected");
	
	let subCategory = $('#courseSubCategory');
	changeSub();
	// subCategory = document.getElementById('${c.courseSubCategory}');
	console.log(subCategory);

	let subCategoryOpt = $('#courseSubCategory option[value='+'"${c.courseSubCategory}"'+']');
	console.log(subCategoryOpt);
	subCategoryOpt.attr("selected", "selected");

	let gradeRadio = $('#grade input[value='+'"${c.courseGrade}"'+']');
	console.log($('#grade input'));
	console.log(gradeRadio);
	gradeRadio.attr("checked","checked");



	function changeSub() {
		// let childrens = document.querySelectorAll(subCategory.children);
		let sub = [];

		subCategory.children().remove();
		if($('.main').val() === 'it') sub = it;
		else if ($('.main').val() === 'english') sub = english;

		for( let s of sub) {
			let opt = $('<option/>').text(s.toUpperCase()).attr('value',s);
			subCategory.append(opt);
		}
		
	}

	function alarm() {
		alert("강의가 수정되었습니다.");
	}

	function ck() {
		if($('#ckImg').is(':checked')) {
			console.log("체크됨");
			$('#hid').css("display","block");
		}
		else {
			console.log("체크해제됨");
			$('#hid').css("display","none");
		}
	}

	function ckdel() {
		if($('#ckDel').is(":checked")) {
			$('#ckRealDel').attr("value", "true");
		}
		else {
			$('#ckRealDel').attr("value", "false");
		}
	}

	// function formCheck() {
	// 	let form = document.getElementById('frm');
	// 	console.log($('#courseSubCategory').val());
	// 	return false;
	// }
</script>
</body>
</html>