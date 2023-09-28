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
.shop__sidebar__categories ul li span {
	color: #b7b7b7;
    font-size: 15px;
    line-height: 32px;
    -webkit-transition: all, 0.3s;
    -o-transition: all, 0.3s;
    transition: all, 0.3s;
    cursor: pointer;
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
					<!-- 전체보기 -->
					<div class="card">
						<div class="course-all">
							<a href="packagelist.do">전체보기</a>
						</div>
					</div>
					<!-- IT -->
					<div class="card">
						<div class="card-heading">
							<a data-toggle="collapse" data-target="#collapseOne">IT</a>
						</div>
						<div id="collapseOne" class="collapse"
							data-parent="#accordionExample">
							<div class="card-body">
								<div class="shop__sidebar__categories">
									<ul class="nice-scroll">
										<li onclick="packageList('it', 'all', this)" data-c="null">
											<span class="sub_menu">전체보기</span>
										</li>
										<li onclick="packageList('it', 'easy', this)" data-c="easy">
											<span class="sub_menu">입문</span>
										</li>
										<li onclick="packageList('it', 'normal', this)" data-c="normal">
											<span class="sub_menu">초급</span>
										</li>
										<li onclick="packageList('it', 'hard', this)" data-c="hard">
											<span class="sub_menu">중급이상</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- English -->
					<div class="card">
						<div class="card-heading">
							<a data-toggle="collapse" data-target="#collapseTwo">English</a>
						</div>
						<div id="collapseTwo" class="collapse"
							data-parent="#accordionExample">
							<div class="card-body">
								<div class="shop__sidebar__categories">
									<ul class="nice-scroll">
										<li onclick="packageList('english', 'all', this)" data-c="null">
											<span class="sub_menu">전체보기</span>
										</li>
										<li onclick="packageList('english', 'easy', this)" data-c="easy">
											<span class="sub_menu">입문</span>
										</li>
										<li onclick="packageList('english', 'normal', this)" data-c="normal">
											<span class="sub_menu">초급</span>
										</li>
										<li onclick="packageList('english', 'hard', this)" data-c="hard">
											<span class="sub_menu">중급이상</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 패키지관련 자바스크립트 연결 -->
	<script type="text/javascript" src="client/js/package.js"></script>
</body>

</html>