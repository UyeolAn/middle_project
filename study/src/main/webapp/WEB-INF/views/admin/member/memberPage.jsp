<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
  <!-- 위에 헤더 -->
    <section style="background-color: #eee;">
        <div class="container py-5">
          <div class="row">
            <div class="col">
              <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                <ol class="breadcrumb mb-0">
                  <li class="breadcrumb-item"><a href="adminhome.do">Home</a></li>
                  <li class="breadcrumb-item"><a href="adminmemberlist.do">회원 목록</a></li>
                  <li class="breadcrumb-item active" aria-current="page">회원 프로필</li>
                </ol>
              </nav>
            </div>
          </div>
      
          <!-- 회원 정보 카드 시작 -->
          <div class="row">
            <div class="col-lg-4">
              <div class="card mb-4">
                <div class="card-body text-center">
                  <img src="admin/img/profile.svg" alt="avatar"
                    class="rounded-circle img-fluid" style="width: 150px;">
                  <h5 class="my-3">${m.memberName}</h5>
                      <!-- 차단 여부 표시 -->
                      <!-- 차단 당한 회원이면 계정정지해제버튼 -->
                      <!-- 차단 아닌 회원이면 계정정지버튼 -->
                    <c:choose>
                        <c:when test="${m.memberStopDate ne null}">
                            <p class="font-weight-bold text-danger">차단당한 회원</p>
                            <button type="button" class="btn btn-primary" id="non-block">계정 정지 해제</button>                  
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-outline-primary ms-1" id="block">계정 정지</button>
                        </c:otherwise>
                    </c:choose>
                </div>
              </div>
              <!-- 회원이 쓴 커뮤니티 및 정보 불러옴 -->
              <div class="card mb-4 mb-lg-0">
                <div class="card-body p-0">
                  <ul class="list-group list-group-flush rounded-3">
                    <!-- 회원이 수강하는 강의의 가격 합 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-coin fa-lg text-warning"></i> 수강 강의 가격 합</span>
                      <p class="mb-0">${price}원</p>
                    </li>
                    <!-- 회원이 쓴 리뷰 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-check-all fa-lg" style="color: blue;"></i> 회원이 쓴 후기</span>
                      <p class="mb-0">${review}개</p>
                    </li>
                    <!-- 회원이 쓴 댓글 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-indent fa-lg" style="color: #55acee;"></i> 회원이 쓴 댓글</span>
                      <p class="mb-0">${reply}개</p>
                    </li>
                    <!-- 회원이 쓴 질문 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-question-circle fa-lg" style="color: #ac2bac;"></i> 회원이 쓴 질문</span>
                      <p class="mb-0">${question}개</p>
                    </li>
                    <!-- 회원이 담은 장바구니 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-bucket-fill fa-lg" style="color: #3b5998;"></i> 회원이 담은 장바구니</span>
                      <p class="mb-0">${bucket}개</p>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- 회원 상세 정보 -->
            <div class="col-lg-8">
              <div class="card mb-4">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">Name</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberName}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">ID</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberId}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">Email</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberEmail}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">Tel</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberTel}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">Address</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberAddress}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">Enter Date</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberEnterDate}</p>
                    </div>
                  </div>
                </div>
              </div>

              <!-- 강의 별 진도율 -->
              <!-- 서블릿에서 함께 넘겨줌 -->
              <div class="row">
                <div class="col-md-6">
                  <div class="card mb-4">
                    <div class="card-body">
                      <p class="mb-4"><span class="text-primary font-italic me-1">강의 별 진도율</span></p>
                      <!-- 서블릿에서 mclist로 담아서 보내줌 -->
                      <c:if test="${empty mclist}">
                        <div style="width: 100%;">
                          <span class="font-weight-bold" style="text-align: center;">수강하는 강의가 없습니다.</span>
                        </div>
                      </c:if>
                      <c:if test="${not empty mclist}">
                        <c:forEach items="${mclist }" var="c">
                          <p class="mt-4 mb-1" style="font-size: .77rem;">
                            <span class="cid" name=${c.courseId}>${c.courseName} 
                              <!-- 강의 이름 옆에 괄호로 진도율 표시 -->
                              (${c.jindo}%)
                            </span>
                          </p>
                          <!-- 차트 진도율만큼 그려줌 -->
                          <div class="progress rounded" style="height: 5px;">
                            <div class="progress-bar" role="progressbar" style="width: ${c.jindo}%" aria-valuenow="80"
                              aria-valuemin="0" aria-valuemax="100" id=${c.courseId}>
                            </div>
                          </div>
                        </c:forEach>
                      </c:if>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="card mb-4 h-100">
                    <div class="card-body" style="height: 100px;">
                      <h5 class="card-title">Pie Chart</h5>
                      <div class="chart-pie pt-4" style="height: 100px;">
                        <canvas id="myPieChart" style="height: 100px;"></canvas>
                    </div>
                      <!-- End Pie Chart -->
                    </div>
                  </div>
                </div>
              </div>


            </div>
          </div>
        </div>
      </section>
    <script src="admin/js/demo/chart-pie-demo.js"></script>
      <script>

//      해당 회원의 아이디 저장
        let id = "${m.memberId}";
        
        //차단 및 차단해제 기능

        //차단이 아닌 회원을 차단할 때
        $('#block').click(function(e) {
			    const response = confirm(id+"님을 정말 차단하시겠습니까?");
          if(response) {
					fetch('ajaxmemberblock.do?mid='+id+'&block=true')
						.then(resolve=>resolve.json())
						.then(result=>console.log(result));
					alert(id+"님이 차단되었습니다.");
          console.log($('#blockdiv').children[0]);

          // 차단이 완료되면 페이지 재로딩
          location.reload(true);
			    }
          else {
            console.log("차단 실패");
          }
        })

        //차단이 회원을 차단 해제할 때
        $('#non-block').click(function (e) {
            const response = confirm(id+"님을 정말 차단 해제하시겠습니까?");
            if(response) {
              fetch('ajaxmemberblock.do?mid='+id+'&block=false')
                  .then(resolve=>resolve.json())
                  .then(result=>console.log(result));
              alert(id+"님이 차단 해제되었습니다.");
  
              // 차단 해제 후 페이지 재로딩
              location.reload(true);
            }
            else {
              console.log("차단 해제 실패");
            }
        })


      </script>
      
</body>
</html>