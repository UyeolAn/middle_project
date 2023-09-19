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
    <!-- <div class="card shadow mb-4" style="padding: 20px;" >
            <img src="admin/img/profile.svg" width="100px" style="margin: 20px;">
            이름 : ${m.memberName}<br>
            아이디 : ${m.memberId}<br>
            전화번호 : ${m.memberTel}<br>
            주소 : ${m.memberAddress}<br>
            이메일 : ${m.memberEmail}<br>
            가입일 : ${m.memberEnterDate}<br>
            정지여부 : 
            <c:if test="${m.memberStopDate ne null}">Y
                <br>정지일 : ${m.memberStopDate}
            </c:if>
            <c:if test="${m.memberStopDate eq null}">N</c:if>
    </div> -->
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
      
          <div class="row">
            <div class="col-lg-4">
              <div class="card mb-4">
                <div class="card-body text-center">
                  <img src="admin/img/profile.svg" alt="avatar"
                    class="rounded-circle img-fluid" style="width: 150px;">
                  <h5 class="my-3">${m.memberName}</h5>
                  <!-- <p class="text-muted mb-1">Full Stack Developer</p> -->
                  <!-- <div class="d-flex justify-content-center mb-2 d-flex-column-revers"> -->
                    <c:choose>
                        <c:when test="${m.memberStopDate ne null}">
                            <p>차단당한 회원</p>
                            <button type="button" class="btn btn-primary" id="non-block">계정 정지 해제</button>                  
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-outline-primary ms-1" id="block">계정 정지</button>
                        </c:otherwise>
                    </c:choose>
                <!-- </div> -->
                  <!-- <p class="text-muted mb-4">Bay Area, San Francisco, CA</p> -->
                </div>
              </div>
              <div class="card mb-4 mb-lg-0">
                <div class="card-body p-0">
                  <ul class="list-group list-group-flush rounded-3">
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <i class="fas fa-globe fa-lg text-warning"></i>
                      <p class="mb-0">https://mdbootstrap.com</p>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <i class="fab fa-github fa-lg" style="color: #333333;"></i>
                      <p class="mb-0">mdbootstrap</p>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                      <p class="mb-0">@mdbootstrap</p>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                      <p class="mb-0">mdbootstrap</p>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                      <p class="mb-0">mdbootstrap</p>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-lg-8">
              <div class="card mb-4">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Name</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberName}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">ID</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberId}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Email</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberEmail}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Tel</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberTel}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Address</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberAddress}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Enter Date</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${m.memberEnterDate}</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="card mb-4">
                    <div class="card-body">
                      <p class="mb-4"><span class="text-primary font-italic me-1">강의 별 진도율</span></p>
                      <c:forEach items="${courses }" var="c">
                        <p class="mt-4 mb-1" style="font-size: .77rem;"><span class="cid" name=${c.courseId}>${c.courseName}</span></p>
                        <div class="progress rounded" style="height: 5px;">
                          <div class="progress-bar" role="progressbar" style="width: ${c.jindo}" aria-valuenow="80"
                            aria-valuemin="0" aria-valuemax="100" id=${c.courseId}></div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                    <div class="col-xl-12 col-lg-12">
                        <div class="card shadow mb-12">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-pie pt-4">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <hr>
                                Styling for the donut chart can be found in the
                                <code>/js/demo/chart-pie-demo.js</code> file.
                            </div>
                        </div>
                    </div>
                  </div>
                <!-- <div class="col-md-6">
                  <div class="card mb-4 mb-md-0">
                    <div class="card-body">
                      <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span> Project Status
                      </p>
                      <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                      <div class="progress rounded" style="height: 5px;">
                        <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                      <div class="progress rounded" style="height: 5px;">
                        <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                      <div class="progress rounded" style="height: 5px;">
                        <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                      <div class="progress rounded" style="height: 5px;">
                        <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                      <div class="progress rounded mb-2" style="height: 5px;">
                        <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </div> -->
              </div>
            </div>
          </div>
        </div>
      </section>
      <script>

        let id = "${m.memberId}";
        
        $('#block').click(function(e) {
			const response = confirm(id+"님을 정말 차단하시겠습니까?");
            if(response) {
					fetch('ajaxmemberblock.do?mid='+id+'&block=true')
						.then(resolve=>resolve.json())
						.then(result=>console.log(result));
					alert(id+"님이 차단되었습니다.");
                    console.log($('#blockdiv').children[0]);
                    location.reload(true);
			}
        })

        $('#non-block').click(function (e) {
            let id = "${m.memberId}";
            const response = confirm(id+"님을 정말 차단 해제하시겠습니까?");
            fetch('ajaxmemberblock.do?mid='+id+'&block=false')
                .then(resolve=>resolve.json())
                .then(result=>console.log(result));
            alert(id+"님이 차단 해제되었습니다.");
            location.reload(true);
        })

        // console.log( document.querySelectorAll('span.cid')[1].getAttribute("name"));
        let cids = [];
        cids = document.querySelectorAll('span.cid');
        for(let i = 0; i < cids.length; i++) {
            let cid = cids[i].getAttribute("name");
            console.log(cids[i].getAttribute("name"));
            fetch('coursenameselect.do?cid='+cid)
            .then(resolve=> resolve.json())
            .then(result=> inputCourseName(result.course.courseName,cid));

            fetch('adminmemberjindo.do?cid='+cid+'&mid='+id)
            .then(resolve=>resolve.json())
            .then(result=>inputJindo(result.jindo,cid));

        } 
  
        function inputJindo(jindo,cid) {
            console.log(cid);
            console.log($(`#`+cid).css("width",jindo+`%`));
            console.log(jindo);
            // $('div[name='+cid+']').getAttribute("width");
            
        }

        function inputCourseName(name,cid) {
            console.log(name);
            // $('span.cid').text(name);
            $(`span[name=`+cid+']').text(name);
        }

      </script>
      
</body>
</html>