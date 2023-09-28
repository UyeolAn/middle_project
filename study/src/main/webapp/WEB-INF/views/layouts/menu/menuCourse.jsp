<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.course-all a {
	color: #111111;
	font-size: 16px;
	font-weight: 700;
	text-transform: uppercase;
	display: block;
}

.shop__sidebar__categories ul {
	height: auto;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>

<body>
	<div class="col-lg-3">
		<div class="shop__sidebar">
			<div class="shop__sidebar__accordion">
				<div class="accordion" id="accordionExample">
					<div class="card">
						<div class="course-all">
							<a href="courselist.do">전체보기</a>
						</div>
					</div>
					<div class="card">
						<div class="card-heading">
							<a data-toggle="collapse" data-target="#collapseOne">IT</a>
						</div>
						<div id="collapseOne" class="collapse"
							data-parent="#accordionExample">
							<div class="card-body">
								<div class="shop__sidebar__categories">
									<ul class="nice-scroll">
										<c:forEach items="${it}" var="it">
											<li
												onclick="courseList('subCate', '${it.courseSubCategory }', 1, this)"
												data-c="${it.courseSubCategory }"><span
												class="sub_menu">${it.courseSubCategory }
													(${it.subCategoryCount })</span></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-heading">
							<a data-toggle="collapse" data-target="#collapseTwo">English</a>
						</div>
						<div id="collapseTwo" class="collapse"
							data-parent="#accordionExample">
							<div class="card-body">
								<div class="shop__sidebar__categories">
									<ul class="nice-scroll">
										<c:forEach items="${english}" var="eng">
											<li
												onclick="courseList('subCate','${eng.courseSubCategory }', 1, this)"
												data-c="${eng.courseSubCategory }"><span
												class="sub_menu">${eng.courseSubCategory }
													(${eng.subCategoryCount })</span></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-heading">
							<a data-toggle="collapse" data-target="#collapseThree">Career</a>
						</div>
						<div id="collapseThree" class="collapse"
							data-parent="#accordionExample">
							<div class="card-body">
								<div class="shop__sidebar__categories">
									<ul class="nice-scroll">
										<c:forEach items="${career}" var="c">
											<li
												onclick="courseList('subCate','${c.courseSubCategory }', 1, this)"
												data-c="${c.courseSubCategory }"><span
												class="sub_menu">${c.courseSubCategory }
													(${c.subCategoryCount })</span></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-heading">
							<a data-toggle="collapse" data-target="#collapseFour">Grade</a>
						</div>
						<div id="collapseFour" class="collapse"
							data-parent="#accordionExample">
							<div class="card-body">
								<div class="shop__sidebar__tags">
									<span id="easy" class="sub_menu_g"
										onclick="courseList('grade', 'easy', 1, this)">입문</span> <span
										id="normal" class="sub_menu_g"
										onclick="courseList('grade', 'normal', 1, this)">초급</span> <span
										id="hard" class="sub_menu_g"
										onclick="courseList('grade', 'hard', 1, this)">중급이상</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>