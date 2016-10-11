package com.examSubmit;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/ExamSubmitServlet")
public class ExamSubmitServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// multipart/form-data는 getParameter로 못가져온다
		
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		// File ownRepository = new File("c:\\temp"); 자신의 임시 디렉토리
		System.out.println(repository.getPath());
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(1024*1024*5);		// 총 파일들의 크기는 5메가 제한
		upload.setFileSizeMax(1024*1024*2); // 여러개 업로드시 각 파일은 2메가 제한
		String fileName = null;
		
		// Parse the request
		try {
			List<FileItem> items = upload.parseRequest(request);	// HTML의 form 태그 안에 있는 모든 input을 모은 리스트
			Iterator<FileItem> ite = items.iterator();
			
			while(ite.hasNext()) {
				FileItem item = ite.next();
				
				//파일과 파일 아닌것 구분
				if(item.isFormField()) {
					// input type="file"이 아닌것들
					String tagName = item.getFieldName();
					String theText = item.getString("UTF-8");
					System.out.println(tagName+"\t"+theText);
				} else {
					// input type="file"인 것들
					fileName = item.getName();
					String contentType = item.getContentType();
					
					// from 파일
					File fromFile = new File(fileName);
					// to 파일
					System.out.println(servletContext.getRealPath("/storage"));
					File toFile = new File(servletContext.getRealPath("/storage"), fromFile.getName());
					item.write(toFile);
					
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
