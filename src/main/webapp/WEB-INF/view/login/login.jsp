<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String logo = (String) request.getAttribute("logo");
%>
<!DOCTYPE html>

<!-- beautify ignore:start -->
<html lang="en" class="light-style customizer-hide" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>로그인</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- Toastr -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="../js/toastr.js"></script>
	
<script>
	$(document).ready(function() {
		$("#signIn").on("click", function() {
			signIn();
		});
	});

	function signIn() {
		let sendData = {
			user_mail : $("#username").val(),
			user_password : $("#password").val()
		};
		
		if($("#username").val() == null || $("#username").val() == "") {
			toastr.error("이메일을 입력해주세요.", "실패!");
			return false;
		}
		
		if($("#password").val() == null || $("#password").val() == "") {
			toastr.error("비밀번호를 입력해주세요.", "실패!");
			return false;
		}

		$.ajax({
			url : "/signIn.do",
			type : "post",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(sendData),
			dataType : "json",
			success : function(result) {
				window.location.href = "/login/mainpage";
			},
			error : function(jqXHR, textStatus, errorThrown) {
				toastr.error("올바르지 않은 회원정보입니다.", "실패!");
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
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<!-- Logo -->
						<div class="app-brand justify-content-center">
							<!-- logo -->
							<%=logo%>
							<!-- /logo -->
						</div>
						<!-- /Logo -->
						<h4 class="mb-2">안녕하세요 Book-Ha입니다 👋</h4>

						<p class="mb-4">
							Book-Ha 의 서비스를 제공받기 위해서는 <br />
							회원가입이 필요하며, <br />
							회원이신분들은 로그인하여주시기 바랍니다.
						</p>

						<div class="mb-3">
							<label for="username" class="form-label">ID</label>
							<input type="text" class="form-control" id="username" name="username" 
							placeholder="ID" autofocus />
						</div>
						<div class="mb-3 form-password-toggle">
							<div class="d-flex justify-content-between">
								<label class="form-label" for="password">Password</label>
							</div>
							<div class="input-group input-group-merge">
								<input type="password" id="password" class="form-control" name="password"
									placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
									aria-describedby="password" />
								<span class="input-group-text cursor-pointer">
									<i class="bx bx-hide"></i>
								</span>
							</div>
						</div>

						<div class="mb-3">
							<button id="signIn" class="btn btn-primary d-grid w-100">Sign in</button>
						</div>
						<div onclick="kakaoLogin()" style="cursor: pointer;">
							<img src="../KakaoTalk.png" />
						</div>
						<br>
						<p class="text-center">
							<span>처음방문 하셨나요?</span>
							<a href="/signUp"><span>회원가입</span></a>
						</p>
						<p class="text-center">
							<a href="/findUserId"><span>아이디 찾기</span></a>
							<span> / </span>
							<a href="/findPw"><span>비밀번호 찾기</span></a>
						</p>
					</div>
				</div>
				<!-- /Register -->
			</div>
		</div>
	</div>

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
	<script>
		Kakao.init("f0e137541dcef23154b82f7c348b087a");
		
		function kakaoLogin() {
			
// 			// 카카오 로그인 토큰 호출
// 			if (!Kakao.Auth.getAccessToken()) {
				Kakao.Auth.loginForm({
					success : function(result) {
						Kakao.Auth.setAccessToken(result.access_token);
						Kakao.API.request({
							url: '/v2/user/me',
							success: function(res) {
								let email = res.kakao_account.email;
								let name = res.kakao_account.profile.nickname;
								
								let DTOUser = {
										"user_mail": email,
										"user_name": name
								}
								
								$.ajax({
									type: 'POST',
									url: "/kakaoUser/kakao_user_check",
									data: JSON.stringify(DTOUser),
									contentType: "application/json; charset=UTF-8",
									dataType: "text",
									success: function(result) {
										if(result == "1") {
											window.location.href = "/login/mainpage";
										} else {
											let f = document.createElement('form');
											
											let obj1;
											obj1 = document.createElement('input');
											obj1.setAttribute('type', 'hidden');
											obj1.setAttribute('name', 'email');
											obj1.setAttribute('value', email);
											
											let obj2;
											obj2 = document.createElement('input');
											obj2.setAttribute('type', 'hidden');
											obj2.setAttribute('name', 'name');
											obj2.setAttribute('value', name);
											
											f.appendChild(obj1);
											f.appendChild(obj2);
											
											f.setAttribute('method', 'post');
											f.setAttribute('action', '/kakaoUser/kakao_add');
											document.body.appendChild(f);
											f.submit();
										}
									}
								});
							},
							fail: function(error) {
								console.log(error);
								toastr.error("Kakao에서 값을 불러오지 못했습니다.", "연결 오류!");
							}
			    		});
					},
					fail : function(err) {
						console.log(JSON.stringify(err));
						toastr.error("Kakao와 연결을 실패하였습니다.", "연결 오류!");
					}
				});
// 			} else {
// 				console.log(Kakao.isInitialized());
// 				return;
// 			}
		}
	</script>

</body>
</html>
