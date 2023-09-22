<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
  td, th {
    text-align: center;
    line-height: 100%;
  }
</style>
</head>
<body>
    <section style="background-color: #eee;">
        <div class="container py-5">
          <div class="row">
            <div class="col">
              <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                <ol class="breadcrumb mb-0">
                  <li class="breadcrumb-item"><a href="adminhome.do">Home</a></li>
                  <li class="breadcrumb-item"><a href="admincourselist.do">강의 목록</a></li>
                  <li class="breadcrumb-item active" aria-current="page">강의 조회</li>
                </ol>
              </nav>
            </div>
          </div>
      
          <!-- 회원 정보 카드 시작 -->
          <div class="row">
            <div class="col-lg-4">
              <div class="card mb-4">
                <div class="card-body text-center">
                    <c:choose>
                        <c:when test="${c.courseImg eq null}">
                            <img src="client/img/product/basic.png" style="width: 200px;">
                        </c:when>
                        <c:otherwise>
                            <img src="client/img/product/${c.courseImg}" style="width: 200px;">
                        </c:otherwise>
                    </c:choose>
                  <h6 class="my-3 font-weight-bold">${c.courseName}</h6>
                    <a class="btn btn-secondary btn-icon-split modify">
                        <span class="icon text-white-50">
                            <i class="fas fa-arrow-right"></i>
                        </span>
                        <span class="text" id="${c.courseId}">수정</span>
                    </a>
                    <a class="btn btn-danger btn-icon-split" onclick='remove(${c.courseId})'>
                        <span class="icon text-white-50">
                            <i class="fas fa-trash"></i>
                        </span>
                        <span class="text" id="${c.courseId}">삭제</span>
                    </a>
                </div>
              </div>
              <!-- 강의 여러 정보 불러옴 -->
              <div class="card mb-4 mb-lg-0">
                <div class="card-body p-0">
                  <ul class="list-group list-group-flush rounded-3">
                    <!-- 강의를 수강하는 회원 수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-coin fa-lg text-warning"></i> 수강자 수</span>
                      <p class="mb-0">${students}명</p>
                    </li>
                    <!-- 회원이 쓴 리뷰 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-check-all fa-lg" style="color: blue;"></i> 강의 후기</span>
                      <p class="mb-0">${reviews}개</p>
                    </li>
                    <!-- 회원이 쓴 댓글 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-indent fa-lg" style="color: #55acee;"></i> 강의 질문</span>
                      <p class="mb-0">${questions}개</p>
                    </li>
                    <!-- 회원이 쓴 질문 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-question-circle fa-lg" style="color: #ac2bac;"></i> 채울까말까</span>
                      <p class="mb-0">개</p>
                    </li>
                    <!-- 회원이 담은 장바구니 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-bucket-fill fa-lg" style="color: #3b5998;"></i> 강의 별점</span>
                      <div class="d-flex justify-content-center small text-warning mb-2" class="stars" name="${c.courseId}">
                        <c:forEach var = "i" begin = "1" end = "${c.courseStars}">
                          <div class="bi-star-fill"></div>
                        </c:forEach>
                      </div>
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
                      <p class="mb-0 font-weight-bold">강의명</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${c.courseName}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">강의 아이디</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${c.courseId}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">강의 설명</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${c.courseScript}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">강의 가격</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">
                        <c:choose>
                            <c:when test="${c.coursePrice eq 0}">
                                FREE
                            </c:when>
                            <c:otherwise>
                                ${c.coursePrice}원
                            </c:otherwise>
                        </c:choose>
                    </p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">강의 난이도</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">
                        <c:choose>
                          <c:when test="${c.courseGrade eq 'easy'}">
                            하
                          </c:when>
                          <c:when test="${c.courseGrade eq 'normal'}">
                            중
                          </c:when>
                          <c:otherwise>
                            상
                          </c:otherwise>
                      </c:choose>
                      </p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">강의 메인 카테고리</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${c.courseMainCategory}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0 font-weight-bold">강의 상세 카테고리</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${c.courseSubCategory}</p>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card mb-4">
                <div class="card-header py-3" style="display: flex; justify-content: space-between;">
                  <h6 class="m-0 font-weight-bold text-primary" style="line-height: 38px;">하위 강의 목록</h6>
                  <a class="btn btn-primary btn-icon-split" id="add" onclick="addSub()">
                    <span class="icon text-white-50">
                        <i class="fas fa-arrow-right"></i>
                    </span>
                    <span class="add text" id="addBtn">추가</span>
                  </a>
                </div>
                <div class="card-body " data-spy="scroll">
            			<div class="table-responsive">
                    <table class="table table-bordered" id="dataTable"  width="100%" cellspacing="0">
                      <thead>
                        <tr>
                          <th style="width: 60%;">이름</th>
                          <th style="width: 10%;">링크</th>
                          <th style="width: 15%;">시간</th>
                          <th style="width: 5%;">수정</th>
                          <th style="width: 5%;">삭제</th>
                        </tr>
                      </thead>
                      <tbody id="scList">
                        <c:if test="${empty subcourse}">
                          <tr><td class="font-weight-bold" colspan="3" style="text-align: center;">서브강의가 없습니다.</td></tr>
                        </c:if>
                        <c:if test="${not empty subcourse}">
                          <c:forEach items="${subcourse }" var="s">
                            <tr>
                              <td>${s.subcourseName}</td>
                              <td><a href="${s.subcourseLink}" target="_blank"> ${s.subcourseLink}</a></td>
                              <td>${s.subcourseTime}분</td>
                              <td>
                                <a class="btn btn-secondary btn-icon-split">
                                  <span class="icon text-white-50">
                                      <i class="fas fa-arrow-right"></i>
                                  </span>
                                </a>
                              </td>
                              <td>
                                <a class="btn btn-danger btn-icon-split" id="deleteSub" onclick="delSub()">
                                  <span class="icon text-white-50">
                                      <i class="fas fa-trash"></i>
                                  </span>
                                </a>
                              </td>
                            </tr>
                          </c:forEach>
                        </c:if>
                        <tr style="display: none;" class="addInput" id="lasttable">
                          <td><input type="text" style="width: 100%;" placeholder="이름" name="scName" id="inputName"></td>
                          <td><input type="text" style="width: 100%;" placeholder="링크" name="scLink" id="inputLink"></td>
                          <td colspan="3"><input type="text" style="width: 100%;" name="scTime" placeholder="시간(분)" id="inputTime"></td>
                        </tr>
                      </tbody>
                    </table>
                    <div style="display: none;" class="addInput">
                      <a class="btn btn-primary btn-icon-split" id="ok" onclick="saveSub(${c.courseId})">
                        <span class="icon text-white-50">
                            <i class="fas fa-arrow-right"></i>
                        </span>
                      </a>
                  </div>
                </div>
              </div>


            </div>

          </div>
        </div>
      </section>
      <form id="sform" action="admincoursemodify.do" method="post">
        <input type="hidden" id="cid" name="cid">
      </form> 
      <script src='admin/js/SubCourse.js'></script>
<script>
  const sc = new SubCourse();
  const fields = ['subcourseName', 'subcourseLink', 'subcourseTime'];

  sc.showInfo();

  // console.log(${empty subcourse});
  function saveSub(id) {
    console.log($('#inputName').val());
    console.log($('#inputLink').val());
    console.log($('#inputTime').val());

    let name = $('#inputName').val();
    let link = $('#inputLink').val();
    let time = $('#inputTime').val();
    let cid = id;

    const s = {cId:cid, scName:name, scLink:link, scTime:time};

    sc.subcourseAdd(s, function(data) {
      if(data.retCode == "Success") {
        let tr = MakeTr(data.data);
        $('#lasttable').before(tr);

        $('#inputName').val("");
        $('#inputLink').val("");
        $('#inputTime').val("");
        // location.reload(true);

      }
      else if (data.retCode == "Fail" ) {
					alert("처리 중 에러");
      }
      else {
        alert("알 수 없는 반환코드");
      }
    })
  }

  $('#deleteSub').addEventListener("click", delSub);
  function delSub(e) {
    // console.log(e.target);
    console.log(e);
    // sc.subcourseDel(sid, function(result) {
    // })
  }

  

  function MakeTr (sub) {

			let tr = document.createElement('tr');
			// tr.setAttribute('subcourseId', reply.replyId);
			// tr.addEventListener('dblclick', showEditForm);
			for (let prop of fields) {
				let td = document.createElement('td');
				if(prop == 'subcourseLink') {
          let a = document.createElement('a');
          a.setAttribute("href", sub[prop]);
          a.setAttribute("target","_blank");
					a.innerText = sub[prop];
          td.appendChild(a);
				}
        else if(prop == 'subcourseTime') {
          let time = sub[prop] / 60;
          td.innerText = time+"분";
        }
				else {
					td.innerText = sub[prop];
				}
				tr.appendChild(td);
			}
			let td = document.createElement('td');
			let a = document.createElement('a');
      a.setAttribute("class", "btn btn-secondary btn-icon-split");
      let span = document.createElement('span');
      span.setAttribute("class","icon text-white-50");
      let i = document.createElement('i');
      i.setAttribute("class", "fas fa-arrow-right");
      span.appendChild(i);
      a.appendChild(span);
      td.appendChild(a);
			tr.appendChild(td);


      td = document.createElement('td');
			a = document.createElement('a');
      a.setAttribute("class", "btn btn-danger btn-icon-split");
      a.setAttribute("id","deleteSub");
      a.addEventListener('click',delsub);
      // a.setAttribute("onclick","delSub()");
      span = document.createElement('span');
      span.setAttribute("class","icon text-white-50");
      i = document.createElement('i');
      i.setAttribute("class", "fas fa-trash");
      span.appendChild(i);
      a.appendChild(span);
      td.appendChild(a);

			// btn.addEventListener('click', deleteReplyFnc );
			// td.appendChild(btn);
			// document.getElementById('replyList').appendChild(tr);
      

			tr.appendChild(td);
			return tr;
		}

  function addSub() {
    $('.addInput').css("display","");
    console.log($('#addBtn').attr("class"));
    if($('#addBtn').attr("class") == 'add text') {
      console.log("추가버튼 누름");
      $('#addBtn').text("취소");
      $('.addInput').css("display","");
      $('#addBtn').attr("class", "cancel text");
    }
    else if ($('#addBtn').attr("class") == 'cancel text') {
      console.log("취소버튼 누름");
      $('#addBtn').text("추가");
      $('.addInput').css("display","none");
      $('#addBtn').attr("class", "add text");

    }
    // $('.addBtn').attr("class", "cancelBtn");
  }


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

$('.modify').click(function(e) {
  console.log(this.children[1].getAttribute("id"));
  let form = document.getElementById("sform");
  form.cid.value = this.children[1].getAttribute("id");
  form.submit();
})


</script>
</body>
</html>