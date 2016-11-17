package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.PageDTO;
import com.exception.CommonException;
import com.service.BoardService;

@WebServlet("/ManagerBoardFormServlet")
public class ManagerBoardFormServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String curPage = request.getParameter("curPage");
		if(curPage == null){
			curPage = "1";
		}
		
		
		BoardService service = new BoardService();
		String title = "";
		String target = "";
		try {
		PageDTO dto = 
				service.page(Integer.parseInt(curPage));
		
		request.setAttribute("page", dto);
		target = "managerBoardForm.jsp";
		} catch (CommonException e) {
			title = e.getMessage();
			String link = "MainStatFormServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
