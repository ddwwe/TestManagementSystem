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
<div class="content-wrapper">
	<section class="content">
	<div class="col-md-6"></div>
	
		         <div class="box box-info ">
		<div class="box-header with-border">
		<a href="ManagerBoardWriteUIServlet"><button class="btn btn-warning"><i class="fa fa-pencil"></i> 글 쓰기</button></a>&nbsp;
		<a href="ManagerBoardFormServlet"><button class="btn btn-info"><i class="fa fa-comments-o"></i> 모든 글 보기</button></a>&nbsp;
		<a href="ManagerNoticeBoardFormServlet"><button class="btn btn-success"><i class="fa fa-comment-o"></i> 공지사항 보기</button></a>&nbsp;
		<p/>
		<div class="box-body">
		<table style="border:none" class="table table-striped table-hover">
				<tr align="center" class="back">
					<th class="back" >글번호</th>
					<th class="back" width="80">보낸이</th>
					<th class="back" width="80">받는이</th>
					<th class="back" width="80">종목</th>
					<th class="back">감독관 ID</th>
					<th class="back">날짜</th>
					<th class="back">장소</th>
					<th class="back">내용</th>
				</tr>
				<c:set var="page" value="${page}" />
				<c:forEach var="errata" items="${page.list}" varStatus="status">
				<tr class="cen">
					<c:if test="${errata.bType == 'send' || errata.bType == 'notice'}">
						<td class="cen" ><h5>${errata.bNo}</h5>
						<a href="ManagerBoardUpdateUIServlet?bNo=${errata.bNo}">
						<input class="btn btn-primary btn-sm" type="button" value="글 수정"></a><p/><p/>
						<a href="ManagerDeleteBoardServlet?bNo=${errata.bNo}&type=ManagerBoardFormServlet">
						<input class="btn btn-danger btn-sm" type="button" value="글 삭제"></a></td>
					</c:if>
					<c:if test="${errata.bType == 'receive'}">
						<td class="cen" ><br><br>${errata.bNo}</td>
					</c:if>
					
					<c:if test="${errata.bType == 'receive' }">
						<td class="cal" ><br><br>감독관</td>
					</c:if>
					<c:if test="${errata.bType == 'notice' }">
						<td class="cal" ><br><br>관리자</td>
					</c:if>
					<c:if test="${errata.bType == 'send' }">
						<td class="cal" ><br><br>관리자</td>
					</c:if>
					
					<c:if test="${errata.bType == 'receive' }">
						<td class="cen" ><br><br>관리자</td>
					</c:if>
					<c:if test="${errata.bType == 'notice' }">
						<td align="cal" ><br><br>모든 감독관</td>
					</c:if>
					<c:if test="${errata.bType == 'send' }">
						<td align="cal" ><br><br>감독관</td>
					</c:if>
					
					<c:if test="${errata.bType == 'notice'}">
						<td class="cal"><br><br>모든 종목</td>
					</c:if>
					<c:if test="${errata.bType == 'send' || errata.bType == 'receive'}">
						<td align="center" >
						<a href="ManagerBoardWriteUIServlet?qCode=${errata.qCode}&qName=${errata.qName}"><br><br>${errata.qName}</a></td>
					</c:if>
					
					<c:if test="${errata.bType == 'notice'}">
						<td align="center"  ></td>
					</c:if>
					<c:if test="${errata.bType == 'send' || errata.bType == 'receive'}">
						<td align="center" ><a href="ManagerBoardWriteUIServlet?ssId=${errata.ssId}"><Br><br>
						${errata.ssId}</a></td>
					</c:if>
					
					<td align="center" id=""><br><br>${errata.bDate}</td>
					
					<c:if test="${errata.schoolDTO != null }">
						<td align="center"><div align="center">${errata.schoolDTO.s_bonboo}
						<br>${errata.schoolDTO.s_gigwan}<br>${errata.schoolDTO.s_name}
						<br>${errata.schoolDTO.s_room}시험실</div></td>
					</c:if>
					<c:if test="${errata.schoolDTO == null }">
						<td align="center">모든 장소에게</td>
					</c:if>
					<td>${errata.bContent}</td>
				</tr>
			 	</c:forEach>
				<tr>
					<td colspan="10" align="center">
						<ul class="pagination">
							<jsp:include page="page.jsp" flush="true" />
						</ul>
					</td>
				</tr>
			</table>
			</div>
		</div>
		</div>
	</section>
</div>

<!-- /.content-wrapper -->