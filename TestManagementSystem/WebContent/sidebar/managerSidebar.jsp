<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

      <!-- Sidebar user panel (optional) -->

      <!-- search form (Optional) -->
      <!-- /.search form -->

      <!-- Sidebar Menu -->
		<ul class="sidebar-menu">
	        <!-- Optionally, you can add icons to the links -->
			<li class="treeview">
				<a href="#">
					<i class="fa fa-pie-chart"></i>
					<span>시험인원</span>
	            	<span class="pull-right-container">
	             		<i class="fa fa-angle-left pull-right"></i>
	            	</span>
				</a>
				<ul class="treeview-menu menu-open">
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 서울지역본부</a></li>
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 부산지역본부</a></li>
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 대구지역본부</a></li>
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 광주지역본부</a></li>
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 대전지역본부</a></li>
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 제주지역본부</a></li>
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 인천지사</a></li>
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 울산지사</a></li>
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 경기지사</a></li>
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 충남지사</a></li>
					<li><a href="StatMainFormServlet"><i class="fa fa-circle-o"></i> 충북지사</a></li>
				</ul>
			</li>
			<li>
				<a href=ManagerBoardFormServlet>
					<i class="fa fa-comment"></i><span>정오게시판</span>
					<span class="pull-right-container"></span>
				</a>
			</li>
			<li>
				<a href="ManagerLogoutServlet">
					<i class="fa fa-sign-out" aria-hidden="true"></i>
					<span class="hidden-xs">로그아웃</span>
				</a>
			</li>
		</ul>
      <!-- /.sidebar-menu -->
	</section>
    <!-- /.sidebar -->
</aside>