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

@WebServlet("/StudentDeleteServlet")
public class StudentDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//나중에 필터로 설정하기
				request.setCharacterEncoding("UTF-8");
				HttpSession session = request.getSession();
				StudentDTO dto = 
						(StudentDTO)session.getAttribute("stuLogin");
				String eId = dto.geteId();

			    MemberService service =
			    		new MemberService();
			    String title="";
			    String target="";
			    try {
					service.deleteStudent(eId);
					target = "index.jsp";
					request.setAttribute("delete", "정상적으로 삭제되었습니다.");
					
			        session.invalidate();
					
					
				} catch (CommonException e) {
					title= e.getMessage();
					String link="MemberFormServlet";
					target="error.jsp";
					request.setAttribute("title", title);
					request.setAttribute("link", link);
				}
				
				RequestDispatcher dis =
						request.getRequestDispatcher(target);
				dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
