<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  #modal {
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
      
          <!-- 강의 정보 카드 시작 -->
          <div class="row">
            <div class="col-lg-4">
              <div class="card mb-4">
                <div class="card-body text-center">
                    <c:choose>
                        <c:when test="${c.courseImg eq null}">
                            <img src="client/img/product/basic.png" style="width: 200px;">
                        </c:when>
                        <c:otherwise>
                            <img src="client/img/product/${c.courseImg}" style="width: 300px;">
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
              <div class="card mb-4">
                <div class="card-body p-0">
                  <ul class="list-group list-group-flush rounded-3">
                    <!-- 강의를 수강하는 회원 수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-coin fa-lg text-warning"></i> 수강자 수</span>
                      <p class="mb-0">${students}명</p>
                    </li>
                    <!-- 강의 후기 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-check-all fa-lg" style="color: blue;"></i> 강의 후기</span>
                      <p class="mb-0">${reviews}개</p>
                    </li>
                    <!-- 강의에 달린 질문 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="fas fa-question fa-lg" style="color: red;"></i> 강의 질문</span>
                      <p class="mb-0">${questions}개</p>
                    </li>
                    <!-- 강의 별점 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span class="font-weight-bold"><i class="bi bi-bucket-fill fa-lg" style="color: #3b5998;"></i> 강의 별점</span>
                      <div class="d-flex justify-content-center small text-warning mb-2" class="stars" name="${c.courseId}">
                        <c:forEach var = "i" begin = "1" end = "${c.courseStars}">
                          <div class="bi-star-fill"></div>
                        </c:forEach>
                        <c:forEach var = "i" begin = "1" end = "${5 - c.courseStars}">
                          <div class="bi-star"></div>
                        </c:forEach>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- 강의 상세 정보 -->
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
                                무료
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${c.coursePrice }" pattern="#,###" />원
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

          </div>
        </div>
        <!-- 강의 하위 강의 목록들 -->
        <div class="row">
          <div class="col-lg-12">
          <div class="card mb-4 mb-lg-0">
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
                      <th style="width: 30%;">이름</th>
                      <th style="width: 30%;">링크</th>
                      <th style="width: 20%;">시간</th>
                      <th style="width: 10%;">수정</th>
                      <th style="width: 10%;">삭제</th>
                    </tr>
                  </thead>
                  <tbody id="scList">
                    <c:if test="${empty subcourse}">
                      <tr id="empty"><td class="font-weight-bold" colspan="5" style="text-align: center;">서브강의가 없습니다.</td></tr>
                    </c:if>
                    <c:if test="${not empty subcourse}">
                      <c:forEach items="${subcourse }" var="s">
                        <tr value="${s.subcourseId}">
                          <td>${s.subcourseName}</td>
                          <td><a href="${s.subcourseLink}" target="_blank"> ${s.subcourseLink}</a></td>
                          <td>${s.subcourseTime}분</td>
                          <td>
                            <a class="btn btn-secondary btn-icon-split modifySub" onclick="modiSub(${s.subcourseId})">
                              <span class="icon text-white-50">
                                  <i class="fas fa-arrow-right"></i>
                              </span>
                            </a>
                          </td>
                          <td>
                            <a class="btn btn-danger btn-icon-split deleteSub" onclick="delSub(${s.subcourseId})">
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
                      <td colspan="2"><input type="text" style="width: 100%;" placeholder="링크" name="scLink" id="inputLink"></td>
                      <td colspan="2"><input type="text" style="width: 100%;" name="scTime" placeholder="시간(분)" id="inputTime"></td>
                    </tr>
                  </tbody>
                </table>
                <div style="display: none;" class="addInput">
                  <a class="btn btn-primary btn-icon-split" id="ok" onclick="saveSub(${c.courseId})">
                    <span class="icon text-white-50">
                        <i class="fas fa-arrow-right"></i>
                    </span>
                    <span class="text" >완료</span>
                  </a>
              </div>
            </div>
            </div>
          </div>


        </div>
        </div>
      </section>

      <div class="card shadow mb-4" id="modal">
        <div class="card-header py-3 modal-content" style="width: 50%;">
          <h5 class="m-0 mb-2 font-weight-bold text-primary">서브강의 수정</h5>
        <div class="card-body">
          <div class="row" style="width:100%; margin-left:0;">
            <p>강의 이름</p>
            <input class="form-group col-lg-12" id="modalName" placeholder="이름">
            <p>강의 링크</p>
            <textarea class="form-group col-lg-12" id="modalLink" placeholder="링크"></textarea>
            <p>강의 시간(분)</p><br><br>
            <input class="form-group col-lg-3" id="modalTime" placeholder="(분)">
            <br>
          </div>
          <a class="btn btn-primary btn-icon-split" id="sub-modal">
            <span class="icon text-white-50">
                <i class="fas fa-arrow-right"></i>
            </span>
            <span class="text" >완료</span>
          </a>
          <a class="btn btn-danger btn-icon-split" id="close-modal">
            <span class="icon text-white-50">
                <i class="fas fa-trash"></i>
            </span>
            <span class="text" >취소</span>
          </a>
        </div>
        </div>
    </div>


      <!-- 강의 수정 -->
      <form id="sform" action="admincoursemodify.do" method="post">
        <input type="hidden" id="cid" name="cid">
      </form>
      <!-- 서브강의 삭제 -->
      <form id="s2form" action="admincoursedelete.do" method="post">
        <input type="hidden" id="cid" name="cid">
      </form>  
      <script src='admin/js/SubCourse.js'></script>
<script>
  const sc = new SubCourse();
  const fields = ['subcourseName', 'subcourseLink', 'subcourseTime'];
  const modal = document.getElementById("modal");
  const subModalBtn = document.getElementById("sub-modal");
  const closeModalBtn = document.getElementById("close-modal");

  sc.showInfo();

  // console.log(${empty subcourse});
  function saveSub(id) {
    // console.log($('#inputName').val());
    // console.log($('#inputLink').val());
    // console.log($('#inputTime').val());

    let name = $('#inputName').val();
    let link = $('#inputLink').val();
    let time = $('#inputTime').val();
    let cid = id;

    const s = {cId:cid, scName:name, scLink:link, scTime:time};

    sc.subcourseAdd(s, function(data) {
      if(data.retCode == "Success") {
        $('#empty').remove();
        let tr = MakeTr(data.data);
        // console.log(data.data);
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


  function delSub(sid) {
    console.log("삭제누르면실행"+sid);
    const response = confirm("삭제하시겠습니까?");
    if(response) {
      sc.subcourseRemove(sid, function(result) {
        if (result.retCode == "Success") {
          alert("서브강의가 삭제되었습니다.");
          location.reload(true);
        }
        else if(result.retCode == "Fail") {
          alert("처리중 에러");
        }
        else {
          alert("잘못된 코드 반환");
        }
      })
    }
  }

  function modiSub(sid) {
    console.log("수정버튼 누름 : "+sid);

    sc.subcourseSearch(sid, function(result) {
      console.log(result);
      console.log(result.subcourseName);

      $('#modalName').val(result.subcourseName);
      $('#modalLink').val(result.subcourseLink);
      $('#modalTime').val(Math.round(result.subcourseTime/60));

    })
    modal.style.display = "block";
    document.body.style.overflow = "hidden"; // 스크롤바 제거

          //수정 모달 제출
  subModalBtn.addEventListener("click", () => {
      console.log(sid);

      let name = $('#modalName').val();
      let link = $('#modalLink').val();
      let time = $('#modalTime').val()
      let scid = sid;

      const sUpdate = {scId:scid, scName:name, scLink:link, scTime:time};

      sc.subcourseUpdate(sUpdate, function(data) {
        if(data.retCode == 'Success') {
          alert("서브강의가 수정되었습니다.");
        }
        else if(result.retCode == "Fail") {
          alert("처리중 에러");
        }
        else {
          alert("잘못된 코드 반환");
        }

        modal.style.display = "none";
        document.body.style.overflow = "auto";
        location.reload(true);
      })
      });
    
  }

        //수정 모달 취소버튼누르면 닫기
  closeModalBtn.addEventListener("click", () => {
      modal.style.display = "none";
      document.body.style.overflow = "auto"; // 스크롤바 보이기
      });



  

  //서브강의 tr만들기
  function MakeTr (sub) {

			let tr = document.createElement('tr');
      console.log("방금 추가된 sc아이디 : "+sub.subcourseId);
      tr.setAttribute("value",sub.subcourseId);
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
      a.setAttribute("class", "btn btn-secondary btn-icon-split modifySub");
      a.setAttribute("onclick", `modiSub(\${sub.subcourseId})`)
      let span = document.createElement('span');
      span.setAttribute("class","icon text-white-50");
      let i = document.createElement('i');
      i.setAttribute("class", "fas fa-arrow-right modiS");
      span.appendChild(i);
      a.appendChild(span);
      td.appendChild(a);
			tr.appendChild(td);


      td = document.createElement('td');
			a = document.createElement('a');
      a.setAttribute("class", "btn btn-danger btn-icon-split deleteSub");
      // a.setAttribute("id","deleteSub");
      // a.addEventListener('click',delsub);
      a.setAttribute("onclick",`delSub(\${sub.subcourseId})`);
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
        let form = document.getElementById("s2form");
        form.cid.value = id;
        form.submit();
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