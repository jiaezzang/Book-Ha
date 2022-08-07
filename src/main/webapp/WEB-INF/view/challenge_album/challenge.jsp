<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
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
</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<aside id="layout-menu"
				class="layout-menu menu-vertical menu bg-menu-theme">
				<div class="app-brand demo">
					<a href="/mainpage" class="app-brand-link">
					<!--  로고 이미지  -->
					<img class="logo-demo" src="../assets/img/logo/logo2.png">
					</a> <a href="javascript:void(0);"
						class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
						<i class="bx bx-chevron-left bx-sm align-middle"></i>
					</a>
				</div>

				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">


					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">책을 읽고 느낀점을 나눠봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/review_list.do"
						class="menu-link"> <!-- <i class='menu-icon bx bx-book-open bx-tada' style='color:#646363'  ></i> -->
							<i class='menu-icon bx bx-book-open' style='color: #646363'></i>
							<div data-i18n="Tables">독후감 나누기</div>
					</a></li>

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
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">하루하루 책을 읽어봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item active"><a href="/album_list.do"
						class="menu-link"> <!-- <i class='menu-icon bx bx-photo-album' style='color:#646363' ></i> -->
							<i class='menu-icon bx bx-photo-album bx-tada'
							style='color: #646363'></i>
							<div data-i18n="Tables">찔끔 챌린지</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">다른 사람들과 책을 나눠봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/share_list.do"
						class="menu-link"> <i class='menu-icon bx bx-gift'
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
						<!-- 
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <i class="bx bx-search fs-4 lh-0"></i>
                  <input
                    type="text"
                    class="form-control border-0 shadow-none"
                    placeholder="Search..."
                    aria-label="Search..."
                  />
                </div>
              </div>
               -->
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
							<span class="text-muted fw-light">찔끔 챌린지 ></span> 목록
						</h4>

						<div class="card">
							<h5 class="card-header">
								<strong>공지 사항</strong>
							</h5>
							<div class="table-responsive text-nowrap">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일자</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
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
						<br />
						<!-- Hoverable Table rows -->
						<div>

							<div class="row row-cols-4 row-cols-md-4 g-4 mb-4">
								<div class="col">
									<div class="card h-100">
										<img class="card-img-top"
											src="../assets/img/elements/reading2.jpg"
											alt="Card image cap">
										<div class="card-body">

											<div style="display: inline-block; width: 100%;">
												<div class="album-title" style="display: inline-block;">
													<h5 class="card-title">[Day +37] 파이팅!</h5>
												</div>

												<!-- Dropdown메뉴 > 수정/삭제 Modal -->
												<div class="btn-group"
													style="display: inline-block; float: right;">
													<button type="button"
														class="btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bx bx-dots-vertical-rounded"></i>
													</button>
													<ul class="dropdown-menu dropdown-menu-right"
														style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);"
														data-popper-placement="top-start">
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter1">수정</a></li>
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter2">삭제</a></li>
													</ul>
												</div>
											</div>
											<br />
											<br />


											<h6 style="text-align: right">멍멍짱</h6>
											<h6 style="text-align: right">22.07.29</h6>
										</div>
									</div>
								</div>

								<div class="col">
									<div class="card h-100">
										<img class="card-img-top"
											src="../assets/img/elements/reading2.jpg"
											alt="Card image cap">
										<div class="card-body">

											<div style="display: inline-block; width: 100%;">
												<div class="album-title" style="display: inline-block;">
													<h5 class="card-title">[Day +37] 파이팅!</h5>
												</div>

												<!-- Dropdown메뉴 > 수정/삭제 Modal -->
												<div class="btn-group"
													style="display: inline-block; float: right;">
													<button type="button"
														class="btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bx bx-dots-vertical-rounded"></i>
													</button>
													<ul class="dropdown-menu dropdown-menu-right"
														style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);"
														data-popper-placement="top-start">
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter1">수정</a></li>
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter2">삭제</a></li>
													</ul>
												</div>
											</div>
											<br />
											<br />

											<h6 style="text-align: right">SF마니아</h6>
											<h6 style="text-align: right">22.07.29</h6>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="card h-100">
										<img class="card-img-top"
											src="../assets/img/elements/reading3.jpg"
											alt="Card image cap">
										<div class="card-body">

											<div style="display: inline-block; width: 100%;">
												<div class="album-title" style="display: inline-block;">
													<h5 class="card-title">[Day +37] 파이팅!</h5>
												</div>

												<!-- Dropdown메뉴 > 수정/삭제 Modal -->
												<div class="btn-group"
													style="display: inline-block; float: right;">
													<button type="button"
														class="btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bx bx-dots-vertical-rounded"></i>
													</button>
													<ul class="dropdown-menu dropdown-menu-right"
														style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);"
														data-popper-placement="top-start">
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter1">수정</a></li>
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter2">삭제</a></li>
													</ul>
												</div>
											</div>
											<br />
											<br />

											<h6 style="text-align: right">고양이좋아</h6>
											<h6 style="text-align: right">22.07.29</h6>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="card h-100">
										<img class="card-img-top"
											src="../assets/img/elements/reading4.jpg"
											alt="Card image cap">
										<div class="card-body">

											<div style="display: inline-block; width: 100%;">
												<div class="album-title" style="display: inline-block;">
													<h5 class="card-title">[Day +37] 파이팅!</h5>
												</div>

												<!-- Dropdown메뉴 > 수정/삭제 Modal -->
												<div class="btn-group"
													style="display: inline-block; float: right;">
													<button type="button"
														class="btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bx bx-dots-vertical-rounded"></i>
													</button>
													<ul class="dropdown-menu dropdown-menu-right"
														style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);"
														data-popper-placement="top-start">
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter1">수정</a></li>
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter2">삭제</a></li>
													</ul>
												</div>
											</div>
											<br />
											<br />

											<h6 style="text-align: right">버터</h6>
											<h6 style="text-align: right">22.07.29</h6>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="card h-100">
										<img class="card-img-top"
											src="../assets/img/elements/reading1.jpg"
											alt="Card image cap">
										<div class="card-body">

											<div style="display: inline-block; width: 100%;">
												<div class="album-title" style="display: inline-block;">
													<h5 class="card-title">[Day +37] 파이팅!</h5>
												</div>

												<!-- Dropdown메뉴 > 수정/삭제 Modal -->
												<div class="btn-group"
													style="display: inline-block; float: right;">
													<button type="button"
														class="btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bx bx-dots-vertical-rounded"></i>
													</button>
													<ul class="dropdown-menu dropdown-menu-right"
														style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);"
														data-popper-placement="top-start">
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter1">수정</a></li>
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter2">삭제</a></li>
													</ul>
												</div>
											</div>
											<br />
											<br />

											<h6 style="text-align: right">밀크</h6>
											<h6 style="text-align: right">22.07.29</h6>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="card h-100">
										<img class="card-img-top"
											src="../assets/img/elements/reading2.jpg"
											alt="Card image cap">
										<div class="card-body">

											<div style="display: inline-block; width: 100%;">
												<div class="album-title" style="display: inline-block;">
													<h5 class="card-title">[Day +37] 파이팅!</h5>
												</div>

												<!-- Dropdown메뉴 > 수정/삭제 Modal -->
												<div class="btn-group"
													style="display: inline-block; float: right;">
													<button type="button"
														class="btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bx bx-dots-vertical-rounded"></i>
													</button>
													<ul class="dropdown-menu dropdown-menu-right"
														style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);"
														data-popper-placement="top-start">
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter1">수정</a></li>
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter2">삭제</a></li>
													</ul>
												</div>
											</div>
											<br />
											<br />

											<h6 style="text-align: right">와플</h6>
											<h6 style="text-align: right">22.07.28</h6>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="card h-100">
										<img class="card-img-top"
											src="../assets/img/elements/reading3.jpg"
											alt="Card image cap">
										<div class="card-body">

											<div style="display: inline-block; width: 100%;">
												<div class="album-title" style="display: inline-block;">
													<h5 class="card-title">[Day +37] 파이팅!</h5>
												</div>

												<!-- Dropdown메뉴 > 수정/삭제 Modal -->
												<div class="btn-group"
													style="display: inline-block; float: right;">
													<button type="button"
														class="btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bx bx-dots-vertical-rounded"></i>
													</button>
													<ul class="dropdown-menu dropdown-menu-right"
														style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);"
														data-popper-placement="top-start">
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter1">수정</a></li>
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter2">삭제</a></li>
													</ul>
												</div>
											</div>
											<br />
											<br />

											<h6 style="text-align: right">초코룽</h6>
											<h6 style="text-align: right">22.07.28</h6>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="card h-100">
										<img class="card-img-top"
											src="../assets/img/elements/reading4.jpg"
											alt="Card image cap">
										<div class="card-body">

											<div style="display: inline-block; width: 100%;">
												<div class="album-title" style="display: inline-block;">
													<h5 class="card-title">[Day +37] 파이팅!</h5>
												</div>

												<!-- Dropdown메뉴 > 수정/삭제 Modal -->
												<div class="btn-group"
													style="display: inline-block; float: right;">
													<button type="button"
														class="btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bx bx-dots-vertical-rounded"></i>
													</button>
													<ul class="dropdown-menu dropdown-menu-right"
														style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);"
														data-popper-placement="top-start">
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter1">수정</a></li>
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter2">삭제</a></li>
													</ul>
												</div>
											</div>
											<br />
											<br />

											<h6 style="text-align: right">지니지니</h6>
											<h6 style="text-align: right">22.07.28</h6>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="card h-100">
										<img class="card-img-top"
											src="../assets/img/elements/reading1.jpg"
											alt="Card image cap">
										<div class="card-body">

											<div style="display: inline-block; width: 100%;">
												<div class="album-title" style="display: inline-block;">
													<h5 class="card-title">[Day +37] 파이팅!</h5>
												</div>

												<!-- Dropdown메뉴 > 수정/삭제 Modal -->
												<div class="btn-group"
													style="display: inline-block; float: right;">
													<button type="button"
														class="btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bx bx-dots-vertical-rounded"></i>
													</button>
													<ul class="dropdown-menu dropdown-menu-right"
														style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);"
														data-popper-placement="top-start">
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter1">수정</a></li>
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter2">삭제</a></li>
													</ul>
												</div>
											</div>
											<br />
											<br />

											<h6 style="text-align: right">버터</h6>
											<h6 style="text-align: right">22.07.28</h6>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="card h-100">
										<img class="card-img-top"
											src="../assets/img/elements/reading2.jpg"
											alt="Card image cap">
										<div class="card-body">

											<div style="display: inline-block; width: 100%;">
												<div class="album-title" style="display: inline-block;">
													<h5 class="card-title">[Day +37] 파이팅!</h5>
												</div>

												<!-- Dropdown메뉴 > 수정/삭제 Modal -->
												<div class="btn-group"
													style="display: inline-block; float: right;">
													<button type="button"
														class="btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
														data-bs-toggle="dropdown" aria-expanded="false">
														<i class="bx bx-dots-vertical-rounded"></i>
													</button>
													<ul class="dropdown-menu dropdown-menu-right"
														style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);"
														data-popper-placement="top-start">
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter1">수정</a></li>
														<li><a class="dropdown-item"
															href="javascript:void(0);" data-bs-toggle="modal"
															data-bs-target="#modalCenter2">삭제</a></li>
													</ul>
												</div>
											</div>
											<br />
											<br />

											<h6 style="text-align: right">멍멍짱</h6>
											<h6 style="text-align: right">22.07.28</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--/ Hoverable Table rows -->

				</div>
				<!-- / Content -->
				<!--  Write Modal  -->
				<div class="modal fade" id="modalCenter0" tabindex="-1"
					style="display: none;" aria-hidden="true" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="modalCenterTitle">글 작성하기</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col mb-3">
										<label for="nameWithTitle" class="form-label">제목</label> <input
											type="text" id="nameWithTitle" class="form-control"
											placeholder="Enter Name">
									</div>
								</div>
								<div class="row g-2">
									<div>
										<label for="formFileDisabled" class="form-label">사진</label> <input
											class="form-control" type="file" id="formFileDisabled"
											disabled="">
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary">등록</button>
							</div>
						</div>
					</div>
				</div>

				<!--  Modify Modal  -->
				<div class="modal fade" id="modalCenter1" tabindex="-1"
					style="display: none;" aria-hidden="true" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="modalCenterTitle">글 수정하기</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col mb-3">
										<label for="nameWithTitle" class="form-label">제목</label> <input
											type="text" id="nameWithTitle" class="form-control"
											placeholder="Enter Name">
									</div>
								</div>
								<div class="row g-2">
									<div>
										<label for="formFileDisabled" class="form-label">사진</label> <input
											class="form-control" type="file" id="formFileDisabled"
											disabled="">
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary">수정</button>
							</div>
						</div>
					</div>
				</div>

				<!--  Delete Modal  -->
				<div class="modal fade" id="modalCenter2" tabindex="-1"
					style="display: none;" aria-hidden="true" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<p>정말 삭제하겠습니까?</p>
								<br />
								<br />
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-secondary"
										data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">삭제</button>
								</div>
							</div>
						</div>
					</div>
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
								target="_blank" class="footer-link me-4">Documentation</a>

							<a
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

	<div class="buy-now">
		<a href="" class="btn btn-outline-primary btn-buy-now"
			data-bs-toggle="modal" data-bs-target="#modalCenter0">글 작성하기</a>
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
