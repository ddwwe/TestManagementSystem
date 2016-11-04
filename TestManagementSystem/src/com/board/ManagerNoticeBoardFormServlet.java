package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.PageDTO;
import com.service.BoardService;

@WebServlet("/ManagerNoticeBoardFormServlet")
public class ManagerNoticeBoardFormServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String curPage = request.getParameter("curPage");
		if(curPage == null){
			curPage = "1";
		}
		
		
		BoardService service = new BoardService();
		PageDTO dto = 
				service.pageNotice(Integer.parseInt(curPage));
		
		request.setAttribute("pageNotice", dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("managerNoticeBoardForm.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
