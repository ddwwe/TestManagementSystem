<%@page import="com.refresh.TableType"%>
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

	

</script>

<%
	ServletContext ctx = getServletContext();
	String tsTitle = (String)session.getAttribute("tsTitle");
	List<String> daejeonList = (ArrayList<String>)session.getAttribute("daejeon");
	List<String> giSaList = (ArrayList<String>)session.getAttribute("giSaList");
	TableType giSaTableType = (TableType)session.getAttribute("daejeonGiSaTableType");
%>

<div class="content-wrapper">
	<section class="content">
		<div class="col-md-6"></div>
	          <!-- AREA CHART -->
	         
	         <div class="box box-info ">
            <div class="box-header with-border">
				<h3 class="box-title"><%= tsTitle %></h3>
				
				<div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				</div>
            </div>
            
			<div class="box-body">
				<table border="1">
					<thead>
						<tr>
							<th>종 목 ＼ 본 부&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
							<% for(int i=0; i < daejeonList.size(); i++) { %>
							<th><%= daejeonList.get(i) %>&nbsp&nbsp</th>
							<%} %>
							<th>총&nbsp&nbsp&nbsp합</th>
						</tr>
					</thead>
					<tbody>
						<% for (int i=0; i < giSaList.size(); i++) {%>
						<tr>
							<th><%= giSaList.get(i) %>&nbsp&nbsp</th>
							<% for (int j=0; j < daejeonList.size(); j++) {%>
							<td align="center"><%= giSaTableType.getYesArr()[i][j] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSaTableType.getArr()[i][j] %></td>
							<%} %>
							<td align="center"><%= giSaTableType.getYesHSum()[i] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSaTableType.gethSum()[i] %></td>
						</tr>
						<%} %>
						<!-- 세로 총합 구하기 -->
						<tr>
							<th>총&nbsp&nbsp&nbsp합</th>
						<% for (int i=0; i < daejeonList.size(); i++) {%>
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
	
	</section>
</div>