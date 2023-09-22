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
	<h1 class="h3 mb-2 text-gray-800">직원 등록</h1>
	<p class="mb-4">
		등록할 직원의 정보를 입력해주세요.
	</p>
		<div class="row">
		  <div class="col-12 col-md-6 col-lg-12">
			<div class="card">
			  <div class="card-header">
				<h6 class="m-0 font-weight-bold text-primary">New Employee</h6>
			  </div>
			  <div class="card-body">
				<form id="frm" action="admincourseinsert.do" method="post">
                    <div class="form-group">
                        <label class="font-weight-bold">아이디</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="col-lg-12 row">
                        <div class="form-group col-lg-6">
                            <label class="font-weight-bold">비밀번호</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                        <div class="form-group col-lg-6">
                            <label class="font-weight-bold">비밀번호 확인</label>
                            <input type="password" class="form-control"  name="password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">연락처</label>
                        <input type="tel" class="form-control" name="tel" placeholder="- 제외" required>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">이메일</label>
                        <input type="email" class="form-control" name="name" required>
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

	let mainCategory = $('#courseMainCategory');
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

	// $('form').submit() {

	// 	alert("강의가 등록되었습니다.");
	// }


	// function formCheck() {
	// 	let form = document.getElementById('frm');
	// 	console.log($('#courseSubCategory').val());
	// 	return false;
	// }
</script>
</body>
</html>