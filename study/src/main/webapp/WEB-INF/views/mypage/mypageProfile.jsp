<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>

		<body>

			<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">${loginId} 's PAGE</h1>
			</div>

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
									<div class="text-xs font-weight-bold text-info text-uppercase mb-1">현재 강의수
									</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${courses}개</div>
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
										새로운 질문</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${newQ }</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-comments fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<!-- 프로필 -->
				<div class="col-xl-4 col-lg-5">
					<div class="card shadow mb-4">
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">${loginName}</h6>

						</div>
					</div>

					<!-- 회원 상세 정보 -->
					<div class="card mb-4">
						<div class="card-body">
							<div>
								<div class="col-sm-3">
									<p class="mb-0 font-weight-bold">이름</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${m.memberName}</p>
								</div>
							</div>
							<hr>
							<div>
								<div class="col-sm-3">
									<p class="mb-0 font-weight-bold">아이디</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0" id="mid" value="${m.memberId}">${m.memberId}</p>
								</div>
							</div>
							<hr>
							<div>
								<div class="col-sm-3">
									<p class="mb-0 font-weight-bold">이메일</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${m.memberEmail}</p>
								</div>
							</div>
							<hr>
							<div>
								<div class="col-sm-3">
									<p class="mb-0 font-weight-bold">연락처</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${m.memberTel}</p>
								</div>
							</div>
							<hr>
							<div>
								<div class="col-sm-3">
									<p class="mb-0 font-weight-bold">주소</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${m.memberAddress}</p>
								</div>
							</div>
							<hr>
							<div>
								<div class="col-sm-3">
									<p class="mb-0 font-weight-bold">가입일</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${m.memberEnterDate}</p>
								</div>
							</div>
						</div>
					</div>
					<!-- 강의목록 -->
					<div class="card mb-4">
						<div class="card-header">
							<h6 class="m-0 font-weight-bold text-primary">강의 목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>NAME</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${mycourse}" var="mc">
											<tr>
												<td>${mc.courseName}</td>
												<td>
													<a class="btn btn-secondary btn-icon-split search">
														<span class="icon text-white-50">
															<i class="fas fa-arrow-right"></i>
														</span>
													</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>



					<!-- Content Column -->
					<div class="col-lg-6 mb-4">

						<!-- Project Card Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">수강중인 강의 진도</h6>
							</div>
							<div class="card-body">
								<h4 class="small font-weight-bold">
									Server Migration <span class="float-right">20%</span>
								</h4>
								<div class="progress mb-4">
									<div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
										aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<h4 class="small font-weight-bold">
									Sales Tracking <span class="float-right">40%</span>
								</h4>
								<div class="progress mb-4">
									<div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
										aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<h4 class="small font-weight-bold">
									Customer Database <span class="float-right">60%</span>
								</h4>
								<div class="progress mb-4">
									<div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<h4 class="small font-weight-bold">
									Payout Details <span class="float-right">80%</span>
								</h4>
								<div class="progress mb-4">
									<div class="progress-bar bg-info" role="progressbar" style="width: 80%"
										aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<h4 class="small font-weight-bold">
									Account Setup <span class="float-right">Complete!</span>
								</h4>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 100%"
										aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
						</div>


					</div>

					<div class="col-lg-6 mb-4">

						<!-- Approach -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Development
									Approach</h6>
							</div>
							<div class="card-body">
								<p>SB Admin 2 makes extensive use of Bootstrap 4 utility
									classes in order to reduce CSS bloat and poor page performance.
									Custom CSS classes are used to create custom components and
									custom utility classes.</p>
								<p class="mb-0">Before working with this theme, you should
									become familiar with the Bootstrap framework, especially the
									utility classes.</p>
							</div>
						</div>

					</div>
				</div>
			</div>

			<script>

			</script>

		</body>

		</html>