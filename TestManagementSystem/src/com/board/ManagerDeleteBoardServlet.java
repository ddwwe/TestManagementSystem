package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/ManagerDeleteBoardServlet")
public class ManagerDeleteBoardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bNo = request.getParameter("bNo");
		String type = request.getParameter("type");
		
		BoardService service = new BoardService();
		service.deleteErrata(Integer.parseInt(bNo));
		
		
		response.sendRedirect(type);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





