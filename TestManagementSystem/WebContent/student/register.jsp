<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper ">
    <!-- Content Header (Page header) -->
    <section class="content-header ">
      <h1>
                   회원가입	
        <small>일반회원가입</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	
    	<div class="row">
    		<div class="col-xs-12">
    			<div class="box">
    				<div class="box-header with-border">
    					<i class="fa fa-pencil"></i>
    					<h4 class="box-title">(<span class="text-red">*</span>) 필수입력 사항입니다.</h4>
    				</div>
    				
    				<div class="box-body">
    					<form class="form-horizontal">		  
        					<div class="form-group">
          						<label class="col-xs-3 control-label" for="id">
          							아이디
          							<span class="text-red">*</span>
          						</label>
        						<div class="col-xs-6">
          							<input class="form-control" id="id" type="text" placeholder="아이디">
          							<!-- ajax로 동적처리
          							<p class="text-info">사용가능한 아이디입니다.</p>
          							<p class="text-danger">사용불가능한 아이디입니다.</p>
          							-->
        						</div>
      						</div>

					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputNumber">
					            	생년월일
					            	<span class="text-red">*</span>
					            </label>
					            <div class="col-sm-2">
							    	<select class="form-control">
							        	<option>년</option>
							      	 	<option>스크립트릿(Scriptlet)</option>
							       	 	<option>이용해서</option>
							       		<option>집어넣자</option>
							    	</select>
					            </div>
					            
					            <div class="col-sm-2">							    	
							    	<select class="form-control">
							        	<option>월</option>
							      	 	<option>스크립트릿(Scriptlet)</option>
							       	 	<option>이용해서</option>
							       		<option>집어넣자</option>
							    	</select>
					             </div>
					             
					            <div class="col-sm-2">							    	
							    	<select class="form-control">
							        	<option>일</option>
							      	 	<option>스크립트릿(Scriptlet)</option>
							       	 	<option>이용해서</option>
							       		<option>집어넣자</option>
							    	</select>
					             </div>
					        </div>      						
      						
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputNumber">
					            	내국인/외국인
					            	<span class="text-red">*</span>
					            </label>
					            <div class="col-sm-6">
 									<label class="radio-inline"><input type="radio" name="optradio">내국인</label>
 								 	<label class="radio-inline"><input type="radio" name="optradio">외국인</label>
					             </div>
					        </div>
					        
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputNumberCheck">
									성별
									<span class="text-red">*</span>
								</label>
					          	<div class="col-sm-6">
 									<label class="radio-inline"><input type="radio" name="optradio">남자</label>
 									<label class="radio-inline"><input type="radio" name="optradio">여자</label>
					          	</div> 
					        </div>
      						
					        <div class="form-group">
					          	<label class="col-sm-3 control-label" for="inputPassword">
					          		비밀번호
					          		<span class="text-red">*</span>
					          		</label>
					        	<div class="col-sm-6">
					          		<input class="form-control" id="inputPassword" type="password" placeholder="비밀번호">
					        	<p class="help-block">비밀번호 조합예시: korea123@ 입력가능 특수문자: ! @ # $ % ^ & * (보안지침에 의거하여 비밀번호는 9~16자리이며, 반드시 영문자 숫자 특수문자를 모두 혼합하여 입력하시기 바랍니다. 대소문자 구분되므로 주의!)</p>
					        	</div>
					        </div>
					        
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputPasswordCheck">
					        		비밀번호 확인
					        		<span class="text-red">*</span>	
					        	</label>
					            <div class="col-sm-6">
					            <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
					            	<!-- ajax로 동적처리  
          							<p class="text-danger">비밀번호가 틀립니다.</p>
          							-->
					            </div>
					        </div>
					        
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="11">
					            	비밀번호 질문
					            	<span class="text-red">*</span>
					            </label>
					            <div class="col-sm-6" >
							    	<select class="form-control" id="11">
							        	<option>- 선택하세요 -</option>
							      	 	<option>스크립트릿(Scriptlet)</option>
							       	 	<option>이용해서</option>
							       		<option>집어넣자</option>
							    	</select>
							    </div>
					        </div>	
					        
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputName">
					            	비밀번호 답변
					            	<span class="text-red">*</span>
					            </label>
					          		<div class="col-sm-6">
					            		<input class="form-control" id="inputName" type="text" placeholder="비밀번호 답변">
					            		<p class="help-block">(비밀번호 분실시 사용됩니다. 질문의 답변을 잘 기억해 두세요)</p>
					          		</div>
					        </div>				        				        
					        					                					
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputName">
					            	이름
					            	<span class="text-red">*</span>
					            </label>
					          		<div class="col-sm-6">
					            		<input class="form-control" id="inputName" type="text" placeholder="이름">
					          		</div>
					        </div>
					        
					        <div class="form-group">
					          	<label class="col-sm-3 control-label" for="email">
					          		이메일
					          		<span class="text-red">*</span>
					          	</label>
					        	<div class="col-sm-6">
					          		<input class="form-control" id="email" type="email" placeholder="이메일">
					        	</div>
					        </div> 
					        
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputNumber">
					             	전화번호
					            </label>
					            <div class="col-sm-6">
					            	<div class="input-group">
					            		<input type="tel" class="form-control" id="inputNumber" placeholder="- 없이 입력해 주세요" />
					            		<span class="input-group-btn">
					            		<button class="btn btn-success">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
					            		</span>
					            	</div>
					            </div>
					        </div>	
					        
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputNumber">
					             	이동전화
					            </label>
					            <div class="col-sm-6">
					            	<div class="input-group">
					            		<input type="tel" class="form-control" id="inputNumber" placeholder="- 없이 입력해 주세요" />
					            		<span class="input-group-btn">
					            		<button class="btn btn-success">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
					            		</span>
					            	</div>
					            </div>
					        </div>					        				        
        			        
					        <div class="form-group text-center">
					        	<label class="col-sm-3 control-label" for="">
					        		주민등록 거주지
					        		<span class="text-red">*</span>
					        	</label>
					        						        	
					        		<div class="col-sm-1">
					        			<label class="text-nowrap text-sm help-block">우편번호 입력 </label>
					        		</div>
					        		
					     	   		<div class="col-sm-3">
			        					<div class="input-group">
					        				<input type="text" name="" class="form-control postcodify_postcode5" />
					        				<span class="input-group-btn">
					        				<button class="btn btn-primary "id="postcodify_search_button">주소검색</button>
					        				</span>
					        			</div>
					        		</div>		
					        					     
					        		<div class="col-sm-2">
					        			<label class="help-block">? 주소입력방법 안내</label>
					        		</div>
					        	
					        	
								<div class="col-sm-offset-3 col-sm-1">
					        		<label class="text-nowrap text-sm help-block">주소 </label>
					        	</div>
					     
					        	<div class="col-sm-3">
									<input type="text" name="" class="form-control postcodify_address" value="" /> 
					        	</div>					        	
					        	
					        	<div class="col-sm-2">
					        		<input type="text" name="" class="form-control postcodify_extra_info" value="" />
					        	</div>
					    
					        	<div class="col-sm-offset-3 col-sm-1">
					        		<label class="text-nowrap text-sm help-block">나머지 주소</label>
					        	</div>

					        	<div class="col-sm-5">
									<input type="text" name="" class="form-control postcodify_details" value="" /><br />
					 			</div>
					        	
					        </div>
	        
				          	<div class="form-group">
				            	<label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
				            	<div class="col-sm-6" data-toggle="buttons">
				              		<label class="btn btn-warning active">
				                	<input id="agree" type="checkbox" autocomplete="off" chacked>
				                  	<span class="fa fa-check"></span>
				              		</label>
				              		<a href="#">이용약관</a> 에 동의 합니다.
				            	</div>
				          	</div>
          
					        <div class="form-group">
					        	<div class="col-sm-12 text-center">
					            	<button class="btn btn-primary" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
					            	<button class="btn btn-danger" type="submit">가입취소<i class="fa fa-times spaceLeft"></i></button>
					          	</div>
						    </div>
        				</form>
        			</div>
        		</div>
    		</div>
   		</div>

      <!-- Your Page Content Here -->

    </section>
    
  </div>
  <!-- /.content-wrapper -->