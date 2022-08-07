<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	String logo = (String)request.getAttribute("logo");
%>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title><%= title %></title>

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

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../assets/js/config.js"></script>

<!-- 디자인 수정용 CSS 추가 -->
<style>
#viewer {
	/* border : 1px solid; */
	width: 95%;
	margin: 5px auto;
}
/* editor content 받을 div태그 스타일 추가. */
#contents {
	width: 50%;
	height: 100px;
	margin: 30px auto;
	border: 1px solid;
}

.list-group {
	width: 95%;
	margin: 10px auto;
}

#exampleFormControlReadOnlyInputPlain1 {
	width: 95%;
	margin: 5px auto;
	font-size: 35pt;
	font: bold;
	color: #696CFF;
}

.buy-now2 .btn-buy-now2 {
	position: fixed;
	bottom: 3rem;
	right: 9rem;
	z-index: 999999;
	box-shadow: 0 1px 10px 1px #5B9DC9;
}

.buy-now2 .btn-buy-now2:hover {
	box-shadow: none;
	color: blue;
}

.buy-now .btn-buy-now:hover {
	color: blue;
}

#basic-default-div {
	margin: auto;
	width: 95%;
	display: inline-block;
}

#basic-default-message {
	display: inline-block;
	width: 90%;
}

#replySendBtn {
	display: inline-block;
}
</style>

<!-- jQuery UI CSS CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<!-- codemirror CDN URL -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- TOAST UI Editor CDN URL(CSS) -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<!-- TOAST UI Editor CDN URL(JS) -->
<!-- jQuery UI CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<script>
	
</script>
</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<aside id="layout-menu"
				class="layout-menu menu-vertical menu bg-menu-theme">
				<div class="app-brand demo">
					<!-- LOGO -->
					<%= logo %>
					<!-- /LOGO -->
				</div>

				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">


					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text"></span></li>

					<!-- Tables -->
					<li class="menu-item active"><a href="/list.do"
						class="menu-link"> <i
							class='menu-icon bx bx-book-open bx-tada' style='color: #646363'></i>
							<!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
							<div data-i18n="Tables">공지글 관리하기</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text"></span></li>

					<!-- Tables -->
					<li class="menu-item" style=""><a href="javascript:void(0)"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-box"></i>
							<div data-i18n="User interface">게시판 이동하기</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a href="/review_list.do"
								class="menu-link">
									<div data-i18n="Accordion">독후감 나누기</div>
							</a></li>
							<li class="menu-item"><a href="/ranking.do" class="menu-link">
									<div data-i18n="Alerts">업적과 순위</div>
							</a></li>
							<li class="menu-item"><a href="/album_list.do" class="menu-link">
									<div data-i18n="Badges">찔끔 챌린지</div>
							</a></li>
							<li class="menu-item"><a href="/share_list.do"
								class="menu-link">
									<div data-i18n="Buttons">나눔과 공유하기</div>
							</a></li>
						</ul></li>


				</ul>
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->

				<nav
					class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
					id="layout-navbar">
					<div
						class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4"
							href="javascript:void(0)"> <i class="bx bx-menu bx-sm"></i>
						</a>
					</div>

					<div class="navbar-nav-right d-flex align-items-center"
						id="navbar-collapse">

						<!-- /Search -->

						<ul class="navbar-nav flex-row align-items-center ms-auto">

							<!-- User -->
							<%= profile %>
							<!--/ User -->
						</ul>
					</div>
				</nav>

				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">공지글 관리하기 > 게시판 목록 ></span> 게시글
						</h4>

						<div class="card">
							<h5 class="card-header">
								<strong>공지 게시판</strong>
							</h5>

							<br />

							<div class="mb-3">
								<p class="form-control-plaintext"
									id="exampleFormControlReadOnlyInputPlain1">제목이 들어갈 항목</p>
							</div>

							<!-- Hoverable Table rows -->

							<!-- TOAST UI Editor가 들어갈 div태그 -->
							<div id="viewer">

								<h2>게시판 사용시 주의사항 및 규칙 5 (반드시 확인 바랍니다)</h2>
								<p>공지내용공지내용</p>
								<p>공지내용공지내용</p>
								<p>공지내용공지내용</p>
								<p>공지내용공지내용</p>
								<p>공지내용공지내용</p>
								<p>공지내용공지내용</p>
								<p>공지내용공지내용</p>

							</div>
							<br /><br />
							
						</div>
						<!--/ Hoverable Table rows -->

						<br />

						<!-- / Content -->


						<!-- Footer -->
						<footer class="content-footer footer bg-footer-theme">
							<div
								class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
								<div class="mb-2 mb-md-0">
									©
									<script>
										document
												.write(new Date().getFullYear());
									</script>
									, made with ❤️ by <a href="https://themeselection.com"
										target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
								</div>
								<div>
									<a href="https://themeselection.com/license/"
										class="footer-link me-4" target="_blank">License</a> <a
										href="https://themeselection.com/" target="_blank"
										class="footer-link me-4">More Themes</a> <a
										href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
										target="_blank" class="footer-link me-4">Documentation</a> <a
										href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
										target="_blank" class="footer-link me-4">Support</a>
								</div>
							</div>
						</footer>
						<!-- / Footer -->

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
		<div class="buy-now2">
			<a href="./modify.do"
				class="btn btn-outline-primary btn-buy-now2"
				style="background-color: #f5f5f9">수정하기</a>
		</div>
		<div class="buy-now">
			<a data-bs-toggle="modal" data-bs-target="#backDropModal"
				class="btn btn-outline-primary btn-buy-now"
				style="background-color: #f5f5f9">삭제하기</a>
		</div>

		<div class="modal fade" id="backDropModal" data-bs-backdrop="static"
			tabindex="-1" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
				<form class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="backDropModalTitle"
							style="color: #696CFF">최종 확인</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							&nbsp;&nbsp;&nbsp;현재 게시글을 정말로 삭제하시겠습니까?<br />
							&nbsp;&nbsp;&nbsp;삭제 후 되돌릴 수 없습니다.
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary"
							data-bs-dismiss="modal" aria-label="Close">취소</button>
						<button type="button" class="btn btn-primary">삭제</button>
					</div>
				</form>
			</div>
		</div>
		<!-- Core JS -->
		<!-- build:js assets/vendor/js/core.js -->
		<script src="../assets/vendor/libs/popper/popper.js"></script>
		<script src="../assets/vendor/js/bootstrap.js"></script>
		<script
			src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

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
