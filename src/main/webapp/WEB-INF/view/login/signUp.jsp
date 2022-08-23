<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String title = (String) request.getAttribute("title");
String logo = (String) request.getAttribute("logo");

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

    <title>회원가입</title>

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
    <script type="text/javascript">
    $(document).ready(function() {
        phoneNo();
        
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
    	                $("#alert-successId").css('display', 'inline-block');
    	                $("#alert-dangerId").css('display', 'none');
    	                $('#userId').css('border', '1px solid #696cff');
    				}
    			},
    			error : function(){
    				console.log("서버요청실패");
    			}
    		});
    	});
	    
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
	                $('#password1').css('border', '1px solid #696cff');
	                $('#password2').css('border', '1px solid #696cff');
	            } else {
	                $("#alert-success").css('display', 'none');
	                $("#alert-danger").css('display', 'inline-block');
	            }
	        }
	    });

		//회원가입 버튼 클릭 시 
        $('#signBtn').on('click', function() {
          if($('#alert-successId').css('display') === 'none') {
            $('#userId').css('border', '1px solid red');
            return alert("이미 존재하는 아이디 입니다.");
          }

          if($('#userId').val().trim() === ''){
            return alert('ID를 입력해주세요.');
          }

          if($('#password1').val().trim() === ''){
            return alert('비밀번호를 입력해주세요.');
          }
          
          if($('#alert-success').css('display') === 'none'){
              $('#password1').css('border', '1px solid red');
              $('#password2').css('border', '1px solid red');
              return alert('비밀번호를 정확히 입력해주세요.');
          }

          if($('#userName').val().trim() === ''){
            return alert('이름을 입력해주세요.');
          }

          if($('#alert-successNick').css('display') === 'none') {
            $('#userNickname').css('border', '1px solid red');
            return alert('이미 존재하는 닉네임입니다.');
          }

          if($('#userNickname').val().trim() === ''){
            return alert('닉네임을 입력 해주세요.');
          }

          if($('#phonenumber').val().trim() === ''){
            return alert('휴대전화번호를 입력 해주세요.');
          }

          if(!$("#checkbox").prop("checked")){
            return alert('개인정보 정책에 동의 해주세요.');
          }

          signUp();
        });
	});

      function phoneNo() {
        $("#phonenumber").on("keyup", () => {
          $("#phonenumber").val( $("#phonenumber").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
        });
      }

      function signUp() {
        let sendData = {
          user_mail: $("#userId").val(),
          user_password: $("#password1").val(),
          user_name: $("#userName").val(),
          user_nickname: $("#userNickname").val(),
          user_phonenumber: $("#phonenumber").val().replaceAll("-", ""),
          // userProfile: $("#"),
          // userSelf: $("#"),
          // user_enterdate: new Date().toLocaleDateString(),
          // user_final: new Date().toLocaleDateString(),
          user_enterdate: null,
          user_final: null,
          user_role: "user"
        };

        $.ajax({
          url:"http://localhost:8080/signUp/new",
          type: "post",
          contentType: "application/json; charset=utf-8",
          data : JSON.stringify(sendData),
          dataType:"json",
          success : function(result){
            window.location.href = "/login";
          },
          error : function(jqXHR,textStatus,errorThrown){
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
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
              <h4 class="mb-2">회원가입 🚀</h4>
              <p class="mb-4">자신의 생각과 타인의 생각을 찾아서</p>

              <div class="mb-3">
                <label for="userId" class="form-label">ID</label>
                <input type="text" class="form-control" id="userId" name="userId" placeholder="Email을 입력해주세요" autofocus />
				<span id="alert-successId" style="display:none; color:#696cff;">&nbsp;&nbsp;사용 가능한 이메일입니다.</span>
				<span id="alert-dangerId" style="display:none; color:#d92742;">&nbsp;&nbsp;이미 사용중인 이메일입니다.</span> 
              </div>
              <div class="mb-3 form-password-toggle">
                <label class="form-label" for="password1">비밀번호</label>
                <div class="input-group input-group-merge">
                  <input type="password" id="password1" class="pw form-control" name="password1" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="password" />
                  <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                </div>
              </div>
              <div class="mb-3 form-password-toggle">
                <label class="form-label" for="password2">비밀번호 확인</label>
                <div class="input-group input-group-merge">
                  <input type="password" id="password2" class="pw form-control" name="password2" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="password" />
                  <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                </div>
                <span id="alert-success" style="display:none; color:#696cff;">&nbsp;&nbsp;&nbsp;비밀번호가 일치합니다</span>
				<span id="alert-danger" style="display:none; color:#d92742;">&nbsp;&nbsp;&nbsp;비밀번호가 일치하지 않습니다.</span>
              </div>
              <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" id="userName" class="form-control" name="userName" value="" placeholder="이름" />
              </div>
              <div class="mb-3">
                <label for="nickname" class="form-label">닉네임</label>
                <input type="text" id="userNickname" class="form-control" name="userNickname" value="" placeholder="닉네임" />
				<span id="alert-successNick" style="display:none; color:#696cff;">&nbsp;&nbsp;사용 가능한 닉네임입니다.</span>
				<span id="alert-dangerNick" style="display:none; color:#d92742;">&nbsp;&nbsp;이미 사용중인 닉네임입니다.</span> 
              </div>
             <div class="mb-3">
               <label for="phonenumber" class="form-label">연락처</label>
               <input type="text" id="phonenumber"  class="form-control" name="phonenumber" value="" maxlength="13" placeholder="연락처" />
             </div>

                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="checkbox" name="terms" .val()="1"/>
                    <label class="form-check-label" for="terms-conditions">
                      개인정보 정책에 동의합니다.
                      <a href="register_policy.html">개인정보 정책</a>
                    </label>
                  </div>
                </div>
                <button id="signBtn" class="btn btn-primary d-grid w-100" status="true">Sign up</button>
                  <br>

              <p class="text-center">
                <span>회원가입을 하셨나요?&nbsp;&nbsp;</span>
                <a href="login">
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

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
