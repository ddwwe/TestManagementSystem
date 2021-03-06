<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String tsTitle = (String)request.getAttribute("tsTitle");
%>

     <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="MainStatFormServlet" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>T</b>MS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>TestManagement</b></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle " data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      
      <div class="collapse navbar-collapse pull-left">
      	
      
      	<ul class="nav navbar-nav">
      		<li>
      			<a><%= tsTitle %> 통계입니다</a>
      		</li>
      	</ul>
      </div>
      
      <!-- Navbar Right Menu -->
      
    </nav>
  </header>
  
  
    <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>