<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.SupervisorDTO"%>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- fullCalendar 2.2.5-->
  <link rel="stylesheet" href="../plugins/fullcalendar/fullcalendar.min.css">
  <link rel="stylesheet" href="../plugins/fullcalendar/fullcalendar.print.css" media="print">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
     <!-- Logo -->
    <a href="../supervisorMenu.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>T</b>MS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>TestManagement</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
 <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
             <li class="dropdown user user-menu">
            <a href="../SupervisorLogOutServlet">
              <img src="../dist/img/logout.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">로그아웃</span>
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
        <li class="active"><a href="#"><i class="fa fa-link"></i> <span>내 정보보기</span></a></li>
        <li class="treeview">
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
              <li class="treeview">
          <a href="calendar.jsp">
            <i class="fa fa-calendar"></i> <span>시험일정</span>
            <span class="pull-right-container">
            </span>
          </a>
       <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>시험인원</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="chartjs.jsp"><i class="fa fa-circle-o"></i> 인원통계</a></li>
          </ul>
        </li>
             <li>
          <a href="picture.jsp">
            <i class="fa fa-comment"></i> <span>정오게시판</span>
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
    <!-- Content Header (Page header) -->

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Profile
      </h1>
    </section>
    <%
			SupervisorDTO dto=(SupervisorDTO)session.getAttribute("login");
    %>
    <!-- Main content -->
      <form class="form-horizontal">
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <form action="<%=request.getContextPath() %>/test/test.do" method="post" enctype="multipart/form-data">
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="../image/<%= dto.getSid()%>.jpg" alt="User profile picture">

              <h3 class="profile-username text-center"><%= dto.getSname()%></h3>


              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>소속</b>
                  <a class="pull-center"><%= dto.getSgroup()%></a>
                </li>
                <li class="list-group-item">
                  <b>생년월일</b>
                  <a class="pull-center"><%= dto.getSbirth()%></a>
                </li>
              </ul>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
</form>
          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Affiliation</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-flag margin-r-5"></i>시험장 위치</strong>

              <p class="text-muted">
              <!-- 쓰는 곳 -->
              </p>

              <hr>
                 <strong><i class="fa fa-book margin-r-5"></i> 시험장 번호</strong>

              <p class="text-muted">
              <!-- 쓰는 곳 -->
              </p>

              <hr>

  </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <form action="SupervisorUpdate" method="post">
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li><a href="#settings" data-toggle="tab">회원정보</a></li>
            </ul>

              <div class="tab-pane" id="settings">
              
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">이름</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputName" value="<%= dto.getSname()%>" readonly="readonly">
                    </div>
                  </div>
                  
                   <div class="form-group">
                    <label for="inputPhone" class="col-sm-2 control-label">휴대폰번호</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputEmail" value="<%= dto.getSphone()%>" readonly="readonly">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">소속</label>
					
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" value="<%= dto.getSgroup()%>" readonly="readonly">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">경력</label>

                    <div class="col-sm-10">
                      <textarea class="form-control" id="inputExperience"readonly="readonly"><%= dto.getScareers()%></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">주소</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" value="<%= dto.getSaddr1()%> <%= dto.getSaddr2()%> <%= dto.getSpost()%>" readonly="readonly">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">수정하기</button>
                    </div>
                  </div>
                </form>
    </section>
    <!-- /.content -->
    
  </div>
  <footer class="main-footer">
			<div class="pull-right hidden-xs"></div>
			<strong>Copyright &copy;2016 <a>KongjuUniversity</a>.
			</strong> All rights reserved.
		</footer>
   <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
      </div>

        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
    
  </aside>
  
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
  
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
</body>