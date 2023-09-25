<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    td{
        text-align: center;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
    <h1 class="h3 mb-2 text-gray-800">질문 목록</h1>
	<p class="mb-4">
		질문관리 페이지
	</p>



	<!-- 테이블 시작 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-dark">Question List</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable"  width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>작성자</th>
							<th>제목</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
							<th>해결 유무</th>
                            <th>상세조회</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>작성자</th>
							<th>제목</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
							<th>해결 유무</th>
                            <th>상세조회</th>
						</tr>
					</tfoot>
					<tbody>
						<!-- 회원정보 동적으로 불러옴 -->
						<c:forEach items="${qlist }" var="q">
                            <tr>
								<td>${q.memberId }</td>
								<td>${q.questionTitle }</td>
								<td>${q.questionEnterDate }</td>
								<td>${q.questionUpdateDate }</td>
								<td>${q.questionHit }</td>
                                <!-- <td>${q.questionSolve}</td> -->
								<!-- 정지계정여부 체크 표시 -->
								<c:choose>
									<c:when test="${q.questionSolve eq 'solve'}">
										<td>Y</td>
									</c:when>
									<c:otherwise>
										<td style="color: red;">N</td>
									</c:otherwise>
								</c:choose>
								<!-- 회원 상세페이지로 이동 버튼 -->
								<td>
									<a class="btn btn-secondary btn-icon-split">
										<span class="icon text-white-50">
											<i class="fas fa-arrow-right"></i>
										</span>
										<span class="text search" id="${q.questionId}">조회</span>
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
		<form id="sform" action="adminquestionpage.do" method="post">
			<input type="hidden" id="qid" name="qid">
		</form> 
	</div>

<script>
    let sform = document.getElementById('sform');

    $('.search').click(function() {
        console.log(this.id);
        sform.qid.value = this.id;
        sform.submit();
    })
</script>
</body>
</html>