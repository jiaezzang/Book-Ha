<%@page import="com.bookha.main.dto.DTOUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String title = (String) request.getAttribute("title");
String profile = (String) request.getAttribute("profile");
String logo = (String) request.getAttribute("logo");

DTOUser userSetting = (DTOUser)request.getAttribute("userSetting");
String navBar = (String)request.getAttribute("navBar");
int session_user_num = (Integer)request.getAttribute("session_user_num");

//프로필 변경 Modal 내부 Contents
String startProfile = (String)request.getAttribute("startProfile");
String endProfile = (String)request.getAttribute("endProfile");
String atList = (String)request.getAttribute("atList");
String reList = (String)request.getAttribute("reList");
String alList = (String)request.getAttribute("alList");
String shList = (String)request.getAttribute("shList");

//프로필 변경 시 다시 로드할 프로필 이미지 영역
String myProfile = (String)request.getAttribute("myProfile");
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

		$('#modalCenter').modal('show');
            
	    phoneNo(); 
	        
	    reload();
	    $("#userId").val("<%=userSetting.getUser_mail()%>");
	    $("#userName").val("<%=userSetting.getUser_name()%>");
	    $("#nickName").val("<%=userSetting.getUser_nickname()%>");
	    $("#phoneNo").val("<%=userSetting.getUser_phonenumber()%>").replaceAll("-", "");
	    $("#introSelf").val("<%=userSetting.getUser_self()%>");

		$("#nickName").keyup(function(){
    		let DTOUser = {
    				"user_nickname": $("#nickName").val().trim()
    		};
    		console.log(DTOUser);
    		if($("#nickName").val().trim() != "<%=userSetting.getUser_nickname()%>"){
	    		$.ajax({
	    			type: 'POST',
	    			url: "/check_nickname.do",
	    			data: JSON.stringify(DTOUser),
	    			contentType: "application/json; charset=UTF-8",
	    			dataType: "text",
	    			success: function(data) {
	    				if (data >= 1){
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
	    
        $('#update_accountBTN').on("click", function() {

          if($('#userId').val().trim() === ''){
            return toastr.error('ID를 입력 해주세요.');
          }

          if($('.pw').val().trim() === ''){
            return toastr.error('비밀번호를 입력 해주세요.');
          }

           if($("#alert-successNick").css("display") === "none") {
             $("#nickName").css("border", "1px solid red");
             return toastr.error("닉네임을 수정해주세요.");
           }

          if($('#nickName').val().trim() === ''){
            return toastr.error('닉네임을 입력 해주세요.');
          }

          if($('#phoneNo').val().trim() === ''){
            return toastr.error('연락처를 입력 해주세요.');
          }
          update();
        })

      	function phoneNo() {
        	$("#phoneNo").on("keyup", () => {
          	$("#phoneNo").val( $("#phoneNo").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
        	});
      	}

      	function update() {
    	 	 if ($("#password1").val()==$("#password2").val()){
	       	 	let sendData = {
	          		user_mail: $("#userId").val(),
	          		user_password: $("#password1").val(),
	          		user_nickname: $("#nickName").val(),
	          		user_phonenumber: $("#phoneNo").val().replaceAll("-", ""),
	          		user_self: $("#introSelf").val()
	        	};
	
	        	$.ajax({
	          		url:"http://localhost:8080/account/update",
	          		type: "post",
	          		contentType: "application/json; charset=utf-8",
	          		data : JSON.stringify(sendData),
	          		dataType:"json",
	          		success : function(result){
	            		window.location.href = "/user_account_setting.do";
	          		},
	          		error : function(jqXHR,textStatus,errorThrown){
	            		alert("정보가 일치하지 않습니다.");
	          		}
	        	});
    	  	}
      	}

      	$('#delete_accountBTN').on("click", function() {

     		if($('#deleteUserId').val().trim() === ''){
        		return alert('ID를 입력 해주세요.');
        	}
        	if($('#deletePassword').val().trim() === ''){
          		return alert('비밀번호를 입력 해주세요.');
        	}
        	if(!$("#accountActivation").prop("checked")){
          		return alert('계정삭제를 원하신다면 체크해주세요.');
        	}
        	deleteUser();
        })
    })

	function deleteUser() {
		let sendData = {
	    user_mail: $("#deleteUserId").val(),
	    user_password: $("#deletePassword").val()
	    };
	
	    $.ajax({
	    	url:"http://localhost:8080/account/delete",
	        type: "post",
	        contentType: "application/json; charset=utf-8",
	        data : JSON.stringify(sendData),
	        dataType:"json",
	        success : function(result){
	        	window.location.href = "/";
	        },
	        error : function(jqXHR,textStatus,errorThrown){
	        	console.log(jqXHR);
	            console.log(textStatus);
	            console.log(errorThrown);
	        }
	    });
	}
	        
	function goBack(){
		window.history.back();
	}
	        
	function checkPw(){
		let DTOUser = {
			"user_num" : <%=session_user_num%>,
			"user_password" : $("#checkPw").val()
		}
		//console.log(DTOUser);
		if($("#checkPw").val() == "" || $("#checkPw").val() == null){
			toastr.error('비밀번호를 정확히 입력해주세요.', '입력 오류!');
			return false;
		}
		$.ajax({
			type: "POST",
		   	url: "check_pw.do",
		   	data: JSON.stringify(DTOUser),
		   	contentType: "application/json; charset=utf-8",
		   	dataType: "text",
		   	success: function(data){
		   		if(data == 1 ) {
			   		$("#modalCenter").modal("hide");
			   		toastr.success('비밀번호 확인 완료!', '작업 성공!');
		   		}else {
		   	   		toastr.error('비밀번호를 정확히 입력해주세요.', '입력 오류!');
		   	   		$("#checkPw").val("");
		   		}
		   	},
		   	error: function(e) {
			   	toastr.error('비밀번호를 정확히 입력해주세요.', '입력 오류!');
			   	$("#checkPw").val("");
		   	}
		});
	}
	
	function changePf(){
		$('#exLargeModal').modal('show');
	}
	  
	function changePfOk(){
	  	let DTOUser = {
			"user_profile" : $('input[name=profile]:checked').val(),
			"user_num" : <%=session_user_num%>
		}
	  	console.log(DTOUser)
		$.ajax({
			type: "POST",
			url: "change_pf.do",
			data: JSON.stringify(DTOUser),
			contentType: "application/json; charset=utf-8",
			dataType: "text",
			success: function(data){
				if(data == 1) {
					$("#exLargeModal").modal("hide");
					toastr.success('프로필 수정 완료!', '작업 성공!');
					reloadNav();
					reload();
		
				}else {
		 					toastr.error('프로필 이미지를 선택해주세요.', '입력 오류!');
		 					$('input[name=profile]:checked').val("");
				}
			},
			error: function(e) {
				toastr.error('프로필 이미지를 선택해주세요.', '입력 오류!');
				$('input[name=profile]:checked').val("");
			}
		});
	}
	        
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

          		<ul class="menu-inner py-1">

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">목표를 얼마나 달성하셨나요?</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/my_achievements.do"
						class="menu-link"> <i
							class='menu-icon bx bx-book-open bx-tada' style='color: #646363'></i>
							<div data-i18n="Tables">나의 업적 확인</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">작성글을 확인해 봅시다.</span></li>

					<!-- Tables -->
					<li class="menu-item" style=""><a href="javascript:void(0)"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-box"></i>
							<div data-i18n="User interface">내 글 모아보기</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a href="/re_list.do"
								class="menu-link">
									<div data-i18n="Accordion">독후감 나누기</div>
							</a></li>
							<li class="menu-item"><a href="/al_list.do"
								class="menu-link">
									<div data-i18n="Badges">찔끔 챌린지</div>
							</a></li>
							<li class="menu-item"><a href="/sh_list.do"
								class="menu-link">
									<div data-i18n="Buttons">나눔과 공유하기</div>
							</a></li>
						</ul></li>
					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text"></span></li>

					<!-- Tables -->
					<li class="menu-item active"><a href="/user_account_setting.do"
						class="menu-link"> <i class='menu-icon bx bx-book-open'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
							<div data-i18n="Tables">개인 정보 수정</div>
					</a></li>
				</ul>
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
												<label for="phoneNo" class="form-label">연 락 처 수 정</label> <input type="text" class="form-control" id="phoneNo" name="phoneNo" value="" maxlength="13" placeholder="연 락 처">
												<div></div> 
											</div>
											<div class="mb-3 col-md-6">
												<label for="userName" class="form-label">이 름</label> 
												<input class="form-control" type="text" id="userName" name="userName" value="" readonly="">
											</div>
											<div class="mb-3 col-md-6">
												<label for="nickName" class="form-label">닉 네 임 수 정</label> 
												<input class="form-control" type="text" id="nickName" name="nickName" value="" placeholder="닉 네 임">
												<span id="alert-successNick" style="display:none; color:#696cff;">&nbsp;&nbsp;&nbsp;사용 가능한 닉네임입니다!</span>
												<span id="alert-dangerNick" style="display:none; color:#d92742; font-weight: bold;">&nbsp;&nbsp;&nbsp;이미 사용중인 닉네임입니다.</span> 
											</div>
											<div class="mb-3 col-md-6 form-password-toggle">
												<label class="form-label" for="password1">비 밀 번 호 수 정</label>
												<div class="input-group input-group-merge">
													<input type="password" id="password1" class="pw form-control" name="password1" placeholder="············" aria-describedby="password">
													<span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
												</div>
											</div>
											<div class="mb-3 col-md-6 form-password-toggle">
												<label class="form-label" for="password2">비 밀 번 호 수 정  확 인</label>
												<div class="input-group input-group-merge">
													<input type="password" id="password2" class="pw form-control" name="password2" placeholder="············" aria-describedby="password"> 
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
															I D 확 인</label> <input class="form-control" type="text" id="deleteUserId" name="deleteUserId" placeholder="ID를 확인해 주세요">
													</div>
													<div class="mb-3 col-md-6 form-password-toggle">
														<label class="form-label" for="deletePassword">
															비 밀 번 호 확 인</label>
														<div class="input-group input-group-merge">
															<input type="password" id="deletePassword" class="form-control" name="deletePassword" placeholder="············" aria-describedby="password"> <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
														</div>
													</div>
												</div>
												<!-- <form id="formAccountDeactivation" onsubmit="return false"> -->
												<div class="form-check mb-3">
													<input class="form-check-input" type="checkbox" id="accountActivation" name="accountActivation"> <label class="form-check-label" for="accountActivation">
														계정 삭제에 동의합니다.</label>
												</div>
												<button type="submit" id="delete_accountBTN" class="btn btn-danger deactivate-account">계 정 삭 제</button>
												<!-- </form> -->
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
										type="text" id="checkPw" class="form-control"
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