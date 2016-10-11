<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="viewPage.jsp" name="frmName" method="post" enctype="multipart/form-data">
		user<br/>
		<input type="text" name="user"><br/>
		title<br/>
		<input type="text" name="title"><br/>
		
		file<br/>
		<input type="file" name="uploadFile">
		<input type="submit" value="UPLOAD">
	</form>
</body>
</html>