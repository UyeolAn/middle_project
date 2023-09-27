<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#Qmodal {
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
</head>
<body>

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">&#129390;약과 4조&#129390;</h1>
			<a href="#"
				class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
				class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
		</div>

		<!-- Content Row -->
		<div class="row">

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<a href="adminmemberlist.do">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-primary text-uppercase mb-1">
										회원 수</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${members}명</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-calendar fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-success text-uppercase mb-1">
									현재 총 매출</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">${totalP }원</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-info shadow h-100 py-2">
					<a href="admincourselist.do">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-info text-uppercase mb-1">현재 강의수
									</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${courses }개</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>

			<!-- Pending Requests Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-danger shadow h-100 py-2">
					<a id="Qmodalopen" href="adminquestionlist.do">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-danger text-uppercase mb-1">
										새로운 질문</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${newQ }개</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-comments fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>

		<!-- Content Row -->

		<div class="row">

			<!-- Area Chart -->
			<div class="col-xl-8 col-lg-7">
				<div class="card shadow mb-4" style="height:100%;">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-secondary">&#128155;월별 가입자수&#128155;</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">Dropdown Header:</div>
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area">
							<canvas id="myAreaChart"></canvas>
						</div>
					</div>
				</div>
			</div>

			<!-- Pie Chart -->
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4" style="height:100%;">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">Dropdown Header:</div>
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<h4 class="small font-weight-bold">
							Server Migration <span class="float-right">임의</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar bg-danger" role="progressbar"
								style="width: 20%" aria-valuenow="20" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
						<h4 class="small font-weight-bold">
							Sales Tracking <span class="float-right">40%</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar bg-warning" role="progressbar"
								style="width: 40%" aria-valuenow="40" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
						<h4 class="small font-weight-bold">
							Customer Database <span class="float-right">60%</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar" role="progressbar" style="width: 60%"
								aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<h4 class="small font-weight-bold">
							Payout Details <span class="float-right">80%</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar bg-info" role="progressbar"
								style="width: 80%" aria-valuenow="80" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
						<h4 class="small font-weight-bold">
							Account Setup <span class="float-right">Complete!</span>
						</h4>
						<div class="progress">
							<div class="progress-bar bg-success" role="progressbar"
								style="width: 100%" aria-valuenow="100" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 모달 -->
		<div class="card shadow mb-4" id="Qmodal">
			<div class="card-header py-3 modal-content" style="width: 70%;">
			  <h5 class="m-0 mb-2 font-weight-bold text-primary" id="QmodalTitle">새로운 질문</h5>
				<div class="card-body">
					<table class="table table-bordered" id="dataTable"  width="100%" cellspacing="0">
						<thead>
						  <tr>
							<th style="width: 10%;">질문자</th>
							<th style="width: 30%;">제목</th>
							<th style="width: 30%;">내용</th>
							<th style="width: 20%;">작성일</th>
							<th style="width: 5%;">답변</th>
							<th style="width: 5%;">삭제</th>
						  </tr>
						</thead>
						<tbody id="qList">
						  <c:if test="${empty qlist}">
							<tr id="empty"><td class="font-weight-bold" colspan="5" style="text-align: center;">새로운 질문이 없습니다.</td></tr>
						  </c:if>
						  <c:if test="${not empty qlist}">
							<c:forEach items="${qlist }" var="q">
							  <tr id="${q.questionId}">
								<td>${q.memberId}</td>
								<td>${q.questionTitle}</td>
								<td>${q.questionContent}</td>
								<td>${q.questionEnterDate}</td>
								<td>
									<a class="btn btn-primary btn-icon-split answer">
									  <span class="icon text-white-50">
										  <i class="fas fa-arrow-right"></i>
									  </span>
									</a>
								  </td>
								<td>
								  <a class="btn btn-danger btn-icon-split deleteSub">
									<span class="icon text-white-50">
										<i class="fas fa-trash"></i>
									</span>
								  </a>
								</td>
							  </tr>
							</c:forEach>
						  </c:if>
						</tbody>
					  </table>
					
					<a class="btn btn-danger btn-icon-split" id="close-modal">
						<span class="icon text-white-50">
							<i class="fas fa-trash"></i>
						</span>
						<span class="text" >닫기</span>
					  </a>
				</div>
			</div>
		</div>
<script>
//console.log(${itcourse});

</script>
</body>
</html>