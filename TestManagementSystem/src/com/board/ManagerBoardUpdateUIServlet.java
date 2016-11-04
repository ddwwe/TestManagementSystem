package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ErrataDTO;
import com.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/ManagerBoardUpdateUIServlet")
public class ManagerBoardUpdateUIServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bNo = request.getParameter("bNo");
		BoardService service = new BoardService();
		ErrataDTO dto = null;
		dto = service.selectErrataDTO(Integer.parseInt(bNo));
		request.setAttribute("errataDTO", dto);
		
	     RequestDispatcher dis = request.getRequestDispatcher("managerBoardUpdateUIForm.jsp");
			dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





