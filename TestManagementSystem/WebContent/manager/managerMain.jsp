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
		location.href = "http://210.125.213.90:8090/TestManagementSystem/ManagerLoginServlet?mId=1234&mPw=1234&yy="+ x;
	}
	function year2() {
		var x2 = document.getElementById("yearSelect2").value;
		location.href = "http://210.125.213.90:8090/TestManagementSystem/ManagerLoginServlet?mId=1234&mPw=1234&yy="+ x2;
	}
	function year3() {
		var x3 = document.getElementById("yearSelect3").value;
		location.href = "http://210.125.213.90:8090/TestManagementSystem/ManagerLoginServlet?mId=1234&mPw=1234&yy="+ x3;
	}
	function year4() {
		var x4 = document.getElementById("yearSelect4").value;
		location.href = "http://210.125.213.90:8090/TestManagementSystem/ManagerLoginServlet?mId=1234&mPw=1234&yy="+ x4;
	}

</script>

<%
	String yy = (String) request.getAttribute("yy");	// 년도 입력받음
	SelectService service = new SelectService();
	List<String> bonbooList = service.selectBonBoo();						// 모든 본부 리스트 가져옴
	
	List<String> giSaList = service.selectQualificationList("기사");// 기사에 해당되는 모든 종목 가져옴(가나다순)
	List<String> giNngSaList = service.selectQualificationList("기능사");// 기능사에 해당되는 모든 종목 가져옴(가나다순)
	List<String> giSulSaList = service.selectQualificationList("기술사");// 기술사에 해당되는 모든 종목 가져옴(가나다순)
	List<String> giNngJangList = service.selectQualificationList("기능장");// 기술사에 해당되는 모든 종목 가져옴(가나다순)
	
	int [][] giNngSaArr = new int[giNngSaList.size()][bonbooList.size()];	// 기능사 시험 신청 수 저장 할 배열
	int [][] yesGiNngSaArr = new int[giNngSaList.size()][bonbooList.size()];	// 기능사 시험 출석 수 저장 할 배열
	
	int [][] giSaArr = new int[giSaList.size()][bonbooList.size()];	// 기사 시험 신청 수 저장 할 배열
	int [][] yesGiSaArr = new int[giSaList.size()][bonbooList.size()];	// 기사 시험 출석 수 저장 할 배열
	
	int [][] giSulSaArr = new int[giSulSaList.size()][bonbooList.size()];	// 기술사 시험 신청 수 저장 할 배열
	int [][] yesGiSulSaArr = new int[giSulSaList.size()][bonbooList.size()];	// 기술사 시험 출석 수 저장 할 배열
	
	int [][] giNngJangArr = new int[giNngJangList.size()][bonbooList.size()];	// 기능장 시험 신청 수 저장 할 배열
	int [][] yesGiNngJangArr = new int[giNngJangList.size()][bonbooList.size()];	// 기능장 시험 출석 수 저장 할 배열
	
	Map<String, String> giSaPeopleMap = new HashMap<>();
	Map<String, String> giNngSaPeopleMap = new HashMap<>();
	Map<String, String> giSulSaPeopleMap = new HashMap<>();
	Map<String, String> giNngJangPeopleMap = new HashMap<>();
	int giSaSum=0, yesGiSaSum=0, giSaTotal=0, yesGiSaTotal=0;	// 기사 행마다의 합, 행마다의 합의 총합
	int giNngSaSum=0, yesGiNngSaSum=0, giNngSaTotal=0, yesGiNngSaTotal=0;	// 기능사 행마다의 합, 행마다의 합의 총합
	int giSulSaSum=0, yesGiSulSaSum=0, giSulSaTotal=0, yesGiSulSaTotal=0;	// 기술사 행마다의 합, 행마다의 합의 총합
	int giNngJangSum=0, yesGiNngJangSum=0, giNngJangTotal=0, yesGiNngJangTotal=0;	// 기능장 행마다의 합, 행마다의 합의 총합
	
	for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
	{
		for(int j=0; j < bonbooList.size(); j++)
		{
			giSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
			giSaPeopleMap.put("S_BONBOO", bonbooList.get(j));	// 본부이름
			giSaPeopleMap.put("tsYear", yy);	// 일정년도
			giSaArr[i][j] =  service.selectSubmitPeople(giSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
			yesGiSaArr[i][j] = service.selectYesPeople(giSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
		}
	}
	
	for(int i=0; i < giNngSaList.size(); i++)		// 기능사 사람 수 구하기
	{
		for(int j=0; j < bonbooList.size(); j++)
		{
			giNngSaPeopleMap.put("qName", giNngSaList.get(i));	// 종목이름
			giNngSaPeopleMap.put("S_BONBOO", bonbooList.get(j));	// 본부이름
			giNngSaPeopleMap.put("tsYear", yy);	// 일정년도
			giNngSaArr[i][j] =  service.selectSubmitPeople(giNngSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
			yesGiNngSaArr[i][j] = service.selectYesPeople(giNngSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
		}
	}
	
	for(int i=0; i < giSulSaList.size(); i++)		// 기술사 사람 수 구하기
	{
		for(int j=0; j < bonbooList.size(); j++)
		{
			giSulSaPeopleMap.put("qName", giSulSaList.get(i));	// 종목이름
			giSulSaPeopleMap.put("S_BONBOO", bonbooList.get(j));	// 본부이름
			giSulSaPeopleMap.put("tsYear", yy);	// 일정년도
			giSulSaArr[i][j] =  service.selectSubmitPeople(giSulSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
			yesGiSulSaArr[i][j] = service.selectYesPeople(giSulSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
		}
	}
	
	for(int i=0; i < giNngJangList.size(); i++)		// 기능사 사람 수 구하기
	{
		for(int j=0; j < bonbooList.size(); j++)
		{
			giNngJangPeopleMap.put("qName", giNngJangList.get(i));	// 종목이름
			giNngJangPeopleMap.put("S_BONBOO", bonbooList.get(j));	// 본부이름
			giNngJangPeopleMap.put("tsYear", yy);	// 일정년도
			giNngJangArr[i][j] =  service.selectSubmitPeople(giNngJangPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
			yesGiNngJangArr[i][j] = service.selectYesPeople(giNngJangPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
		}
	}
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
				현재 선택한 년도는 20<%=yy %>년 입니다
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
							<td align="center"><%= yesGiNngSaArr[i][j] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngSaArr[i][j] %></td>
							<% giNngSaSum += giNngSaArr[i][j]; %>
							<% yesGiNngSaSum += yesGiNngSaArr[i][j]; %>
							<%} %>
							<td align="center"><%= yesGiNngSaSum %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngSaSum %></td>
							<% giNngSaTotal += giNngSaSum; %>
							<% yesGiNngSaTotal += yesGiNngSaSum; %>
							<% giNngSaSum = 0;%>
							<% yesGiNngSaSum = 0; %>
						</tr>
						<%} %>
						<!-- 세로 총합 구하기 -->
						<tr>
							<th>총&nbsp&nbsp&nbsp합</th>
						<% for (int i=0; i < bonbooList.size(); i++) {%>
							<% for (int j=0; j < giNngSaList.size(); j++) {%>
							<% giNngSaSum += giNngSaArr[j][i]; %>
							<% yesGiNngSaSum += yesGiNngSaArr[j][i]; %>
							<%} %>
							<td align="center"><%= yesGiNngSaSum %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngSaSum %></td>
							<% giNngSaSum = 0; %>
							<% yesGiNngSaSum = 0; %>
						<%} %>
						<td align="center"><%=yesGiNngSaTotal%>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%=giNngSaTotal%></td>
						</tr>
					</tbody>
				</table>             
			</div>
	          <!-- /.box -->
		</div>
		<!-- DONUT CHART -->
	<!-- 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝  -->
	         
		<div class="box box-success collapsed-box">
            <div class="box-header with-border">
				<h3 class="box-title">기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp사</h3>
				<select id="yearSelect2" onchange="year2()">
					<option value="16">연도선택</option>
					<option value="16">2016년</option>
					<option value="15">2015년</option>
				</select>
				현재 선택한 년도는 20<%=yy %>년 입니다
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
							<td align="center"><%= yesGiSaArr[i][j] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSaArr[i][j] %></td>
							<% giSaSum += giSaArr[i][j]; %>
							<% yesGiSaSum += yesGiSaArr[i][j]; %>
							<%} %>
							<td align="center"><%= yesGiSaSum %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSaSum %></td>
							<% giSaTotal += giSaSum; %>
							<% yesGiSaTotal += yesGiSaSum; %>
							<% giSaSum = 0;%>
							<% yesGiSaSum = 0; %>
						</tr>
						<%} %>
						<!-- 세로 총합 구하기 -->
						<tr>
							<th>총&nbsp&nbsp&nbsp합</th>
						<% for (int i=0; i < bonbooList.size(); i++) {%>
							<% for (int j=0; j < giSaList.size(); j++) {%>
							<% giSaSum += giSaArr[j][i]; %>
							<% yesGiSaSum += yesGiSaArr[j][i]; %>
							<%} %>
							<td align="center"><%= yesGiSaSum %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSaSum %></td>
							<% giSaSum = 0; %>
							<% yesGiSaSum = 0; %>
						<%} %>
						<td align="center"><%=yesGiSaTotal%>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%=giSaTotal%></td>
						</tr>
					</tbody>
				</table>             
			</div>
	          <!-- /.box -->
		</div>
		<!-- DONUT CHART -->
		<!-- 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝  -->
		
		<div class="box box-info collapsed-box">
            <div class="box-header with-border">
				<h3 class="box-title">기 술 사</h3>
				<select id="yearSelect3" onchange="year3()">
					<option value="16">연도선택</option>
					<option value="16">2016년</option>
					<option value="15">2015년</option>
				</select>
				현재 선택한 년도는 20<%=yy %>년 입니다
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
							<td align="center"><%= yesGiSulSaArr[i][j] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSulSaArr[i][j] %></td>
							<% giSulSaSum += giSulSaArr[i][j]; %>
							<% yesGiSulSaSum += yesGiSulSaArr[i][j]; %>
							<%} %>
							<td align="center"><%= yesGiSulSaSum %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSulSaSum %></td>
							<% giSulSaTotal += giSulSaSum; %>
							<% yesGiSulSaTotal += yesGiSulSaSum; %>
							<% giSulSaSum = 0;%>
							<% yesGiSulSaSum = 0; %>
						</tr>
						<%} %>
						<!-- 세로 총합 구하기 -->
						<tr>
							<th>총&nbsp&nbsp&nbsp합</th>
						<% for (int i=0; i < bonbooList.size(); i++) {%>
							<% for (int j=0; j < giSulSaList.size(); j++) {%>
							<% giSulSaSum += giSulSaArr[j][i]; %>
							<% yesGiSulSaSum += yesGiSulSaArr[j][i]; %>
							<%} %>
							<td align="center"><%= yesGiSulSaSum %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giSulSaSum %></td>
							<% giSulSaSum = 0; %>
							<% yesGiSulSaSum = 0; %>
						<%} %>
						<td align="center"><%=yesGiSulSaTotal%>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%=giSulSaTotal%></td>
						</tr>
					</tbody>
				</table>             
			</div>
	          <!-- /.box -->
		</div>
		<!-- DONUT CHART -->
		<!-- 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 -->
	
	<div class="box box-warning collapsed-box">
            <div class="box-header with-border">
				<h3 class="box-title">기 능 장</h3>
				<select id="yearSelect4" onchange="year4()">
					<option value="16">연도선택</option>
					<option value="16">2016년</option>
					<option value="15">2015년</option>
				</select>
				현재 선택한 년도는 20<%=yy %>년 입니다
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
							<td align="center"><%= yesGiNngJangArr[i][j] %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngJangArr[i][j] %></td>
							<% giNngJangSum += giNngJangArr[i][j]; %>
							<% yesGiNngJangSum += yesGiNngJangArr[i][j]; %>
							<%} %>
							<td align="center"><%= yesGiNngJangSum %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngJangSum %></td>
							<% giNngJangTotal += giNngJangSum; %>
							<% yesGiNngJangTotal += yesGiNngJangSum; %>
							<% giNngJangSum = 0;%>
							<% yesGiNngJangSum = 0; %>
						</tr>
						<%} %>
						<!-- 세로 총합 구하기 -->
						<tr>
							<th>총&nbsp&nbsp&nbsp합</th>
						<% for (int i=0; i < bonbooList.size(); i++) {%>
							<% for (int j=0; j < giNngJangList.size(); j++) {%>
							<% giNngJangSum += giNngJangArr[j][i]; %>
							<% yesGiNngJangSum += yesGiNngJangArr[j][i]; %>
							<%} %>
							<td align="center"><%= yesGiNngJangSum %>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%= giNngJangSum %></td>
							<% giNngJangSum = 0; %>
							<% yesGiNngJangSum = 0; %>
						<%} %>
						<td align="center"><%=yesGiNngJangTotal%>/&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp/<%=giNngJangTotal%></td>
						</tr>
					</tbody>
				</table>             
			</div>
	          <!-- /.box -->
		</div>
		<!-- DONUT CHART -->
	<!-- 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 -->
	
	</section>
</div>