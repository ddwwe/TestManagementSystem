package com.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.StudentDTO;

@WebServlet("/StudentLogOutServlet")
public class StudentLogOutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		StudentDTO dto =
				(StudentDTO)session.getAttribute("stuLogin");
		 String title="";
		 String target="";
		if(dto==null){
			title= "로그인 하세요";
			String link="StudentLoginFormServlet";
			target="error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}else{
			target="index.jsp";
	request.setAttribute("stuLogout", "정상적으로 로그아웃");
		    session.invalidate();	
		}
		
		RequestDispatcher dis =
				request.getRequestDispatcher(target);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
