package com.register;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dto.StudentDTO;
import com.exception.CommonException;
import com.service.MemberService;


@WebServlet("/StudentRegisterServlet")
public class StudentRegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String eId = request.getParameter("eId");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		String eBirth = birthYear + "/" + birthMonth + "/" + birthDay;
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
			service.addMember(dto);
			target = "index.jsp";
			request.setAttribute("result", "success");
		} catch (CommonException e) {
			title= e.getMessage();
			String link="StudentRegisterFormServlet";
			target="error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		
		RequestDispatcher dis =
				request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

}
