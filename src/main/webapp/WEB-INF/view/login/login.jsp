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

		$.ajax({
			url : "http://localhost:8080/signIn.do",
			type : "post",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(sendData),
			dataType : "json",
			success : function(result) {
				window.location.href = "/login/mainpage";
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Id 또는 PASSWORD를 확인해 주세요.");
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
			if (!Kakao.Auth.getAccessToken()) {
				
				Kakao.Auth.loginForm({
					success : function(result) {
						Kakao.Auth.setAccessToken(result.access_token);
						location.href = "/kakaoUser/kakao_add";
					},
					fail : function(err) {
						console.log(JSON.stringify(err));
					}
				});
			} else {
				console.log("kakao login");
				Kakao.Auth.login({
					success: function(authObj) {
						Kakao.Auth.setAccessToken(authObj.access_token);
						location.href = "/kakaoUser/kakao_add";
					},
					fail: function(err) {
						alert(JSON.stringify(err))
					},
			    });
				return;
			}
		}
	</script>

</body>
</html>
