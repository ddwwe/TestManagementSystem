<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	.hh {
	color:red;
	}
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<section class="content-header">
		<div class="box-body table-responsive no-padding">
		<h3 class="hh">컨트롤 + F로 감독관 정보를 찾으시면 편리합니다</h3>
		<c:set var="supervisorList" value="${supervisorList}" />
		<p/><table class="table table-hover">
				<tr>
					<th align="center">감독관 ID</th>
					<th align="center">감독관 이름</th>
					<th align="center">감독관 소속</th>
					<th align="center">감독관 전화</th>
					<th align="center">감독관 우편번호</th>
					<th align="center">감독관 주소</th>
					<th align="center">감독관 생년월일</th>
					<th align="center">감독관 담당 시험실</th>
				</tr>
				
				<c:forEach var="supervisor" items="${supervisorList}">
				<tr>
					<td align="center">${supervisor.ssId}</td>
					<td align="center">${supervisor.sName}</td>
					<td align="center">${supervisor.sGroup}</td>
					<td align="center">${supervisor.sPhone}</td>
					<td align="center">${supervisor.sPost}</td>
					<td align="center">${supervisor.sAddr1} ${supervisor.sAddr2}</td>
					<td align="center">${supervisor.sBirth}</td>
					<td align="center"><div align="center">${supervisor.schoolDTO.s_bonboo}<br>${supervisor.schoolDTO.s_gigwan}<br>${supervisor.schoolDTO.s_name}<br>${supervisor.schoolDTO.s_room}시험실</div></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</section>
</div>
<!-- /.content-wrapper -->