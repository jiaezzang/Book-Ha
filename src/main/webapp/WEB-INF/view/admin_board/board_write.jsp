<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	String logo = (String)request.getAttribute("logo");
	String navBar = (String)request.getAttribute("navBar");
	
	int session_user_num = (int)request.getAttribute("session_user_num");
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
#editor {
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

#accordion {
	width: 95%;
	margin: 10px auto;
}

.input-group {
	width: 95%;
	margin: 10px auto;
}

.list-group {
	width: 95%;
	margin: 10px auto;
}

#defaultFormControlInput {
	width: 95%;
	margin: 5px auto;
	font-size: 35pt;
	font: bold;
	color: #696CFF;
}

.buy-now .btn-buy-now:hover {
	color: blue;
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

<!-- Toastr -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="../js/toastr.js"></script>

<script>
   	$(document).ready(function() {
   		
		$('#board_submit').on("click", function(e) {
			if($('#defaultFormControlInput').val() == '') {
				toastr.error('제목을 입력하세요.', '입력 오류!');
				return false;
			}
			
			if(editor.getHTML() == '<p><br></p>') {
				toastr.error('본문을 입력하세요.', '입력 오류!');
				return false;
			}
			
			for(let i=1; i<=6; i++) {
				if(editor.getHTML().indexOf('<h' + i + '><br></h' + i + '>') != -1) {
					toastr.error('소제목을 다시 확인하세요', '입력 오류!');
					return false;
				}
			}
			
			let f = document.createElement('form');
			
			let obj1;
			obj1 = document.createElement('input');
			obj1.setAttribute('type', 'hidden');
			obj1.setAttribute('name', 'subject');
			obj1.setAttribute('value', $('#defaultFormControlInput').val());
			
			let obj2;
			obj2 = document.createElement('input');
			obj2.setAttribute('type', 'hidden');
			obj2.setAttribute('name', 'user_num');
			obj2.setAttribute('value', <%= session_user_num %>);
			
			let obj3;
			obj3 = document.createElement('input');
			obj3.setAttribute('type', 'hidden');
			obj3.setAttribute('name', 'content');
			obj3.setAttribute('value', editor.getHTML());
			
			f.appendChild(obj1);
			f.appendChild(obj2);
			f.appendChild(obj3);
			
			f.setAttribute('method', 'post');
			f.setAttribute('action', '/write_ok.do');
			document.body.appendChild(f);
			f.submit();
		});
		
		<!-- TOAST UI Editor 생성 JavaScript 코드 -->
		const editor = new toastui.Editor({
			el: document.querySelector('#editor'),
			previewStyle: 'vertical',
			previewHighlight: false,
			height: '700px',
			// 사전입력 항목
			initialValue: '# 안녕하세요. 제목입니다.\n### 사전입력 테스트\n본문본문본문\n\n',
			// 이미지가 Base64 형식으로 입력되는 것 가로채주는 옵션
			hooks: {
				addImageBlobHook: (blob, callback) => {
					// blob : Java Script 파일 객체
					
					const formData = new FormData();
					formData.append('image', blob);
					
					let url = '/images/';
					$.ajax({
						type: 'POST',
						enctype: 'multipart/form-data',
						url: '/writeTest.do',
						data: formData,
						dataType: 'json',
						processData: false,
						contentType: false,
						cache: false,
						timeout: 600000,
						success: function(data) {
							url += data.filename;
								
							// callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
							// 형식 : ![대체 텍스트](주소)
							callback(url, '사진 대체 텍스트 입력');
						},
						error: function(e) {
							callback('image_load_fail', '사진 대체 텍스트 입력');
						}
					});
				}
			}
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
						class="menu-header-text"></span></li>

					<!-- Tables -->
					<li class="menu-item active"><a href="/list.do"
						class="menu-link"> <i class='menu-icon bx bx-book-open bx-tada'
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
							<li class="menu-item"><a href="/ranking.do" class="menu-link">
									<div data-i18n="Alerts">업적과 순위</div>
							</a></li>
							<li class="menu-item"><a href="/review_list.do"
								class="menu-link">
									<div data-i18n="Accordion">독후감 나누기</div>
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
				<%=navBar %>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">공지글 관리하기 > 게시판 목록 ></span> 글 쓰기
						</h4>

						<div class="card">
							<h5 class="card-header">
								공지글 관리하기&nbsp;&nbsp;>&nbsp;&nbsp;<strong>공지 게시판</strong>
							</h5>
							
							<div>
								<input type="text" class="form-control"
									id="defaultFormControlInput" placeholder="제목을 입력하세요"
									aria-describedby="defaultFormControlHelp" />
							</div>
							<br />
							<div class="table-responsive text-nowrap">
								<table class="table table-borderless">
									<tbody class="table-border-bottom-0">
									
								</table>
							</div>

							<!-- Hoverable Table rows -->

							<!-- TOAST UI Editor가 들어갈 div태그 -->
							<div id="editor"></div>

							<!-- Markdown을 설명할 accordion이 들어갈 div태그 -->
							<br />
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
	<!-- / Layout wrapper -->

	<div class="buy-now">
		<!-- javascript:void(0) => a 태그 디자인은 살리면서 링크기능은 없애기 -->
		<a href="javascript:void(0);"
			class="btn btn-outline-primary btn-buy-now"
			style="background-color: #f5f5f9"
			id="board_submit">작성 완료</a>
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
