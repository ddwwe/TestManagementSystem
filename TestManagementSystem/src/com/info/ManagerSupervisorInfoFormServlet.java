package com.info;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.SupervisorDTO;
import com.exception.CommonException;
import com.service.InfoService;

@WebServlet("/ManagerSupervisorInfoFormServlet")
public class ManagerSupervisorInfoFormServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bonboo = request.getParameter("bonbooSelect");
		String gigwan = request.getParameter("gigwanSelect");
		String name = request.getParameter("nameSelect");
		String room = request.getParameter("roomSelect");
		String sCode = null;
		
		if(bonboo == "" || bonboo == null) bonboo = "";
		if(gigwan == "" || gigwan == null) gigwan = "";
		if(name == "" || name == null) name = "";
		if(room == "" || room == null) room = "";
		
		sCode = bonboo + gigwan + name + room + "%";
		System.out.println(sCode);
		InfoService service = new InfoService();
		List<SupervisorDTO> supervisorList = null;
		String title = "";
		String target = "";
		try {
		if(sCode == "%") supervisorList = service.searchAllSupervisor();
		else supervisorList = service.searchSupervisorBySCode(sCode);
		
		request.setAttribute("supervisorList", supervisorList);
		target = "managerSupervisorInfoForm.jsp";
		} catch (CommonException e) {
			title = e.getMessage();
			String link = "MainStatFormServlet";
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
