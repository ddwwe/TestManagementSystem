<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<section class="content-header">
		<div class="box-body table-responsive no-padding">
		<a href="ManagerBoardWriteUIServlet"><button class="btn btn-warning"><i class="fa fa-pencil"></i> 글 쓰기</button></a>&nbsp;
		<a href="ManagerBoardFormServlet"><button class="btn btn-info"><i class="fa fa-comments-o"></i> 모든 글 보기</button></a>&nbsp;
		<a href="ManagerNoticeBoardFormServlet"><button class="btn btn-success"><i class="fa fa-comment-o"></i> 공지사항 보기</button></a>&nbsp;
		<p/><table class="table table-condensed">
				<tr align="center">
					<th class="active" width="50"><div align="center">글번호</div></th>
					<th class="success" width="80"><div align="center">보낸이</div></th>
					<th class="warning" width="80"><div align="center">종목</div></th>
					<th class="danger" width="60"><div align="center">감독관</div></th>
					<th class="info" width="80"><div align="center">날짜</div></th>
					<th class="success"  width="100"><div align="center">장소</div></th>
					<th class="active" width="50">내용</th>
				</tr>
				<c:set var="page" value="${page}" />
				<c:forEach var="errata" items="${page.list}" varStatus="status">
				<tr>
					<c:if test="${errata.bType == 'send' || errata.bType == 'notice'}">
						<td align="center"  width="50"><h5>${errata.bNo}</h5><a href="ManagerBoardUpdateUIServlet?bNo=${errata.bNo}"><input class="btn btn-primary btn-sm" type="button" value="글 수정"></a><p/><p/><a href="ManagerDeleteBoardServlet?bNo=${errata.bNo}&type=ManagerBoardFormServlet"><input class="btn btn-danger btn-sm" type="button" value="글 삭제"></a></td>
					</c:if>
					<c:if test="${errata.bType == 'receive'}">
						<td align="center"  width="50">${errata.bNo}</td>
					</c:if>
					
					<c:if test="${errata.bType == 'receive' }">
						<td align="center" >감독관<br>↓<br>관리자<br><br>보낸글</td>
					</c:if>
					<c:if test="${errata.bType == 'notice' }">
						<td align="center" >공지사항</td>
					</c:if>
					<c:if test="${errata.bType == 'send' }">
						<td align="center" >관리자<br>↓<br>감독관<br><br>보낸글</td>
					</c:if>
					
					<c:if test="${errata.bType == 'notice'}">
						<td align="center"  >모든 종목</td>
					</c:if>
					<c:if test="${errata.bType == 'send' || errata.bType == 'receive'}">
						<td align="center" ><a href="ManagerBoardWriteUIServlet?qCode=${errata.qCode}&qName=${errata.qName}">${errata.qName}</a></td>
					</c:if>
					
					<c:if test="${errata.bType == 'notice'}">
						<td align="center"  class="danger" valign=middle>모든 감독관</td>
					</c:if>
					<c:if test="${errata.bType == 'send' || errata.bType == 'receive'}">
						<td align="center"  class="danger" valign=middle><a href="ManagerBoardWriteUIServlet?ssId=${errata.ssId}">${errata.ssId}</a></td>
					</c:if>
					
					<td align="center" class="info" width="50" >${errata.bDate}</td>
					
					<c:if test="${errata.schoolDTO != null }">
						<td align="center"><div align="center">${errata.schoolDTO.s_bonboo}<br>${errata.schoolDTO.s_gigwan}<br>${errata.schoolDTO.s_name}<br>${errata.schoolDTO.s_room}시험실</div></td>
					</c:if>
					<c:if test="${errata.schoolDTO == null }">
						<td align="center">모든 장소에게</td>
					</c:if>
					<td>${errata.bContent}</td>
				</tr>
			 	</c:forEach>
				<tr>
					<td colspan="6" align="center">
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