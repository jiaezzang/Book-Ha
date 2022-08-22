<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.bookha.main.dto.DTOAdminBoard"%>

<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	String logo = (String)request.getAttribute("logo");
	String navBar = (String)request.getAttribute("navBar");
	
	int session_user_num = (int)request.getAttribute("session_user_num");
	
	DTOAdminBoard to = (DTOAdminBoard)request.getAttribute("to");
	int seq = to.getSeq();
	String subject = to.getSubject();
	int user_num = to.getUser_num();
	String content = to.getContent();
	String date = to.getWdate();
	
	// 이전글
	DTOAdminBoard to1 = (DTOAdminBoard)request.getAttribute("to1");
	int beforeSeq = to1.getSeq();
	String beforeSubject = to1.getSubject();
	
	// 다음글
	DTOAdminBoard to2 = (DTOAdminBoard)request.getAttribute("to2");
	int afterSeq = to2.getSeq();
	String afterSubject = to2.getSubject();
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

<script type="text/javascript">
	$(document).ready(function() {
		
		const viewer = new toastui.Editor.factory({
			el : document.querySelector('#viewer'),
			viewer : true,
			intialValue : '<%= content %>'
		});
		
		// 다음글 | 이전글
		$('#after').on('click', function() {
			let f = document.createElement('form');
			
			let obj1;
			obj1 = document.createElement('input');
			obj1.setAttribute('type', 'hidden');
			obj1.setAttribute('name', 'seq');
			obj1.setAttribute('value', <%=afterSeq %>);
			
			f.appendChild(obj1);
			
			f.setAttribute('method', 'get');
			if( <%=afterSeq %> == 0 ) {
				f.setAttribute('action', 'javascript:void(0);');
			} else {
				f.setAttribute('action', '/notice.do');
			}
			document.body.appendChild(f);
			f.submit();
		});
		
		$('#before').on('click', function() {
			let f = document.createElement('form');
			
			let obj1;
			obj1 = document.createElement('input');
			obj1.setAttribute('type', 'hidden');
			obj1.setAttribute('name', 'seq');
			obj1.setAttribute('value', <%=beforeSeq %>);
			
			f.appendChild(obj1);
			
			f.setAttribute('method', 'get');
			if( <%=beforeSeq %> == 0 ) {
				f.setAttribute('action', 'javascript:void(0);');
			} else {
				f.setAttribute('action', '/notice.do');
			}
			document.body.appendChild(f);
			f.submit();
		});		
	});
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
						class="menu-header-text">당신의 순위는 어디일까요?</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/review_list.do"
						class="menu-link"> <i class='menu-icon bx bx-crown'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-crown bx-tada' style='color:#646363' ></i> -->
							<div data-i18n="Tables">업적과 순위</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">책을 읽고 느낀점을 나눠봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/review_list.do"
						class="menu-link"> <i
							class='menu-icon bx bx-book-open' style='color: #646363'></i>
							<!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
							<div data-i18n="Tables">독후감 나누기</div>
					</a></li>


					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">하루하루 책을 읽어봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/review_list.do"
						class="menu-link"> <i class='menu-icon bx bx-photo-album'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-photo-album bx-tada' style='color:#646363' ></i> -->
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
				<%=navBar %>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">공지 게시판 ></span> 게시글
						</h4>

						<div class="card">
							<h5 class="card-header">
								<strong>공지 게시판</strong>
							</h5>

							<br />

							<div class="mb-3">
								<p class="form-control-plaintext"
									id="exampleFormControlReadOnlyInputPlain1"><%= subject %></p>
								<p align="right" ><%=date%>&nbsp;&nbsp;&nbsp;&nbsp;</p>
							</div>

							<!-- Hoverable Table rows -->

							<!-- TOAST UI Editor가 들어갈 div태그 -->
							<div id="viewer">
								<%=content %>
							</div>
							<br /><br />
							
						</div>
						<!--/ Hoverable Table rows -->

						<br />
						
						<div class="card">
							 <div class="demo-inline-spacing">
						          <div class="list-group list-group-flush">
						            <a href="javascript:void(0);" class="list-group-item list-group-item-action" id="after"><strong>다음글</strong>  | <%=afterSubject %></a>
						            <a href="javascript:void(0);" class="list-group-item list-group-item-action" id="before"><strong>이전글</strong>  | <%=beforeSubject %></a>
						          </div>
       						 </div>
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
