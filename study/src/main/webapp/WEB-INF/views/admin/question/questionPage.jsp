<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<style>
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
          <div class="row">
            <div class="col">
              <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                <ol class="breadcrumb mb-0">
                  <li class="breadcrumb-item"><a href="adminhome.do">Home</a></li>
                  <li class="breadcrumb-item"><a href="adminquestionlist.do">질문 목록</a></li>
                  <li class="breadcrumb-item active" aria-current="page">질문 조회</li>
                </ol>
              </nav>
            </div>
          </div>
    <div class="row">
        <div class="col-lg-12">
          <div class="card mb-4">
            <div class="card-body text-center">
                <p>
                    <h4 class="font-weight-bold text-primary">${q.questionTitle}</h4>
                    <span class="font-weight-bold">${q.questionId}번 질문</span>
                </p>
                <p style="text-align: right;">
                    작성일 : ${q.questionEnterDate}<br> 
                    <c:if test="${not empty q.questionUpdateDate }">
                        수정일 : ${q.questionUpdateDate}
                    </c:if>
                </p>
                <br><br>
                <p>
                    <c:if test="${not empty q.questionImg}">
                        <img src="client/img/product/${q.questionImg}" style="width: 300px;">
                    </c:if>
                </p>
                <p>${q.questionContent}</p>
                <hr>
                <p class="font-weight-bold text-primary" style="text-align: left;">답변</p>
                <c:if test="${empty alist}">
                    <p>답변이 없습니다.</p>
                    <br>
                </c:if>
                <c:if test="${not empty alist}">
                    <c:forEach items="${alist}" var="a">
                        <c:if test="${not empty a.answerImg}">
                            <img src="client/img/product/${a.answerImg}" style="width: 200px; text-align: left;">
                            <br>
                        </c:if>
                            <div class="row">
                                <div class="col-lg-10">
                                    <p>
                                        <br>
                                        <h5 class="font-weight-bold" style="text-align: left;">${a.answerContent}</h5>
                                        <div  style="text-align: left;">
                                            <br>
                                            작성일 : ${a.answerEnterDate}<br>
                                            <c:if test="${not empty a.answerUpdateDate}">
                                                수정일 : ${a.answerUpdateDate}<br>
                                            </c:if>
                                        </div>
                                    </p>
                                </div>
                                <div class="col-lg-2" id="${q.questionId}">
                                    <a class="btn btn-primary btn-icon-split" onclick="modAns('${a.answerId}','${a.answerContent}')">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                    </a>
                                    <a class="btn btn-danger btn-icon-split" id="${a.answerId}" onclick="delAns('${a.answerId}','${a.answerContent}')">
                                        <span class="icon text-white-50">
                                                <i class="fas fa-trash"></i>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        <hr>
                    </c:forEach>
                </c:if>
                <div class="row">
                    <div class="col-lg-8">
                        <input placeholder="답변을 달아주세요" style="width: 80%;" id="aContent">
                        <a class="btn btn-primary btn-icon-split">
                            <span class="icon text-white-50">
                                <i class="fas fa-arrow-right"></i>
                            </span>
                            <span class="text search answer" onclick="subAns('${q.questionId}')">완료</span>
                        </a>
                    </div>
                </div>
            </div>
         </div>
        </div>
    </div>


    <div class="card shadow mb-4" id="modal">
        <div class="card-header py-3 modal-content" style="width: 50%;">
            <h5 class="m-0 mb-2 font-weight-bold text-primary" id="modalTitle">답변 수정</h5>
            <div class="card-body">
                <form id="frm2" class="row">
                    <div class="form-group  col-12">
                        <label id="contlabel" class="font-weight-bold" style="display: block;">내용</label>
                        <input id="modAnswer" type="text" style="width: 100%;">
                    </div>

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
    <script src='admin/js/Answer.js'></script>
<script>
    const answer = new Answer();
    const modal = document.getElementById("modal");
    const subModalBtn = document.getElementById("sub-modal");
    const closeModalBtn = document.getElementById("close-modal");

    function subAns(id) {
        
        console.log(id);
        let content = $('#aContent').val();
        const a = {qid:id, content:content, img:''};
        console.log(a);
        answer.answerAdd(a,function(data){
            if(data.retCode == "Success") {
                alert("답변이 달렸습니다.");
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

    function delAns(aid) {
        console.log(aid);
        const response = confirm("삭제하시겠습니까?");
        if(response) {
        answer.answerRemove(aid, function(result) {
            console.log(result);
            if (result.retCode == "Success") {
            alert("답변이 삭제되었습니다.");
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

    function modAns(id, content) {
        console.log(id);

        modal.style.display = "block";
        document.body.style.overflow = "hidden";

        $('#modAnswer').val(content);
        
        $('#sub-modal').click(function() {
            // console.log("클릭함");
            let content = $('#modAnswer').val();
            let aid = id;
            // console.log(content);
            // console.log(aid);
            // console.log(qid);

            const a = {aid:aid,content:content};
            answer.answerUpdate(a, function(data){
                if(data.retCode == "Success") {
                alert("답변이 수정되었습니다.");
                location.reload(true);
                }
                else if (data.retCode == "Fail" ) {
                        alert("처리 중 에러");
                }
                else {
                    alert("알 수 없는 반환코드");
                }
            })
    
        })


    }


    //모달창 닫기
    closeModalBtn.addEventListener("click", () => {
                modal.style.display = "none";
                document.body.style.overflow = "auto"; // 스크롤바 보이기
            });

    
</script>
</body>
</html>