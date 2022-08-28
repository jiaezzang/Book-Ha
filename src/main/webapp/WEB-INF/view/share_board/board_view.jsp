<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="com.bookha.main.dto.DTOShareBoard"%>
<%@page import="com.bookha.main.dto.DTOUser"%>

<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	String logo = (String)request.getAttribute( "logo" );
	String navBar = (String)request.getAttribute("navBar");
	String menuBar =(String)request.getAttribute("menuBar");
	
	String cmtTable = (String)request.getAttribute("cmtTable");
	
	int session_user_num = (int)request.getAttribute("session_user_num");
	
	DTOShareBoard to = (DTOShareBoard)request.getAttribute("to");
	
	DTOUser user = (DTOUser)request.getAttribute("user");
	
	String user_role = (String)request.getAttribute("user_role");
	
	int user_num = to.getUser_num();
	int seq = to.getSeq();
	
	String subject = to.getSubject();
	String content = to.getContent();
	String hash_tag = to.getHash_tag();
	String date = to.getWdate();
	int hit = to.getHit();
	
	String myprofile = "../assets/img/achievements/" + user.getUser_profile();
	String self = user.getUser_self();
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
	
	if(user_role.equals("admin")){
		btnHide = "";
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
<script src="../js/toastr.js"></script>

<script>
	$(document).ready(function() {
		
		// 댓글 작성
		$('#writeReply').on('click', function() {
			let com_content = $("#reply-text-area").val();
			
			if(com_content == null || com_content == "") {
				toastr.error('댓글이 입력되지 않았습니다.', '입력 오류!');
				return false;
			}
			
			let DTOShareComment = {
					"user_num" : <%=session_user_num %>,
					"content" : com_content,
					"board_seq" : <%=seq %>
			}
			
			$.ajax({
				type: "POST",
				url: "/share_cmt_write.do",
				data: JSON.stringify(DTOShareComment),
				contentType: "application/json; chareset=UTF-8",
				dataType: "text",
				success: function(data) {
					$("#reply-text-area").val('');
					toastr.success('댓글이 작성되었습니다.', '성공!');
					reload(<%=seq %>);
				}
			});
		});
		
		// 댓글 삭제
		$(document).on('click', '.deleteReply', function(e) {
			let com_seq = $(this).next().html();
			
			let DTOShareComment = {
					"seq" : com_seq,
					"user_num": <%=session_user_num %>
			}
			
			$.ajax({
				type: "POST",
				url: "/share_cmt_delete.do",
				data: JSON.stringify(DTOShareComment),
				contentType: "application/json; chareset=UTF-8",
				dataType: "text",
				success: function(data) {
					toastr.success('댓글이 삭제되었습니다.', '성공!');
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
											<td align="right">
												<label><%=date%>  |  <%=hit%>&nbsp;&nbsp;</label>
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
											src='<%=myprofile %>'
											style='width: 120px'
											class='me-4 mb-sm-0 mb-2 h-auto rounded-circle' /> <span>
											<h6 style="color: #696CFF"><%=nickname %></h6>
											<div><%=self %></div>
											<div></div>
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
			<a href="/share_modify.do?seq=<%=seq %>"
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
