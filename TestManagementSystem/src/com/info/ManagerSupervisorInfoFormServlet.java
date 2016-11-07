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
import com.service.InfoService;

@WebServlet("/ManagerSupervisorInfoFormServlet")
public class ManagerSupervisorInfoFormServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		InfoService service = new InfoService();
		List<SupervisorDTO> supervisorList = null;
		
		supervisorList = service.searchAllSupervisor();
		
		request.setAttribute("supervisorList", supervisorList);
		
		RequestDispatcher dis = request.getRequestDispatcher("managerSupervisorInfoForm.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
