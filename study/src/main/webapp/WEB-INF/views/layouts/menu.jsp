<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
  </head>

  <body>
	<c:if test="${menu eq 'course'}">
		<jsp:include page="menu/menuCourse.jsp"></jsp:include>
	</c:if>
	<c:if test="${menu eq 'community' }">
		<jsp:include page="menu/menuCommunity.jsp"></jsp:include>
	</c:if>
  	<c:if test="${menu eq 'mypage' }">
		<jsp:include page="menu/menuMypage.jsp"></jsp:include>
	</c:if>
  </body>

  </html>