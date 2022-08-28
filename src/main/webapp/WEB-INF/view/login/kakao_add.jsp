<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String title = (String) request.getAttribute("title");
String logo = (String) request.getAttribute("logo");
String email = (String) request.getAttribute("email");
String name = (String) request.getAttribute("name");

%>
<!DOCTYPE html>

<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>카카오 추가 정보 입력</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="../assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    
    <!-- Toastr -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script src="../js/toastr.js"></script>
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
    <script type="text/javascript">

    $(document).ready(function() {
        
	    //비동기 아이디 일치검사
		$("#userId").keyup(function(){
    		let DTOUser = {
    				"user_mail": $("#userId").val().trim()
    		};

    		$.ajax({
    			type: 'POST',
    			url: "/check_id.do",
    			data: JSON.stringify(DTOUser),
    			contentType: "application/json; charset=UTF-8",
    			dataType: "text",
    			success: function(data) {
    				if (data == 1){
    					$("#alert-successId").css('display', 'none');
    	                $("#alert-dangerId").css('display', 'inline-block');
    				} else {
    					correctMail();
    				}
    			},
    			error : function(){
    				console.log("서버요청실패");
    			}
    		});
    	});
	    
	    //이메일 정규식 검사
	    function correctMail() {
			var text = $("#userId").val().trim();
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if (regEmail.test(text) === true) {
                $("#alert-successId").css('display', 'inline-block');
                $("#alert-dangerId").css('display', 'none');
                $("#alert-correctId").css('display', 'none');
                $('#userId').css('border', '1px solid #696cff');
			} else {
                $("#alert-successId").css('display', 'none');
                $("#alert-dangerId").css('display', 'none');
                $("#alert-correctId").css('display', 'inline-block');
			}
		}
	    
	    //비동기 닉네임 일치검사
		$("#userNickname").keyup(function(){
    		let DTOUser = {
    				"user_nickname": $("#userNickname").val().trim()
    		};
    		$.ajax({
    			type: 'POST',
    			url: "/check_nickname.do",
    			data: JSON.stringify(DTOUser),
    			contentType: "application/json; charset=UTF-8",
    			dataType: "text",
    			success: function(data) {
    				if (data == 1){
    					$("#alert-successNick").css('display', 'none');
    	                $("#alert-dangerNick").css('display', 'inline-block');
    				} else {
    	                $("#alert-successNick").css('display', 'inline-block');
    	                $("#alert-dangerNick").css('display', 'none');
    	                $('#userNickname').css('border', '1px solid #696cff');
    				}
    			},
    			error : function(){
    			}
    		});
    	});
	    
	    //휴대폰 번호 정규식 검사
		$("#userPhone").keyup(function(){
			$("#userPhone").val( $("#userPhone").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
			
      		var text = $("#userPhone").val().trim();

      		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
      		if (regPhone.test(text) === true) {
      			$("#alert-correctPhone").css('display', 'none');
      			$('#userPhone').css('border', '1px solid #696cff');
      		}else{
      			$("#alert-correctPhone").css('display', 'inline-block');
      		}
  		});

        $('#signBtn').on("click", function() {
// 			if($('#alert-successId').css('display') === 'none') {
// 				$('#userId').css('border', '1px solid red');
// 				return toastr.error("이미 존재하는 이메일입니다.", "실패!");
// 			}

			if($('#userId').val().trim() === ''){
				$('#userId').css('border', '1px solid red');
				return toastr.error('이메일을 입력해주세요.', '실패!');
			}
      
			if($('#userName').val().trim() === ''){
				$('#userName').css('border', '1px solid red');
            	return toastr.error('이름을 입력해주세요.', '실패!');
          	}

	        if($('#alert-successNick').css('display') === 'none') {
	        	$('#userNickname').css('border', '1px solid red');
	        	return toastr.error('이미 존재하는 닉네임입니다.', '실패!');
	        }

          	if($('#userNickname').val().trim() === ''){
          		$('#userNickname').css('border', '1px solid red');
           		return toastr.error('닉네임을 입력해주세요.', '실패!');
          	}

          	if($('#userPhone').val().trim() === ''){
          		$('#userPhone').css('border', '1px solid red');
            	return toastr.error('연락처를 입력해주세요.', '실패!');
          	}
            
            if($('#alert-correctPhone').css('display') === 'inline-block'){
          	$('#userPhone').css('border', '1px solid red')
              return toastr.error('올바른 형식의 연락처를 입력해주세요.', '실패!');
            }
        
          	if(!$("#checkbox").prop("checked")){
            	return toastr.error('개인정보 정책에 동의해주세요.', '실패!');
          	}

          	signUp();
        })
     });

      function signUp() {
        let sendData = {
          user_mail: $("#userId").val(),
          user_password: $("#password").val(),
          user_name: $("#userName").val(),
          user_nickname: $("#userNickname").val(),
          user_phonenumber: $("#userPhone").val().replaceAll("-", ""),
          user_profile: "none.png",
          // userSelf: $("#"),
          // user_enterdate: new Date().toLocaleDateString(),
          // user_final: new Date().toLocaleDateString(),
          user_enterdate: null,
          user_final: null,
          user_role: "user"
        };
        
        $.ajax({
          url:"/kakaoUser/userInfo",
          type: "post",
          contentType: "application/json; charset=utf-8",
          data : JSON.stringify(sendData),
          dataType:"json",
          success : function(result){
            window.location.href = "/login/mainpage";
          },
          error : function(jqXHR,textStatus,errorThrown){
          }
        });
      }
		
    </script>
  </head>

  <body>
    <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register Card -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="index" class="app-brand-link gap-2">
                  <span class="app-brand-logo demo">
                    <%=logo %>
                  </span>
                </a>
              </div>
              <!-- /Logo -->
              <h4 class="mb-2">추가 정보 입력 🚀</h4>
              <p class="mb-4">자신의 생각과 타인의 생각을 찾아서</p>

             <!-- <form id="formAuthentication" class="mb-3" action="/signUp" method="POST"> -->
                <div class="mb-3">
                  <label for="userId" class="form-label">E-mail</label>
                  <input type="text" class="form-control" id="userId" name="userId" placeholder="E-mail" value="<%= email %>" readonly=""/>
                  <span id="alert-successId" style="display:none; color:#696cff;">&nbsp;&nbsp;사용 가능한 이메일입니다.</span>
				  <span id="alert-dangerId" style="display:none; color:#d92742;">&nbsp;&nbsp;이미 사용중인 이메일입니다.</span>
				  <span id="alert-correctId" style="display:none; color:#d92742;">&nbsp;&nbsp;이메일 형식을 올바르게 입력해주세요.</span>
                </div>
                <div class="mb-3">
                  <label for="userName" class="form-label">이름</label>
                  <input type="text" class="form-control" id="userName" name="userName" placeholder="이름" value="<%= name %>" readonly=""/>
                </div>
                <div class="mb-3">
                  <label for="userNickname" class="form-label">닉네임</label>
                  <input type="text" class="form-control" id="userNickname" name="userNickname" placeholder="닉네임" />
				  <span id="alert-successNick" style="display:none; color:#696cff;">&nbsp;&nbsp;사용 가능한 닉네임입니다.</span>
				  <span id="alert-dangerNick" style="display:none; color:#d92742;">&nbsp;&nbsp;이미 사용중인 닉네임입니다.</span> 
                </div>
               <div class="mb-3">
                 <label for="phonenumber" class="form-label">연락처</label>
                 <input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="연락처" />
                 <span id="alert-correctPhone" style="display:none; color:#d92742;">&nbsp;&nbsp;올바른 형식의 연락처를 입력해주세요.</span>
               </div>

                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="checkbox" name="terms" value="1" />
                    <label class="form-check-label" for="terms-conditions">
                      개인정보 정책에 동의합니다.
                      <a href="/register_policy">개인정보 정책</a>
                    </label>
                  </div>
                </div>
                <button type="submit" id="signBtn" class="btn btn-primary d-grid w-100" status="true">Sign up</button>
              <!-- </form> -->

              <p class="text-center">
                <span>회원가입을 하셨나요?</span>
                <a href="/login">
                  <span>로그인하러가기</span>
                </a>
              </p>
            </div>
          </div>
          <!-- Register Card -->
        </div>
      </div>
    </div>

    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->

  </body>
</html>
