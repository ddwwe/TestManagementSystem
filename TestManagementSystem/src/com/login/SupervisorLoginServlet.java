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
import javax.swing.plaf.synth.SynthSeparatorUI;

import com.dto.SupervisorDTO;
import com.exception.CommonException;
import com.service.MemberService;

@WebServlet("/SupervisorLoginServlet")
public class SupervisorLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String supervisorno = request.getParameter("supervisorno");
		String supervisorpass = request.getParameter("supervisorpass");
		System.out.println(supervisorno);
		HashMap<String, String> map = new HashMap<>();
		map.put("supervisorno", supervisorno);
		map.put("supervisorpass", supervisorpass);

		MemberService service = new MemberService();
		String title = "";
		String target = "";
		try {
			SupervisorDTO dto = service.superlogin(map);
			if (dto == null) {
				title = "아이디 또는 비밀번호 불일치";
				String link = "SupervisorLoginFormServlet";
				target = "error.jsp";
				request.setAttribute("title", title);
				request.setAttribute("link", link);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("login", dto);
				target = "studentMainForm.jsp";
			}

		} catch (CommonException e) {
			title = e.getMessage();
			String link = "SupervisorLoginFormServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
