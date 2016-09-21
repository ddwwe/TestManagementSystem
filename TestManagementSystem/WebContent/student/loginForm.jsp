<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.content-wrapper { text-align: center; }
</style>
  <div class="content-wrapper">
<img src="image/student.PNG" width="280" height="300" border=0><br>
<form action="studentMainForm.jsp" method="get">
      <div class="form-group has-feedback">
        <input type="text"  placeholder="ID">
      </div>
      <div class="form-group has-feedback">
        <input type="text"  placeholder="Password">
      </div>
      <div class="row">
        <div class="col-xs-5">
        </div>
        <!-- /.col -->
        <div class="col-xs-2">
          <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
</div>