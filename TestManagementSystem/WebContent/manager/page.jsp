<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PageDTO pageDTO = (PageDTO) request.getAttribute("page");
	int curPage = pageDTO.getCurPage();
	int perPage = pageDTO.getPerPage();
	int totalRecord = pageDTO.getTotalRecord();

	int totalCount = totalRecord / perPage;
	if (totalRecord % perPage != 0)
		totalCount++;

	for (int i = 1; i <= totalCount; i++) {

		if (curPage == i) {
			out.print("<font size='5'>" + i + "</font>&nbsp;&nbsp;&nbsp;&nbsp;");
		} else {
			out.print("<font size='5'><a href='ManagerBoardFormServlet?curPage=" + i + "'>" + i + "</a></font>&nbsp;&nbsp;&nbsp;&nbsp;");
		}

	}
%>