<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ChartJS
      </h1>
    </section>

    <!-- Main content -->
	<section class="content">
      <div class="row">
				<form action="AllCountServlet" method=get>
				  <div class="col-md-6"></div>
				    <!-- AREA CHART -->
         
         			<div class="box box-primary">
			            <div class="box-header with-border">
			            	<h3 class="box-title">수강생인원</h3>
			            	
			                <div class="box-tools pull-right">
				                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
			                </div>
			            </div>
            
            			<div class="box-body">
             				<table>
								<caption></caption>
								<thead>
									<tr>
										<td>필기시험</td>
										<th>2015 1회차</th>
										<th>2015 2회차</th>
										<th>2015 3회차</th>
										<th>2016 1회차</th>
										<th>2016 2회차</th>
										<th>2016 3회차</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>기사/산업기사</th>
										<td>44190</td>
										<td>42410</td>
										<td>42340</td>
										<td>42330</td>
										<td>41250</td>
										<td>4123</td>
									</tr>
									<tr>
										<th>기능장</th>
										<td>4213</td>
										<td>1440</td>
										<td>2150</td>
										<td>2650</td>
										<td>2150</td>
										<td>1</td>
									</tr>
									<tr>
										<th>기술사</th>
										<td>2142</td>
										<td>1380</td>
										<td>5210</td>
										<td>2315</td>
										<td>2150</td>
										<td>1</td>
									</tr>
									<tr>
										<th>기능사</th>
										<td>2310</td>
										<td>1480</td>
										<td>2190</td>
										<td>3125</td>
										<td>2150</td>
										<td>1</td>
									</tr>
								</tbody>
							</table>
							
							<div class="chart">
								<input type="submit" value="새로고침"></input>
       						</div>
						</div>
            			<!-- /.box-body -->
           			</div>
			        <!-- /.box -->
	 			</form>
	 			
				<!-- DONUT CHART -->
				<div class="box box-danger">
					<div class="box-header with-border">
						<h3 class="box-title">수강생참석인원</h3>
					
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
							<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
						</div>
					</div>
					<div class="box-body">
					
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

      </div>
      <!-- /.row -->
	</section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->