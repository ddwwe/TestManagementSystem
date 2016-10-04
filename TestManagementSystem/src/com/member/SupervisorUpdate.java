package com.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.SupervisorDTO;
import com.exception.CommonException;
import com.service.MemberService;

@WebServlet("/SupervisorUpdate")
public class SupervisorUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userid=request.getParameter("userid");
		String passwd=request.getParameter("passwd");
		String username=request.getParameter("username");
		String post1=request.getParameter("post1");
		String post2=request.getParameter("post2");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone3=request.getParameter("phone3");
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		SupervisorDTO dto= new SupervisorDTO();
		MemberService service=new MemberService();
		String title="";
		String link="";
		String target="";
		try {
			service.updateMember(dto);
			target="home.jsp";
			request.setAttribute("update", "정상적으로 수정되었습니다");
		} catch (CommonException e) {
			title=e.getMessage();
			link="MypageServlet";
			target="error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		
		
		RequestDispatcher dis=request.getRequestDispatcher(target);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
