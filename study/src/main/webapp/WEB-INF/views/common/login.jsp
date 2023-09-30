<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!DOCTYPE html>
		<html>

		<head>

			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<meta name="description" content="">
			<meta name="author" content="">

			<title>SB Admin 2 - Login</title>

			<!-- Custom fonts for this template-->
			<link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
			<link
				href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
				rel="stylesheet">

			<!-- Custom styles for this template-->

			<link rel="stylesheet" href="admin/css/sb-admin-2.min.css">
			<style>
				.small {
					color: #737373;
				}

				.btn {
					background-color: #999999;
					border-color: #999999;
				}

				.bg-gradient-primary {
					display: flex;
					justify-content: center;
					align-items: center;
					min-height: 100dvh;
					background-color: #f1f0ff;
					background-image: none;
				}

				.container {
					padding: 3rem;
					font-size: 2rem;
					border-radius: 1rem;
				}
			</style>
		</head>

		<body class="bg-gradient-primary">

			<div class="container">

				<!-- Outer Row -->
				<div class="row justify-content-center">

					<div class="col-xl-10 col-lg-12 col-md-9">

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="card-body p-0">
								<!-- Nested Row within Card Body -->
								<div class="row" style="margin-top: 10%; margin-bottom: 10%;">

									<div class="col-lg-6 col-md-6" style="margin: 0 auto;">
										<div class="text-center">
											<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
										</div>
										<form class="user" action="memberchecklogin.do" method="post">
											<div class="form-group">
												<input type="text" class="form-control form-control-user" id="memberId"
													name="memberId" aria-describedby="INPUT ID" placeholder="Enter ID"
													maxlength="20">
											</div>
											<div class="form-group">
												<input type="password" class="form-control form-control-user"
													name="memberPassword" id="memberPassword" placeholder="Password"
													maxlength="50">
											</div>
											<div class="form-group">
												<div class="custom-control custom-checkbox small">
													<input type="checkbox" class="custom-control-input"
														id="idSaveCheck"> <label class="custom-control-label"
														for="idSaveCheck">
														ID 저장 </label>
												</div>
											</div>
											<button type="submit"
												class="btn btn-primary btn-user btn-block">Login</button>
											<hr>
										</form>
										<div class="text-center">
											<a class="small" href="passwordsearch.do">Forgot
												Password?</a>
										</div>
										<div class="text-center">
											<a class="small" href="register.do">Create an Account!</a>
										</div>
										<div class="text-center">
											<a class="small" href="home.do">Back Home!</a>
										</div>

									</div>
								</div>
							</div>

						</div>

					</div>

				</div>
				<script>
					let loginMsg = `${loginmsg}`;
					if (loginMsg != "") {
						alert(loginMsg)
						loginMsg = "";
					}

					//뒤로가기 방지
					//로그인페이지에서 뒤로가기 방지

					history.pushState(null, null, location.href);
					window.onpopstate = function (event) {
						history.go(1);
					};


					// 로그인 후 페이지 접근 제한
					//세션에 id있을시 강제로 로그아웃
					let loginId = `${loginId}`;
					loginAccess()

					console.log(loginId)
					function loginAccess() {
						if (loginId != "") {
							location.href("logout.do");
							alert("로그아웃되었습니다")
						}

					}



				</script>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
				<script>
					$(document).ready(function () {
						// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
						var key = getCookie("saveId");
						$("#memberId").val(key);

						// 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
						if ($("#memberId").val() != "") {
							$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
						}
					})

					$("#idSaveCheck").change(function () { // 체크박스에 변화가 있다면,
						if ($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
							setCookie("key", $("#memberId").val(), 7); // 7일 동안 쿠키 보관
						} else { // ID 저장하기 체크 해제 시,
							deleteCookie("key");
						}
					});

					// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
					$("#memberId").keyup(function () { // ID 입력 칸에 ID를 입력할 때,
						if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
							setCookie("saveId", $("#memberId").val(), 7); // 7일 동안 쿠키 보관
						}
					});

					// 쿠키 저장하기 
					// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
					function setCookie(cookieName, value, exdays) {
						var exdate = new Date();
						exdate.setDate(exdate.getDate() + exdays);
						var cookieValue = escape(value)
							+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
						document.cookie = cookieName + "=" + cookieValue;
					}

					// 쿠키 삭제
					function deleteCookie(cookieName) {
						var expireDate = new Date();
						expireDate.setDate(expireDate.getDate() - 1);
						document.cookie = cookieName + "= " + "; expires="
							+ expireDate.toGMTString();
					}

					// 쿠키 가져오기
					function getCookie(cookieName) {
						cookieName = cookieName + '=';
						var cookieData = document.cookie;
						var start = cookieData.indexOf(cookieName);
						var cookieValue = '';
						if (start != -1) { // 쿠키가 존재하면
							start += cookieName.length;
							var end = cookieData.indexOf(';', start);
							if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
								end = cookieData.length;
							console.log("end위치  : " + end);
							cookieValue = cookieData.substring(start, end);
						}
						return unescape(cookieValue);
					}
				</script>



		</body>
		<script>

		</script>

		</html>