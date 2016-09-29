package com.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.SupervisorDTO;

@WebServlet("/SupervisorLogOutServlet")
public class SupervisorLogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		SupervisorDTO dto=(SupervisorDTO)session.getAttribute("login");
		String target="";
		
		if(dto==null){
			target="error.jsp";
		}else{
			target="index.jsp";
			request.setAttribute("logout", "로그아웃 되었습니다");
			session.invalidate();
		}
		
		RequestDispatcher dis=request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
