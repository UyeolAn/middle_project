<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>

	<!-- 회원목록조회페이지 -->
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">회원 목록</h1>
	<p class="mb-4">
		회원관리 페이지
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Member List</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>TEL</th>
							<th>ADDRESS</th>
							<th>EMAIL</th>
							<th>ENTER DATE</th>
							<th>BLOCK</th>
							<th>PAGE</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>TEL</th>
							<th>ADDRESS</th>
							<th>EMAIL</th>
							<th>ENTER DATE</th>
							<th>BLOCK</th>
							<th>PAGE</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${members }" var="m">
							<tr>
								<td>${m.memberId }</td>
								<td>${m.memberName }</td>
								<td>${m.memberTel }</td>
								<td>${m.memberAddress }</td>
								<td>${m.memberEmail }</td>
								<td>${m.memberEnterDate }</td>
								<!-- 정지계정여부 표시 -->
								<c:choose>
									<c:when test="${m.memberStopDate != null}">
										<td><input type="checkbox" class="block" name="block" checked/></td>
									</c:when>
									<c:otherwise>
										<td><input type="checkbox" class="block" name="block"/></td>
									</c:otherwise>
								</c:choose>
								<!-- 회원 상세페이지로 이동 버튼 -->
								<td>
									<a class="btn btn-primary btn-icon-split">
										<span class="icon text-white-50">
											<i class="fas fa-info-circle"></i>
										</span>
										<span class="text" id="${m.memberId}">Page</span>
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
	<script>
	//block클래스 - 정지여부체크박스
	//체크박스를 눌렀을 떄 체크가 되면 차단, 체크 해제되면 차단해제
		$('.block').change(function(e) {
			if($(this).is(':checked')) {
				let id = this.parentElement.parentElement.children[0].textContent;
				const response = confirm(id+"님을 정말 차단하시겠습니까?");
				console.log(this.parentElement.parentElement.children[0].textContent);
				if(response) {
					fetch('ajaxmemberblock.do?mid='+id+'&block=true')
						.then(resolve=>resolve.json())
						.then(result=>console.log(result));
					alert(id+"님이 차단되었습니다.");
				}
			}
			else {
				console.log("체크해제");
				let id = this.parentElement.parentElement.children[0].textContent;
				const response = confirm(id+"님을 정말 차단 해제하시겠습니까?");
				fetch('ajaxmemberblock.do?mid='+id+'&block=false')
					.then(resolve=>resolve.json())
					.then(result=>console.log(result));
				alert(id+"님이 차단 해제되었습니다.");				
			}
		})


		//페이지버튼을 누르면 폼에 해당 회원의 아이디 넣어서 서블릿으로 전송
		$('a').click(function(e) {
			console.log(this.children[1].getAttribute("id"));
			let form = document.getElementById("sform");
			form.mid.value = this.children[1].getAttribute("id");
			form.submit();
		})


	</script>
</body>
</html>