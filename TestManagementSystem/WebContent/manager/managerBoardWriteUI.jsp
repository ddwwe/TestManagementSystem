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
              <form action="ManagerBoardWriteServlet" method="get">
	            <div class="box-header">
	              <p>
					<c:set var="ssId" value="${ssId}" />
					<c:set var="qName" value="${qName}" />
					
					<c:if test="${ssId == null && qName != null}">
	            		<h4>특정 종목에 글 쓰기&nbsp;&nbsp;<input type="radio" name="destination" value="qName" checked="checked"></h4>
	            		보낼 종목&nbsp;&nbsp;<input type="text" name="inputQName" id="inputQName" value="${qName}" readonly="readonly"><br>
	            	</c:if>
	            	<c:if test="${ssId != null && qName == null}">
	            		<h4>감독관에게 글 쓰기&nbsp;&nbsp;<input type="radio" name="destination" value="Supervisor" checked="checked"></h4>
	            		보낼 감독관 ID&nbsp;&nbsp;<input type="text" name="inputSsId" id="inputSsId" value="${ssId}" readonly="readonly"><br>
	            	</c:if>
	            	<c:if test="${ssId == null && qName == null}">
	            		<h4>특정 종목에 글 쓰기&nbsp;&nbsp;<input type="radio" name="destination" id="qName" value="qName"></h4>
	            			보낼 종목&nbsp;&nbsp;<input type="text" name="inputQName" id="inputQName"><br>
	            		<h4>특정 감독관에게 글 쓰기&nbsp;&nbsp;<input type="radio" name="destination" id="Supervisor" value="Supervisor"></h4>
	            			보낼 감독관 ID&nbsp;&nbsp;<input type="text" name="inputSsId" id="inputSsId"><br>
	            		<h4>공지사항으로 글 쓰기&nbsp;&nbsp;<input type="radio" name="destination" id="Supervisors" value="Supervisors" checked="checked"></h4>
	            	</c:if>
	              </p>
	              <!-- tools box -->
	              <div class="pull-right box-tools">
					
	              </div>
	              <!-- /. tools -->
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body pad">
	                    <textarea id="editor" name="editor" rows="10" cols="80">
	                    	글을 써주세요.
	                    </textarea>
	                    <p/>
	                    <p/>
	                    <input type="submit" class="btn btn-primary" value="글 작성">
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
	    var inputQName = $("#inputQName").val();
	    var destination = $(":input:radio[name='destination']:checked").val();
	    if(inputSsId == '' && destination == 'Supervisor'){
	    	alert("감독관 아이디를 입력하세요");
	    	return false;
	    }
	    if(inputQName == '' && destination == 'qName'){
	    	alert("종목을 입력하세요");
	    	return false;
	    }
	   
   });
</script>