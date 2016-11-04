<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="jquery-3.1.0.min.js"></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<section class="content-header">
		<div class="box-body table-responsive no-padding">
		<a href="ManagerBoardWriteUIServlet"><button class="btn btn-warning"><i class="fa fa-pencil"></i> 글 쓰기</button></a>&nbsp;
		<a href="ManagerBoardFormServlet"><button class="btn btn-info"><i class="fa fa-comments-o"></i> 모든 글 보기</button></a>&nbsp;
		<a href="ManagerNoticeBoardFormServlet"><button class="btn btn-success"><i class="fa fa-comment-o"></i> 공지사항 보기</button></a>
		<p/>
		<div class="box box-info">
              <form action="ManagerBoardUpdateServlet" method="get">
				<c:set var="errata" value="${errataDTO}" />
           		<input type="hidden" name="bNo" id="bNo" value="${errata.bNo}">
	            <div class="box-header">
	              <p/>
	            	<c:if test="${errata.ssId == null}">
	            		<h4>공지사항 수정&nbsp;&nbsp;<input type="radio" name="destination" id="Supervisors" value="Supervisors" checked="checked"></h4>
	            	</c:if>
	            	<c:if test="${errata.ssId != null}">
	            		<h4>감독관에게 쓴 글 수정&nbsp;&nbsp;<input type="radio" name="destination" id="Supervisor" value="Supervisor" checked="checked"></h4>
	            			보낼 감독관 ID&nbsp;&nbsp;<input type="text" id="inputSsId" value="${errata.ssId}" readonly="readonly"><br>
	            	</c:if>
	              <p/>
	              <!-- tools box -->
	              <div class="pull-right box-tools">
					
	              </div>
	              <!-- /. tools -->
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body pad">
	                    <textarea id="editor" name="editor" rows="10" cols="80">
	                    	${errata.bContent}
	                    </textarea>
	                    <p/>
	                    <p/>
	                    <input type="submit" class="btn btn-primary" value="글 수정">
	            </div>
              </form>
          </div>
		</div>
	</section>
</div>
<!-- /.content-wrapper -->
<script type="text/javascript">
	CKEDITOR.replace('editor');
	
	$("form").on("submit", function(event){
		   
	    var inputSsId = $("#inputSsId").val();
	    var destination = $(":input:radio[name='destination']:checked").val();
	    if(inputSsId == '' && destination == 'Supervisor'){
	    	alert("아이디를 입력하세요");
	    	return false;
	    }
	   
   });
</script>