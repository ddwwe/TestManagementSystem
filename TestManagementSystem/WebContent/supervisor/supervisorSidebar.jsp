<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
      </div>

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
        </li>
         <li>
          <a href="supervisor/calendar.jsp">
            <i class="fa fa-calendar"></i> <span>시험일정</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
       <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>시험인원</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="supervisor/chartjs.jsp"><i class="fa fa-circle-o"></i> 인원통계</a></li>
          </ul>
        </li>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>