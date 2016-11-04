package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ErrataDTO;
import com.service.BoardService;

@WebServlet("/ManagerBoardWriteServlet")
public class ManagerBoardWriteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String ssId = request.getParameter("destination");
		String bContent = request.getParameter("editor");
		ErrataDTO dto = new ErrataDTO();
		
		if(ssId.equals("Supervisor")) {
			ssId = request.getParameter("inputSsId");
			dto.setbType("send");
		}
		else {
			ssId = null;
			dto.setbType("notice");
		}
	    
		dto.setSsId(ssId);
		dto.setbContent(bContent);
		
		BoardService service = new BoardService();
		service.write(dto);
		
		//화면 ( list.jsp로 보내면 안됨. )
		response.sendRedirect("ManagerBoardFormServlet");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
		
	}

}
