<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<section class="content-header">
		<div class="box-body table-responsive no-padding">
			<table class="table table-hover">
				<tr>
					<th>글번호</th>
					<th>감독관 ID</th>
					<th>날짜</th>
					<th>장소</th>
					<th>내용</th>
				</tr>
				<tr>
					<td>123</td>
					<td>한누리</td>
					<td>11-7-2014</td>
					<td><span class="label label-success">경기도 평택시 동일공업고등학교</span></td>
					<td>감독관이 전한 메시지입니다.</td>
				</tr>
				<tr>
					<td>456</td>
					<td>김원교</td>
					<td>11-7-2014</td>
					<td><span class="label label-warning">히히</span></td>
					<td>감독관이 전한 메시지입니다.</td>
				</tr>
				<tr>
					<td>678</td>
					<td>김대원</td>
					<td>11-7-2014</td>
					<td><span class="label label-primary">책상 뒷다리때리기</span></td>
					<td>감독관이 전한 메시지입니다.</td>
				</tr>
				<tr>
					<td>175</td>
					<td>소명섭</td>
					<td>11-7-2014</td>
					<td><span class="label label-danger">집구석어딘가에...</span></td>
					<td>감독관이 전한 메시지입니다..</td>
				</tr>
			</table>
			
<table class="table table-hover">
 
 <tr>
	<th width="6%"><div align="center">글번호</div></th>
	<th width="5%">감독관<br><div align="center">ID</div></th>
	<th width="5%"><div align="center">날짜</div></th>
	<th width="15%"><div align="center">장소</div></th>
	<th width="69%">내용</th>
 </tr>
<c:set var="page" value="${page}" />
<c:forEach var="errataList" items="${page.list}" varStatus="status">
 <tr>
   <td>${errataList.bNo}</td>

  <c:if test="${manaLogin != null }">
   <td><a href="ManagerBoardWriteServlet?ssId=${errataList.ssId}">${errataList.ssId}</a></td>
  </c:if>
  <c:if test="${manaLogin == null }">
   <td>${errataList.ssId}</td>
  </c:if>
  
   <td>${errataList.bDate}</td>
   <td><div align="center">${errataList.schoolDTO.s_bonboo}<br>${errataList.schoolDTO.s_gigwan}<br>${errataList.schoolDTO.s_name}<br>${errataList.schoolDTO.s_room}시험실</div></td>
   <td>${errataList.bContent}</td>
 </tr>
 </c:forEach>
  <tr>
    <td colspan="5" align="center">
     <ul class="pagination">
      <jsp:include page="page.jsp" flush="true" />
     </ul>
    </td>
  </tr>
 
 
 
 
 
</table>
		</div>
	</section>
</div>
<!-- /.content-wrapper -->