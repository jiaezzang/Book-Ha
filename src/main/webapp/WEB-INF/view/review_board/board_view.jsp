<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bookha.main.dto.DTOReviewBoard" %>
<%@ page import="com.bookha.main.dto.DTOUser" %>
<%
request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	String logo = (String)request.getAttribute("logo");
	String navBar = (String)request.getAttribute("navBar");
	String menuBar = (String)request.getAttribute("menuBar");
	String comment = (String)request.getAttribute("comment");
	
	int session_user_num = (int)request.getAttribute("session_user_num");
	
	DTOReviewBoard to = (DTOReviewBoard)request.getAttribute("to");
	
	DTOUser user = (DTOUser)request.getAttribute("user");
	
	String user_role = (String)request.getAttribute("user_role");
	
	int user_num = to.getUser_num();
	int seq = to.getSeq();
	
	String subject = to.getSubject();
	String content = to.getContent();
	String hash_tag = to.getHash_tag();
	
	String book_img_url = to.getBook_img_url();
	String book_info_url = to.getBook_info_url();
	String book_title = to.getBook_title();
	String book_publisher = to.getBook_publisher();
	String book_author = to.getBook_author();
	String book_summary = to.getBook_summary();
	
	String btnradio1 = "disabled";
	String btnradio2 = "disabled";
	String btnradio3 = "disabled";
	String btnradio4 = "disabled";
	String btnradio5 = "disabled";
	String btnradio6 = "disabled";
	
	if(hash_tag.equals("# 소설")) {
		btnradio1 = "checked";
	} else if(hash_tag.equals("# 수필")) {
		btnradio2 = "checked";
	} else if(hash_tag.equals("# 시")) {
		btnradio3 = "checked";
	} else if(hash_tag.equals("# 인문/사회")) {
		btnradio4 = "checked";
	} else if(hash_tag.equals("# 과학")) {
		btnradio5 = "checked";
	} else if(hash_tag.equals("# 기타")) {
		btnradio6 = "checked";
	}
	
	String btnHide = "";
	if(session_user_num != user_num) {
		btnHide = "display: none;";
	}
	
	if(user_role.equals("admin")) {
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

<script type="text/javascript">
$(document).ready(function() {
	
	$('#replyWriteBtn').on('click', function() {
		let com_content = $("#reply-text-area").val();
		
		if(com_content == null || com_content == "") {
			toastr.error('댓글을 작성해주세요.', '실패!');
			return false;
		}
		
		let DTO_Review_Comment = {
			"user_num": <%= session_user_num %>,
			"content": com_content,
			"board_seq": <%= seq %>
		}
		
		//console.log(DTO_Review_Comment);
		
		$.ajax({
			type: 'POST',
			url: "/review_comment_write.do",
			data: JSON.stringify(DTO_Review_Comment),
			contentType: "application/json; charset=UTF-8",
			dataType: "text",
			success: function(data) {
				$("#reply-text-area").val('');
				toastr.success('댓글이 작성되었습니다.', '성공!');
//					console.log(data);
				reload(<%= seq %>);
			}
		});
	});
	
	$(document).on('click', '.deleteReply', function(e) {
		
		//console.log('삭제버튼');
		
		let com_seq = $(this).next().html();
		
		let DTO_Review_Comment = {
			"seq": com_seq,
			"user_num": <%= session_user_num %>
		}
		
//			console.log(com_seq);
//			console.log(DTO_Review_Comment);
		
		$.ajax({
			type: 'POST',
			url: "/review_comment_delete.do",
			data: JSON.stringify(DTO_Review_Comment),
			contentType: "application/json; charset=UTF-8",
			dataType: "text",
			success: function(data) {
				toastr.success('댓글이 삭제되었습니다.', '성공!');
//					console.log(data);
				reload(<%= seq %>);
			}
		});
	});
	
	const viewer = new toastui.Editor.factory({
		el : document.querySelector('#viewer'),
		viewer: true,
		initialValue : '<%= content %>'
	});
	
	$('#boardDeleteBtn').on('click', function() {
		//console.log('삭제모달창 소환!');
		//toastr.success('삭제 모달창 생성!', '성공');
	});
	
	$('#boardDeleteOkBtn').on('click', function() {
		//console.log('삭제버튼 누름!');
		//toastr.success('삭제 버튼 누름!', '성공');
		
		let f = document.createElement('form');
		
		let obj1;
		obj1 = document.createElement('input');
		obj1.setAttribute('type', 'hidden');
		obj1.setAttribute('name', 'seq');
		obj1.setAttribute('value', <%= seq %>);
		
		let obj2;
		obj2 = document.createElement('input');
		obj2.setAttribute('type', 'hidden');
		obj2.setAttribute('name', 'user_num');
		obj2.setAttribute('value', <%=session_user_num %>);
		
		f.appendChild(obj1);
		f.appendChild(obj2);
		
		f.setAttribute('method', 'post');
		f.setAttribute('action', '/review_delete.do');
		document.body.appendChild(f);
		f.submit();
	});
});

const reload = function(board_seq) {
//		console.log("board seq : " + board_seq);
	$.ajax({
		type: 'POST',
		url: "/review_comment_list.do",
		data: JSON.stringify({
			"board_seq": board_seq
		}),
		contentType: "application/json; charset=UTF-8",
		dataType: "text",
		success: function(data) {
//				toastr.success('댓글 목록을 불러왔습니다.', '성공');
//				console.log(data);
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
					<%= logo %>
				</div>
				<div class="menu-inner-shadow"></div>
				<!-- menuBar Model -->
				<%=menuBar %>
				<!-- / menuBar Model -->			</aside>
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
							<span class="text-muted fw-light">독후감 나누기 > 게시판 목록 ></span> 게시글
						</h4>

						<div class="card">
							<h5 class="card-header">
								독후감 나누기&nbsp;&nbsp;>&nbsp;&nbsp;<strong>독후감 게시판</strong>
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
												<label class="btn rounded-pill btn-outline-primary" for="btnradio1"># 소설</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" <%= btnradio2 %> id="btnradio2" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio2"># 수필</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" <%= btnradio3 %> id="btnradio3" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio3"># 시</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" <%= btnradio4 %> id="btnradio4" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio4"># 인문/사회</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" <%= btnradio5 %> id="btnradio5" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio5"># 과학</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" <%= btnradio6 %> id="btnradio6" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio6"># 기타</label>
											</td>
											<td align="right">
												<label><%= to.getWdate() %>  |  <%= to.getHit() %>&nbsp;&nbsp;</label>
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
										<img src='<%= book_img_url %>' style='width: 120px' class='me-4 mb-sm-0 mb-2' />
										<span>
											<h6><a href='<%= book_info_url %>'><%= book_title %></a></h6>
											<strong>저 자:</strong> <%= book_author %><br>
											<strong>출판사:</strong> <%= book_publisher %><br>
											<strong>요 약:</strong> <%= book_summary %><br>
										</span>
									</div>
								</label>
							</div>

							<br />

							<!-- Hoverable Table rows -->

							<!-- TOAST UI Editor가 들어갈 div태그 -->
							<div id="viewer">
								
							</div>

							<div class="list-group" id="profile_group">
								<label class='list-group-item'>
									<div class='d-grid d-sm-flex p-3'>
										<img
											src='../assets/img/achievements/<%= user.getUser_profile() %>'
											style='width: 120px'
											class='me-4 mb-sm-0 mb-2 h-auto rounded-circle' />
										<span>
											<h6 style="color: #696CFF"><%= user.getUser_nickname() %></h6>
											<div><%= user.getUser_self() %></div>
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
								<button class="btn btn-primary" id="replyWriteBtn" >댓글 달기</button>
							</div>
							<script type="text/javascript">
							
							</script>

							<div class="list-group" id="reply">
<!-- 								<label class='list-group-item'> -->
<!-- 									<h6 style="color: #696CFF; display: inline-block;">작성자1234</h6> -->
<!-- 									&emsp;&emsp; -->
<!-- 									<a href="#" class="deleteReply" style="color: gray; display: inline-block;">댓글 삭제</a> -->
<!-- 									<div style="display: inline-block; visibility: hidden;">댓글seq1</div> -->
<!-- 									<p>댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다 댓글내용입니다</p> -->
<!-- 								</label> -->
								<%= comment %>
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
			<a
				href="/review_modify.do?seq=<%= seq %>"
				class="btn btn-outline-primary btn-buy-now2"
				style="background-color: #f5f5f9; <%= btnHide %>">수정하기</a>
		</div>
		<div class="buy-now">
			<a data-bs-toggle="modal" data-bs-target="#backDropModal"
				class="btn btn-outline-primary btn-buy-now"
				style="background-color: #f5f5f9; <%= btnHide %>" id="boardDeleteBtn">삭제하기</a>
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
						<button type="button" class="btn btn-primary" id="boardDeleteOkBtn">삭제</button>
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
