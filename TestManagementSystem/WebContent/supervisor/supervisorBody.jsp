<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.content-wrapper {text-align: center; line-height:837px;}
</style>
      <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
<body class="content-wrapper">

	<div >
	 <img class="mySlides" src="image/himnet.jpg" style="width: 100%" height="800px"> 
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
  <!-- /.content-wrapper -->