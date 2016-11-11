<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.tr1 {text-align: center;
display: table-cell;
vertical-align: middle;
}
.tr2 {
text-align: center;
background:#BECEE9;
}
.tr3 {
text-align: center;
background:#FAF8FC;
line-height: 10px;
}
.tr4 {
text-align: center;
background:#FAF8FC;
line-height: 50px;
}
</style>
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
					<th class="tr2" width="80"><div align="center">보낸이</div></th>
					<th class="danger" width="80"><div align="center">받는이</div></th>
					<th class="warning" width="80"><div align="center">종목</div></th>
					<th class="tr3" width="60"><div align="center">감독관 ID</div></th>
					<th class="info" width="30"><div align="center">날짜</div></th>
					<th class="success"  width="50"><div align="center">장소</div></th>
					<th class="active" width="50">내용</th>
				</tr>
				<c:set var="page" value="${page}" />
				<c:forEach var="errata" items="${page.list}" varStatus="status">
				<tr class="tr3">
					<c:if test="${errata.bType == 'send' || errata.bType == 'notice'}">
						<td class="tr3"  width="50"><h5>${errata.bNo}</h5>
						<a class="tr3" href="ManagerBoardUpdateUIServlet?bNo=${errata.bNo}">
						<input class="btn btn-primary btn-sm" type="button" value="글 수정"></a><p/><p/>
						<a href="ManagerDeleteBoardServlet?bNo=${errata.bNo}&type=ManagerBoardFormServlet">
						<input class="btn btn-danger btn-sm" type="button" value="글 삭제"></a></td>
					</c:if>
					<c:if test="${errata.bType == 'receive'}">
						<td class="tr3"  width="50">${errata.bNo}</td>
					</c:if>
					
					<c:if test="${errata.bType == 'receive' }">
						<td class="tr1" >감독관</td>
					</c:if>
					<c:if test="${errata.bType == 'notice' }">
						<td class="tr1" >관리자</td>
					</c:if>
					<c:if test="${errata.bType == 'send' }">
						<td class="tr1" >관리자</td>
					</c:if>
					
					<c:if test="${errata.bType == 'receive' }">
						<td class="tr1" >관리자</td>
					</c:if>
					<c:if test="${errata.bType == 'notice' }">
						<td align="center" >모든 감독관</td>
					</c:if>
					<c:if test="${errata.bType == 'send' }">
						<td align="center" >감독관</td>
					</c:if>
					
					<c:if test="${errata.bType == 'notice'}">
						<td align="center"  >모든 종목</td>
					</c:if>
					<c:if test="${errata.bType == 'send' || errata.bType == 'receive'}">
						<td align="center" ><a href="ManagerBoardWriteUIServlet?qCode=${errata.qCode}&qName=${errata.qName}">${errata.qName}</a></td>
					</c:if>
					
					<c:if test="${errata.bType == 'notice'}">
						<td align="center"  class="danger" valign=middle></td>
					</c:if>
					<c:if test="${errata.bType == 'send' || errata.bType == 'receive'}">
						<td align="center"  class="tr4"><a href="ManagerBoardWriteUIServlet?ssId=${errata.ssId}">${errata.ssId}</a></td>
					</c:if>
					
					<td align="center" class="info" width="30" >${errata.bDate}</td>
					
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