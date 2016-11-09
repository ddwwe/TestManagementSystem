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
	    qClassChoice.options.length = 0;
	    var current = opt[sel.value];
	    qClassChoice.options.length = current.length;
	    for(var i=0;i<current.length;i++){
	    	qClassChoice.options[i].text = current[i][0];
	    	qClassChoice.options[i].value = current[i][1];
	    }
	}
	
	var opt2 = [];

	function changeQNameChoice(sel){
		var tsNo = document.getElementById("tsNoChoice").value;
		
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
	    var qNameChoice = document.getElementById("qNameChoice");
	    qNameChoice.options.length = 0;
	    var current = opt2[sel.value];
	    qNameChoice.options.length = current.length;
	    for(var i=0;i<current.length;i++){
	    	qNameChoice.options[i].text = current[i][0];
	    	qNameChoice.options[i].value = current[i][1];
	    }
	}
	
	function buttonDisabled() {
		document.getElementById("submit").disabled = false;
	}


</script>

<%
	String bonboo = (String)request.getAttribute("bonboo");
	String gigwan = (String)request.getAttribute("gigwan");
	String name = (String)request.getAttribute("name");
	String room = (String)request.getAttribute("room");
	List<HashMap<String, String>> studentDataList = (ArrayList<HashMap<String, String>>)request.getAttribute("studentDataList");
	List<HashMap<String, String>> supervisorDataList = (ArrayList<HashMap<String, String>>)request.getAttribute("supervisorDataList");
	int count=0;
%>

<div class="content-wrapper">
	<section class="content">
		<div class="col-md-6"></div>
	          <!-- AREA CHART -->
	         
	         <div class="box box-info ">
            <div class="box-header with-border">
            
            </div>
            
			<div class="box-body">
				<table border="1">
					<tr align="center">
						<th align="center">시험실 담당 감독관</th>
						<th align="center">감독관 ID</th>
					</tr>
					<tr align="center">
						<td><%= supervisorDataList.get(0).get("SNAME") %></td>
						<td><%= supervisorDataList.get(0).get("SSID") %></td>
					</tr>
					<tr align="center">
						<td><%= supervisorDataList.get(1).get("SNAME") %></td>
						<td><%= supervisorDataList.get(1).get("SSID") %></td>
					</tr>
				</table>
				<p/>
				<table border="1">
					<thead>
						<tr al>
							<th>좌석번호</th>
							<th>수험번호</th>
							<th>수험생 이름</th>
							<th>과목</th>
							<th>시험지 유형</th>
							<th>참석여부</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<% for (int i=0; i < studentDataList.size(); i++) {%>
						<tr>
							<td align="center"><%= studentDataList.get(i).get("PSEAT") %></td>
							<td align="center"><%= studentDataList.get(i).get("SNO") %></td>
							<td align="center"><%= studentDataList.get(i).get("ENAME") %></td>
							<td align="center"><%= studentDataList.get(i).get("QNAME") %></td>
							<td align="center"><%= studentDataList.get(i).get("PTYPE") %></td>
							<td align="center"><%= studentDataList.get(i).get("PATTENDANCE") %></td>
							<% if(studentDataList.get(i).get("PNOTE") == null) { %>
							<td align="center"></td>
							<% } else {%>
							<td align="center"><%= studentDataList.get(i).get("PNOTE") %></td>
							<% } %>
						</tr>
						<%} %>
					</tbody>
				</table>             
			</div>
	          <!-- /.box -->
		</div>
		<!-- DONUT CHART -->
	<!-- 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 -->
	
	</section>
</div>