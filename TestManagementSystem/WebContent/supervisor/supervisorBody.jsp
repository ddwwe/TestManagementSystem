<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="flexslider.css" type="text/css">
<style>
.content-wrapper {text-align: center; line-height:837px;}
</style>
      <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
<body class="content-wrapper">

	<div class="w3-content w3-section" style="max-width: 300px">
		<img class="mySlides" src="image/statistics.png" style="width: 100%"> <img
			class="mySlides" src="image/korea.png" style="width: 100%"> <img
			class="mySlides" src="image/japan.png" style="width: 100%">
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
			setTimeout(carousel, 1000); // Change image every 2 seconds
		}
	</script>

  </div>
  <!-- /.content-wrapper -->