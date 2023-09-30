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
												<!-- <a id="kakao-login-btn" href="javascript:kakaoLogin()">
													<img src="img/kakao_login.png" width="100" margin = "0 auto"
													  alt="카카오 로그인 버튼" />
												  </a> -->
												  <a id="kakao-login-btn" href="javascript:kakaoLogin()">
													<img src="client/img/icon/kakao_login.png" width="421" height="44" margin = "0 auto"
													  style="border-radius: 10rem;" alt="카카오 로그인 버튼" />
												  </a>
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
				<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
				integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous">
			</script>
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

				<script>
					let loginMsg = `${loginmsg}`;
					if (loginMsg != "") {
						alert(loginMsg)
						loginMsg = "";
					}

					//뒤로가기 방지
					//회원가입 후 로그인페이지에서 뒤로가기>> 중복해서 회원가입
					function noBack() {
						history.pushState(null, null, location.href);
						window.onpopstate = function (event) {
							history.go(1);
						};
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

					Kakao.init('9c1eb3ec967ca14a10ddab8621bdddef');
					console.log(Kakao.isInitialized());

					function kakaoLogin() {
						Kakao.Auth.login({
							success: function (response) {
								Kakao.API.request({
									url: '/v2/user/me',
									success: function (response) {
										console.log(response.kakao_account.email);
										console.log(response.kakao_account.profile.nickname);
										let url = 'KakaoLogin.do';
										let payload = 'id=' + response.kakao_account.email + '&name=' + response.kakao_account.profile.nickname;
										fetch(url, {
											method: 'POST',
											headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
											body: payload
										})
										.then(result => {
											if (result.ok) {
												// 여기서 로그인 상태 여부를 확인하고 이동할 페이지 결정
												checkLoginStatus();
											} else {
												console.error('서버 응답 오류');
											}
										})
										.catch(error => {
											console.error('페이지 이동 실패: ' + error);
										});
									},
									fail: function (error) {
										console.log(error);
									},
								});
							},
							fail: function (error) {
								console.log(error);
							},
						});
					}

					function checkLoginStatus() {
						fetch('checkLoginStatus.do')
						.then(response => {
							if (response.ok) {
								return response.json();
							} else {
								console.error('서버 응답 오류');
							}
						})
						.then(data => {
							if (data.isLoggedIn) {
								// 로그인 상태인 경우 홈 페이지로 이동
								window.location.href = 'home.do';
							} else {
								// 로그인 상태가 아닌 경우 회원가입 페이지로 이동
								window.location.href = 'kakaoregister.do';
							}
						})
						.catch(error => {
							console.error('페이지 이동 실패: ' + error);
						});
					}


					//카카오로그아웃  
	//				function kakaoLogout() {
	//					if (Kakao.Auth.getAccessToken()) {
	//					Kakao.API.request({
	//						url: '/v1/user/unlink',
	//						success: function (response) {
	//							console.log(response)
	//						},
	//						fail: function (error) {
	//						console.log(error)
	//						},
	//					})
	//					Kakao.Auth.setAccessToken(undefined)
	//					}}

	// 				//카카오
	// 				function loginWithKakao2 () {
    // 	window.Kakao.Auth.authorize({
    // 		redirectUri: 'http://localhost/prj',
    //         prompt: 'select_account',
    // 	})
    // }
    // function loginWithKakao() {
        
        
        // // 예제: 이메일, 성별 정보 가져오기
        // Kakao.API.request({
        //     url: '/v2/user/me',
        //     data: {
        //             property_keys: ['kakao_account.email'],
        //         },
        //     })
        //     .then(function(response) {
        //         console.log(response);
        //     })
        //     .catch(function(error) {
        //         console.log(error);
        //     });
            
        //     Kakao.Auth.authorize({
        //       redirectUri: 'http://127.0.0.1/prj',
        //       prompt: 'select_account',
        //     });
        

    //     window.Kakao.Auth.login({
    //             scope: 'profile_nickname, account_email, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
    //             success: function(response) {
    //                 console.log(response);
    //                 console.log(response.access_token);
    //                 Kakao.Auth.setAccessToken(response.access_token);
    //               // 로그인 성공하면 받아오는 데이터
    //                 window.Kakao.API.request({ // 사용자 정보 가져오기 
    //                     url: '/v2/user/me',
    //                     success: (res) => {
    //                         const kakao_account = res.kakao_account;
    //                         alert(kakao_account.profile.nickname+"님 환영합니다");
    //                         console.log(kakao_account);
    //                         console.log(kakao_account.profile.nickname);
    //                         console.log(kakao_account.birthday);
    //                         console.log(kakao_account.email);
	// 						fetch('KakaoLogin.do?mid='+kakao_account.email)
	// 						.then(resolve=>resolve.json())
	// 						.then(result=>{
	// 							console.log("계정 : "+result);
	// 						});
    //                     }
    //                 });
    //                  //window.location.href='http://localhost/prj' //리다이렉트 되는 코드
    //             },
    //             fail: function(error) {
    //                 console.log(error);
    //             }
    //         });
    //   }
	
				</script>



		</body>
		<script>

		</script>

		</html>