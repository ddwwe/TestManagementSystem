package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/ManagerBoardWriteUIServlet")
public class ManagerBoardWriteUIServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ssId = request.getParameter("ssId");
		request.setAttribute("ssId", ssId);
		
	     RequestDispatcher dis = request.getRequestDispatcher("managerBoardWriteUIForm.jsp");
			dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





