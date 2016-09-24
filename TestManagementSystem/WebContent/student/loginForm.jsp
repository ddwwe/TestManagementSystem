<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.content-wrapper { text-align: center; }
	.vertic { height: 150px; }
</style>
<div class="content-wrapper">
	<div class="vertic">
	</div>
	<img src="image/student.PNG" width="280" height="300" border=0>
	<form action="StudentLoginServlet" method="get">
      <div class="form-group has-feedback">
        <input type="text" name="id" id="id" placeholder="ID">
      </div>
      <div class="form-group has-feedback">
        <input type="text" name="passwd" id="passwd" placeholder="Password">
      </div>
      <div class="row">
        <div class="col-xs-5">
        </div>
        <!-- /.col -->
        <div class="col-xs-2">
          <input type="submit" class="btn btn-primary btn-block btn-flat" value="로그인"></input>
        </div>
        <!-- /.col -->
      </div>
    </form>
</div>