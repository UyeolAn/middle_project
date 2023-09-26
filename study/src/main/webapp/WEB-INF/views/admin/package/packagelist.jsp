<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card {
    margin-bottom: 30px;
    border: none;
    border-radius: 5px;
    box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
}
</style>
</head>
<body>
    <h1 class="h3 mb-2 text-gray-800">패키지 목록</h1>
	<p class="mb-4">
		패키지관리 페이지
	</p>
    <div class="row" style="justify-content: center;">
        <div class="row col-lg-10" style="justify-content: start">
            <c:forEach items="${plist }" var="p">
                <div class="card col-lg-4 m-1" style="width: 300px;">
                    <a href="adminpackagepage.do?pid=${p.packageId}" style="color: black;">
                        <img src="client/img/product/${p.packageThumbnail}" class="card-img-top" alt="..."">
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold" style="display: inline-block;">${p.packageTitle}</h5>
                            <a class="btn btn-danger btn-icon-split" id="close-modal">
                                <span class="text" style="padding: 0;">${p.packageDiscount}%</span>
                            </a>
                            <br>
                            <p>
                                <c:choose>
                                    <c:when test="${fn:length(p.packageScript) gt 100}">
                                        <c:out value="${fn:substring(p.packageScript, 0, 99)}"/>...
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${p.packageScript}">
                                    </c:out></c:otherwise>
                                </c:choose>
                            </p>
                          <!-- <p class="card-text">${p.packageScript}</p> -->
                            <p class="font-weight-bold">카테고리 : <span class="text-primary">${p.packageCategory}</span></p>
                            <p class="font-weight-bold">난이도 : <span class="text-primary">${p.packageGrade}</span></p>
                        </div>
                    </a>
                </div>
            </c:forEach>

        </div>
    </div>
    
</body>
</html>