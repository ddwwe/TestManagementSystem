package com.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ManagerDTO;
import com.dto.SupervisorDTO;
import com.exception.CommonException;
import com.service.MemberService;
import com.service.SelectService;

@WebServlet("/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		HashMap<String, String> map = new HashMap<>();
		map.put("mId", mId);
		map.put("mPw", mPw);

		MemberService service = new MemberService();
		String title = "";
		String target = "";
		try {
			ManagerDTO dto = service.managerLogin(map);
			if (dto == null) {
				title = "아이디 또는 비밀번호 불일치";
				String link = "ManagerLoginFormServlet";
				target = "error.jsp";
				request.setAttribute("title", title);
				request.setAttribute("link", link);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("manaLogin", dto);
				target = "managerMainForm.jsp";
			}

		} catch (CommonException e) {
			title = e.getMessage();
			String link = "ManagerLoginFormServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
