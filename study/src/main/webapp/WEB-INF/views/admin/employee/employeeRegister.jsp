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
				<form id="frm" action="adminemployeeinsert.do" method="post" onsubmit="return formCheck()">
					<div class="form-group">
                        <label class="font-weight-bold">이름</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">아이디</label>
                        <input type="text" class="form-control" name="id" required>
                    </div>
                    <div class="col-lg-12 row">
                        <div class="form-group col-lg-6">
                            <label class="font-weight-bold">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="form-group col-lg-6">
                            <label class="font-weight-bold">비밀번호 확인</label>
                            <input type="password" class="form-control" id="passwordRepeat" name="passwordRepeat" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">연락처</label>
                        <input type="tel" class="form-control" name="tel" placeholder="- 제외" required>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">이메일</label>
                        <input type="email" class="form-control" name="email" required>
                    </div>
					<div class="form-group">
						<label class="font-weight-bold">주소</label><br>
						<input type="text" id="sample6_postcode" class="form-control mb-2" style="display: inline; width: 50%;" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" class="form-control mb-2" style="width: 100%; display: inline;" name="address1" placeholder="주소">
						<div class="row mb-2" style="width: 100%; margin-left: 0;">
							<input type="text" id="sample6_detailAddress" class="form-control col-lg-6" style="width: 50%; display: inline;" name="address2" placeholder="상세주소"><!--
							--><input type="text" id="sample6_extraAddress" class="form-control col-lg-6" style="width: 50%; display: inline;" name="address3" placeholder="참고항목">
						</div>
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

	  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function formCheck() {
		let form = document.getElementById('frm');
		
		if(form.password.value != form.passwordRepeat.value) {
			alert("비밀번호가 틀립니다.");
			form.password.value = '';
			form.passwordRepeat.value = '';
			return false;
		}
	}

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>