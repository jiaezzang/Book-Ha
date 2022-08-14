<%@page import="com.bookha.main.dto.DTO_Album_Total"%>
<%@page import="com.bookha.main.dto.DTO_Album_Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bookha.main.dao.DAO_Album_Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	
	DTO_Album_Board dto = (DTO_Album_Board)request.getAttribute("dto");
	DTO_Album_Total totalLists = (DTO_Album_Total)request.getAttribute("totalLists");
	
	String albumlist = (String)request.getAttribute("albumlist");
	System.out.println(albumlist);
	ArrayList<DTO_Album_Board> lists = totalLists.getBoard();
	

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

<!-- jQuery UI CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Toastr -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script>
const toastHtml = function(title, message) {
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
	
	toastr.error(message, title);
	};
	
$(document).ready(function(){
	$('#write').on("click", function(){
		
		//제목 미입력 시
// 		if($("#nameWithTitle").val() == ""){
// 			toastHtml("입력 오류!", "제목을 입력하세요.");
// 			return false;
// 		}

		//이미지 미등록 시 
// 		if($("#formFile").val() == ""){
// 			toastHtml("입력 오류!", "이미지를 등록하세요.");
// 			return false;
// 		} else {
// 			let extension = document.wfrm.upload.value.split( "." ).pop();
// 			//alert( extension );
// 			if( extension != "png" && extension != "jpg" && extension != "gif" && extension != "jpeg" ){
// 				toastHtml("입력 오류!", "이미지 파일(jpg, jpeg, gif, png)을 입력하세요.");
// 				return false;
// 			}
// 		}
		
		const formData = new FormData(); //가상의 form생성(js내부에서 돌아가는 form 객체)
    	formData.append('image', $('#formFile')[0].files[0]);
    	
    	console.log($('#formFile')[0].files[0]);
    	console.log(formData);
		
    	let url = '/images/';
		$.ajax({
       		type: 'POST',
       		enctype: 'multipart/form-data',
       		url: '/img_change.do',
       		data: formData,
       		dataType: 'json',
       		processData: false,
       		contentType: false,
       		cache: false,
       		timeout: 600000,
       		success: function(data) {
       			//console.log('ajax 이미지 업로드 성공');
       			url += data.filename;
       			console.log(url);
       			
       			let DTO_Album_board = {
       					"al_user_num" : 1,
       					"al_subject" : $("#writeSubject").val(),
       					"al_imgName" : data.filename
       			}
       			console.log(DTO_Album_board);
       			$.ajax({
       				type: "POST",
       				url: "album_write.do",
       				data: JSON.stringify(DTO_Album_board),
       				contentType: "application/json; charset=utf-8",
       				dataType: "text",
       				success: function(data){
       					$("#modalCenter0").modal("hide");
       					console.log("DB 추가 성공");
       					reload();
       				}
       			});
       		}
       	});
	});
});

//modify
let al_seq = 0;
const modifyData = function(seq, subject){
	al_seq = seq;
	$("#modifySubject").val(subject);
	console.log(subject);
}

$(document).ready(function(){
	$( "#modify" ).on("click", function(){
		const formData = new FormData(); //가상의 form생성(js내부에서 돌아가는 form 객체)
    	formData.append('image', $('#formFile2')[0].files[0]);
    	
    	console.log($('#formFile2')[0].files[0]);
    	console.log(formData);
		
    	let url = '/images/';
		$.ajax({
       		type: 'POST',
       		enctype: 'multipart/form-data',
       		url: '/img_change.do',
       		data: formData,
       		dataType: 'json',
       		processData: false,
       		contentType: false,
       		cache: false,
       		timeout: 600000,
       		success: function(data) {
       			//console.log('ajax 이미지 업로드 성공');
       			url += data.filename;
       			console.log(url);
       			
       			let DTO_Album_board = {
       					"al_user_num" : 1,
       					"al_seq" : al_seq,
       					"al_subject" : $("#modifySubject").val(),
       					"al_imgName" : data.filename
       			}
       			console.log(DTO_Album_board);
       			$.ajax({
       				type: "POST",
       				url: "album_modify.do",
       				data: JSON.stringify(DTO_Album_board),
       				contentType: "application/json; charset=utf-8",
       				dataType: "text",
       				success: function(data){
       					$("#modalCenter1").modal("hide");
       					console.log("DB 추가 성공");
       					reload();
       				}
       			});
       		}
       	});
	});
});

//delete 
let data = 0;
const deleteData = function(al_seq){
	data = al_seq;
	//console.log("data : "+data)
}
$(document).ready(function(){
	$('#delete').on("click", function(){
		let DTO_Album_board = {
				"al_seq" : data
		}
		//console.log(DTO_Album_board);
		$.ajax({
			type: "POST",
			url: "album_delete.do",
			data: JSON.stringify(DTO_Album_board),
			contentType: "application/json; charset=utf-8",
			dataType: "text",
			success: function(data){
				$("#modalCenter2").modal("hide");
				//console.log(data);
				reload();
			}
		});
	});
});

const reload = function(){
	$.ajax({
		type: 'POST',
		url: "album_reload.do",
		datatype: "text",
		success: function(data){
			$("#albumContents").html(data);
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
						class="menu-link"> <!-- <i class='menu-icon bx bx-book-open bx-tada' style='color:#646363'  ></i> -->
							<i class='menu-icon bx bx-book-open' style='color: #646363'></i>
							<div data-i18n="Tables">독후감 나누기</div>
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
			<div class="layout-page" id="albumlayout">
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
							<span class="text-muted fw-light">찔끔 챌린지</span> 
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

							<div class="row row-cols-4 row-cols-md-4 g-4 mb-4" id="albumContents">
							
									<%= albumlist %>	
								
							</div>
							
							<!-- 페이징 -->
							<div class="demo-inline-spacing" style="display:flex; justify-content: center;">
								<nav aria-label="Page navigation">
 									<ul class="pagination">
<%
//첫 페이지 
if( totalLists.getStartBlock() == 1 ){
	out.println("<li class='page-item first'><a class='page-link'><i class='tf-icon bx bx-chevrons-left'></i></a></li>" );
} else {
	out.println( "<li class='page-item first'><a class='page-link' href='album_list.do?cpage=" + ( totalLists.getStartBlock() - totalLists.getBlockPerPage() ) + "'><i class='tf-icon bx bx-chevrons-left'></i></a></li>" ); 
}

//이전 페이지 
if( totalLists.getCpage() == 1 ) { 
	out.println( "<li class='page-item prev'><a class='page-link'><i class='tf-icon bx bx-chevron-left'></i></a></li>" );
} else {
	out.println( "<li class='page-item prev'><a class='page-link' href='album_list.do?cpage=" + ( totalLists.getCpage()-1 ) + "'><i class='tf-icon bx bx-chevron-left'></i></a></li>" ); 
}	

//페이지 블록
for( int i=totalLists.getStartBlock(); i<=totalLists.getEndBlock() ; i++ ){
	if( i == totalLists.getCpage() ) { 
		out.println( "<li class='page-item active'><a class='page-link'>" + i + "</a></li>" );
	} else {
		out.println( "<li class='page-item'><a class='page-link' href='album_list.do?cpage=" + i + "'>" + i + "</a></li>" );
		
	}
}

//다음 페이지
if( totalLists.getCpage() == totalLists.getTotalPage() ) { 
	out.println( "<li class='page-item next'><a class='page-link'><i class='tf-icon bx bx-chevron-right'></i></a></li>" );
} else {
	out.println( "<li class='page-item next'><a class='page-link' href='album_list.do?cpage=" + ( totalLists.getCpage()+1 ) + "'><i class='tf-icon bx bx-chevron-right'></i></a></li>" ); 
}

//마지막 페이지
if( totalLists.getEndBlock() == totalLists.getTotalPage() ){
		out.println("<li class='page-item last'><a class='page-link'><i class='tf-icon bx bx-chevrons-right'></i></a></li>" );
	} else {
		out.println( "<li class='page-item last'><a class='page-link' href='album_list.do?cpage=" + ( totalLists.getStartBlock() + totalLists.getBlockPerPage() ) + "'><i class='tf-icon bx bx-chevrons-right'></i></a></li>" ); 
	}
%>
									</ul>
								</nav>
							</div>
							<!-- /페이징 -->
							
						</div>
					</div>
					<!--/ Hoverable Table rows -->

				</div>
				<!-- / Content -->
				
				<!-- Modal -->
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
										<label for="writeSubject" class="form-label">제목</label> <input
											type="text" id="writeSubject" class="form-control"
											placeholder="Title">
									</div>
								</div>
								<!-- 사진업로드  -->
								<div class="row g-2">
									<div>
										<label for="formFile" class="form-label">사진</label> 
										<input class="form-control" type="file" name="upload" id="formFile" accept=".gif, .jpg, .png, .jpeg">
									</div>
								</div>
								<!-- /사진업로드 -->
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary" id="write">등록</button>
							</div>
						</div>
					</div>
				</div>
				<!--  Write Modal  -->

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
										<label for="modifySubject" class="form-label">제목</label> 
										<input
											type="text" id="modifySubject" class="form-control"
											placeholder="Title">
									</div>
								</div>
								<!-- 사진업로드  -->
								<div class="row g-2">
									<div>
										<label for="formFile2" class="form-label">사진</label> 
										<input class="form-control" type="file" name="upload" id="formFile2" accept=".gif, .jpg, .png, .jpeg">
									</div>
								</div>
								<!-- /사진업로드 -->
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary" id="modify">수정</button>
							</div>
						</div>
					</div>
				</div>
				<!--  /Modify Modal  -->
				
				<!--  Delete Modal  -->
				<div class="modal fade" id="modalCenter2" tabindex="-1"
					style="display: none;" aria-hidden="true" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<p>정말 삭제하시겠습니까?</p>
								<br />
								<br />
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-secondary"
										data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="delete">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  /Delete Modal  -->
				<!-- /Modal -->

				<!-- Footer -->
<!-- 				<footer class="content-footer footer bg-footer-theme"> -->
<!-- 					<div -->
<!-- 						class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column"> -->
<!-- 						<div class="mb-2 mb-md-0"> -->
<!-- 							© -->
<!-- 							<script> -->
<!--  								document.write(new Date().getFullYear()); -->
<!-- 							</script> -->
<!-- 							, made with ❤️ by <a href="https://themeselection.com" -->
<!-- 								target="_blank" class="footer-link fw-bolder">ThemeSelection</a> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<a href="https://themeselection.com/license/" -->
<!-- 								class="footer-link me-4" target="_blank">License</a> <a -->
<!-- 								href="https://themeselection.com/" target="_blank" -->
<!-- 								class="footer-link me-4">More Themes</a> <a -->
<!-- 								href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" -->
<!-- 								target="_blank" class="footer-link me-4">Documentation</a> -->

<!-- 							<a -->
<!-- 								href="https://github.com/themeselection/sneat-html-admin-template-free/issues" -->
<!-- 								target="_blank" class="footer-link me-4">Support</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</footer> -->
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
			data-bs-toggle="modal" data-bs-target="#modalCenter0" onclick="writeData()">글 작성하기</a>
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
