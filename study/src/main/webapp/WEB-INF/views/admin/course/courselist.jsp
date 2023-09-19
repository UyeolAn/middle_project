<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link href="admin/css/sb-admin-2.min.css" rel="stylesheet">
<link href="admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body>
    <h1 class="h3 mb-2 text-gray-800">강의 목록</h1>
	<p class="mb-4">
		강의관리 페이지
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Course List</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable"  width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${courses }" var="c">
							<tr>
								<td>${c.courseId}</td>
								<td>${c.courseName }</td>
								<!-- 정지계정여부 표시 -->
								<!-- <c:choose>
									<c:when test="${m.memberStopDate != null}">
										<td><input type="checkbox" class="block" name="block" checked/></td>
									</c:when>
									<c:otherwise>
										<td><input type="checkbox" class="block" name="block"/></td>
									</c:otherwise>
								</c:choose> -->
								<!-- 회원 상세페이지로 이동 버튼 -->
								<td>
									<a class="btn btn-secondary btn-icon-split">
										<span class="icon text-white-50">
											<i class="fas fa-arrow-right"></i>
										</span>
										<span class="text" id="${m.memberId}">수정</span>
									</a>
								</td>
								<td>
									<a class="btn btn-danger btn-icon-split" onclick='remove(${c.courseId})'>
										<span class="icon text-white-50">
											<i class="fas fa-trash"></i>
										</span>
										<span class="text" id="${m.memberId}">삭제</span>
									</a>
								</td>
							</tr>
						 </c:forEach> 
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div>
		<!-- 폼을 통해 조회할 회원 아이디 서블릿으로 전송  (mid에 넣어서 보냄) -->
		<form id="sform" action="adminmemberpage.do" method="post">
			<input type="hidden" id="mid" name="mid">
		</form> 
	</div>
    <script src="admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="admin/js/demo/datatables-demo.js"></script>
	<script>
		function remove(id) {
			const response = confirm("삭제하시겠습니까?");
			console.log(id);
			console.log(name);
			if(response) {
					fetch('admincoursedelete.do?cid='+id)
						.then(resolve=>resolve.json())
						.then(result=>console.log(result));
					alert("삭제되었습니다.");
					location.reload(true);
				}
		}
	</script>
</body>
</html>