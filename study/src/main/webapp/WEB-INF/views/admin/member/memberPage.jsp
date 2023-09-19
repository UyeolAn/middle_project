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
    <div class="card shadow mb-4" style="padding: 20px;" >
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
    </div>
</body>
</html>