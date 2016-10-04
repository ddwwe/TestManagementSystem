<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- fullCalendar 2.2.5-->
<link rel="stylesheet"
	href="../plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet"
	href="../plugins/fullcalendar/fullcalendar.print.css" media="print">
<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="visualize.jQuery.css" />
<link type="text/css" rel="stylesheet" href="demopage.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="visualize.jQuery.js"></script>
<script type="text/javascript">
	$(function() {
		//make some charts
		$('table').visualize({
			type : 'pie',
			pieMargin : 10,
		});
		$('table').visualize();
	});
</script>

<%
int may = 10;
%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="../supervisorMenu.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>T</b>MS</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>TestManagement</b></span>
			</a>

			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->
						<li class="dropdown user user-menu"><a
							href="../SupervisorLogOutServlet"> <img
								src="../dist/img/logout.jpg" class="user-image" alt="User Image">
								<span class="hidden-xs" style="font-size: 11pt">로그아웃</span>
						</a>
				</div>
			</nav>
		</header>
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel (optional) -->

				<!-- search form (Optional) -->
				<!-- /.search form -->

				<!-- Sidebar Menu -->
				<ul class="sidebar-menu">
					<!-- Optionally, you can add icons to the links -->
					<li class="active"><a href="supervisorProfile.jsp"><i class="fa fa-link"></i>
							<span style="font-size: 11pt">내 정보보기</span></a></li>
					<li class="treeview"><span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
					</span>
					<li class="treeview"></li>
					<li><a href="calendar.jsp"> <i class="fa fa-calendar"></i>
							<span style="font-size: 11pt">시험일정</span> <span
							class="pull-right-container"> </span>
					</a></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span style="font-size: 11pt">시험인원</span>
							<span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="chartjs.jsp"><i class="fa fa-circle-o"></i>
									인원보기</a></li>
						</ul></li>
					</li>
					      <li>
          <a href="picture.jsp"><i class="fa fa-comment"></i> <span style="font-size: 11pt">정오게시판</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->

		</aside>
		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">
			<!-- Sidebar user panel -->
			<!-- sidebar menu: : style can be found in sidebar.less -->
			<ul class="sidebar-menu">
				<!-- /.sidebar -->
				</aside>

				<!-- Content Wrapper. Contains page content -->
				<div class="content-wrapper">
					<!-- Content Header (Page header) -->
					<section class="content-header">
						<h1>
							<span style="color: black">인원통계</span>
						</h1>
					</section>

					<head>

					</head>
					<body>
						<div>
							<table>
								<caption></caption>
								<thead>
									<tr>
										<td>필기시험</td>
										<th>2015 1회차</th>
										<th>2015 2회차</th>
										<th>2015 3회차</th>
										<th>2016 1회차</th>
										<th>2016 2회차</th>
										<th>2016 3회차</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>기사/산업기사</th>
										<td>44190</td>
										<td>42410</td>
										<td>42340</td>
										<td>42330</td>
										<td>41250</td>
										<td>4123</td>
									<tr>
										<th>기능장</th>
										<td>4213</td>
										<td>1440</td>
										<td>2150</td>
										<td>2650</td>
										<td>2150</td>
										<td>1</td>
									</tr>
									<tr>
										<th>기술사</th>
										<td>2142</td>
										<td>1380</td>
										<td>5210</td>
										<td>2315</td>
										<td>2150</td>
										<td>1</td>
									</tr>

									<tr>
										<th>기능사</th>
										<td>2310</td>
										<td>1480</td>
										<td>2190</td>
										<td>3125</td>
										<td>2150</td>
										<td>1</td>
									</tr>

								</tbody>
							</table>
					</body>

					<!-- -------------------------------------------------------------------------------- -->
				</div>

			</ul>
		</section>
		<footer class="main-footer">
			<div class="pull-right hidden-xs"></div>
			<strong>Copyright &copy;2016 <a>KongjuUniversity</a>.
			</strong> All rights reserved.
		</footer>