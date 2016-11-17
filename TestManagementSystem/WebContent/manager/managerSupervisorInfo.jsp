<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="jquery-3.1.0.min.js"></script>
<script type="text/javascript">

	var opt = [];
	var opt2 = [];
	var opt3 = [];

	opt['100'] = [["전체 기관",""], ["서대문구","01"], ["노원구","02"], ["성북구","03"]];
	opt['200'] = [["전체 기관",""], ["동구","01"], ["부산진구","02"], ["서구","03"]];
	opt['300'] = [["전체 기관",""], ["중구","01"], ["유성구","02"], ["대덕구","03"]];
	
	function changeGigwanSelect(sel){
		var gigwan = document.getElementById("gigwanSelect");
		var name = document.getElementById("nameSelect");
		var room = document.getElementById("roomSelect");
		
		if(sel.value == '') {
		    gigwan.options.length = 1;
			gigwan.options[0].text = "전체 기관";
	    	gigwan.options[0].value = "";
	    	
	    	name.options.length = 1;
	    	name.options[0].text = "전체 시험장";
	    	name.options[0].value = "";
	    	
	    	room.options.length = 1;
	    	room.options[0].text = "전체 시험실";
	    	room.options[0].value = "";
		}
		else {
			gigwan.options.length = 0;
		    var current = opt[sel.value];
		    gigwan.options.length = current.length;
		    for(var i=0;i<current.length;i++){
		    	gigwan.options[i].text = current[i][0];
		    	gigwan.options[i].value = current[i][1];
		    }
		}
	}
	
	function changeNameSelect(sel){
		var bonboo = document.getElementById("bonbooSelect").value;
		var name = document.getElementById("nameSelect");
		var room = document.getElementById("roomSelect");
		
		if (bonboo == '100') {
			opt2['01'] = [["전체 시험장",""], ["인창고등학교","01"], ["명지고등학교","02"], ["한성고등학교","03"]];
			opt2['02'] = [["전체 시험장",""], ["대진고등학교","01"], ["청원고등학교","02"], ["노원고등학교","03"]];
			opt2['03'] = [["전체 시험장",""], ["용문고등학교","01"], ["경동고등학교","02"], ["석관고등학교","03"]];
		}
		if (bonboo == '200') {
			opt2['01'] = [["전체 시험장",""], ["부산고등학교","01"], ["경남여자고등학교","02"], ["부산금성고등학교","03"]];
			opt2['02'] = [["전체 시험장",""], ["개성고등학교","01"], ["가야고등학교","02"], ["개금고등학교","03"]];
			opt2['03'] = [["전체 시험장",""], ["경남고등학교","01"], ["부경고등학교","02"], ["경성전자고등학교","03"]];
		}
		if (bonboo == '300') {
			opt2['01'] = [["전체 시험장",""], ["대전고등학교","01"], ["대성고등학교","02"], ["대전동산고등학교","03"]];
			opt2['02'] = [["전체 시험장",""], ["유성고등학교","01"], ["노은고등학교","02"], ["대덕고등학교","03"]];
			opt2['03'] = [["전체 시험장",""], ["동대전고등학교","01"], ["신탄진고등학교","02"], ["대전송촌고등학교","03"]];
		}
		
		if(sel.value == '') {
	    	name.options.length = 1;
	    	name.options[0].text = "전체 시험장";
	    	name.options[0].value = "";
	    	
	    	room.options.length = 1;
	    	room.options[0].text = "전체 시험실";
	    	room.options[0].value = "";
		}
		else {
			name.options.length = 0;
		    var current = opt2[sel.value];
		    name.options.length = current.length;
		    for(var i=0;i<current.length;i++){
		    	name.options[i].text = current[i][0];
		    	name.options[i].value = current[i][1];
		    }
		}
	}
	
	function changeRoomSelect(sel) {
		var room = document.getElementById("roomSelect");
		
		opt3['0'] = [["전체 시험실",""], ["1시험실","1"], ["2시험실","2"], ["3시험실","3"]];
		
		if(sel.value == '') {
	    	room.options.length = 1;
	    	room.options[0].text = "전체 시험실";
	    	room.options[0].value = "";
		}
		else {
		    var current = opt3['0'];
		    room.options.length = current.length;
		    room.options.length = 4;
		    for(var i=0;i<current.length;i++){
		    	room.options[i].text = current[i][0];
		    	room.options[i].value = current[i][1];
		    }
		}
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
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<section class="content">
	
	<div class="col-md-6"></div>
		    <div class="box box-info ">
            <div class="box-header with-border">
		
		<form action="ManagerSupervisorInfoFormServlet" method="get">
		장소별 감독관 보기&nbsp;
			<select id="bonbooSelect" name="bonbooSelect" onchange="changeGigwanSelect(this)">
				<option value="">전국</option>
				<option value="100">서울지역본부</option>
				<option value="200">부산지역본부</option>
				<option value="300">대전지역본부</option>
			</select>
			
			<select id="gigwanSelect" name="gigwanSelect" onchange="changeNameSelect(this)">
				<option value="">전체 기관</option>
			</select>
			
			<select id="nameSelect" name="nameSelect" onchange="changeRoomSelect(this)">
				<option value="">전체 시험장</option>
			</select>
			
			<select id="roomSelect" name="roomSelect">
				<option value="">전체 시험실</option>
			</select>
			
			<input class="btn btn-primary" type="submit" value="보기">
		</form>
		<c:set var="supervisorList" value="${supervisorList}" />
		<p/><table border="1" class="table table-striped table-hover">
				<tr>
					<th class="back">감독관<p>ID</p></th>
					<th class="back" width="60">감독관<p>이름</p></th>
					<th class="back">감독관<p>소속</p></th>
					<th class="back">감독관<p>전화</p></th>
					<th class="back" width="75">감독관<p>우편번호</p></th>
					<th class="back">감독관<p>주소</p></th>
					<th class="back">감독관<p>생년월일</p></th>
					<th class="back">감독관<p>담당시험실</p></th>
				</tr>
				
				<c:forEach var="supervisor" items="${supervisorList}">
				<tr>
					<td align="center">${supervisor.ssId}</td>
					<td align="center">${supervisor.sName}</td>
					<td align="center">${supervisor.sGroup}</td>
					<td align="center">${supervisor.sPhone}</td>
					<td align="center">${supervisor.sPost}</td>
					<td align="center">${supervisor.sAddr1}<br>${supervisor.sAddr2}</td>
					<td align="center">${supervisor.sBirth}</td>
					<td align="center"><div align="center">${supervisor.schoolDTO.s_bonboo} ${supervisor.schoolDTO.s_gigwan} ${supervisor.schoolDTO.s_name} ${supervisor.schoolDTO.s_room}시험실</div></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</div>
	</section>
</div>

<!-- /.content-wrapper -->