<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.bookha.main.dto.DTOShareBoard"%>

<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute( "title" );
	String profile = (String)request.getAttribute( "profile" );
	String logo = (String)request.getAttribute( "logo" );
	
	String listTable = (String)request.getAttribute( "listTable" );
	String nav = (String)request.getAttribute("nav");
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

<script type="text/javascript">
	$(document).ready(function() {
		// escapeHtml 허용여부
		toastr.options.escapeHtml = true;
		// closeButton을 생성여부
		toastr.options.closeButton = true;
		// closeButton의 커스텀
		toastr.options.closeHtml = '';
		// 메시지 창이 사라질 때의 애니메이션 효과
		toastr.options.closeMethod = 'fadeOut';
		// 메시지 창의 애니메이션 효과 시간
		toastr.options.closeDuration = 300;
		toastr.options.closeEasing = 'swing';
		// 새로운 창의 위치, true이면 가장 위 포지션, false면 가장 아래 포지션
		toastr.options.newestOnTop = false;
		// 이벤트 옵션// 추가될 때 이벤트
		//toastr.options.onShown = function() { console.log('hello'); }
		// 사라질 때 이벤트
		//toastr.options.onHidden = function() { console.log('goodbye'); }
		// 클릭될 때 이벤트
		//toastr.options.onclick = function() { console.log('clicked'); }
		// 닫기 버튼이 눌릴 때 이벤트
		//toastr.options.onCloseClick = function() { console.log('close button clicked'); }
		// 메시지 중복 허용 여부, 두개 이상 메시지가 생성될 때 이 전꺼는 사라짐
		toastr.options.preventDuplicates = false;
		// 메시지가 표시되는 시간
		toastr.options.timeOut = 2000;
		// 메시지 위로 커서를 올렸을 때 표시되는 시간
		toastr.options.extendedTimeOut = 60;
		// 만약 메시지 표시되는 시간과 올렸을 때 표시되는 시간을 0으로 하면 메시지는 사라지지 않는다.
		// 프로그래스바 표시 여부
		toastr.options.progressBar = true;
		// 글자를 오른쪽 정렬 여부
		toastr.options.rtl = false;
		//애니메이션 설정 여부
		toastr.options.showEasing = 'swing';
		
		toastr.options.hideEasing = 'linear';
		toastr.options.closeEasing = 'linear';
		toastr.options.showMethod = 'fadeIn';
		toastr.options.hideMethod = 'fadeOut';
		toastr.options.closeMethod = 'fadeOut';
		
		$(document).on('click', '.btn-check', function() {
			
			let hash_tag = $(this).next().text();
			
			let DTOShareBoard = {
				"hash_tag": hash_tag
			}
			
			$.ajax({
				type: 'POST',
				url: "/share_list_hashTag.do",
				data: JSON.stringify(DTOShareBoard),
				contentType: "application/json; charset=UTF-8",
				dataType: "text",
				success: function(data) {
					$("#listTable").html(data);
					toastr.success('HASH TAG가 [' + hash_tag + '](으)로 변경되었습니다.', '성공');
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
			url: "/shre_list_pageNav.do",
			data: JSON.stringify(DTOShareBoard),
			contentType: "application/json; charset=UTF-8",
			dataType: "text",
			success: function(data) {
				$('#pageNav').html(data);
			}
		});
	}
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
					<%=logo%>
					<!-- /LOGO -->
				</div>

				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">당신의 순위는 어디일까요?</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/ranking.do"
						class="menu-link"> <i class='menu-icon bx bx-crown'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-crown bx-tada' style='color:#646363' ></i> -->
							<div data-i18n="Tables">업적과 순위</div>
					</a></li>
					
					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase">
						<span class="menu-header-text">책을 읽고 느낀점을 나눠봐요!</span>
					</li>

					<!-- Tables -->
					<li class="menu-item"><a href="/review_list.do"
						class="menu-link"> <i class='menu-icon bx bx-book-open '
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
							<div data-i18n="Tables">독후감 나누기</div>
					</a></li>


					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">하루하루 책을 읽어봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/album_list.do"
						class="menu-link"> <i class='menu-icon bx bx-photo-album'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-photo-album bx-tada' style='color:#646363' ></i> -->
							<div data-i18n="Tables">찔끔 챌린지</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">다른 사람들과 책을 나눠봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item active"><a href="/share_list.do"
						class="menu-link"> <i class='menu-icon bx bx-gift bx-tada'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-bx-gift bx-tada' style='color:#646363' ></i> -->
							<div data-i18n="Tables">나눔과 공유하기</div>
					</a></li>


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
						<!-- Search -->
						<div class="navbar-nav align-items-center">
							<div class="nav-item d-flex align-items-center">
								<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
									class="form-control border-0 shadow-none"
									placeholder="Search..." aria-label="Search..." />
							</div>
						</div>
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
							<span class="text-muted fw-light">나눔과 공유하기 ></span> 게시판 목록
						</h4>

						<!-- Hoverable Table rows -->
						<div class="card">
							<h5 class="card-header">
								<strong>공지 사항</strong>
							</h5>
							<div class="table-responsive text-nowrap">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>제   목</th>
											<th>작성자</th>
											<th>작성일자</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-2"></i>
												<a href="./notice.do" style="color: gray"> <strong>[필독]&nbsp;&nbsp;</strong>게시판
													사용시 주의사항 및 규칙 3 (반드시 확인 바랍니다)
											</a></td>
											<td>운영자</td>
											<td>2022-07-27</td>
										</tr>
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-2"></i>
												<a href="#" style="color: gray"> <strong>[필독]&nbsp;&nbsp;</strong>게시판
													사용시 주의사항 및 규칙 2 (반드시 확인 바랍니다)
											</a></td>
											<td>운영자</td>
											<td>2022-07-27</td>
										</tr>
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-2"></i>
												<a href="#" style="color: gray"> <strong>[필독]&nbsp;&nbsp;</strong>게시판
													사용시 주의사항 및 규칙 1 (반드시 확인 바랍니다)
											</a></td>
											<td>운영자</td>
											<td>2022-07-26</td>
										</tr>
									</tbody>
								</table>
							</div>
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
								<%=nav %>
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
		<a href="./share_write.do"
			class="btn btn-outline-primary btn-buy-now">글 작성하기</a>
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
