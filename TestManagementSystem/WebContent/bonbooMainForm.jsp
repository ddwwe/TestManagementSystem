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
  <link rel="stylesheet" href="dist/css/AdminLTE.css">
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
  <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
  <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
  <link href="jquery.treemenu.css" rel="stylesheet">

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <jsp:include page="header/managerStatHeader.jsp" flush="true"></jsp:include>
  <jsp:include page="sidebar/managerSidebar.jsp" flush="true"></jsp:include>
  <jsp:include page="stat/bonbooMain.jsp" flush="true"></jsp:include>
  <jsp:include page="footer/footer.jsp" flush="true"></jsp:include>

</div>
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>                                                                                                                                                                                                                                                                                     
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="dist/js/app.min.js"></script>
<script src="jquery.treemenu.js"></script>
<script type="text/javascript">
	$(".tree").treemenu({delay:500}).openActive();
</script>

</body>
</html>
