<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.dto.PlaceDTO"%>
<%@page import="com.service.SelectService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	

<script type="text/javascript" src="jquery-3.1.0.min.js"></script>
<script type="text/javascript">

	var opt = [];
	opt['15'] = [["등급 선택",""],["기능사","giNngSa"],["기사","giSa"],["기술사","giSulSa"],["기능장","giNngJang"]];
	opt['16'] = [["등급 선택",""],["기능사","giNngSa"],["기사","giSa"],["기술사","giSulSa"],["기능장","giNngJang"]];

	function changeQClassChoice(sel){
	    var qClassChoice = document.getElementById("qClassChoice");
	    var qNameChoice = document.getElementById("qNameChoice");
	    
	    if(sel.value == '') {
	    	qClassChoice.options.length = 1;
	    	qClassChoice.options[0].text = "등급 선택";
	    	qClassChoice.options[0].value = "";
	    	
	    	qNameChoice.options.length = 1;
	    	qNameChoice.options[0].text = "시험 선택";
	    	qNameChoice.options[0].value = "";
		}
		else {
		    qClassChoice.options.length = 0;
		    var current = opt[sel.value];
		    qClassChoice.options.length = current.length;
		    for(var i=0;i<current.length;i++){
		    	qClassChoice.options[i].text = current[i][0];
		    	qClassChoice.options[i].value = current[i][1];
		    }
		}
	}
	
	var opt2 = [];

	function changeQNameChoice(sel){
		var tsNo = document.getElementById("tsNoChoice").value;
	    var qNameChoice = document.getElementById("qNameChoice");
		
		opt2['giNngSa'] = [["시험이름 선택",""],["1차 기능사 필기","10"],["2차 기능사 필기","11"],["4차 기능사 필기","13"],["5차 기능사 필기","14"],["1차 기능사 실기","15"],["2차 기능사 실기","16"],["3차 기능사 실기","17"],["4차 기능사 실기","18"],["5차 기능사 실기","19"]];
		opt2['giSa'] = [["시험이름 선택",""],["1차 기사 필기","01"],["2차 기사 필기","02"],["3차 기사 필기","03"],["4차 기사 필기","04"],["1차 기사 실기","06"],["2차 기사 실기","07"],["3차 기사 실기","08"],["4차 기사 실기","09"]];
		
		if (tsNo == '15') {
			opt2['giSulSa'] = [["시험이름 선택",""],["기술사 105회 필기","21"],["기술사 106회 필기","22"],["기술사 107회 필기","23"],["기술사 105회 면접","26"],["기술사 106회 면접","27"],["기술사 107회 면접","28"]];
			opt2['giNngJang'] = [["시험이름 선택",""],["기능장 57회 필기","31"],["기능장 58회 필기","32"],["기능장 57회 실기","36"],["기능장 58회 실기","37"]];
		}
		if (tsNo == '16') {
			opt2['giSulSa'] = [["시험이름 선택",""],["기술사 108회 필기","21"],["기술사 109회 필기","22"],["기술사 110회 필기","23"],["기술사 108회 면접","26"],["기술사 109회 면접","27"],["기술사 110회 면접","28"]];
			opt2['giNngJang'] = [["시험이름 선택",""],["기능장 59회 필기","31"],["기능장 60회 필기","32"],["기능장 59회 실기","36"],["기능장 60회 실기","37"]];
		}

		if(sel.value == '') {
	    	
			qNameChoice.options.length = 1;
			qNameChoice.options[0].text = "시험 선택";
	    	qNameChoice.options[0].value = "";
		}
		else {
		    qNameChoice.options.length = 0;
		    var current = opt2[sel.value];
		    qNameChoice.options.length = current.length;
		    for(var i=0;i<current.length;i++){
		    	qNameChoice.options[i].text = current[i][0];
		    	qNameChoice.options[i].value = current[i][1];
		    }
		}
	}
	
	function buttonDisabled() {
		document.getElementById("submit").disabled = false;
	}


</script>
<style>
.back{
background:#DCEBFF;
text-align: center;
vertical-align: middle;
}
.cal{
text-align: center;
vertical-align: middle;
font-weight: bold;
}
.cen{
text-align: center;
vertical-align: middle;

}
</style>
<%
	List<String> qNameList = (ArrayList<String>)request.getAttribute("qNameList");
	List<PlaceDTO> bonbooList = (ArrayList<PlaceDTO>)request.getAttribute("bonbooList");
	int [][] AttendCountArr = (int[][])request.getAttribute("mainAttendCountArr");
	int [][] SubmitCountArr = (int[][])request.getAttribute("mainSubmitCountArr");
	int [] AttendHSumArr = (int[])request.getAttribute("mainAttendHSumArr");
	int [] SubmitHSumArr = (int[])request.getAttribute("mainSubmitHSumArr");
	int [] AttendVSumArr = (int[])request.getAttribute("mainAttendVSumArr");
	int [] SubmitVSumArr = (int[])request.getAttribute("mainSubmitVSumArr");
	int AttendTotal = (int)request.getAttribute("mainAttendTotal");
	int SubmitTotal = (int)request.getAttribute("mainSubmitTotal");
%>

<div class="content-wrapper">
	<section class="content">
		<div class="col-md-6"></div>
	          <!-- AREA CHART -->
	         
	         <div class="box box-info ">
            <div class="box-header with-border">
            
            	<form action="MainStatFormServlet" method="get">
	            	<select name="tsNoChoice" id="tsNoChoice" onchange="changeQClassChoice(this)">
					    <option value="">연도 선택</option>
					    <option value="15">2015년</option>
					    <option value="16">2016년</option>
					</select>
	            
	            	<select name="qClassChoice" id="qClassChoice" onchange="changeQNameChoice(this)">
						<option value="">등급 선택</option>
					</select>
	
					<select name="qNameChoice" id="qNameChoice" onchange="buttonDisabled()">
						<option value="">시험 선택</option>
					</select>
					
					<input class="btn btn-primary" id="submit" type="submit" value="검색" disabled="disabled">
				</form>
            </div>
            
			<div class="box-body">
				<table border="1" class="table table-striped table-hover">
					<thead>
						<tr>
							<th class="back">종 목 ＼ 본 부</th>
							<% for(int i=0; i < bonbooList.size(); i++) { %>
							<th class="back"><%= bonbooList.get(i).getS_Place() %></th>
							<%} %>
						</tr>
					</thead>
					<tbody>
						<% for (int i=0; i < qNameList.size(); i++) {%>
						<tr>
							<th class="cen"><%= qNameList.get(i) %></th>
							<% for (int j=0; j < bonbooList.size(); j++) {%>
							<td align="center"><%= AttendCountArr[i][j] %>/<%= SubmitCountArr[i][j] %></td>
							<%} %>
						</tr>
						<%} %>
					</tbody>
				</table> 
				
				<p/>　<p/><h3>지역별 총합</h3><p/>
				<table class="table table-striped table-hover">
					<tr>
						<% for(int i=0; i < bonbooList.size(); i++) { %>
						<th class="back"><%= bonbooList.get(i).getS_Place() %></th>
						<%} %>
						<th class="back">총 합</th>
					</tr>
					<tr>
						<% for (int i=0; i < bonbooList.size(); i++) {%>
							<td class="cal"><%= AttendVSumArr[i] %>/<%= SubmitVSumArr[i] %></td>
						<%} %>
						<td class="cal"><%=AttendTotal%>/<%=SubmitTotal%></td>
						
					</tr>
				</table>
				
				<p/>　<p/><h3>응시종목 총합</h3><p/>
				<table class="table table-striped table-hover">
					<tr>
						<% for(int i=0; i < qNameList.size(); i++) { %>
							<th class="back"><%= qNameList.get(i) %></th>
						<%} %>
					</tr>
					<tr>
						<% for (int i=0; i < qNameList.size(); i++) {%>
							<td align="center"><%= AttendHSumArr[i] %>/<%= SubmitHSumArr[i] %></td>
						<%} %>
					</tr>
				</table>
			</div>
	          <!-- /.box -->
		</div>
		<!-- DONUT CHART -->
	<!-- 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 -->
	
	</section>
</div>