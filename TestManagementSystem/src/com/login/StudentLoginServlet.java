package com.login;

import java.io.IOException;
import java.util.HashMap;

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


@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("eId");
		String passwd = request.getParameter("ePw");
		
		HashMap<String, String> map= new HashMap<>();
		map.put("eId", id);
		map.put("ePw", passwd);
		
		MemberService service = new MemberService();
		  String title="";
		    String target="";
		try {
			StudentDTO dto = service.login(map);
			if(dto==null){
				title= "아이디나 비밀번호 불일치  또는 등록된 회원이 아닙니다";
				String link="";
				target="error.jsp";
				request.setAttribute("title", title);
				request.setAttribute("link", link);
			}else{
				HttpSession session=request.getSession();
				session.setAttribute("stuLogin", dto);
				target="studentMainForm.jsp";
			}
			
		} catch (CommonException e) {
			title= e.getMessage();
			String link="StudentLoginFormServlet";
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
