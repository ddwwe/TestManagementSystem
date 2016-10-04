<%@page import="com.dto.SupervisorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.parallax-1.1.3.js"></script>
<script type="text/javascript"
	src="scripts/jquery.localscroll-1.2.7-min.js"></script>
<script type="text/javascript"
	src="scripts/jquery.scrollTo-1.4.2-min.js"></script>
<style>
.content-wrapper {
	text-align: center;
	line-height: 837px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#nav').localScroll(1000);

		//.parallax(xPosition, speedFactor, outerHeight) options:
		//xPosition - Horizontal position of the element
		//inertia - speed to move relative to vertical scroll. Example: 0.1 is one tenth the speed of scrolling, 2 is twice the speed of scrolling
		//outerHeight (true/false) - Whether or not jQuery should use it's outerHeight option to determine when a section is in the viewport
		$('#intro').parallax("50%", 0.1);
		$('#second').parallax("80%", 0.1);
		$('.bg').parallax("40%", 0.4);
		$('#third').parallax("50%", 0.3);
		$('#four').parallax("50%", 0.1);

	})
</script>
</head>

<body>
	<ul id="nav">
		<li><a href="#intro" title="Next Section"><img
				src="image/dot.png" alt="Link" /></a></li>
		<li><a href="#second" title="Next Section"><img
				src="image/dot.png" alt="Link" /></a></li>
		<li><a href="#third" title="Next Section"><img
				src="image/dot.png" alt="Link" /></a></li>
		<li><a href="#four" title="Next Section"><img
				src="image/dot.png" alt="Link" /></a></li>		
				
	</ul>

	<div id="intro">
		<div class="story">
			<div class="float-left">
			</div>
			<div>
			</div>
			<div>
			</div>
			<div class="float-right">
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<a href="#four" title="Next Section"><img
				src="image/login.png"  width="150" height="50" alt="Link" /></a>
			</div>
		</div>
		<!--.story-->
	</div>
	<!--#intro-->

	<div id="second">
		<div class="story">
			<div class="bg"></div>
			<div class="float-right">
				<h2>"HIMNET(힘넷)이란?"</h2>
				<p>한국산업인력공단 + 큐넷이 합쳐진 사이트입니다.</p>
				<p></p>
				<p>시험감독관들은 인적사항파악, 인원통계, 문제가 발생시 이것을 수기로 작성하여</p>
				<p>중앙통제부에 직접 가서 보고하였습니다. </p>
				<p>또, 중앙통제부에선 이것들을 수집하여 다시 위에한테 보고를 했는데</p>
				<p>이제 힘넷에서는 이런 번거러움 필요 없이 바로 안드로이드와 연동하여
				 실시간 통계를 내고, 상황을 빠르게 조치할 수 있도록 하는 사이트입니다.</p>
			</div>
		</div>
		<!--.story-->
		<%
	SupervisorDTO dto=(SupervisorDTO)session.getAttribute("login");
%>
<% if(dto!=null){ %>
<%
System.out.println(dto.getSname());

}%>
<div id="third">
		<div class="story">
			<div >
	 <img class="mySlides" src="image/himnet.jpg" style="width: 100%" height="300"> 
		<img class="mySlides" src="image/qnet.PNG" style="width: 100%" height="300px">
		 <img class="mySlides" src="image/sanup.png" style="width: 100%"> 
	</div>

	<script>
		var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 2000); // Change image every 2 seconds
		}
	</script>

		</div>
		<!--.story-->
	</div>

	</div>
	<!--#second-->
	<div id="four">
		<div class="story">
			<div class="content-wrapper">
				<a href="studentLoginForm.jsp"> <img src="image/student.PNG"
					width="280" height="300" border=0></a> <a
					href="SuperLogin.jsp"> <img src="image/supervisor.png"
					width="280" height="300" border=0></a>
			</div>
		</div>
		<!--.story-->
	</div>

</body>