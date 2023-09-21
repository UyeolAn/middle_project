<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>


<!-- Start GA -->
</head>
<body>
	<div class="section-body container py-5">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">강의 등록</h1>
	<p class="mb-4">
		등록할 강의의 정보를 입력해주세요.
	</p>
		<div class="row">
		  <div class="col-12 col-md-6 col-lg-12">
			<div class="card">
			  <div class="card-header">
				<h6 class="m-0 font-weight-bold text-primary">New Course</h6>
			  </div>
			  <div class="card-body">
				<form id="frm" action="admincourseinsert.do" method="post">
				<div class="form-group">
				  <label>강의 이름</label>
				  <input type="text" class="form-control" name="courseName" required>
				</div>
				<div class="form-group">
					<label>강의 설명</label>
					<textarea class="form-control" name="courseScript" required></textarea>
				  </div>
				  <div class="col-lg-12 row">
				<div class="form-group col-lg-6">
				  <label>강의 가격 (원)</label>
				  <div class="input-group">
					<div class="input-group-prepend">
					  <div class="input-group-text">
						<i class="fa fa-credit-card"></i>
					  </div>
					</div>
					<input type="text" class="form-control" name="coursePrice" required>
				  </div>
				</div>
				<div class="form-group col-lg-6">
					<label>강의 강사(채널)</label>
					<div class="input-group">
					  <div class="input-group-prepend">
						<div class="input-group-text">
						  <i class="fa fa-user"></i>
						</div>
					  </div>
					  <input type="text" class="form-control" name="courseTeacher" required>
					</div>
				  </div>
				</div>
				<div class="row">
					<div class="form-group col-lg-6">
						<label>메인 카테고리</label>
						<select class="form-control select2 main" name="courseMainCategory" onchange="changeSub()">
							<option value="it">IT</option>
							<option value="english">ENGLISH</option>
						</select>
					</div>
					<div class="form-group col-lg-6">
						<label>서브 카테고리</label>
						<select class="form-control select2" id="courseSubCategory" name="courseSubCategory">
							<option value="java">JAVA</option>
							<option value="python">PYTHON</option>
							<option value="c">C</option>
							<option value="c++">C++</option>
							<option value="c#">C#</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="form-label">난이도</label>
					<div class="selectgroup w-100">
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
				  <div class="form-group">
					<label>강의 이미지</label>
					<input type="file" style="display: block;" id="courseImg" name="courseImg">
				  </div>
				  <div class="row">
					<div class="col-lg-4"></div>
					<div class="col-lg-4" >
						<div style="text-align: center;">
					  <button type="submit"  class="btn btn-primary btn-circle btn-lg" style="margin-right: 20px;">
						<i class="fas fa-check"></i>
						</button>
					  <button type="reset" class="btn btn-danger btn-circle btn-lg" style="margin-left: 20px;">
						<i class="fas fa-trash"></i>
					  </button>
					</div>
					</div>
					<div class="col-lg-4"></div>

				  </div>
				</form>
			  </div>
			</div>
		  </div>
		</div>
	  </div>


<script>
	let it =['java', 'python', 'c', 'c++', 'c#'];
	let english = ['비즈니스/마케팅', 'toeic', 'toefl'];

	let mainCategory = $('.main');
	let subCategory = $('#courseSubCategory');

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

	$('form').submit() {
		alert("강의가 등록되었습니다.");
	}


	// function formCheck() {
	// 	let form = document.getElementById('frm');
	// 	console.log($('#courseSubCategory').val());
	// 	return false;
	// }
</script>
</body>
</html>