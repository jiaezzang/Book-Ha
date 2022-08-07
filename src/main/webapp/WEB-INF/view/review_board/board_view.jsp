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

.input-group {
	margin: auto;
	width: 95%;
}
#reply-text-area {
	height: 6.25em;
	resize: none;
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
					<a href="index.html" class="app-brand-link"> <span
						class="app-brand-logo demo"> 
					</span> <img class="logo-demo" src="../assets/img/logo/logo2.png" >
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
					<li class="menu-item active"><a href="/review_list.do"
						class="menu-link"> <i
							class='menu-icon bx bx-book-open bx-tada' style='color: #646363'></i>
							<!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
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
					<li class="menu-item"><a href="/album_list.do"
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
							<span class="text-muted fw-light">독후감 나누기 > 게시판 목록 ></span> 글 쓰기
						</h4>

						<div class="card">
							<h5 class="card-header">
								독후감 나누기&nbsp;&nbsp;>&nbsp;&nbsp;<strong>독후감 게시판</strong>
							</h5>
							
							<div>
								<p class="form-control-plaintext"
									id="exampleFormControlReadOnlyInputPlain1">제목이 들어갈 항목</p>
							</div>
							<div class="table-responsive text-nowrap">
								<table class="table table-borderless">
									<tbody class="table-border-bottom-0">
									<tbody>
										<tr>
											<td>&nbsp;&nbsp;
												<button type="button"
													class="btn rounded-pill btn-outline-primary"># 소설</button>
												&nbsp;
												<button type="button"
													class="btn rounded-pill btn-outline-primary"
													name="btnradio"># 수필</button> &nbsp;
												<button type="button"
													class="btn rounded-pill btn-outline-primary"
													name="btnradio"># 시</button> &nbsp;
												<button type="button"
													class="btn rounded-pill btn-outline-primary"
													name="btnradio"># 인문/사회</button> &nbsp;
												<button type="button"
													class="btn rounded-pill btn-outline-primary"
													name="btnradio"># 과학</button> &nbsp;
												<button type="button"
													class="btn rounded-pill btn-outline-primary"
													name="btnradio"># 기타</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="list-group" id="kakao_bookSearch_result">
								<label class='list-group-item'>
									<h5 class="card-header">
										<strong>리뷰한 책은 뭔가요?</strong>
									</h5>
									<div class='d-grid d-sm-flex p-3'>
										<img
											src='https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5082004%3Ftimestamp%3D20220731154947'
											style='width: 120px' class='me-4 mb-sm-0 mb-2' /> <span>
											<h6>
												<a
													href='https://search.daum.net/search?w=bookpage&bookId=5082004&q=%EB%8D%B0%EC%9D%BC+%EC%B9%B4%EB%84%A4%EA%B8%B0+%EC%9D%B8%EA%B0%84%EA%B4%80%EA%B3%84%EB%A1%A0'>데일
													카네기의 인간관계론</a>
											</h6> <strong>저자:</strong> 데일 카네기<br> <strong>출판사:</strong>
											현대지성<br> <strong>요약:</strong> 인간관계는 친구를 만들고 적을 만들지 않는
											것에서 시작된다. 『데일 카네기 인간관계론』은 이런 인간관계의 핵심을 꿰뚫는다. ‘친구를 만들고, 사람을
											설득하는 법’이라는 제목으로 1936년 처음 출간된 데일 카네기의 책은 80년 넘게 수많은 사람들에게 영향을
											끼쳐 왔다. 이후에 나온 모든 자기 계발서들이 이 책의 영향을 받았다고 해도 과언이 아니다. 세계적인 투자자
											워런 버핏의 인생을 바꾼 책이자, 누구나 꼭 읽어야 할 책이기도 하다. 『데일 카네기 인간...<br>
										</span>
									</div>
								</label>
							</div>

							<br />

							<!-- Hoverable Table rows -->

							<!-- TOAST UI Editor가 들어갈 div태그 -->
							<div id="viewer">
								<h1>본문제목1</h1>
								<p>안녕하세요?</p>
								<p>오늘 소개할 책은 데일 카네기의 인간관계론 입니다.</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>내용내용내용</p>
								<p>감사합니다.</p>
							</div>

							<!-- TOAST UI Editor 생성 JavaScript 코드 -->
							<script>
								const viewer = new toastui.Editor({
									el : document.querySelector('#viewer'),
									initialValue : content
								});

								// editor.getHtml()을 사용해서 에디터 내용 수신
								//document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHTML());
								// 콘솔창에 표시
								//console.log(editor.getHTML());
							</script>
							<div class="list-group" id="profile_group">
								<label class='list-group-item'>
									<div class='d-grid d-sm-flex p-3'>
										<img
											src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgCc_yb9hC0afzbtVF6a56iYz2N_4Ci8ouSg&usqp=CAU'
											style='width: 120px'
											class='me-4 mb-sm-0 mb-2 h-auto rounded-circle' /> <span>
											<h6 style="color: #696CFF">아기고양이 33</h6>
											<div>안녕하세요. 말하는 고양이입니다.</div>
											<div>야옹</div>
										</span>
									</div>
								</label>
							</div>
							<br />
						</div>
						<!--/ Hoverable Table rows -->

						<br />

						<div class="card">
							<h5 class="card-header">
								<strong>당신의 생각을 남겨주세요</strong>
							</h5>

							<div class="input-group">
								<textarea class="form-control" aria-label="With textarea" id="reply-text-area"
									placeholder="댓글을 입력해 주세요"></textarea>
								<button class="btn btn-primary">댓글 달기</button>
							</div>

							<div class="list-group" id="reply">
								<label class='list-group-item'>
									<h6 style="color: #696CFF; display: inline-block;">작성자1234</h6>
									&emsp;&emsp;
									<a href="#" class="deleteReply" style="color: gray; display: inline-block;">댓글 삭제</a>
									<div style="display: inline-block; visibility: hidden;">댓글seq1</div>
									<p>댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다</p>
								</label>
								<label class='list-group-item'>
									<h6 style="color: #696CFF; display: inline-block;">작성자1234</h6>
									&emsp;&emsp;
									<a href="#" class="deleteReply" style="color: gray; display: inline-block;">댓글 삭제</a>
									<div style="display: inline-block; visibility: hidden;">댓글seq2</div>
									<p>댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다</p>
								</label>
								<label class='list-group-item'>
									<h6 style="color: #696CFF; display: inline-block;">작성자1234</h6>
									&emsp;&emsp;
									<a href="#" class="deleteReply" style="color: gray; display: inline-block;">댓글 삭제</a>
									<div style="display: inline-block; visibility: hidden;">댓글seq3</div>
									<p>댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다</p>
								</label>
							</div>
							
							<script type="text/javascript">
								$(document).ready(function() {
									$('.deleteReply').on('click', function(e) {
										e.preventDefault();
										//console.log($(this).next().html());
									});
								});
							</script>
						</div>
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
			<a
				href="https://themeselection.com/products/sneat-bootstrap-html-admin-template/"
				target="_blank" class="btn btn-outline-primary btn-buy-now2"
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
