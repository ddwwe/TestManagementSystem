package com.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.StudentDTO;
import com.exception.CommonException;
import com.service.MemberService;


@WebServlet("/StudentMyPageServlet")
public class StudentMyPageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		StudentDTO dto = 
				(StudentDTO)session.getAttribute("stuLogin");
		String target="";
		String title="";
		if(dto!=null){
			target="studentMyPageForm.jsp";
			
			String eId = dto.geteId();
			MemberService service = new MemberService();
			try {
				StudentDTO my = service.mypage(eId);
				request.setAttribute("stuMypage", my);
			} catch (CommonException e) {
				title= e.getMessage();
				String link="StudentLoginFormServlet";
				target="error.jsp";
				request.setAttribute("title", title);
				request.setAttribute("link", link);
			}
			
		}else{
			target="StudentLoginFormServlet";
		}

		RequestDispatcher dis =
				request.getRequestDispatcher(target);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
