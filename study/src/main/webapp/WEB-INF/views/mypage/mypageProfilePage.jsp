<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>
				#modal {
					position: fixed;
					z-index: 1;
					left: 0;
					top: 0;
					width: 100%;
					height: 100%;
					overflow: auto;
					background-color: rgba(0, 0, 0, 0.4);
					display: none;
				}

				.modal-content {
					background-color: #fefefe;
					margin: 15% auto;
					padding: 20px;
					border: 1px solid #888;
					width: 80%;
				}

				.close {
					color: #aaa;
					float: right;
					font-size: 28px;
					font-weight: bold;
				}

				.close:hover,
				.close:focus {
					color: black;
					text-decoration: none;
					cursor: pointer;
				}
			</style>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
			<link rel="stylesheet" href="client/css/sb-admin-2.min.css">
		</head>

		<body>

			<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">MYPAGE</h1>
			</div>
			<p class="mb-4">
				${loginId}님의 정보
			</p>
			<!-- Content Row -->
			<div class="row">

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-primary shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
										수강중인 강좌</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${memberCourseCount}개</div>
								</div>
							</div>
						</div>
					</div>
				</div>



				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-info shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-info text-uppercase mb-1">학습 완료한 강의
									</div>

									<div class="h5 mb-0 font-weight-bold text-gray-800">${compcnt}개</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Pending Requests Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-danger shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
										작성한 게시물 수</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800"> ${postCount}개</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-danger shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
										작성한 댓글 수</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${countrec } </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<!-- 프로필 -->
				<div class="col">

					<div class="card">
						<div class="card-header">
							<h6 class="m-0 font-weight-bold text-primary">${m.memberName} 님</h6>
						</div>
						<div class="card-body" style="padding: 50px;">

							<!-- 회원 상세 정보 -->
							<form id="frm">
								<div class="form-group">
									<label class="font-weight-bold" style="display: block;">이름</label>
									<span>${m.memberName}</span>
								</div>
								<div class="form-group">
									<label class="font-weight-bold" style="display: block;">아이디</label>
									<span>${m.memberId}</span>
								</div>
								<div class="form-group">
									<label class="font-weight-bold" style="display: block;">연락처</label>
									<span>${m.memberTel}</span>
								</div>
								<div class="form-group">
									<label class="font-weight-bold" style="display: block;">주소</label>
									<span>${m.memberAddress}</span>
								</div>
								<div class="form-group">
									<label class="font-weight-bold" style="display: block;">이메일</label>
									<span>${m.memberEmail}</span>
								</div>
								<div class="form-group">
									<label class="font-weight-bold">가입일</label>
									<p>${m.memberEnterDate}</p>
								</div>
								<a class="btn btn-primary btn-icon-split">
									<span class="text" onclick="modalOpen()" style="color: white;">수정</span>
								</a>
							</form>
						</div>
					</div>
				</div>


				<div class="col">

					<!-- Project Card Example -->
					<div class="card">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">수강중인 강의 진도</h6>
						</div>
						<div class="card-body">
							<!-- 강의 별 진도율 -->
							<!-- 서블릿에서 함께 넘겨줌 -->

							<div class="card-body">
								<c:if test="${empty mclist}">
									<!-- 서블릿에서 mclist로 담아서 보내줌 -->
									<div style="width: 100%;">
										<span class="font-weight-bold" style="text-align: center;">수강하는 강의가
											없습니다.</span>
									</div>
								</c:if>
								<c:if test="${not empty mclist}">
									<p class="mb-4"><span class="text-primary font-weight-bold me-1">강의 별 진도율</span>
									</p>
									<c:forEach items="${mclist }" var="c">
										<p class="mt-4 mb-1" style="font-size: .77rem;">
											<span class="cid" name=${c.courseId}>${c.courseName}
												<!-- 강의 이름 옆에 괄호로 진도율 표시 -->
												(${c.jindo}%)
											</span>
										</p>
										<!-- 차트 진도율만큼 그려줌 -->
										<div class="progress rounded" style="height: 5px;">
											<div class="progress-bar" role="progressbar" style="width: ${c.jindo}%"
												aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
												id=${c.courseId}>
											</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<!-- 강의목록 -->
				<div class="col-12" style="margin-top: 20px;">
					<div class="card">
						<div class="card-header">
							<h6 class="m-0 font-weight-bold text-primary">강의 목록</h6>
						</div>
						<div class="card-body">
							<c:if test="${empty mclist}">
								<h3 style="text-align: center;">수강중인 강의가 없습니다.</h3>
							</c:if>
							<c:if test="${not empty mclist }">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>NAME</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${mclist}" var="mc">
												<tr>
													<td>${mc.courseName}</td>
													<td align="center">
														<a class="btn btn-secondary btn-icon-split search">
															<span class="icon text-white-50"
																onclick="location.href='coursedetail.do?courseId=${mc.courseId}'">
																<i class="fas" >들어가기</i>
															</span>
														</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:if>
						</div>
					</div>
				</div>




				<div class="card shadow mb-4" id="modal">
					<div class="card-header py-3 modal-content" style="width: 50%;">
						<h5 class="m-0 mb-2 font-weight-bold text-primary" id="modalTitle">내 정보 수정</h5>
						<div class="card-body">
							<form id="frm2">
								<div class="form-group">
									<label class="font-weight-bold" style="display: block;">이름</label>
									<input value="${m.memberName}" id="modalName" type="text"
										class="form-control form-control-user" maxlength="10" spellcheck="false">
								</div>
								<div class="form-group">
									<label class="font-weight-bold" style="display: block;">아이디</label>
									<input class="form-control form-control-user" value="${m.memberId}" id="modalId"
										type="text" readonly>
								</div>
								<div class="form-group">
									<label style="display: block;">비밀번호</label>
									<input  class="form-control form-control-user" id="modalPw" type="password" maxlength="50">
								</div>
								<div class="form-group">
									<label class="font-weight-bold" style="display: block;">연락처</label>
									<input class="form-control form-control-user" value="${m.memberTel}" id="modalTel"
										type="tel" maxlength="20">
								</div>
								<div class="form-group">
									<label class="font-weight-bold">주소</label><br>
									<input type="text" id="sample6_postcode" class="form-control mb-2"
										style="display: inline; width: 50%;" placeholder="우편번호" readonly>
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" id="sample6_address" class="form-control mb-2"
										style="width: 100%; display: inline;" value="${m.memberAddress}"
										placeholder="주소" required readonly>
									<div class="row mb-2" style="width: 100%; margin-left: 0;">
										<input type="text" id="sample6_detailAddress" class="form-control col-lg-6"
											style="width: 50%; display: inline;" placeholder="상세주소">
										<input type="text" id="sample6_extraAddress" class="form-control col-lg-6"
											style="width: 50%; display: inline;" placeholder="참고항목">
									</div>
								</div>
								<div class="form-group">
									<label style="display: block;">이메일</label>
									<input class="form-control form-control-user" value="${m.memberEmail}" id="modalEmail" type="email">
								</div>

							</form>
							<a class="btn btn-primary btn-icon-split" id="sub-modal">
								<span class="icon text-white-70">
									✔
								</span>
								<span class="text" style="color: white; font-weight: bold;">완료</span>
							</a>
							<a class="btn btn-danger btn-icon-split" id="close-modal">
								<span class="icon text-white-70">
									❌
								</span>
								<span class="text"  style="color: white; font-weight: bold;">취소</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<script>
				var mid = "${m.memberId}";

				function studyroom() {
					location.replace("coursedetail.do?courseId=${courseId}");
				}
			</script>

			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				const modal = document.getElementById("modal");
				const subModalBtn = document.getElementById("sub-modal");
				const closeModalBtn = document.getElementById("close-modal");
				const modalFields = ['이름', '아이디', '연락처', '주소', '이메일'];

				modal.style.display = "none";
				document.body.style.overflow = "auto";

				function modalOpen() {
					// const m = {id:'${m.memberId}', name:'${m.memberName}', tel:'${m.memberTel}', addr:'${m.memberAddress}', email:'${m.memberEmail}'};

					modal.style.display = "block";
					document.body.style.overflow = "hidden";


					subModalBtn.addEventListener("click", () => {
						let id = $('#modalId').val();
						let pw = $('#modalPw').val();
						let name = $('#modalName').val();
						let tel = $('#modalTel').val();
						let addr = $('#sample6_address').val() + " " + $('#sample6_detailAddress').val() + $('#sample6_extraAddress').val();
						let email = $('#modalEmail').val();
						console.log(id);

						let url = 'ajaxemployeemypageupdate.do';
						let payload = 'id=' + id + '&pw=' + pw + '&name=' + name + '&tel=' + tel + '&addr=' + addr + '&email=' + email;
						fetch(url, {
							method: 'POST',
							headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
							body: payload
						})
							.then(resolve => resolve.json())
							.then(result => {
								console.log(result);
								console.log(result);
								modal.style.display = "none";
								document.body.style.overflow = "auto";
								location.reload(true);
							});
					})
				}


				//수정 모달 취소버튼누르면 닫기
				closeModalBtn.addEventListener("click", () => {
					modal.style.display = "none";
					document.body.style.overflow = "auto"; // 스크롤바 보이기
				});


				function sample6_execDaumPostcode() {
					new daum.Postcode({
						oncomplete: function (data) {
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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== '' && data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
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