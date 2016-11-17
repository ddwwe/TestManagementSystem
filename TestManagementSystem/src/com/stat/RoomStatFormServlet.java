package com.stat;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exception.CommonException;
import com.service.SelectService;

@WebServlet("/RoomStatFormServlet")
public class RoomStatFormServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SelectService service = new SelectService();
		String qClass = null;
		String tsNo = null;
		String tsTitle = null;
		String qNameChoice = null;
		String tsNoChoice = null;
		String bonboo = null;
		String gigwan = null;
		String name = null;
		String room = null;
		String sCode = null;
		String sCodeTsNo = null;
		HashMap<String, String> sCodeMap = new HashMap<>();
		HashMap<String, String> scheduleMap = new HashMap<>();
		List<HashMap<String, String>> studentDataList = null;
		List<HashMap<String, String>> supervisorDataList = null;
		
		tsNoChoice = (String) request.getParameter("tsNoChoice");		// tsNo 앞부분 받음
		qNameChoice = (String) request.getParameter("qNameChoice");		// tsNo 뒷부분 받음
		System.out.println(tsNoChoice+qNameChoice);
		tsNo = tsNoChoice + qNameChoice;
		if(tsNoChoice == null && qNameChoice == null)	tsNo = "1603";	// 받아온게 없으면 1603
		System.out.println(tsNo);
		
		bonboo = (String)request.getParameter("bonboo");
		gigwan = (String)request.getParameter("gigwan");
		name = (String)request.getParameter("name");
		room = (String)request.getParameter("room");
		
		sCodeMap.put("bonboo", bonboo);
		sCodeMap.put("gigwan", gigwan);
		sCodeMap.put("name", name);
		sCodeMap.put("room", room);

		String title = "";
		String target = "";
		try {
			tsTitle = service.searchTsTitle(tsNo);			// 일정이름 불러오기
			sCode = service.searchScodeByMap(sCodeMap);		// sCode찾기
			sCodeTsNo = sCode +"__"+ tsNo;
			scheduleMap.put("sCode", sCode);
			scheduleMap.put("tsNo", tsNo);
			studentDataList = service.searchStudentDataByScode(sCodeTsNo);	// sCode와 tsNo로 학생정보 찾기
			supervisorDataList = service.searchSupervisorDataByScode(scheduleMap);	// sCode와 tsNo로 감독관 찾기
			target = "roomMainForm.jsp";
		} catch (CommonException e) {
			title = e.getMessage();
			String link = "MainStatFormServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		
		request.setAttribute("bonboo", bonboo);
		request.setAttribute("gigwan", gigwan);
		request.setAttribute("name", name);
		request.setAttribute("room", room);
		request.setAttribute("tsTitle", bonboo+" "+gigwan+" "+name+" "+room+"시험실 "+tsTitle);
		request.setAttribute("studentDataList", studentDataList);
		request.setAttribute("supervisorDataList", supervisorDataList);
		
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
