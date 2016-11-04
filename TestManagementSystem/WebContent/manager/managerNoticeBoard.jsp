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
		<p/><table class="table table-hover">
				<tr align="center">
					<th width="6%"><div align="center">글번호</div></th>
					<th width="8%"><div align="center">글종류</div></th>
					<th width="5%"><div align="center">날짜</div></th>
					<th width="15%"><div align="center">장소</div></th>
					<th width="61%">내용</th>
				</tr>
				<c:set var="page" value="${pageNotice}" />
				<c:forEach var="errata" items="${page.list}" varStatus="status">
				<tr>
					<c:if test="${errata.bType == 'send' || errata.bType == 'notice'}">
						<td align="center">${errata.bNo}<br><a href="ManagerBoardUpdateUIServlet?bNo=${errata.bNo}"><input class="btn btn-primary btn-sm" type="button" value="글 수정"></a><p/><p/><a href="ManagerDeleteBoardServlet?bNo=${errata.bNo}&type=ManagerNoticeBoardFormServlet"><input class="btn btn-danger btn-sm" type="button" value="글 삭제"></a></td>
					</c:if>
					<c:if test="${errata.bType == 'receive'}">
						<td align="center">${errata.bNo}</td>
					</c:if>
					
					<td align="center">공지사항</td>
					
					<c:if test="${errata.ssId != null }">
						<c:if test="${manaLogin != null }">
							<td align="center"><a href="ManagerBoardWriteServlet?ssId=${errata.ssId}">${errata.ssId}</a></td>
						</c:if>
						<c:if test="${manaLogin == null }">
							<td align="center">${errata.ssId}</td>
						</c:if>
				 	</c:if>
					<c:if test="${errata.ssId != null }">
						<td></td>
					</c:if>
					
					<td align="center">${errata.bDate}</td>
					
					<c:if test="${errata.schoolDTO != null }">
						<td align="center"><div align="center">${errata.schoolDTO.s_bonboo}<br>${errata.schoolDTO.s_gigwan}<br>${errata.schoolDTO.s_name}<br>${errata.schoolDTO.s_room}시험실</div></td>
					</c:if>
					<c:if test="${errata.schoolDTO == null }">
						<td align="center"><div align="center">모든 장소에게</div></td>
					</c:if>
					
					<td>${errata.bContent}</td>
				</tr>
			 	</c:forEach>
				<tr>
					<td colspan="6" align="center">
						<ul class="pagination">
							<jsp:include page="pageNotice.jsp" flush="true" />
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</section>
</div>
<!-- /.content-wrapper -->