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
		$('#nav').localScroll(800);

		//.parallax(xPosition, speedFactor, outerHeight) options:
		//xPosition - Horizontal position of the element
		//inertia - speed to move relative to vertical scroll. Example: 0.1 is one tenth the speed of scrolling, 2 is twice the speed of scrolling
		//outerHeight (true/false) - Whether or not jQuery should use it's outerHeight option to determine when a section is in the viewport
		$('#intro').parallax("50%", 0.1);
		$('#second').parallax("50%", 0.1);
		$('.bg').parallax("50%", 0.4);
		$('#third').parallax("50%", 0.3);

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
	</ul>

	<div id="intro">
		<div class="story">
			<div class="float-left">
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<h1>합격을 기원합니다</h1>
			</div>
		</div>
		<!--.story-->
	</div>
	<!--#intro-->

	<div id="second">
		<div class="story">
			<div class="bg"></div>
			<div class="float-right">
				<h1>"답은 언제나 하나뿐!"</h1>
				<p>젋었을 때 열심히 배우지 않으면 늙어서 후회한다. - 중국 유학자 주희 -</p>
				<p>사람은 미치광이라는 말을 들을 정도가 아니면 아무것도 이룰 수 없다 - 박태준 포스코명예회장 -</p>
				<p>쉬운 길, 편안한 길로 가는 사람은 성공의 묘미를 못 느낀다. 어려움 없이 성취되는 것은 하나도 없다 - 노만
					V.필 -</p>
				<p>평범한 인간이 이따금 비상한 결의로 성공하는 경우가 있는데, 그것은 그가 훌륭한 인물이어서가 아니라 불안에서
					벗어나려고 끊임없이 노력한 결과이다. - 몽테로랑 -</p>
				<p>공부 밖에 할줄 모르는 "바보" 한테 잘 보여라. 사회 나온 다음에는 아마 그 "바보" 밑에서 일하게 될지
					모른다.</p>
			</div>
		</div>
		<!--.story-->

	</div>
	<!--#second-->
	<div id="third">
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