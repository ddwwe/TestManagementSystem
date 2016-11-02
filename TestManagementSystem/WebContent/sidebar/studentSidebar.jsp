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
        <li class="header">학생 메뉴</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active">
        	<a href="StudentMyPageServlet">
        		<i class="fa fa-link"></i>
        		<span>내 정보 수정</span>
        	</a>
        </li>
        
        <li>
        	<a href="ExamSubmitFormServlet">
        		<i class="fa fa-link"></i>
        		<span>시험 접수하기</span>
        	</a>
        </li>
        
      	<li>
      		<a href="StudentLogOutServlet">
					<i class="fa fa-sign-out" aria-hidden="true"></i>
					<span class="hidden-xs">로그아웃</span>
			</a>
		</li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>