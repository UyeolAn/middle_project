<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="client/css/coursedetail.css" type="text/css">
	<link rel="stylesheet" href="client/css/course.css" type="text/css">
</head>

<body>
	<!-- Offcanvas Menu Begin -->

	<!-- Offcanvas Menu End -->

	<!-- 강의 상세 정보 Begin -->
	<section class="shop-details">
		<!-- 강의 카테고리, 등급, 강의 이름, 설명 start -->
		<div class="product__details__pic set-bg course_bg">
			<div class="container course_container">
				<div class="row set-bg course_pic" data-setbg="client/img/product/${course.courseImg }"></div>
				<div class="course_info_wrap">
					<div>
						<p class="breadcrumb__links course_links"><span>${fn:toUpperCase(course.courseMainCategory)}</span>
							<span>${fn:toUpperCase(course.courseSubCategory)}</span></p>
						<div class="course_grade_name">
							<p>
								<c:if test="${course.courseGrade eq 'easy' }"><span class="course_grade">입문</span></c:if>
								<c:if test="${course.courseGrade eq 'normal' }"><span class="course_grade">초급</span></c:if>
								<c:if test="${course.courseGrade eq 'hard' }"><span class="course_grade">중급이상</span></c:if>
								<%-- <c:if test="${course.courseGrade ne 'hard' }"><span class="c_space"></span></c:if>
									<c:if test="${course.courseGrade eq 'hard' }"><span class="c_space"></span></c:if> --%>
								<span class="course_name">${course.courseName }</span>
							</p>
						</div>
					</div>
					<div class="course_info_etc">
						<!-- 별점 가져오기 -->
						<div class="rating">
							<c:if test="${course.courseStars > 0 }">
								<c:forEach var="i" begin="1" end="${course.courseStars}">
									<i class="fa fa-star"></i>
								</c:forEach>
								<c:forEach var="i" begin="1" end="${5 - course.courseStars}">
									<i class="fa fa-star-o"></i>
								</c:forEach>
							</c:if>
							<c:if test="${course.courseStars <= 0 }">
								<i class="fa fa-star-o"></i>
								<i class="fa fa-star-o"></i>
								<i class="fa fa-star-o"></i>
								<i class="fa fa-star-o"></i>
								<i class="fa fa-star-o"></i>
							</c:if>
							<span> - 5 Reviews</span>
						</div>

						<!-- 강사 이름 -->
						<div class="course_teacher">
							<span class="infd-icon"><svg width="19" xmlns="http://www.w3.org/2000/svg" height="19"
									viewBox="0 0 16 16">
									<path fill="#343a40" fill-rule="evenodd"
										d="M8 1.667c-2.025 0-3.667 1.641-3.667 3.666 0 1.26.636 2.371 1.603 3.031-2.243.822-3.859 2.945-3.933 5.454-.009.277.209.507.485.515.276.008.506-.209.514-.485C3.082 11.158 5.29 9 8 9c2.71 0 4.918 2.157 4.998 4.848.008.276.238.493.514.485.276-.008.493-.239.485-.514-.074-2.51-1.69-4.633-3.933-5.455.967-.66 1.603-1.771 1.603-3.03 0-2.026-1.642-3.667-3.667-3.667zM5.333 5.333c0-1.472 1.194-2.666 2.667-2.666 1.473 0 2.667 1.194 2.667 2.666C10.667 6.806 9.473 8 8 8 6.527 8 5.333 6.806 5.333 5.333z"
										clip-rule="evenodd"></path>
								</svg></span>
							<p>${course.courseTeacher }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 강의 카테고리, 등급, 강의 이름, 설명 end -->

		<div class="product__details__content">
			<div class="container">
				<div class="row course_tab_row">
					<!-- 강의소개, 커리큘럽, 수강생리뷰 탭 start -->
					<div class="col-lg-12" <c:if test='${message eq "possible" }'>style="max-width: 100%"</c:if>>
						<div class="product__details__tab">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item">
									<a class="nav-link <c:if test='${message eq "impossible" }'>active</c:if>" data-toggle="tab" href="#tabs-5" role="tab">강의소개</a>
								</li>
								<li class="nav-item">
									<a class="nav-link <c:if test='${message eq "possible" }'>active</c:if>" data-toggle="tab" href="#tabs-6" role="tab">커리큘럼</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">수강생리뷰</a>
								</li>
							</ul>
							<div class="tab-content">
								<!-- 강의소개 탭 start  -->
								<div class="tab-pane <c:if test='${message eq "impossible" }'>active</c:if>" id="tabs-5" role="tabpanel">
									<div class="product__details__tab__content">
										<div class="course_script_wrap">
											<div class="intro_text"><span>🎓</span>이런분들께<br> 추천드려요!</div>
											<p class="note">${course.courseScript }</p>
										</div>
										<div class="product__details__tab__content__item">
											<h5><span>🧐</span> 미리보기를 통해 콘텐츠를 확인해보세요.</h5>
											<div id="free_iframe_area_1" data_link="${subCourses[1].subcourseLink }"></div>
										</div>
									</div>
								</div>

								<!-- 커리큘럼 탭 start -->
								<div class="tab-pane <c:if test='${message eq "possible" }'>active</c:if>" id="tabs-6" role="tabpanel">
									<div class="product__details__tab__content">
										<div class="product__details__tab__content__item">
											<h5><span>✍️</span> 이런 걸 배워요!</h5>
											<ul class="subcourse_list_wrap">
												<c:forEach items="${subCourses}" var="s">
													<li class="subcourse_data">
														<!-- 서브강의 리스트 생성 start -->
														<div class="col_7">
															<div class="col_left">
																<p>${s.rwm }.</p>
																<p>${s.subcourseName }</p>
																<p>(${s.subcourseTime }분)</p>
															</div>
															<button onclick="playBtn(${s.subcourseId }, '${s.subcourseLink }')"
																class="play_btn">
																<c:if test='${message eq "possible" }'>
																	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
																		fill="currentColor" class="bi bi-play-circle-fill" viewBox="0 0 16 16">
																		<path
																			d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814l-3.5-2.5z" />
																	</svg>
																</c:if>
																<c:if test='${message eq "impossible" }'>
																	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
																		fill="#e8e8e8" class="bi bi-play-circle-fill" viewBox="0 0 16 16">
																		<path
																			d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814l-3.5-2.5z" />
																	</svg>
																</c:if>
															</button>
														</div>
														<!-- 서브강의 리스트 생성 end -->
														<!-- 강의 모달창 start -->
														<div id="modalWrap_${s.subcourseId }" class="modalWrap" data-s="${s.subcourseId }">
															<div id="modalContent_${s.subcourseId }" class="modalContent">
																<div id="modalBody_${s.subcourseId }" class="modalBody">
																	<div class="modalBody_top">
																		<p class="bold_text">
																			<span class="bold_text">[${s.rwm }강]</span>${s.subcourseName }
																		</p>
																		<span class="closeBtn">&times;</span>
																	</div>
																	<!-- 클릭시 동영상 태그 삽입.. -->
																	<div id="iframe_area_${s.subcourseId }"></div>
																</div>
															</div>
														</div>
														<!-- 강의 모달창 end -->
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>

								<!-- 수강생리뷰 탭 start -->
								<div class="tab-pane" id="tabs-7" role="tabpanel">
									<div class="product__details__tab__content">
										<div class="product__details__tab__content__item">
											<div class="reviw_tab_title">
												<h5>수강평 <span>총 ${rcount }개</span></h5>
												<p>수강생분들이 직접 작성하신 리뷰입니다.</p>
											</div>
											<c:if test="${message eq 'possible' }">
												<form id="reviw_write_area" action="" method="post">
													<div class="stars_wrap">
														<p class="review_item_title">
															강의만족도<span class="required">*</span>
															<span>(별점을 선택해주세요)</span>
														</p>
														<select id="reviewStars" name="reviewStars">
															<option value="5" class="rating">★★★★★(5점)</option>
															<option value="4" class="rating">★★★★☆(4점)</option>
															<option value="3" class="rating">★★★☆☆(3점)</option>
															<option value="2" class="rating">★★☆☆☆(2점)</option>
															<option value="1" class="rating">★☆☆☆☆(1점)</option>
															<option value="0" class="rating">☆☆☆☆☆(0점)</option>
														</select>
													</div>
													<div class="review_write_wrap">
														<p class="review_item_title">수강후기 <span>(선택사항)</span></p>
														<div class="textarea_wrap">
															<textarea id="reviwContent" name="reviwContent" rows="3" placeholder="좋은 수강평을 남겨주시면 지식공유자와 이후 배우는 사람들에게 큰 도움이 됩니다!"></textarea>
														</div>
													</div>
												</form>
											</c:if>
											<div class="review_tab_content">
												<c:forEach items="${reviews}" var="r">
													<div class="col_7">
														<div class="reviw_col_top">
															<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#b9c2c9"
																class="bi bi-person-circle" viewBox="0 0 16 16">
																<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
																<path fill-rule="evenodd"
																	d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
															</svg>
															<div>
																<div class="rating">
																	<c:if test="${r.reviewStars > 0 }">
																		<c:forEach var="i" begin="1" end="${r.reviewStars}">
																			<i class="fa fa-star"></i>
																		</c:forEach>
																		<c:forEach var="i" begin="1" end="${5 - r.reviewStars}">
																			<i class="fa fa-star-o"></i>
																		</c:forEach>
																	</c:if>
																	<c:if test="${r.reviewStars <= 0 }">
																		<i class="fa fa-star-o"></i>
																		<i class="fa fa-star-o"></i>
																		<i class="fa fa-star-o"></i>
																		<i class="fa fa-star-o"></i>
																		<i class="fa fa-star-o"></i>
																	</c:if>
																</div>
																<p>
																	<span>${r.memberId } |</span>
																	<c:if test="${r.reviewUpdateDate ne null }">${r.reviewUpdateDate}</c:if>
																	<c:if test="${r.reviewUpdateDate eq null }">${r.reviewEnterDate}</c:if>
																</p>
															</div>
														</div>
														<p class="reviw_content">${r.reviewContent }</p>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 강의소개, 커리큘럽, 수강생리뷰 탭 end -->
					
					<!-- 금액, 장바구니 start -->
					<c:if test="${message eq 'impossible' }">
						<div class="course_price_wrap">
							<div class="course_price_top">
								<c:choose>
									<c:when test="${course.coursePrice <= 0}">
										<h5 class="course_price_free">무료, 지금 바로 수강하세요!</h5>
										<h5 class="course_price">0원</h5>
										<div class="button_wrap">
											<button type="button" class="btn btn-green course-add" onclick="addMemberFreeCourse()">바로 수강신청 하기</button>
										</div>
									</c:when>
									<c:otherwise>
										<c:if test="${course.coursePrice >= 100000 }">
											<h5 class="course_price_pay">3개월 무이자 할부 가능!</h5>
										</c:if>
										<h5 class="course_price">
											<fmt:formatNumber value="${course.coursePrice }" pattern="#,###" />원
										</h5>
										<div class="button_wrap">
											<c:if test="${bucket eq 'notIn' }">
												<a href="bucketinsert.do?courseId=${course.courseId }&memberId=${loginId }"><button type="button" class="btn btn-green btn-green-p course-add">수강신청 하기</button></a>
												<a href="ajaxbucketinsert.do?courseId=${course.courseId }"><button type="button" class="btn btn-green btn-green-p">장바구니 담기</button></a>
											</c:if>
											<c:if test="${bucket eq 'in' }">
												<a href="bucketlist.do?memberId=${loginId }"><button type="button" class="btn btn-green btn-green-p course-add">장바구니로 이동</button></a>
											</c:if>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<ul class="course_price_bottom">
								<li>수강기한: 무제한</li>
								<li>지식제공자: ${course.courseTeacher }</li>
								<c:if test="${course.courseGrade eq 'easy'}"><li>난이도: 입문</li></c:if>
								<c:if test="${course.courseGrade eq 'normal'}"><li>난이도: 초급</li></c:if>
								<c:if test="${course.courseGrade eq 'hard'}"><li>난이도: 중급이상</li></c:if>
								<li>질문 답변 제공</li>
							</ul>
						</div>
					</c:if>
					<!-- 금액, 장바구니 end -->
				</div>
			</div>
		</div>
	</section>
	<!-- 강의 상세 정보 End -->

	<form id="cform" action="courselist.do" method="post">
		<input type="hidden" name="subCate" id="subCate" value="" />
		<input type="hidden" name="grade" id="grade" value="" />
		<input type="hidden" name="nowPage" id="nowPage" value="" />
		<input type="hidden" name="cntPerPage" id="cntPerPage" value="" />
		<input type="hidden" name="message" id="message" value="${message }" />
		<input type="hidden" name="courseId" id="courseId" value="${course.courseId }" />
		<input type="hidden" name="loginId" id="loginId" value="${loginId }" />
	</form>
	

	<!-- 강의 관련 자바스크립트 연결 -->
	<script type="text/javascript" src="client/js/coursedetail.js"></script>

</body>

</html>