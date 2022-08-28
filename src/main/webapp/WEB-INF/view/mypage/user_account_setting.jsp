<%@page import="com.bookha.main.dto.DTOUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title = (String) request.getAttribute("title");
	String profile = (String) request.getAttribute("profile");
	String logo = (String) request.getAttribute("logo");
	
	//유저 정보 관련
	DTOUser userSetting = (DTOUser)request.getAttribute("userSetting");
	int session_user_num = (Integer)request.getAttribute("session_user_num");
	
	//상단 네비게이션바와 좌측 메뉴바
	String navBar = (String)request.getAttribute("navBar");
	String menuBar =(String)request.getAttribute("menuBar");
	
	//프로필 변경 Modal 내부 Contents
	String startProfile = (String)request.getAttribute("startProfile");
	String endProfile = (String)request.getAttribute("endProfile");
	String atList = (String)request.getAttribute("atList");
	String reList = (String)request.getAttribute("reList");
	String alList = (String)request.getAttribute("alList");
	String shList = (String)request.getAttribute("shList");
	
	//프로필 변경 시 다시 로드할 프로필 이미지 영역
	String myProfile = (String)request.getAttribute("myProfile");
	
	//카카오 유저 판별
	String pathKakao = (String)request.getAttribute("pathKakao");
%>
<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="css/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title><%=title%></title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="../assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="../assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet" href="../assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="../assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<!-- Page CSS -->
<style type="text/css">
#introSelf{
	height: 6.25em;
	resize: none;
}

.btn-kakao {
  color: #FFF;
  background-color: #FEE500;
  border-color: #FEE500;
  box-shadow: 0 0.125rem 0.25rem 0 #FEE500;
}
</style>

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../assets/js/config.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assets/vendor/libs/popper/popper.js"></script>
<script src="../assets/vendor/js/bootstrap.js"></script>
<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assets/vendor/js/menu.js"></script>

<!-- Toastr -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="../js/toastr.js"></script>
<script>
	$(document).ready(function() {
		//카카오 유저와 일반 유저 구분
		if("<%=pathKakao%>" != "kakao"){
			$('#modalCenter').modal('show');
            $('#password1').removeAttr("readonly");
            $('#password2').removeAttr("readonly");
            $('#deleteUserId').removeAttr("readonly");
            $('#deletePassword').removeAttr("readonly");
            $("#delete_accountBTN").css('display', 'inline-block');
		} else {
			$("#delete_kakaoAccountBTN").css('display', 'inline-block');
		}
		
		//기본값 입력
	    reload();
	    $("#userId").val("<%=userSetting.getUser_mail()%>");
	    $("#userName").val("<%=userSetting.getUser_name()%>");
	    $("#nickName").val("<%=userSetting.getUser_nickname()%>");
	    $("#userPhone").val("<%=userSetting.getUser_phonenumber()%>").replaceAll("-", "");
	    let user_self = "<%=userSetting.getUser_self().replaceAll("\n", "<br />")%>";
	    $("#introSelf").val(user_self.replaceAll("<br />", "\n"));
		
		$("#userPhone").val( $("#userPhone").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replaceAll("--", "-") );

	    //휴대폰 번호 정규식 검사
		$("#userPhone").keyup(function(){
      		$("#userPhone").val( $("#userPhone").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replaceAll("--", "-") );
      		
      		var text = $("#userPhone").val().trim();
      		
      		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
      		if (regPhone.test(text) === true) {
      			$("#alert-correctPhone").css('display', 'none');
      			$('#userPhone').css('border', '1px solid #696cff');
      		}else{
      			$("#alert-correctPhone").css('display', 'inline-block');
      		}
  		});

	    //비동기 닉네임 일치검사
		$("#nickName").keyup(function(){
    		let DTOUser = {
    				"user_nickname": $("#nickName").val().trim()
    		};
    		if($("#nickName").val().trim() != "<%=userSetting.getUser_nickname()%>"){
	    		$.ajax({
	    			type: 'POST',
	    			url: "/check_nickname.do",
	    			data: JSON.stringify(DTOUser),
	    			contentType: "application/json; charset=UTF-8",
	    			dataType: "text",
	    			success: function(data) {
	    				if(data == 1){
	    					$("#alert-successNick").css('display', 'none');
	    	                $("#alert-dangerNick").css('display', 'inline-block');
	    				} else {
	    	                $("#alert-successNick").css('display', 'inline-block');
	    	                $("#alert-dangerNick").css('display', 'none');
	    				}
	    			},
	    			error : function(){
	    				//console.log("서버요청실패");
	    			}
	    		});
    		}
    	});
		
		//비동기 비밀번호 일치 검사
	    $('.pw').keyup(function () {
	        var pwd1 = $("#password1").val();
	        var pwd2 = $("#password2").val();
	  
	        if ( pwd1 != '' && pwd2 == '' ) {
	            null;
	        } else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	                $("#alert-success").css('display', 'inline-block');
	                $("#alert-danger").css('display', 'none');
	            } else {
	                $("#alert-success").css('display', 'none');
	                $("#alert-danger").css('display', 'inline-block');
	            }
	        }
	    });
	    
	    //값을 입력하지 않고 개인정보 수정 버튼을 눌렀을 때
        $('#update_accountBTN').on("click", function() {

          if($('#userId').val().trim() === ''){
            return toastr.error('이메일을 입력해주세요.', '실패!');
          }

          if('<%=pathKakao%>' != 'kakao' && $('.pw').val().trim() === ''){
            return toastr.error('비밀번호를 입력해주세요.', '실패!');
          }

          if($("#alert-successNick").css("display") === "none" && $("#alert-dangerNick").css("display") === "none"){
        	   
          }else if($("#alert-successNick").css("display") === "none") {
             $("#nickName").css("border", "1px solid red");
             return toastr.error("닉네임을 수정해주세요.", '실패!');
          }

          if($('#nickName').val().trim() === ''){
            return toastr.error('닉네임을 입력해주세요.', '실패!');
          }

          if($('#userPhone').val().trim() === ''){
            return toastr.error('연락처를 입력해주세요.', '실패!');
          }
          
          if($('#alert-correctPhone').css('display') === 'inline-block'){
          	$('#userPhone').css('border', '1px solid red')
              return toastr.error('올바른 형식의 연락처를 입력해주세요.', '실패!');
          }
          update();
        })

      	function phoneNo() {
        	$("#userPhone").on("keyup", () => {
          	$("#userPhone").val( $("#userPhone").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
        	});
      	}

	    //정보 수정 완료 시
      	function update() {
    	 	 if ($("#password1").val()==$("#password2").val()){
	       	 	let sendData = {
	          		user_mail: $("#userId").val(),
	          		user_password: $("#password1").val(),
	          		user_nickname: $("#nickName").val(),
	          		user_phonenumber: $("#userPhone").val().replaceAll("-", ""),
	          		user_self: $("#introSelf").val()
	        	};
	
	        	$.ajax({
	          		url:"/account/update",
	          		type: "post",
	          		contentType: "application/json; charset=utf-8",
	          		data : JSON.stringify(sendData),
	          		dataType:"json",
	          		success : function(result){
	            		window.location.href = "/user_account_setting.do";
	          		},
	          		error : function(jqXHR,textStatus,errorThrown){
	            		alert("정보가 일치하지 않습니다.", '실패!');
	          		}
	        	});
    	  	}
      	}

	    //일반 계정 삭제 시
      	$('#delete_accountBTN').on("click", function() {

			if($('#deleteUserId').val().trim() != "<%=userSetting.getUser_mail()%>") {
				return toastr.error('이메일을 올바르게 입력해주세요.', '실패!');
			}
     		if($('#deleteUserId').val().trim() === ''){
     			return toastr.error('이메일을 입력해주세요.', '실패!');
        	}
			if($('#deletePassword').val().trim() != "<%=userSetting.getUser_password()%>") {
				return toastr.error('비밀번호를 올바르게 입력해주세요.', '실패!');
			}
        	if($('#deletePassword').val().trim() === ''){
        		return toastr.error('비밀번호를 입력해주세요.', '실패!');
      		}
        	if(!$("#accountActivation").prop("checked")){
        		return toastr.error('계정삭제에 동의해주세요.', '실패!');
        	}
        	
        	$('#deleteOk').modal('show');
        })
        
        //카카오 계정 삭제 시
      	$('#delete_kakaoAccountBTN').on("click", function() {
        	if(!$("#accountActivation").prop("checked")){
        		return toastr.error('계정삭제에 동의해주세요.', '실패!');
        	}
        	
        	$('#deleteOk').modal('show');
        })
    })

    
	function deleteUser() {

		if("<%=pathKakao%>" != "kakao"){
			let sendData = {
		    	user_mail: $("#deleteUserId").val(),
		    	user_password: $("#deletePassword").val()
		    };
		    $.ajax({
		    	url:"/account/delete",
		        type: "post",
		        contentType: "application/json; charset=utf-8",
		        data : JSON.stringify(sendData),
		        dataType:"json",
		        success : function(result){
		        	window.location.href = "/";
		        },
		        error : function(jqXHR,textStatus,errorThrown){
// 	        		console.log(jqXHR);
// 	            	console.log(textStatus);
// 	            	console.log(errorThrown);
		        }
		    });
		} else {
			let sendData = {
				user_mail: "<%=userSetting.getUser_mail()%>"
			};
	
		    $.ajax({
		    	url:"/account/delete_kakao",
		        type: "post",
		        contentType: "application/json; charset=utf-8",
		        data : JSON.stringify(sendData),
		        dataType:"json",
		        success : function(result){
		        	window.location.href = "/";
		        },
		        error : function(jqXHR,textStatus,errorThrown){
// 	    	    	console.log(jqXHR);
// 		            console.log(textStatus);
//	 	            console.log(errorThrown);
		        }
		    });
		}
	}
	        
	function goBack(){
		window.history.back();
	}
	
	//개인정보 수정 페이지 진입 시 비밀번호 확인 검사 모달
	function checkPw(){
		if($("#checkPw").val() == "" || $("#checkPw").val() == null){
			toastr.error('비밀번호를 입력해주세요.', '실패!');
			return false;
		}
		
		let DTOUser = {
			"user_num" : <%=session_user_num%>,
			"user_password" : $("#checkPw").val()
		}
		
		$.ajax({
			type: "POST",
		   	url: "/check_pw.do",
		   	data: JSON.stringify(DTOUser),
		   	contentType: "application/json; charset=utf-8",
		   	dataType: "text",
		   	success: function(data){
		   		if(data == 1 ) {
			   		$("#modalCenter").modal("hide");
			   		toastr.success('비밀번호 확인 완료!', '성공!');
		   		}else {
		   	   		toastr.error('비밀번호를 올바르게 입력해주세요.', '실패!');
		   	   		$("#checkPw").val("");
		   		}
		   	},
		   	error: function(e) {
			   	toastr.error('서버 통신오류 - 500', '통신 오류!');
			   	$("#checkPw").val("");
		   	}
		});
	}
	
	//프로필사진 변경 시 사용되는 모달
	function changePf(){
		$('#exLargeModal').modal('show');
	}
	
	//프로필 변경 완료 시 
	function changePfOk(){
		if($('input[name=profile]:checked').val() != null || $('input[name=profile]:checked').val() == ""){
		  	let DTOUser = {
				"user_profile" : $('input[name=profile]:checked').val(),
				"user_num" : <%=session_user_num%>
			}
			$.ajax({
				type: "POST",
				url: "change_pf.do",
				data: JSON.stringify(DTOUser),
				contentType: "application/json; charset=utf-8",
				dataType: "text",
				success: function(data){
					if(data == 1) {
						$("#exLargeModal").modal("hide");
						toastr.success('프로필이 수정되었습니다.', '성공!');
						reloadNav();
						reload();
			
					}else {
			 					toastr.error('프로필 이미지를 선택해주세요.', '실패!');
			 					$('input[name=profile]:checked').val("");
					}
				},
				error: function(e) {
					toastr.error('프로필 이미지를 선택해주세요.', '실패!');
					$('input[name=profile]:checked').val("");
				}
			});
		} else {
			toastr.error('프로필 이미지를 선택해주세요.', '실패!');
		}
	}
	        
	//프로필 변경 완료 시 다시 로드 될 프로필 이미지 영역
	const reload = function(){
		$.ajax({
			type: 'POST',
			url: "/reload_profile.do",
			datatype: "text",
			success: function(data){
				$("#profileImg").html(data);
			}
		});
	}
	
	//프로필 변경 완료 시 다시 로드 될 네비게이션바 영역
	const reloadNav = function(){
		$.ajax({
			type: 'POST',
			url: "/reload_nav.do",
			datatype: "text",
			success: function(data){
				$("#navBar").html(data);
			}
		});
	}
</script>
</head>
<body class="modal-open" style="padding-right:17px;">
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme" data-bg-class="bg-menu-theme">
				<div class="app-brand demo">
					<%= logo %>
				</div>
          <div class="menu-inner-shadow"></div>
				<%=menuBar %>
		</aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
			<div id="navBar"><%=navBar %></div>
          <!-- / Navbar -->

          <!-- Content wrapper -->
          	<div class="content-wrapper">
            <!-- Content -->

            	<div class="container-xxl flex-grow-1 container-p-y">
              	<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">개인 정보 수정</span></h4>

             		 <div class="row">
                		<div class="col-md-12">
                  			<div class="card mb-4">
								<h5 class="card-header">계정 상세</h5>
									<!-- Account -->
									<div class="card-body">
										<div class="d-flex align-items-start align-items-sm-center gap-4" id="profileImg">
											<%=myProfile %>
										</div>
									</div>
					
								<hr class="my-0">
									<div class="card-body">
										<!-- <form id="formAccountSettings" method="POST" onsubmit="return false"> -->
										<div class="row">
											<div class="mb-3 col-md-6">
												<label for="userId" class="form-label">I D</label> 
												<input class="form-control" type="text" id="userId" name="userId" value="" readonly="">
											</div>
											<div class="mb-3 col-md-6">
												<label for="userPhone" class="form-label">연 락 처 수 정</label> <input type="text" class="form-control" id="userPhone" name="userPhone" value="" maxlength="13" placeholder="연 락 처">
												<span id="alert-correctPhone" style="display:none; color:#d92742;">&nbsp;&nbsp;올바른 형식의 연락처를 입력해주세요.</span> 
												<div></div> 
											</div>
											<div class="mb-3 col-md-6">
												<label for="userName" class="form-label">이 름</label> 
												<input class="form-control" type="text" id="userName" name="userName" value="" readonly="">
											</div>
											<div class="mb-3 col-md-6">
												<label for="nickName" class="form-label">닉 네 임 수 정</label> 
												<input class="form-control" type="text" id="nickName" name="nickName" value="" placeholder="닉 네 임">
												<span id="alert-successNick" style="display:none; color:#696cff;">&nbsp;&nbsp;&nbsp;사용 가능한 닉네임입니다.</span>
												<span id="alert-dangerNick" style="display:none; color:#d92742; font-weight: bold;">&nbsp;&nbsp;&nbsp;이미 사용중인 닉네임입니다.</span> 
											</div>
											<div class="mb-3 col-md-6 form-password-toggle">
												<label class="form-label" for="password1">비 밀 번 호 수 정</label>
												<div class="input-group input-group-merge">
													<input type="password" id="password1" class="pw form-control" name="password1" placeholder="············" aria-describedby="password" readonly="">
													<span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
												</div>
											</div>
											<div class="mb-3 col-md-6 form-password-toggle">
												<label class="form-label" for="password2">비 밀 번 호 수 정  확 인</label>
												<div class="input-group input-group-merge">
													<input type="password" id="password2" class="pw form-control" name="password2" placeholder="············" aria-describedby="password" readonly=""> 
													<span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
												</div>
												<span id="alert-success" style="display:none; color:#696cff;">&nbsp;&nbsp;&nbsp;비밀번호가 일치합니다</span>
												<span id="alert-danger" style="display:none; color:#d92742; font-weight: bold;">&nbsp;&nbsp;&nbsp;비밀번호가 일치하지 않습니다.</span>
											</div>
											<div>
												<label class="form-label" for="introSelf">자 기 소 개</label>
												<div class="input-group input-group-merge">
													<textarea class="form-control" id="introSelf" name="introSelf" aria-label="With textarea" placeholder="자기소개를 입력해주세요."></textarea>
												</div>
											</div>
					
											<div class="mt-2">
												<button type="submit" id="update_accountBTN" class="btn btn-primary me-2" status="true" style="float: right;">
												변경사항 저장</button>
												<!--                           <button type="reset" class="btn btn-outline-secondary">취 소</button> -->
											</div>
											<!-- </form> -->
										</div>
										<!-- /Account -->
									</div>
								</div>
									<div class="card">
										<h5 class="card-header">계정 삭제</h5>
										<div class="card-body">
											<div class="mb-3 col-12 mb-0">
											
												<div class="alert alert-warning">
													<h6 class="alert-heading fw-bold mb-1">계정을 삭제하기를
														원하시나요?</h6>
													<p class="mb-0">만약 계정을 삭제한다면, 복구는 불가능합니다. 주의부탁드립니다.</p>
												</div>
												
												<div class="row">
													<div class="mb-3 col-md-6">
														<label for="deleteUserId" class="form-label">
															I D 확 인</label> <input class="form-control" type="text" id="deleteUserId" name="deleteUserId" placeholder="ID를 확인해 주세요" readonly="">
													</div>
													<div class="mb-3 col-md-6 form-password-toggle">
														<label class="form-label" for="deletePassword">
															비 밀 번 호 확 인</label>
														<div class="input-group input-group-merge">
															<input type="password" id="deletePassword" class="form-control" name="deletePassword" placeholder="············" aria-describedby="password" readonly=""> <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
														</div>
													</div>
												</div>
												<div class="form-check mb-3" style="display:inline-block;">
													<input class="form-check-input" type="checkbox" id="accountActivation" name="accountActivation"> 
													<label class="form-check-label" for="accountActivation">
														계정 삭제에 동의합니다.</label>
												</div>
												<button type="submit" id="delete_accountBTN" class="btn btn-danger deactivate-account" style="float: right; display:none;">계정삭제</button>
												<button type="submit" id="delete_kakaoAccountBTN" class="btn btn-kakao deactivate-account" style="float: right; display:none;">카카오계정 삭제</button>
											</div>
										</div>
									</div>
				                </div>
				              </div>
				            </div>
            <!-- / Content -->
            
            <!--  PWD check Modal  -->
			<div class="modal fade" id="modalCenter" tabindex="-1" data-bs-backdrop="static" style="display: none;" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modalCenterTitle">비밀번호를 확인해주세요.</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col mb-3">
									<label for="checkPw" class="form-label">비밀번호 입력</label> 
									<input
										type="password" id="checkPw" class="form-control"
										placeholder="PASSWORD">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-secondary"
							data-bs-dismiss="modal" aria-label="Close" onclick="goBack();">취소</button>
							<button type="button" class="btn btn-primary" id="check" onclick="checkPw();">확인</button>
						</div>
					</div>
				</div>
			</div>
			<!--  /PWD check Modal  -->
			
			<!-- Profile change Modal -->
			<div class="modal fade" id="exLargeModal" tabindex="-1" data-bs-backdrop="static" style="display: none;" role="dialog">
            	<div class="modal-dialog modal-xl" role="document">
                	<div class="modal-content">
                    	<div class="modal-header">
                     		<h5 class="modal-title" id="exampleModalLabel4">프로필 변경하기</h5>
                         	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
                     	<div class="modal-body">

							<%=startProfile %>
                        	<%=atList %>
                        	<%=reList %>
                        	<%=alList %>
                        	<%=shList %>
							<%=endProfile %>

                       	</div>
                       	<div class="modal-footer">
                         	<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                         	<button type="button" class="btn btn-primary" onclick="changePfOk();">확인</button>
                       	</div>
           			</div>
        		</div>
			</div>
			<!--/ Profile change Modal -->
			
			<!-- Delete Account Modal -->
			<div class="modal fade" id="deleteOk" tabindex="-1" data-bs-backdrop="static" style="display: none;" role="dialog">
            	<div class="modal-dialog modal-dialog modal-dialog-centered" role="document">
                	<div class="modal-content">
                    	<div class="modal-header">
                     		<h5 class="modal-title" id="exampleModalLabel4">계정 삭제</h5>
                         	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
                     	<div class="modal-body">
							<p>계정을 정말 삭제하시겠습니까?</p>
                       	</div>
                       	<div class="modal-footer">
                         	<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                         	<button type="button" class="btn btn-primary" onclick="deleteUser();">확인</button>
                       	</div>
           			</div>
        		</div>
			</div>
			<!--/ Delete Account Modal -->
			
            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
    
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../assets/js/pages-account-settings-account.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
</body>
</html>