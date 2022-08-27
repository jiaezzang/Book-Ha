<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.bookha.main.dto.DTOShareBoard"%>

<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute( "title" );
	String profile = (String)request.getAttribute( "profile" );
	String logo = (String)request.getAttribute( "logo" );
	
	String navBar = (String)request.getAttribute("navBar");
	String menuBar =(String)request.getAttribute("menuBar");
	
	String listTable = (String)request.getAttribute( "listTable" );
	
	String paging = (String)request.getAttribute("paging");
	String hashTag = (String)request.getAttribute("hashTag");

	String btnradio0 = "";
	String btnradio1 = "";
	String btnradio2 = "";
	String btnradio3 = "";
	String btnradio4 = "";
	
	if(hashTag.equals("# 전체")) {
		btnradio0 = "checked";
	} else if(hashTag.equals("# 나눔")) {
		btnradio1 = "checked";
	} else if(hashTag.equals("# 교환")) {
		btnradio2 = "checked";
	} else if(hashTag.equals("# 빌려줌")) {
		btnradio3 = "checked";
	} else if(hashTag.equals("# 빌려줘")) {
		btnradio4 = "checked";
	} 

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
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title><%= title %></title>

<meta name="description" content="" />

<style type="text/css">
.demo-inline-spacing {
	margin: auto;
}

.bg-menu-theme .menu-sub>.menu-item.active>.menu-link:not(.menu-toggle) {
    background-color: #696cff !important;
    border: 3px solid #e7e7ff !important;
}

</style>

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

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../assets/js/config.js"></script>

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Toastr -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="../js/toastr.js"></script>
/*
<script type="text/javascript">
	$(document).ready(function() {

		$(document).on('click', '.btn-check', function() {
			
			let hash_tag = $(this).next().text();
			
			let DTOShareBoard = {
				"hash_tag": hash_tag
			}
			
			$.ajax({
				type: 'POST',
				url: "/myshare_list_hashTag.do",
				data: JSON.stringify(DTOShareBoard),
				contentType: "application/json; charset=UTF-8",
				dataType: "text",
				success: function(data) {
					$("#listTable").html(data);
					//toastr.success('HASH TAG가 [' + hash_tag + '](으)로 변경되었습니다.', '성공!');
					pageNavigation(hash_tag);
				}
			});
		});
	});
	
	const pageNavigation = function(hash_tag) {
		let DTOShareBoard = {
				"hash_tag": hash_tag
		}
		
		$.ajax({
			type: "POST",
			url: "/myshre_list_pageNav.do",
			data: JSON.stringify(DTOShareBoard),
			contentType: "application/json; charset=UTF-8",
			dataType: "text",
			success: function(data) {
				$('#pageNav').html(data);
			}
		});
	}
</script>
*/
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
				<!-- menuBar Model -->
				<%=menuBar %>
				<!-- / menuBar Model -->
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->
				<%=navBar %>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">나눔과 공유하기 ></span> 내가 작성한 글 목록
						</h4>

						<!-- Hoverable Table rows -->
						<div class="card">
							
						</div>
						<!--/ Hoverable Table rows -->

						<br />

						<div class="card">
							<h5 class="card-header">
								나눔과 공유하기&nbsp;&nbsp;>&nbsp;&nbsp;<strong>공유 게시판</strong>
							</h5>
							<div class="table-responsive text-nowrap">
								<table class="table table-borderless">
									<tbody class="table-border-bottom-0">
									<tbody>
										<tr>
											<td>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" <%= btnradio0 %> id="btnradio0" checked autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio0"># 전체</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" <%= btnradio1 %> id="btnradio1" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio1"># 나눔</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" <%= btnradio2 %> id="btnradio2" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio2"># 교환</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" <%= btnradio3 %> id="btnradio3" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio3"># 빌려줌</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" <%= btnradio4 %> id="btnradio4" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio4"># 빌려줘</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<br />

							<!-- Hoverable Table rows -->
							<div class="table-responsive text-nowrap">
								<table class="table table-hover">
									<thead>
										<tr align="center">
											<th>제  목</th>
											<th>태  그</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0" id="listTable">
										<!-- share_board list -->
										<%=listTable %>
										<!-- /share_board list -->
									</tbody>
								</table>
							</div>
							<div class="demo-inline-spacing">
								<!-- Basic Pagination -->
								<%=paging %>
								<!--/ Basic Pagination -->
							</div>
						</div>
						<!--/ Hoverable Table rows -->

					</div>
					<!-- / Content -->
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

	<div class="buy-now">
		<a href="/share_list.do"
			class="btn btn-outline-primary btn-buy-now">공유게시판</a>
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
