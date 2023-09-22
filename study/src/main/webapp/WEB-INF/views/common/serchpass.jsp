<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!DOCTYPE html>
		<html lang>

		<head>

			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<meta name="description" content="">
			<meta name="author" content="">

			<title>forgot pass</title>

			<!-- Custom fonts for this template-->
			<link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
			<link
				href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
				rel="stylesheet">

			<!-- Custom styles for this template-->

			<link rel="stylesheet" href="admin/css/sb-admin-2.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		</head>

		<body class="bg-gradient-primary" style="display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100dvh;">

			<div class="container" style=" padding: 3rem;
		font-size: 2rem;
		border-radius: 1rem;
		">

				<!-- Outer Row -->
				<div class="row justify-content-center">

					<div class="col-xl-10 col-lg-12 col-md-9">

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="card-body p-0">
								<!-- Nested Row within Card Body -->
								<div class="row">
									<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
									<div class="col-lg-6">
										<div class="p-5">
											<div class="text-center">
												<h1 class="h4 text-gray-900 mb-4">RESET Password!</h1>
											</div>
											<c:if test="${empty searchId}">
												<form class="user">
													<div class="form-group">
														<input type="text" class="form-control form-control-user"
															id="memberId" name="memberId" aria-describedby="INPUT ID"
															placeholder="Enter ID">
													</div>
													<div class="form-group">
														<input type="email" class="form-control form-control-user"
															id="memberEmail" name="memberEmail"
															placeholder="Email Address">
													</div>
													<button type="button" class="btn btn-primary btn-user btn-block"
														id="IdEmailCheck">password reset</button>
												</form>
											</c:if>

											<c:if test="${not empty searchId}">
												<hr>

												<form class="user">
													<div class="form-group">
														<input type="text" class="form-control form-control-user"
															id="memberIdcheck" name="memberId"
															aria-describedby="INPUT ID" placeholder="Enter ID" readonly
															value="${searchId}">
													</div>
													<div class="form-group">
														<input type="email" class="form-control form-control-user"
															id="memberEmailcheck" name="memberEmail"
															placeholder="Email Address" readonly value="${searchEmail}">
													</div>
													<hr>
													<div class="form-group row">
														<div class="col-sm-6 mb-3 mb-sm-0">
															<input type="password"
																class="form-control form-control-user"
																name="memberPassword" id="memberPassword"
																placeholder="Password">
														</div>
														<div class="col-sm-6">
															<input type="password"
																class="form-control form-control-user" id="checkPass"
																placeholder="Repeat Password">
														</div>
													</div>
													<a class="btn btn-primary btn-user btn-block"
														id="passwordReset">SUBMIT</a>

												</form>
											</c:if>

											<hr>
											<a class="btn btn-primary btn-user btn-block" href="logout.do">HOME</a>

											<hr>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>


			<script>
				//변경할 Id탐색
				$("#IdEmailCheck").click(function () {

					$.ajax({
						url: 'ajaxpasswordresettarget.do',
						type: 'post',
						data: {
							memberId: document.getElementById("memberId").value,
							memberEmail: document.getElementById("memberEmail").value,
						},
						success: function (data) {


							alert("next")
							location.replace("passwordsearch.do")



						}
					})
				})

				//submit 클릭>>비밀번호 체크
				$("#passwordReset").click(function () {
					let password = document.getElementById("memberPassword").value;
					let repeatPassword = document.getElementById("checkPass").value;
					if (password == repeatPassword) {
						console.log("ak")
						SubmitPass()
						alert("next")

					} else {
						alert("비밀번호가 일치하지 않습니다.")
					}

				})


				//비밀번호 변경 
				function SubmitPass() {
					$.ajax({
						url: 'ajaxpasswordreset.do',
						type: 'post',
						data: {
							memberId: document.getElementById("memberIdcheck").value,
							memberEmail: document.getElementById("memberEmailcheck").value,
							memberPassword: document.getElementById("memberPassword").value
						}
					})
				}

			</script>



			<!-- Bootstrap core JavaScript-->
			<script src="admin/vendor/jquery/jquery.min.js"></script>
			<script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="admin/js/sb-admin-2.min.js"></script>

		</body>

		<script>

		</script>

		</html>