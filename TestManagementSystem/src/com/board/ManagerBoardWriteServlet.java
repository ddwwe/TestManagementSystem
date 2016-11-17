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

import sun.print.resources.serviceui;

@WebServlet("/ManagerBoardWriteServlet")
public class ManagerBoardWriteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String ssId = null;
		String qName = null;
		String qCode = null;
		String dest = request.getParameter("destination");
		String bContent = request.getParameter("editor");
		ErrataDTO dto = new ErrataDTO();
		BoardService service = new BoardService();
		
		String title = "";
		String target = "";
		try {
		if(dest.equals("Supervisor")) {					// 라디오버튼 누른거에 따라 타입 설정
			ssId = request.getParameter("inputSsId");
			dto.setbType("send");
		}
		else if(dest.equals("qName")) {
			qName = request.getParameter("inputQName");
			qCode = service.selectQCode(qName);
			dto.setbType("send");
			
			if(qCode == null)
				throw new CommonException("과목 입력을 제대로 확인 해주세요");
		}
		else {
			dest = null;
			dto.setbType("notice");
		}
	    
		dto.setbContent(bContent);		// 글 설정
		
		if(ssId != null) {				// ssId나 qCode 설정
			dto.setSsId(ssId);
		}
		else if(qName != null) {
			dto.setqCode(qCode);
		}

		service.write(dto);
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
