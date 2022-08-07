<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String title = (String) request.getAttribute("title");
String profile = (String) request.getAttribute("profile");
String logo = (String) request.getAttribute("logo");
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

<title><%=title%></title>

<meta name="description" content="" />

<style type="text/css">
.demo-inline-spacing {
	margin: auto;
}
</style>

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

<!-- Graph CSS -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<style type="text/css">
.btn-group {
	float: right;
}
</style>

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../assets/js/config.js"></script>
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
					<%=logo%>
					<!-- /LOGO -->
				</div>

				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text"></span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/list.do"
						class="menu-link"> <i class='menu-icon bx bx-book-open '
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
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
							<%=profile%>
							<!--/ User -->
						</ul>
					</div>
				</nav>

				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-2">
							<span class="text-muted fw-light">방문 통계</span>
						</h4>

						<!-- Hoverable Table rows -->

						<!--/ Hoverable Table rows -->

						<br />

						<div class="card">
							<br />
							<h3 class="card-header">

								<div class="tab_graph">
									<div class="btn-group" role="group"
										aria-label="Basic radio toggle button group">
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio1" checked="" autocomplete="off"> <label
											class="btn btn-outline-primary" for="btnradio1">일간</label> <input
											type="radio" class="btn-check" name="btnradio" id="btnradio2"
											autocomplete="off"> <label
											class="btn btn-outline-primary" for="btnradio2">주간</label> <input
											type="radio" class="btn-check" name="btnradio" id="btnradio3"
											autocomplete="off"> <label
											class="btn btn-outline-primary" for="btnradio3">월간</label>
									</div>
								</div>

								<!-- 일간: YYYY.MM.DD d -->
								<!-- 주간: YYYY.MM.DD ~ YYYY.MM.DD -->
								<!-- 월간: YYYY.MM -->
								<strong>2022.08.06 토</strong>
							</h3>
							<br />
							<br />

							<!-- Hoverable Table rows -->
							<div class="table-responsive text-nowrap">
								<div class="container">
									<canvas id="myChart"></canvas>
								</div>
								<script>
									const ctx = document.getElementById(
											'myChart').getContext('2d');
									const chart = new Chart(
											ctx,
											{
												// 차트 종류
												type : 'line',

												// 차트를 그릴 데이터
												data : {
													// x축 값
													// id="btnradio1" 일간:1~30(31)
													// id="btnradio2" 주간: 이번주를 마지막으로 10주
													// id="btnradio3" 월간: 1~12
													labels : [ '1', '2', '3',
															'4', '5', '6',
															'...', '30' ],
													datasets : [ {
														backgroundColor : 'transparent',
														borderColor : "#696cff",
														// 방문자 수
														data : [ 0, 10, 5, 2,
																20, 30, 45 ]
													} ]
												},
												options : {
													legend : {
														display : false
													}
												}
											});
								</script>
							</div>
							<br /> <br />

						</div>
						<!--/Hoverable Table rows -->

					</div>
					<!-- /Content -->
				</div>

				<!-- Footer -->
				<footer class="content-footer footer bg-footer-theme">
					<div
						class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
						<div class="mb-2 mb-md-0">
							©
							<script>
								document.write(new Date().getFullYear());
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


	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="../assets/vendor/libs/jquery/jquery.js"></script>
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
