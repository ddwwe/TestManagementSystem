<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<section class="content-header">
		<div class="box-body table-responsive no-padding">
		<a href="ManagerBoardWriteUIServlet"><button class="btn btn-warning"><i class="fa fa-pencil"></i> 글 쓰기</button></a>&nbsp;
		<a href="ManagerBoardFormServlet"><button class="btn btn-info"><i class="fa fa-comments-o"></i> 모든 글 보기</button></a>&nbsp;
		<a href="ManagerNoticeBoardFormServlet"><button class="btn btn-success"><i class="fa fa-comment-o"></i> 공지사항 보기</button></a>&nbsp;
		<p/><table class="table table-hover">
				<tr align="center">
					<th class="back" width="10" height="10">글번호</th>
					<th class="back" >글종류</th>
					<th class="back" >날짜</th>
					<th class="back" >장소</th>
					<th class="back" >내용</th>
				</tr>
				<c:set var="page" value="${pageNotice}" />
				<c:forEach var="errata" items="${page.list}" varStatus="status">
				<tr>
					<td align="center">${errata.bNo}<br><a href="ManagerBoardUpdateUIServlet?bNo=${errata.bNo}"><input class="btn btn-primary btn-sm" type="button" value="글 수정"></a><p/><p/><a href="ManagerDeleteBoardServlet?bNo=${errata.bNo}&type=ManagerNoticeBoardFormServlet"><input class="btn btn-danger btn-sm" type="button" value="글 삭제"></a></td>
					
					<td align="center"><br><br>공지사항</td>
					
					<td align="center"><br><br>${errata.bDate}</td>
					
					<td align="center"><br><br>모든 장소에게</td>
					
					<td >${errata.bContent}</td>
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