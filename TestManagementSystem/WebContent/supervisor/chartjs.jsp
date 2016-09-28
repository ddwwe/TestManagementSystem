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
			title : '2009 Total Sales by Individual'
		});
		$('table').visualize({
			type : 'line'
		});
		$('table').visualize({
			type : 'area'
		});
		$('table').visualize();
	});
</script>


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
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
					 <span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a>

			</nav>
		</header>
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel"></div>

				<!-- search form (Optional) -->
				<!-- /.search form -->

				<!-- Sidebar Menu -->
				<ul class="sidebar-menu">
					<!-- Optionally, you can add icons to the links -->
					<li class="active"><a href="#"><i class="fa fa-link"></i>
							<span style="font-size: 12pt">내 정보보기</span></a></li>
					<li class="treeview"><span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
					</span>
					<li class="treeview"></li>
					<li><a href="calendar.jsp"> <i class="fa fa-calendar"></i>
							<span style="font-size: 12pt">시험일정</span> <span
							class="pull-right-container"> </span>
					</a></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span style="font-size: 12pt">시험인원</span>
							<span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="chartjs.jsp"><i class="fa fa-circle-o"></i>
									인원보기</a></li>
						</ul></li>
					</li>
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>
		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">
			<!-- Sidebar user panel -->
			<div class="user-panel"></div>
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
								<caption>시험 인원 현황</caption>
								<thead>
									<tr>
										<td></td>
										<th>2014</th>
										<th>2014</th>
										<th>2014</th>
										<th>2015</th>
										<th>2015</th>
										<th>2015</th>
										<th>2016</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>기사/산업기사</th>
										<td>84190</td>
										<td>82410</td>
										<td>82340</td>
										<td>84120</td>
										<td>82330</td>
										<td>81250</td>
										<td>82150</td>
									</tr>
									<tr>
										<th>기능장</th>
										<td>14213</td>
										<td>11440</td>
										<td>12330</td>
										<td>14245</td>
										<td>12535</td>
										<td>12449</td>
										<td>11230</td>
									</tr>
									<tr>
										<th>기술사</th>
										<td>10142</td>
										<td>11380</td>
										<td>15210</td>
										<td>12315</td>
										<td>12125</td>
										<td>13179</td>
										<td>14220</td>
									</tr>

									<tr>
										<th>기능사</th>
										<td>12310</td>
										<td>11480</td>
										<td>12190</td>
										<td>23125</td>
										<td>4215</td>
										<td>23119</td>
										<td>52130</td>
									</tr>

								</tbody>
							</table>
					</body>

					<!-- -------------------------------------------------------------------------------- -->
</body>
