<%@page import="com.config.MySqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="jquery-3.1.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ePost').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('eAddr1').value = fullRoadAddr;
                document.getElementById('eAddr2').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
    
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper ">
    <!-- Content Header (Page header) -->
    <section class="content-header ">
      <h1>
                   원서접수	
        <small>수험생 시험원서접수</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
	
    	<div class="row">
    		<div class="col-xs-12">
    			<div class="box">
    				
    				<div class="box-body">
    					<form class="form-horizontal" action="ExamSubmitServlet" method="post" enctype="multipart/form-data">		  
        					<div class="form-group">
          						<label class="col-xs-3 control-label" for="id">
          							아이디
          							<span class="text-red">*</span>
          						</label>
        						<div class="col-xs-6">
          							<input class="form-control" name="eId" id="eId" type="text" placeholder="아이디">
          							<span id="resultId"></span>
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
					            <div class="col-xs-2">
          							<input class="form-control" name="birthYear" id="birthYear" type="text" placeholder="년">
        						</div>
					            
					            <div class="col-xs-2">
          							<input class="form-control" name="birthMonth" id="birthMonth" type="text" placeholder="월">
        						</div>
        						
					            <div class="col-xs-2">
          							<input class="form-control" name="birthDay" id="birthDay" type="text" placeholder="일">
        						</div>
					        </div>   

      						
					        <div class="form-group">
					          	<label class="col-sm-3 control-label" for="inputPassword">
					          		비밀번호
					          		<span class="text-red">*</span>
					          		</label>
					        	<div class="col-sm-6">
					          		<input class="form-control" name="ePw" id="ePw" type="password" placeholder="비밀번호">
					            <span id="result"></span>
					        	<p class="help-block">비밀번호 조합예시: korea123@<br> 보안지침에 의거하여 비밀번호는 무조건 9~16자리 입니다.<br>비밀번호는 영문자 숫자 특수문자를 혼합하여 입력하시는 것을 권장합니다.</p>
					        	</div>
					        </div>
					        
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputPasswordCheck">
					        		비밀번호 확인
					        		<span class="text-red">*</span>	
					        	</label>
					            <div class="col-sm-6">
					            <input class="form-control" id="ePw2" type="password" placeholder="비밀번호 확인">
					            <span id="result2"></span>
					            	<!-- ajax로 동적처리  
          							<p class="text-danger">비밀번호가 틀립니다.</p>
          							-->
					            </div>
					        </div>
					        	                					
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputName">
					            	이름
					            	<span class="text-red">*</span>
					            </label>
					          		<div class="col-sm-6">
					            		<input class="form-control" name="eName" id="eName" type="text" placeholder="이름">
					          		</div>
					        </div>
					        
					        <div class="form-group">
					          	<label class="col-sm-3 control-label" for="email">
					          		이메일
					          		<span class="text-red">*</span>
					          	</label>
					        	<div class="col-sm-6">
					          			<input class="form-control" name="eEmail" id="eEmail" type="email" placeholder="이메일">
					            		
					        	</div>
					        </div>
					        
					        <div class="form-group">
					            <label class="col-sm-3 control-label" for="inputNumber">
					             	전화번호
					            	<span class="text-red">*</span>
					            </label>
					            <div class="col-sm-6">
					            		<input type="tel" class="form-control" name="ePhone" id="ePhone" placeholder="- 없이 입력해 주세요" />
					            </div>
					        </div>	        				        
        			        
					        <div class="form-group text-center">
					        	<label class="col-sm-3 control-label" for="">
					        		주소
					        		<span class="text-red">*</span>
					        	</label>
					        						        	
					        		<div class="col-sm-1">
					        			<label class="text-nowrap text-sm help-block">우편번호 입력 </label>
					        		</div>
					        		
					     	   		<div class="col-sm-3">
			        					<div class="input-group">
					        				<input type="text" id="ePost" name="ePost" class="form-control postcodify_postcode5" />
					        				<span class="input-group-btn">
					        				<input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="주소검색">
					        				</span>
					        			</div>
					        		</div>		
					        					     
					        		<div class="col-sm-2">
					        			<label class="help-block">주소를 입력해주세요.</label>
					        		</div>


								<div class="col-sm-offset-3 col-sm-1">
					        		<label class="text-nowrap text-sm help-block">도로명주소 </label>
					        	</div>
					     
					        	<div class="col-sm-5">
									<input type="text" id="eAddr1" name="eAddr1" class="form-control postcodify_address" value="" /> 
					        	</div>	
					    
					        	<div class="col-sm-offset-3 col-sm-1">
					        		<label class="text-nowrap text-sm help-block">지번 주소</label>
					        	</div>

					        	<div class="col-sm-5">
									<input type="text" id="eAddr2" name="eAddr2" class="form-control postcodify_details" value="" /><br />
					 			</div>
					        	
					        </div>
          
					        <div class="form-group">
					        	<div class="col-sm-12 text-center">
					            	<input class="btn btn-primary btn-info" id="sub" type="submit" value="회원가입">
					          	</div>
					          	
					          	<div class="col-sm-12 text-center">
					            	파일<input type="file" name="theFIle">
					          	</div>
						    </div>
        				</form>
        				
        				<script type="text/javascript">

						   $(document).ready(function(){
							  
							   $("#eId").on("keyup", function(event){
								   
								   //Ajax 연동 
								 //ajax통신
									jQuery.ajax({
										type:"GET",
										url:"idCheck.jsp",
										dataType:"text",
										data:{
											   eId:$("#eId").val()
											},
										success:function(responseData,status,xhr){
											console.log(responseData);
											$("#resultId").text(responseData);
										},
										error:function(xhr,status,error){
											console.log("error");
										}
									});
							   });
							   
							   $("#ePw2").on("keyup", function(event){
								 $("#result2").removeClass();
								   var p = $("#ePw").val();
								   var p2 = $("#ePw2").val();
								   if(p == p2){
									   $("#result2").text("비밀번호가 일치합니다");
								   }else{
									   $("#result2").text("비밀번호가 불일치합니다");
								   }
							   });
							   
							   $("#ePw").on("keyup", function(event){
									 $("#result").removeClass();
									   var p = $("#ePw").val();
									   if(p.length < 9 || p.length > 16){
										   $("#sub").attr("disabled", true);
										   $("#result").text("비밀번호는 9~16자로 입력 해주세요.");
									   }else{
										   $("#result").text("입력하신 비밀번호가 9~16자 입니다.");
										   $("#sub").attr("disabled", false);
									   }
								});
							   
							   $("form").on("submit", function(event){
								   
								    var eId = $("#eId").val();
								    if(eId == ''){
								    	alert("아이디를 입력하세요");
								    	return false;
								    }else if($("#birthYear").val() == ''){
								    	alert("생년월일(년)을 입력하세요");
								    	return false;
								    }else if($("#birthMonth").val() == ''){
								    	alert("생년월일(월)을 입력하세요");
								    	return false;
								    }else if($("#birthDay").val() == ''){
								    	alert("생년월일(일)을 입력하세요");
								    	return false;
								    }else if($("#ePw").val() == ''){
								    	alert("비밀번호를 입력하세요");
								    	return false;
								    }else if($("#ePw2").val() == ''){
								    	alert("비밀번호 확인을 입력하세요");
								    	return false;
								    }else if($("#eName").val() == ''){
								    	alert("이름을 입력하세요");
								    	return false;
								    }else if($("#ePost").val() == ''){
								    	alert("우편번호를 입력하세요");
								    	return false;
								    }else if($("#eAddr1").val() == ''){
								    	alert("주소를 입력하세요");
								    	return false;
								    }else if($("#eAddr2").val() == ''){
								    	alert("주소를 입력하세요");
								    	return false;
								    }else if($("#ePhone").val() == ''){
								    	alert("전화번호를 입력하세요");
								    	return false;
								    }else if($("#eEmail").val() == ''){
								    	alert("이메일을 입력하세요");
								    	return false;
								    }else{
								    	//성공
								    	alert("회원가입을 환영합니다");
								    }
								   
							   });
							   
						   });
					   </script>
        				
        			</div>
        		</div>
    		</div>
   		</div>

      <!-- Your Page Content Here -->

    </section>
    
  </div>
  <!-- /.content-wrapper -->