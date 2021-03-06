<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

</head>
<body class="hold-transition skin-blue  sidebar-collapse">
<div class="wrapper">
  <jsp:include page="header/header.jsp" flush="true"></jsp:include>
  <jsp:include page="error/errorSidebar.jsp" flush="true"></jsp:include>
  <jsp:include page="error/error.jsp" flush="true"></jsp:include>
  <jsp:include page="footer/footer.jsp" flush="true"></jsp:include>

</div>
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>                                                                                                                                                                                                                                                                                     
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="dist/js/app.min.js"></script>
<!-- 주소 검색 -->
<script type="text/javascript" src="plugins/search/search.min.js"></script>

<script type="text/javascript">
	$("#postcodify_search_button").postcodifyPopUp();
</script>

</body>
</html>