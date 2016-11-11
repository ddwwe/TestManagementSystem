<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.dto.PlaceDTO"%>
<%@page import="com.service.SelectService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	

<div class="content-wrapper">
	<section class="content">
	          <!-- AREA CHART -->
		    <div class="box box-info collapsed-box">
	            <div class="box-header with-border">
	            <h4>기능사 시험일정</h4>
			      <div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
				  </div>
	            </div>
	            <div class="box-body">
		        	<table class="table table-condensed">
			        	<tr>
			        		<th width="80" align="center">회차</th>
			        		<th align="center">필기시험<br>접수기간<br>(인터넷)</th>
			        		<th>필기시험</th>
			        		<th>필기시험<br>합격자 발표</th>
			        		<th>실기시험<br>접수기간<br>(인터넷)</th>
			        		<th>실기시험</th>
			        		<th>실기시험<br>합격자 발표</th>
			        	</tr>
			        	<tr>
			        		<td>제1회</td>
			        		<td>1월 5일 ~ 1월 11일</td>
			        		<td>1월 24일</td>
			        		<td>2월 4일</td>
			        		<td>2월 15일 ~ 2월 18일</td>
			        		<td>3월 12일 ~ 3월 25일</td>
			        		<td>4월 1일,<br>4월 15일</td>
			        	</tr>
			        	<tr>
			        		<td>제2회</td>
			        		<td>3월 4일 ~ 3월 10일</td>
			        		<td>4월 2일</td>
			        		<td>4월 14일</td>
			        		<td>4월 18일 ~ 4월 21일</td>
			        		<td>5월 21일 ~ 6월 5일</td>
			        		<td>6월 10일,<br>6월 24일</td>
			        	</tr>
			        	<tr>
			        		<td>제3회</td>
			        		<td colspan="3">산업수요 맞춤형 고등학교 및
			        		<br>특성화 고등학교 필기시험 면제자 검정
			        		<br>※ 일반인 필기시험 면제자 응시 불가
			        		</td>
			        		<td>5월 9일 ~ 5월 12일</td>
			        		<td>6월 11일 ~ 6월 24일</td>
			        		<td>7월 1일,<br>7월 15일</td>
			        	</tr>
			        	<tr>
			        		<td>제4회</td>
			        		<td>6월 17일 ~ 6월 23일</td>
			        		<td>7월 10일</td>
			        		<td>7월 21일</td>
			        		<td>7월 25일 ~ 7월 28일</td>
			        		<td>8월 27일 ~ 9월 11일</td>
			        		<td>9월 23일,<br>10월 7일</td>
			        	</tr>
			        	<tr>
			        		<td>제5회</td>
			        		<td>8월 18일 ~ 8월 30일</td>
			        		<td>9월 3일 ~ 10월 14일</td>
			        		<td>시행당일</td>
			        		<td>10월 24일 ~ 10월 27일</td>
			        		<td>11월 26일 ~ 12월 9일</td>
			        		<td>12월 16일,<br>12월 30일</td>
			        	</tr>
		        	</table>
		        </div>
			</div>
		<!-- DONUT CHART -->
	<!-- 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 기능사 끝 -->
	
	<div class="box box-warning collapsed-box">
	            <div class="box-header with-border">
	            <h4>기사 시험일정</h4>
			      <div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
				  </div>
	            </div>
	            <div class="box-body">
		        <table class="table table-condensed">
			        	<tr>
			        		<th width="80" align="center">회차</th>
			        		<th align="center">필기시험<br>접수기간<br>(인터넷)</th>
			        		<th>필기시험</th>
			        		<th>합격예정자<br>발표(필기)</th>
			        		<th>응시자격<br>서류제출<br>(방문제출)</th>
			        		<th>실기시험<br>접수기간<br>(인터넷)</th>
			        		<th>실기시험</th>
			        		<th>합격자<br>발표</th>
			        	</tr>
			        	<tr>
			        		<td>제1회</td>
			        		<td>1월 29일 ~ 2월 4일</td>
			        		<td>3월 6일</td>
			        		<td>3월 17일</td>
			        		<td>3월 21일 ~ 3월 30일</td>
			        		<td>3월 21일 ~ 3월 24일</td>
			        		<td>4월 16일 ~ 4월 29일</td>
			        		<td>5월 6일,<br>5월 27일</td>
			        	</tr>
			        	<tr>
			        		<td>제2회</td>
			        		<td>4월 1일 ~ 4월 7일</td>
			        		<td>5월 8일</td>
			        		<td>5월 19일</td>
			        		<td>5월 30일 ~ 6월 9일</td>
			        		<td>5월 30일 ~ 6월 2일</td>
			        		<td>6월 25일 ~ 7월 8일</td>
			        		<td>7월 15일,<br>8월 5일</td>
			        	</tr>
			        	<tr>
			        		<td>제3회</td>
			        		<td>8월 2일 ~ 8월 8일</td>
			        		<td>8월 21일</td>
			        		<td>9월 1일</td>
			        		<td>9월 5일 ~ 9월 19일</td>
			        		<td>9월 5일 ~ 9월 8일</td>
			        		<td>10월 8일 ~ 10월 21일</td>
			        		<td>10월 28일,<br>11월 18일</td>
			        	</tr>
			        	<tr>
			        		<td>제4회</td>
			        		<td>9월 2일 ~ 9월 8일</td>
			        		<td>10월 1일</td>
			        		<td>10월 13일</td>
			        		<td>10월 17일 ~ 10월 26일</td>
			        		<td>10월 17일 ~ 10월 20일</td>
			        		<td>11월 12일 ~ 11월 25일</td>
			        		<td>12월 2일,<br>12월 23일</td>
			        	</tr>
		        	</table>
		        </div>
			</div>
		<!-- DONUT CHART -->
	<!-- 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 기사 끝 -->
	
	<div class="box box-success collapsed-box">
	            <div class="box-header with-border">
	            <h4>기능장 시험일정</h4>
			      <div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
				  </div>
	            </div>
	            <div class="box-body">
		        <table class="table table-condensed">
			        	<tr>
			        		<th width="80" align="center">회차</th>
			        		<th align="center">필기시험<br>접수기간<br>(인터넷)</th>
			        		<th>필기시험</th>
			        		<th>합격예정자<br>발표(필기)</th>
			        		<th>응시자격<br>서류제출<br>(방문제출)</th>
			        		<th>실기시험<br>접수기간<br>(인터넷)</th>
			        		<th>실기시험</th>
			        		<th>합격자<br>발표</th>
			        	</tr>
			        	<tr>
			        		<td>제59회</td>
			        		<td>3월 4일 ~ 3월 10일</td>
			        		<td>4월 2일</td>
			        		<td>4월 14일</td>
			        		<td>4월 18일 ~ 4월 27일</td>
			        		<td>4월 18일 ~ 4월 21일</td>
			        		<td>5월 21일 ~ 6월 5일</td>
			        		<td>6월 10일,<br>6월 24일</td>
			        	</tr>
			        	<tr>
			        		<td>제60회</td>
			        		<td>6월 17일 ~ 6월 23일</td>
			        		<td>7월 10일</td>
			        		<td>7월 21일</td>
			        		<td>7월 25일 ~ 8월 3일</td>
			        		<td>7월 25일 ~ 7월 28일</td>
			        		<td>8월 27일 ~ 9월 11일</td>
			        		<td>9월 23일,<br>10월 7일</td>
			        	</tr>
		        	</table>
		        </div>
			</div>
		<!-- DONUT CHART -->
	<!-- 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 기능장 끝 -->
	
	<div class="box box-danger collapsed-box">
	            <div class="box-header with-border">
	            <h4>기술사 시험일정</h4>
			      <div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
				  </div>
	            </div>
	            <div class="box-body">
		        <table class="table table-condensed">
			        	<tr>
			        		<th width="80" align="center">회차</th>
			        		<th align="center">필기시험<br>접수기간<br>(인터넷)</th>
			        		<th>필기시험</th>
			        		<th>합격예정자<br>발표(필기)</th>
			        		<th>응시자격<br>서류제출<br>(방문제출)</th>
			        		<th>면접시험<br>접수기간<br>(인터넷)</th>
			        		<th>면접시험</th>
			        		<th>합격자<br>발표</th>
			        	</tr>
			        	<tr>
			        		<td>제108회</td>
			        		<td>1월 8일 ~ 1월 14일</td>
			        		<td>1월 31일</td>
			        		<td>3월 17일</td>
			        		<td>3월 21일 ~ 3월 30일</td>
			        		<td>3월 21일 ~ 3월 24일</td>
			        		<td>4월 23일 ~ 5월 2일</td>
			        		<td>5월 20일</td>
			        	</tr>
			        	<tr>
			        		<td>제109회</td>
			        		<td>3월 25일 ~ 3월 31일</td>
			        		<td>5월 15일</td>
			        		<td>6월 23일</td>
			        		<td>6월 27일 ~ 7월 6일</td>
			        		<td>6월 27일 ~ 6월 30일</td>
			        		<td>8월 6일 ~ 8월 15일</td>
			        		<td>9월 2일</td>
			        	</tr>
			        	<tr>
			        		<td>제110회</td>
			        		<td>7월 1일 ~ 7월 7일</td>
			        		<td>7월 30일</td>
			        		<td>9월 8일</td>
			        		<td>9월 19일 ~ 9월 28일</td>
			        		<td>9월 19일 ~ 9월 22일</td>
			        		<td>10월 15일 ~ 10월 24일</td>
			        		<td>11월 11일</td>
			        	</tr>
		        	</table>
		        </div>
			</div>
		<!-- DONUT CHART -->
	<!-- 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 기술사 끝 -->
	</section>
</div>