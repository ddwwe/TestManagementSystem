package com.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.StudentDTO;
import com.exception.CommonException;
import com.service.MemberService;

@WebServlet("/StudentUpdateServlet")
public class StudentUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//나중에 필터로 설정하기
				request.setCharacterEncoding("UTF-8");
				
				String eId = request.getParameter("eId");
				String eBirth = request.getParameter("eBirth");
				String ePw = request.getParameter("ePw");
				String eName = request.getParameter("eName");
				String eEmail = request.getParameter("eEmail");
				String ePhone = request.getParameter("ePhone");
				String ePost = request.getParameter("ePost");
				String eAddr1 = request.getParameter("eAddr1");
				String eAddr2 = request.getParameter("eAddr2");
				String ePath = "1";
				
				
				StudentDTO dto = new StudentDTO(eId, ePw, eName, eBirth, eEmail, ePhone, ePost, eAddr1, eAddr2, ePath);
			    MemberService service =
			    		new MemberService();
			    String title="";
			    String target="";
			    try {
					service.updateMember(dto);
					target = "studentMainForm.jsp";
					request.setAttribute("update", "정상적으로 수정되었습니다.");
				} catch (CommonException e) {
					title= e.getMessage();
					String link="StudentMyPageServlet";
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
