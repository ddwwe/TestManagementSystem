<%@page import="com.context.TableType"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.service.SelectService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	

<script type="text/javascript" src="jquery-3.1.0.min.js"></script>
<script type="text/javascript">

	function year() {
		var x = document.getElementById("yearSelect").value;
		
	}
	function year2() {
		var x2 = document.getElementById("yearSelect2").value;
		location.href = "http://210.125.213.90:8090/TestManagementSystem/ManagerLoginServlet?mId=1234&mPw=1234";
	}
	function year3() {
		var x3 = document.getElementById("yearSelect3").value;
		location.href = "http://210.125.213.90:8090/TestManagementSystem/ManagerLoginServlet?mId=1234&mPw=1234";
	}
	function year4() {
		var x4 = document.getElementById("yearSelect4").value;
		location.href = "http://210.125.213.90:8090/TestManagementSystem/ManagerLoginServlet?mId=1234&mPw=1234";
	}

</script>

<%
	ServletContext ctx = getServletContext();
	String yy = (String)ctx.getAttribute("yearSelect");
	
	List<String> bonbooList = (ArrayList<String>)ctx.getAttribute("bonboo");
	List<TableType> TableTypeList = (ArrayList<TableType>)ctx.getAttribute(yy);
	List<String> giSaList = (ArrayList<String>)ctx.getAttribute(yy+"giSaList");
	List<String> giNngSaList = (ArrayList<String>)ctx.getAttribute(yy+"giNngSaList");
	List<String> giSulSaList = (ArrayList<String>)ctx.getAttribute(yy+"giSulSaList");
	List<String> giNngJangList = (ArrayList<String>)ctx.getAttribute(yy+"giNngJangList");
	
	TableType giNngSaTableType = TableTypeList.get(0);
	TableType giSaTableType = TableTypeList.get(1);
	TableType giSulSaTableType = TableTypeList.get(2);
	TableType giNngJangTableType = TableTypeList.get(3);
%>

<div class="content-wrapper">
	<section class="content">
		<div class="col-md-6"></div>
	          <!-- AREA CHART -->
	         
	         <div class="box box-danger collapsed-box">
            <div class="box-header with-border">
				<h3 class="box-title">기 능 사</h3>
				<select id="yearSelect" onchange="year()">
					<option value="16">연도선택</option>
					<option value="16">2016년</option>
					<option value="15">2015년</option>
				</select>
				현재 선택한 년도는 20<%= yy %>년 입니다
				<div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
				</div>
            </div>
            
			<div class="box-body">
				<table border="1">
					<thead>
						<tr>
							<th>종 목 ＼ 본 부&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
							<% for(int i=0; i < bonbooList.size(); i++) { %>
							<th><%= bonbooList.get(i) %>&nbsp&nbsp</th>
							<%} %>
							<th>총&nbsp&nbsp&nbsp합</th>
						</tr>
					</thead>
					<tbody>
						<% for (int i=0; i < giNngSaList.size(); i++) {%>
						<tr>
							<th><%= giNngSaList.get(i) %>&nbsp&nbsp</th>
							<% for (int j=0; j < bonbooList.size(); j++) {%>
							<td align="center"><%= giNngSaTableType.getYesArr()[i][j] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngSaTableType.getArr()[i][j] %></td>
							<%} %>
							<td align="center"><%= giNngSaTableType.getYesHSum()[i] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngSaTableType.gethSum()[i] %></td>
						</tr>
						<%} %>
						<!-- 세로 총합 구하기 -->
						<tr>
							<th>총&nbsp&nbsp&nbsp합</th>
						<% for (int i=0; i < bonbooList.size(); i++) {%>
							<td align="center"><%= giNngSaTableType.getYesVSum()[i] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngSaTableType.getvSum()[i] %></td>
						<%} %>
						<td align="center"><%=giNngSaTableType.getYesTotal()%>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%=giNngSaTableType.getTotal()%></td>
						</tr>
					</tbody>
				</table>             
			</div>
	          <!-- /.box -->
		</div>
		<!-- DONUT CHART -->
	<!-- 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝  -->
	    
	         <div class="box box-info collapsed-box">
            <div class="box-header with-border">
				<h3 class="box-title">기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp사</h3>
				<select id="yearSelect" onchange="year()">
					<option value="16">연도선택</option>
					<option value="16">2016년</option>
					<option value="15">2015년</option>
				</select>
				현재 선택한 년도는 20<%= yy %>년 입니다
				<div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
				</div>
            </div>
            
			<div class="box-body">
				<table border="1">
					<thead>
						<tr>
							<th>종 목 ＼ 본 부&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
							<% for(int i=0; i < bonbooList.size(); i++) { %>
							<th><%= bonbooList.get(i) %>&nbsp&nbsp</th>
							<%} %>
							<th>총&nbsp&nbsp&nbsp합</th>
						</tr>
					</thead>
					<tbody>
						<% for (int i=0; i < giSaList.size(); i++) {%>
						<tr>
							<th><%= giSaList.get(i) %>&nbsp&nbsp</th>
							<% for (int j=0; j < bonbooList.size(); j++) {%>
							<td align="center"><%= giSaTableType.getYesArr()[i][j] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSaTableType.getArr()[i][j] %></td>
							<%} %>
							<td align="center"><%= giSaTableType.getYesHSum()[i] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSaTableType.gethSum()[i] %></td>
						</tr>
						<%} %>
						<!-- 세로 총합 구하기 -->
						<tr>
							<th>총&nbsp&nbsp&nbsp합</th>
						<% for (int i=0; i < bonbooList.size(); i++) {%>
							<td align="center"><%= giSaTableType.getYesVSum()[i] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSaTableType.getvSum()[i] %></td>
						<%} %>
						<td align="center"><%=giSaTableType.getYesTotal()%>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%=giSaTableType.getTotal()%></td>
						</tr>
					</tbody>
				</table>             
			</div>
	          <!-- /.box -->
		</div>
		<!-- DONUT CHART -->
	<!-- 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 -->
	    
	         <div class="box box-warning collapsed-box">
            <div class="box-header with-border">
				<h3 class="box-title">기 술 사</h3>
				<select id="yearSelect" onchange="year()">
					<option value="16">연도선택</option>
					<option value="16">2016년</option>
					<option value="15">2015년</option>
				</select>
				현재 선택한 년도는 20<%= yy %>년 입니다
				<div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
				</div>
            </div>
            
			<div class="box-body">
				<table border="1">
					<thead>
						<tr>
							<th>종 목 ＼ 본 부&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
							<% for(int i=0; i < bonbooList.size(); i++) { %>
							<th><%= bonbooList.get(i) %>&nbsp&nbsp</th>
							<%} %>
							<th>총&nbsp&nbsp&nbsp합</th>
						</tr>
					</thead>
					<tbody>
						<% for (int i=0; i < giSulSaList.size(); i++) {%>
						<tr>
							<th><%= giSulSaList.get(i) %>&nbsp&nbsp</th>
							<% for (int j=0; j < bonbooList.size(); j++) {%>
							<td align="center"><%= giSulSaTableType.getYesArr()[i][j] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSulSaTableType.getArr()[i][j] %></td>
							<%} %>
							<td align="center"><%= giSulSaTableType.getYesHSum()[i] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSulSaTableType.gethSum()[i] %></td>
						</tr>
						<%} %>
						<!-- 세로 총합 구하기 -->
						<tr>
							<th>총&nbsp&nbsp&nbsp합</th>
						<% for (int i=0; i < bonbooList.size(); i++) {%>
							<td align="center"><%= giSulSaTableType.getYesVSum()[i] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSulSaTableType.getvSum()[i] %></td>
						<%} %>
						<td align="center"><%=giSulSaTableType.getYesTotal()%>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%=giSulSaTableType.getTotal()%></td>
						</tr>
					</tbody>
				</table>             
			</div>
	          <!-- /.box -->
		</div>
		<!-- DONUT CHART -->
	<!-- 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 -->
	
	         <div class="box box-success collapsed-box">
            <div class="box-header with-border">
				<h3 class="box-title">기 능 장</h3>
				<select id="yearSelect" onchange="year()">
					<option value="16">연도선택</option>
					<option value="16">2016년</option>
					<option value="15">2015년</option>
				</select>
				현재 선택한 년도는 20<%= yy %>년 입니다
				<div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
				</div>
            </div>
            
			<div class="box-body">
				<table border="1">
					<thead>
						<tr>
							<th>종 목 ＼ 본 부&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
							<% for(int i=0; i < bonbooList.size(); i++) { %>
							<th><%= bonbooList.get(i) %>&nbsp&nbsp</th>
							<%} %>
							<th>총&nbsp&nbsp&nbsp합</th>
						</tr>
					</thead>
					<tbody>
						<% for (int i=0; i < giNngJangList.size(); i++) {%>
						<tr>
							<th><%= giNngJangList.get(i) %>&nbsp&nbsp</th>
							<% for (int j=0; j < bonbooList.size(); j++) {%>
							<td align="center"><%= giNngJangTableType.getYesArr()[i][j] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngJangTableType.getArr()[i][j] %></td>
							<%} %>
							<td align="center"><%= giNngJangTableType.getYesHSum()[i] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngJangTableType.gethSum()[i] %></td>
						</tr>
						<%} %>
						<!-- 세로 총합 구하기 -->
						<tr>
							<th>총&nbsp&nbsp&nbsp합</th>
						<% for (int i=0; i < bonbooList.size(); i++) {%>
							<td align="center"><%= giNngJangTableType.getYesVSum()[i] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngJangTableType.getvSum()[i] %></td>
						<%} %>
						<td align="center"><%=giNngJangTableType.getYesTotal()%>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%=giNngJangTableType.getTotal()%></td>
						</tr>
					</tbody>
				</table>             
			</div>
	          <!-- /.box -->
		</div>
		<!-- DONUT CHART -->
	<!-- 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 -->
	
	</section>
</div>