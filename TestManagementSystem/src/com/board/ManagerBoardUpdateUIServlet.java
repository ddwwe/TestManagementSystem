package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ErrataDTO;
import com.exception.CommonException;
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
		String title = "";
		String target = "";
		try {
		dto = service.selectErrataDTO(Integer.parseInt(bNo));
		request.setAttribute("errataDTO", dto);
		target = "managerBoardUpdateUIForm.jsp";
		} catch (CommonException e) {
			title = e.getMessage();
			String link = "ManagerBoardFormServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		
	     RequestDispatcher dis = request.getRequestDispatcher(target);
			dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





