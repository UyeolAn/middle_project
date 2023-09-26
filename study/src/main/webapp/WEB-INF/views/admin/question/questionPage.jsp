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
                    <h4 class="font-weight-bold text-primary">${q.questionId}번 질문   </h4>
                    <span class="font-weight-bold">제목 : ${q.questionTitle}</span>
                </p>
                <p style="text-align: right;">
                    작성일 : ${q.questionEnterDate}<br> 
                    <c:if test="${not empty q.questionUpdateDate }">
                        수정일 : ${q.questionUpdateDate}
                    </c:if>
                </p>
                <hr>
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
                                    <p style="text-align: left;">
                                        [내용]<br>
                                        ${a.answerContent}<br>
                                        작성일 : ${a.answerEnterDate}<br>
                                        <i class="bi bi-hand-thumbs-up-fill"></i>
                                        <i class="bi bi-hand-thumbs-down-fill"></i>
                                    </p>
                                </div>
                                <div class="col-lg-2" id="${q.questionId}">
                                    <a class="btn btn-primary btn-icon-split" onclick="modAns('${a.answerId}')">
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
    <script src='admin/js/Answer.js'></script>
<script>
    const answer = new Answer();

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

    function modAns(aid, content) {
        console.log(aid);
        let input = document.createElement('input');
        document.getElementById(aid).after(input);
        let btn = document.createElement('input');
        btn.type = 'button';
        btn.value = 'btn';
        input.after(btn);
    }

    
</script>
</body>
</html>