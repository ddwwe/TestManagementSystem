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

@WebServlet("/ManagerBoardUpdateServlet")
public class ManagerBoardUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String bContent = request.getParameter("editor");
		String bNo = request.getParameter("bNo");
		ErrataDTO dto = new ErrataDTO();
		
		dto.setbContent(bContent);
		try {
		dto.setbNo(Integer.parseInt(bNo));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		BoardService service = new BoardService();
		String title = "";
		String target = "";
		try {
		service.updateErrata(dto);
		target = "ManagerBoardFormServlet";
		} catch (CommonException e) {
			title = e.getMessage();
			String link = "ManagerBoardFormServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		//화면 ( list.jsp로 보내면 안됨. )
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
		
	}

}
