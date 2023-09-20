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
    <section style="background-color: #eee;">
        <div class="container py-5">
          <div class="row">
            <div class="col">
              <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                <ol class="breadcrumb mb-0">
                  <li class="breadcrumb-item"><a href="adminhome.do">Home</a></li>
                  <li class="breadcrumb-item"><a href="adminmemberlist.do">강의 목록</a></li>
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
                  <h5 class="my-3">${c.courseName}</h5>
                    <a class="btn btn-secondary btn-icon-split search">
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
              <!-- 회원이 쓴 커뮤니티 및 정보 불러옴 -->
              <div class="card mb-4 mb-lg-0">
                <div class="card-body p-0">
                  <ul class="list-group list-group-flush rounded-3">
                    <!-- 회원이 수강하는 강의의 가격 합 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span><i class="bi bi-coin fa-lg text-warning"></i> 수강 강의 가격 합</span>
                      <p class="mb-0">원</p>
                    </li>
                    <!-- 회원이 쓴 리뷰 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span><i class="bi bi-check-all fa-lg" style="color: blue;"></i> 회원이 쓴 후기</span>
                      <p class="mb-0">개</p>
                    </li>
                    <!-- 회원이 쓴 댓글 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span><i class="bi bi-indent fa-lg" style="color: #55acee;"></i> 회원이 쓴 댓글</span>
                      <p class="mb-0">개</p>
                    </li>
                    <!-- 회원이 쓴 질문 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span><i class="bi bi-question-circle fa-lg" style="color: #ac2bac;"></i> 회원이 쓴 질문</span>
                      <p class="mb-0">개</p>
                    </li>
                    <!-- 회원이 담은 장바구니 갯수 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                      <span><i class="bi bi-bucket-fill fa-lg" style="color: #3b5998;"></i> 회원이 담은 장바구니</span>
                      <p class="mb-0">개</p>
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
                      <p class="mb-0">강의명</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${c.courseName}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">강의 아이디</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${c.courseId}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">강의 설명</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${c.courseScript}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">강의 가격</p>
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
                      <p class="mb-0">강의 카테고리</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${c.courseMainCategory}</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">강의 상세 카테고리</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">${c.courseSubCategory}</p>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card mb-4">
                <div class="card-body " data-spy="scroll">
                    <c:forEach items="${subcourse }" var="s">
                        <div class="row">
                            <div class="col-sm-3">
                              <p class="mb-0">${s.subcourseName}</p>
                            </div>
                            <div class="col-sm-6">
                              <p class="text-muted mb-0">${s.subcourseLink}</p>
                            </div>
                            <div class="col-sm-3">
                                <p class="text-muted mb-0">${s.subcourseTime}분</p>
                              </div>
                          </div>
                          <hr>
                    </c:forEach>
                </div>
              </div>


            </div>

          </div>
        </div>
      </section>

</body>
</html>