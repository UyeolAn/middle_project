<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul
		class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion"
		id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="adminhome.do">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-laugh-wink"></i>
			</div>
			<div class="sidebar-brand-text mx-3">
				관리자 페이지
			</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a class="nav-link" href="adminhome.do">
				<i class="fas fa-fw fa-tachometer-alt"></i> <span>HOME</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">관리</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#member"
				aria-expanded="true" 
				aria-controls="collapseTwo"> 
					<i class="fas fa-fw fa-cog"></i> 
				<span>회원관리</span>
			</a>
			<div id="member" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Member Management</h6>
						<a class="collapse-item" href="adminmemberlist.do">회원목록</a> 
					</div>
			</div>
		</li>

		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#course"
			aria-expanded="true" aria-controls="course"> 
			<i class="fas fa-fw fa-cog"></i> <span>강의관리</span>
		</a>
			<div id="course" class="collapse" aria-labelledby="headingCourse"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Course Management</h6>
					<a class="collapse-item" href="admincourselist.do">강의목록</a> 
					<a class="collapse-item" href="adimincourseregister.do">강의등록</a>
				</div>
			</div></li>
			
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#package"
			aria-expanded="true" aria-controls="package"> 
			<i class="fas fa-fw fa-cog"></i> <span>패키지관리</span>
		</a>
			<div id="package" class="collapse" aria-labelledby="headingPackage"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Course Management</h6>
					<a class="collapse-item" href="admincourselist.do">패키지목록</a> 
					<a class="collapse-item" href="adimincourseregister.do">패키지등록</a>
				</div>
			</div></li>
			
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#worker"
			aria-expanded="true" aria-controls="worker"> 
			<i class="fas fa-fw fa-cog"></i> <span>직원관리</span>
		</a>
			<div id="worker" class="collapse" aria-labelledby="headingWorker"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Worker Management</h6>
					<a class="collapse-item" href="adminemployeelist.do">직원목록</a> 
					<a class="collapse-item" href="adminemployeeregister.do">직원등록</a>
				</div>
			</div></li>


		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

		<!-- Sidebar Message -->
		<!--  
		<div class="sidebar-card d-none d-lg-flex">
			<img class="sidebar-card-illustration mb-2"
				src="admin/img/undraw_rocket.svg" alt="...">
			<p class="text-center mb-2">
				<strong>SB Admin Pro</strong> is packed with premium features,
				components, and more!
			</p>
			<a class="btn btn-success btn-sm"
				href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to
				Pro!</a>
		</div>
		-->

	</ul>
</body>
</html>