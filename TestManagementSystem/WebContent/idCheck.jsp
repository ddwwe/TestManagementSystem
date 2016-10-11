<%@page import="com.config.MySqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id = request.getParameter("eId");
   SqlSession sess = MySqlSessionFactory.getSession();
   String userid = null;
   try{
     userid = sess.selectOne("idCheck", id);
   }finally{
	   sess.close();
   }

   if(userid == null){
	   out.print("사용가능");
   }else{
	   out.print("사용불가");
   }



   
%>