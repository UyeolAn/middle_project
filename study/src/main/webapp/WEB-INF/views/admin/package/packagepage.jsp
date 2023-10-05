<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>
            td, th{
                text-align: center;
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
        <!-- private int packageId;
	private String packageTitle;
	private String packageScript;
	private int packageDiscount = -1;
	private String packageThumbnail;
	private String packageImg;
	private String packageCategory;
	private String packageGrade; -->

        <section style="background-color: #eee; padding: 10px;">


                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="adminhome.do">Home</a></li>
                                <li class="breadcrumb-item"><a href="adminpackagelist.do">패키지 목록</a></li>
                                <li class="breadcrumb-item active" aria-current="page">패키지 조회</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <img src="client/img/product/${p.packageThumbnail}" style="width: 100%;" onclick="window.open(this.src)">
                                <h6 class="my-3 font-weight-bold">${p.packageTitle}</h6>
                                <a class="btn btn-secondary btn-icon-split" onclick="modify(${p.packageId})">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-arrow-right"></i>
                                    </span>
                                    <span class="text" id="${p.packageId}">수정</span>
                                </a>
                                <a class="btn btn-danger btn-icon-split" onclick='remove(${p.packageId})'>
                                    <span class="icon text-white-50">
                                        <i class="fas fa-trash"></i>
                                    </span>
                                    <span class="text" id="${p.packageId}">삭제</span>
                                </a>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <h6 class="font-weight-bold">패키지 설명 이미지</h6>
                                <img src="client/img/product/${p.packageImg}" style="width:100%;" onclick="window.open(this.src)">
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0 font-weight-bold">패키지명</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${p.packageTitle}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0 font-weight-bold">패키지 아이디</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${p.packageId}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0 font-weight-bold">패키지 설명</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${p.packageScript}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0 font-weight-bold">패키지 할인율</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">
                                            <c:choose>
                                                <c:when test="${original eq 0}">
                                                    무료
                                                </c:when>
                                                <c:otherwise>
                                                    ${p.packageDiscount}%
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0 font-weight-bold">가격</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <c:choose>
                                            <c:when test="${original eq 0}">
                                                무료
                                            </c:when>
                                            <c:otherwise>
                                                <p class="text-muted mb-0"><del>
                                                <fmt:formatNumber value="${original }" pattern="#,###" />원
                                                </del>=> 
                                                <fmt:formatNumber value="${sale }" pattern="#,###" />원
                                                </p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0 font-weight-bold">패키지 난이도</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">
                                            <c:choose>
                                                <c:when test="${p.packageGrade eq 'easy'}">
                                                    하
                                                </c:when>
                                                <c:when test="${p.packageGrade eq 'normal'}">
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
                                        <p class="mb-0 font-weight-bold">패키지 메인 카테고리</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${p.packageCategory}</p>
                                    </div>
                                </div>
                            </div>
                        </div>


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
                                      <th style="width: 15%;">아이디</th>
                                      <th style="width: 40%;">강의명</th>
                                      <th style="width: 15%;">가격</th>
                                      <th style="width: 20%;">강사</th>
                                      <th style="width: 10%;">삭제</th>
                                    </tr>
                                  </thead>
                                  <tbody id="scList">
                                    <c:if test="${empty clist}">
                                      <tr id="empty"><td class="font-weight-bold" colspan="5" style="text-align: center;">등록된 강의가 없습니다.</td></tr>
                                    </c:if>
                                    <c:if test="${not empty clist}">
                                      <c:forEach items="${clist }" var="c">
                                        <tr value="${c.courseId}">
                                          <td>${c.courseId}</td>
                                          <td>${c.courseName}</td>
                                          <td><fmt:formatNumber value="${c.coursePrice }" pattern="#,###" />원</td>
                                          <td>${c.courseTeacher}</td>
                                          <td>
                                            <a class="btn btn-danger btn-icon-split deleteSub" onclick="delSub(${c.courseId})">
                                              <span class="icon text-white-50">
                                                  <i class="fas fa-trash"></i>
                                              </span>
                                            </a>
                                          </td>
                                        </tr>
                                      </c:forEach>
                                    </c:if>
                                    <!-- <tr style="display: none;" class="addInput" id="lasttable">
                                      <td><input type="text" style="width: 100%;" placeholder="이름" name="scName" id="inputName"></td>
                                      <td colspan="2"><input type="text" style="width: 100%;" placeholder="링크" name="scLink" id="inputLink"></td>
                                      <td colspan="2"><input type="text" style="width: 100%;" name="scTime" placeholder="시간(분)" id="inputTime"></td>
                                    </tr> -->
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

            <div class="card shadow mb-4" id="modal">
                <div class="card-header py-3 modal-content" style="width: 50%;">
                    <h5 class="m-0 mb-2 font-weight-bold text-primary" id="modalTitle">강의 추가</h5>
                    <div class="card-body">
                        <form id="frm2" class="row">
                            <!-- <div class="form-group  col-12">
                                <label id="contlabel" class="font-weight-bold" style="display: block;">${p.packageCategory}</label>
                                    <c:forEach items="${catelist}" var="c">
                                        <label><input type="checkbox" name="course" value="${c.courseId}">${c.courseName} (${c.courseSubCategory})</label>
                                        <br>
                                    </c:forEach>

                            </div> -->

                            <div class="form-group col-12">
                                <label id="contlabel" class="font-weight-bold" style="display: block;"><h4>[${p.packageCategory}]</h4></label>
                                <div id="courseList">
                                    <!-- 서브 카테고리별로 그룹화하여 표시합니다. -->
                                    <c:forEach items="${sublist}" var="s">
                                        <h6 class="text-primary font-weight-bold">
                                        ${fn:toUpperCase(s)}
                                        </h6>
                                        <c:forEach items="${catelist}" var="c">
                                            <c:if test="${s == c.courseSubCategory}">
                                                <label><input type="checkbox" name="course" value="${c.courseId}">${c.courseName}</label>
                                                <br>
                                            </c:if>
                                        </c:forEach>
                                        <br>
                                    </c:forEach>
                                </div>
                            </div>
                            

                            <!-- <div class="form-group col-12">
                                <label id="contlabel" class="font-weight-bold" style="display: block;">${p.packageCategory}</label>
                                <select id="subCategorySelect">
                                    <option value="All">All</option>
                                    <c:forEach items="${catelist}" var="c">
                                        <option value="${c.courseSubCategory}">${c.courseSubCategory}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-12" id="courseList">
                                <c:forEach items="${catelist}" var="c">
                                    <label><input type="checkbox" name="course" value="${c.courseId}">${c.courseName} (${c.courseSubCategory})</label>
                                    <br>
                                </c:forEach>
                            </div> -->
        
                        </form>
                        <a class="btn btn-primary btn-icon-split" id="sub-modal">
                            <span class="icon text-white-50">
                                <i class="fas fa-arrow-right"></i>
                            </span>
                            <span class="text">완료</span>
                        </a>
                        <a class="btn btn-danger btn-icon-split" id="close-modal">
                            <span class="icon text-white-50">
                                <i class="fas fa-trash"></i>
                            </span>
                            <span class="text">취소</span>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <form id="sform" action="adminpackagedelete.do" method="post">
            <input type="hidden" id="pid" name="pid">
        </form> 
        <form id="s2form" action="adminpackagemodify.do" method="post">
            <input type="hidden" id="pid" name="pid">
        </form> 
        <script src='admin/js/PackageCourse.js'></script>
    <script>
    //      document.addEventListener("DOMContentLoaded", function () {
    //     const subCategorySelect = document.getElementById("subCategorySelect");
    //     const subCategories = Array.from(subCategorySelect.options).map(option => option.value);
    //     const uniqueSubCategories = Array.from(new Set(subCategories));

    //     subCategorySelect.innerHTML = "";
    //     uniqueSubCategories.forEach(subCategory => {
    //         const option = document.createElement("option");
    //         option.value = subCategory;
    //         option.text = subCategory;
    //         subCategorySelect.appendChild(option);
    //     });
    // });

    // document.addEventListener("DOMContentLoaded", function () {
    //     const subCategorySelect = document.getElementById("subCategorySelect");
    //     const courseList = document.getElementById("courseList");
    //     const checkboxes = courseList.querySelectorAll('[name="course"]');
        
    //     subCategorySelect.addEventListener("change", function () {
    //         const selectedSubCategory = subCategorySelect.value;
            
    //         // 모든 강의를 숨김
    //         checkboxes.forEach(function (checkbox) {
    //             checkbox.parentNode.style.display = "none";
    //         });
            
    //         // 선택한 서브 카테고리에 해당하는 강의만 보이도록 함
    //         checkboxes.forEach(function (checkbox) {
    //             const courseSubCategory = checkbox.nextElementSibling.textContent.split('(')[1].split(')')[0];
    //             if (selectedSubCategory === "" || courseSubCategory === selectedSubCategory) {
    //                 checkbox.parentNode.style.display = "block";
    //             }
    //         });
    //     });
    // });



        const pc = new PackageCourse();
        const modal = document.getElementById("modal");
        const subModalBtn = document.getElementById("sub-modal");
        const closeModalBtn = document.getElementById("close-modal");

        //모달창 닫기
        closeModalBtn.addEventListener("click", () => {
            modal.style.display = "none";
            document.body.style.overflow = "auto"; // 스크롤바 보이기
        });

        function addSub() {
            modal.style.display = "block";
            document.body.style.overflow = "hidden";
        }

        //하위강의 추가
        $('#sub-modal').click(function() {
            var checkArr = [];
            let num = 0;
            $('input[name=course]:checked').each(function() {
                checkArr.push($(this).val());
                let cval = $(this).val();
                let pval = ${p.packageId};
                
                // console.log($(this).val());
                const p = {pid:pval,cid:cval};
                pc.courseAdd(p, function(data){
                    if(data.retCode == "Success") {
                        num++;
                        // location.reload(true);
                    }
                    else if (data.retCode == "Fail" ) {
                            alert("처리 중 에러");
                            return false;
                    }
                    else {
                        alert("알 수 없는 반환코드");
                        return false;
                    }
                })
            })

                alert("모두 추가되었습니다.");
                location.reload(true);

        })


        //하위강의 삭제
        function delSub(id) {
            console.log("삭제할 묶음 "+${p.packageId}+", "+id);
            let pid = ${p.packageId};
            let cid = id;
            const response = confirm("삭제하시겠습니까?");
            const p = {pid:pid, cid:cid};
            if(response) {
                pc.courseRemove(p, function(data) {
                    if(data.retCode == "Success") {
                        alert("삭제되었습니다.");
                        location.reload(true);

                    }
                    else if (data.retCode == "Fail" ) {
                            alert("처리 중 에러");
                    }
                    else {
                        alert("알 수 없는 반환코드");
                    }
                })
            }
        }


        function remove(id) {
            const response = confirm("삭제하시겠습니까?");
            console.log(id);
            console.log(name);
            if(response) {
                    let form = document.getElementById("sform");
                    form.pid.value = id;
                    form.submit();
                }
        }

        function modify(id) {
            let form = document.getElementById("s2form");
            form.pid.value = id;
            form.submit();
        }
    </script>
    </body>

    </html>