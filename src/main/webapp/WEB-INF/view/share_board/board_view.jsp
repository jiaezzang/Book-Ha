<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="com.bookha.main.dto.DTOShareBoard"%>

<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	
	String cmtTable = (String) request.getAttribute("cmtTable");
	
	int session_user_num = (int)request.getAttribute("session_user_num");
	
	DTOShareBoard to = (DTOShareBoard)request.getAttribute("to");
	
	int user_num = to.getUser_num();
	int seq = to.getSeq();
	
	String subject = to.getSubject();
	String content = to.getContent();
	String hash_tag = to.getHash_tag();

	String nickname = to.getUser_nickname();
	
	String btnradio1 = "disabled";
	String btnradio2 = "disabled";
	String btnradio3 = "disabled";
	String btnradio4 = "disabled";
	
	if(hash_tag.equals("# 나눔")) {
		btnradio1 = "checked";
	} else if(hash_tag.equals("# 교환")) {
		btnradio2 = "checked";
	} else if(hash_tag.equals("# 빌려줌")) {
		btnradio3 = "checked";
	} else if(hash_tag.equals("# 빌려줘")) {
		btnradio4 = "checked";
	}
	
	String btnHide = "";
	if(session_user_num != user_num) {
		btnHide = "display: none;";
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
	box-shadow: 0 1px 10px 1px #696cff;
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

<!-- Toastr -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script>
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
		toastr.options.preventDuplicates = true;
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
		
		// 댓글 작성
		$('#writeReply').on('click', function() {
			let com_content = $("#reply-text-area").val();
	
			let DTO_Share_Comment = {
					"user_num" : <%=session_user_num %>,
					"content" : com_content,
					"board_seq" : <%=seq %>
			}
			
			$.ajax({
				type: "POST",
				url: "/share_cmt_write.do",
				data: JSON.strigify(DTO_Share_Comment),
				contentType: "application/json; chareset=UTF-8",
				dataType: "text",
				success: function(data) {
					$("#reply-text-area").val('');
					toastr.success('댓글 작성 완료', '댓글 작성');
					reload(<%=seq %>);
				}
			});
		});
		
		// 댓글 삭제
		$(document).on('click', '.deleteReply', function(e) {
			let com_seq = $(this).next().html();
			
			let DTO_Share_Comment = {
					"seq" : com_seq,
					"user_num": <%=session_user_num %>
			}
			
			$.ajax({
				type: "POST",
				url: "/share_cmt_delete.do",
				data: JSON.strigify(DTO_Share_Comment),
				contentType: "application/json; chareset=UTF-8",
				dataType: "text",
				success: function(data) {
					toastr.success('댓글 삭제 완료', '댓글 삭제');
					reload(<%=seq %>);
				}
			});
		});
		
		// 게시글 삭제
		const viewer = new toastui.Editor.factory({
			el : document.querySelector('#viewer'),
			viewer : true,
			intialValue : '<%= content %>'
		});
		
		$('boardDelete').on('click', function() {
			// delete 모달창
		});
		
		$('#boardDeleteOk').on('click', function() {
			
			let f = document.createElement('form');
			
			let obj1;
			obj1 = document.createElement('input');
			obj1.setAttribute('type', 'hidden');
			obj1.setAttribute('name', 'seq');
			obj1.setAttribute('value', <%=seq %>);
			
			let obj2;
			obj2 = document.createElement('input');
			obj2.setAttribute('type', 'hidden');
			obj2.setAttribute('name', 'user_num');
			obj2.setAttribute('value', <%=session_user_num %>);
			/* obj2.setAttribute('value', 4); */
			
			f.appendChild(obj1);
			f.appendChild(obj2);
			
			f.setAttribute('method', 'post');
			f.setAttribute('action', '/share_delete_ok.do');
			document.body.appendChild(f);
			f.submit();
			
			toastr.success( '게시글이 삭제되었습니다.', '게시글 삭제' );
		});
		
	});
	
	const reload = function(board_seq) {
		$.ajax({
			type: "POST",
			url: "/share_cmt_list.do",
			data: JSON.stringify({
				"board_seq": board_seq
			}),
			contentType: "application/json; charset=UTF-8",
			dataType: "text",
			success: function(data) {
				$('#reply').html(data);
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
					<a href="/home.do" class="app-brand-link">
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
						class="menu-header-text">당신의 순위는 어디일까요?</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/ranking.do"
						class="menu-link"> <i class='menu-icon bx bx-crown'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-crown bx-tada' style='color:#646363' ></i> -->
							<div data-i18n="Tables">업적과 순위</div>
					</a></li>


					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">책을 읽고 느낀점을 나눠봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/review_list.do"
						class="menu-link"> <i class='menu-icon bx bx-book-open'
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
							<span class="text-muted fw-light">나눔과 공유하기 > 게시판 목록 ></span> 게시글
						</h4>

						<div class="card">
							<h5 class="card-header">
								나눔과 공유하기&nbsp;&nbsp;>&nbsp;&nbsp;<strong>공유 게시판</strong>
							</h5>
							
							<div>
								<p class="form-control-plaintext"
									id="exampleFormControlReadOnlyInputPlain1"><%= subject %></p>
							</div>
							
							<div class="table-responsive text-nowrap">
								<table class="table table-borderless">
									<tbody class="table-border-bottom-0">
									<tbody>
										<tr>
											<td>
												&nbsp;&nbsp;
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

							<!-- TOAST UI Editor가 들어갈 div태그 -->
							<div id="viewer">
								<%=content %>
							</div>
							<br />
							<br />

							<div class="list-group" id="profile_group">
								<!-- 자기소개 -->
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
								<button class="btn btn-primary" id="writeReply">댓글 달기</button>
							</div>
							<br />
							
							<div class="list-group" id="reply">
								<!-- 댓글 -->
								<%=cmtTable %>
								<!-- /댓글 -->
								
							</div>
							
							<script type="text/javascript">
								$(document).ready(function() {
									
								});
							</script>
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
		<div class="buy-now2">
			<a href="./share_modify.do?seq=<%=seq %>"
				class="btn btn-outline-primary btn-buy-now2"
				style="background-color: #f5f5f9; <%= btnHide %>">수정하기</a>
		</div>
		<div class="buy-now">
			<a data-bs-toggle="modal" data-bs-target="#backDropModal"
				class="btn btn-outline-primary btn-buy-now"
				style="background-color: #f5f5f9; <%= btnHide %>" id="boardDelete">삭제하기</a>
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
						<div class="row" style="color: gray;">
							&nbsp;&nbsp;&nbsp;현재 게시글을 정말로 삭제하시겠습니까?<br />
							&nbsp;&nbsp;&nbsp;삭제 후 되돌릴 수 없습니다.
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary"
							data-bs-dismiss="modal" aria-label="Close">취소</button>
						<button type="button" id="boardDeleteOk" class="btn btn-primary">삭제</button>
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
