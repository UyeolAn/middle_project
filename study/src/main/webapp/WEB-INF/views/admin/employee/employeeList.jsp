<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <div style="overflow:auto; width:100%; height:100%;">
  <c:forEach items="${elist}" var="e">
    <!-- Dropdown Card Example -->
    <div class="card shadow mb-4 col-lg-12">
        <!-- Card Header - Dropdown -->
        <div
            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">${e.memberName}</h6>
            <div class="dropdown no-arrow">
                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                    aria-labelledby="dropdownMenuLink">
                    <div class="dropdown-header">메뉴</div>
                    <div class="dropdown-item" onclick="remove('${e.memberId}')">삭제</div>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </div>
        </div>
        <!-- Card Body -->
        <div class="card-body row">
          <div class=" col-lg-2">
            <img src="admin/img/profile.svg" alt="avatar"
            class="rounded-circle img-fluid" style="width: 150px;">
          </div>
          <div class="row col-lg-5">
              <div class="col-lg-3">
                <p class="mb-0 font-weight-bold">이름</p>
              </div>
              <div class="col-lg-9">
                <p class="text-muted mb-0">${e.memberName}</p>
              </div>
              <hr>

              <div class="col-lg-3">
                <p class="mb-0 font-weight-bold">연락처</p>
              </div>
              <div class="col-lg-9">
                <p class="text-muted mb-0">${e.memberTel}</p>
              </div>
              <hr>

              <div class="col-lg-3">
                <p class="mb-0 font-weight-bold">이메일</p>
              </div>
              <div class="col-lg-9">
                <p class="text-muted mb-0">${e.memberEmail}</p>
              </div>
              <hr>
          </div>
          <div class="row col-lg-5">
            <div class="col-lg-3">
              <p class="mb-0 font-weight-bold">아이디</p>
            </div>
            <div class="col-sm-9">
              <p class="text-muted mb-0">${e.memberId}</p>
            </div>
            <hr>

            <div class="col-lg-3">
              <p class="mb-0 font-weight-bold">주소</p>
            </div>
            <div class="col-lg-9">
              <p class="text-muted mb-0">${e.memberAddress}</p>
            </div>
            <hr>

            <div class="col-lg-3">
              <p class="mb-0 font-weight-bold">입사일</p>
            </div>
            <div class="col-lg-9">
              <p class="text-muted mb-0">${e.memberEnterDate}</p>
            </div>
            <hr>
          </div>
        </div>
    </div>
  </c:forEach>
</div>
<script>

  function remove(id) {
    console.log(id);
			const response = confirm("삭제하시겠습니까?");
			if(response) {
					fetch('adminemployeedelete.do?eid='+id)
						.then(resolve=>resolve.json())
						.then(result=> {
              if(result.retCode == 'Success') {
                alert("삭제하였습니다.");
                location.reload(true);
              }
              else {
                alert("실패하였습니다.");
                location.reload(true);
              }
            });
					// location.reload(true);
				}
		}

</script>
</body>
</html>