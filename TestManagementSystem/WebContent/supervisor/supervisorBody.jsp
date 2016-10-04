<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<style type='text/css'>
body {
	margin: 0;
}

#slidebox {
	position: relative;
	width: 300px;
	height: 200px;
	overflow: hidden;
	white-space: nowrap;
	border: 1px solid #000;
}

#slidebox ul#slider {
	list-style: none;
	margin: 0;
	padding: 0;
}

#slidebox ul li {
	position: absolute;
	width: 300px;
	height: 300px;
}

#slidebox ul li img {
	width: 300px;
	height: 200px;
}
</style>
<body>
	<div class="content-wrapper">
		<div id="slidebox">
			<ul id="slider">
				<li><img src="image/qnet.PNG" style="width: 100%"
					height="300px" /></li>
				<li><img src="image/sanup.png" style="width: 100%" /></li>
				<li><img src="image/exam2.jpg" style="width: 100%" /></li>
			</ul>
		</div>
		<script type='text/javascript'>
			var x = 300;
			var slider = document.getElementById("slider");
			var slideArray = slider.getElementsByTagName("li");
			var slideMax = slideArray.length - 1;
			var curSlideNo = 0;

			for (i = 0; i <= slideMax; i++) {
				if (i == curSlideNo)
					slideArray[i].style.left = 0;
				else
					slideArray[i].style.left = -x + "px";
			}

			slider.addEventListener('click', function() {
				changeSlide();
			}, false);

			var aniStart = false;
			var next = 1;
			var changeSlide = function() {
				if (aniStart === true)
					return;
				next = curSlideNo + 1;
				if (next > slideMax)
					next = 0;
				aniStart = true;
				sliding();
			}

			function sliding() {
				var curX = parseInt(slideArray[curSlideNo].style.left, 10);
				var nextX = parseInt(slideArray[next].style.left, 10);
				var newCurX = curX + 10;
				var newNextX = nextX + 10;
				if (newCurX >= x) {
					slideArray[curSlideNo].style.left = -x + "px";
					slideArray[next].style.left = 0;
					curSlideNo = curSlideNo + 1;
					if (curSlideNo > slideMax)
						curSlideNo = 0;
					aniStart = false;
					return;
				}
				slideArray[curSlideNo].style.left = newCurX + "px";
				slideArray[next].style.left = newNextX + "px";
				setTimeout(function() {
					sliding();
				}, 20);
			}
			setInterval(changeSlide, 2000);
		</script>
	</div>
</body>
