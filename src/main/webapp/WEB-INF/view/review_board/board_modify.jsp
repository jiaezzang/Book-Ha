<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bookha.main.dto.DTOReviewBoard" %>
<%
request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	
	DTOReviewBoard to = (DTOReviewBoard)request.getAttribute("to");
	
	int seq = Integer.parseInt(request.getParameter("seq"));
	String subject = to.getSubject();
	String content = to.getContent();
	String hash_tag = to.getHash_tag();
	
	String book_img_url = to.getBook_img_url();
	String book_info_url = to.getBook_info_url();
	String book_title = to.getBook_title();
	String book_publisher = to.getBook_publisher();
	String book_author = to.getBook_author();
	String book_summary = to.getBook_summary();
	
	String btnradio1 = "";
	String btnradio2 = "";
	String btnradio3 = "";
	String btnradio4 = "";
	String btnradio5 = "";
	String btnradio6 = "";
	
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
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="../js/toastr.js"></script>

<script>
	$(document).ready(function() {
		var pageNum = 1;
		let tag_radio = '<%= hash_tag %>';
		let book_search_is_end = false;
		
		$("#query").val('<%= book_title %>');
		
		let book_seach_result = "";
        book_seach_result += "<label class='list-group-item list-group-item-action'>";
        book_seach_result += "<table>";
        book_seach_result += "<tr><td>";
        book_seach_result += "<input class='form-check-input me-1' type='radio' checked value='' name='bookRadio'/>";
        book_seach_result += "</td>";
        book_seach_result += "<td>";
        book_seach_result += "<div class='d-grid d-sm-flex p-3'>";
        book_seach_result += "<img src='<%= book_img_url %>' style='width: 120px' class='me-4 mb-sm-0 mb-2'/>";
        book_seach_result += "<span>";
        book_seach_result += "<h6><a href='<%= book_info_url %>'><%= book_title %></a></h6>";
        book_seach_result += "<strong>저자:</strong> <span class='span_author'><%= book_author %></span><br>";
        book_seach_result += "<strong>출판사:</strong> <span class='span_publisher'><%= book_publisher %></span><br>";
        book_seach_result += "<strong>요약:</strong> <span class='span_summary'><%= book_summary %></span><br>";
        book_seach_result += "</span>";
        book_seach_result += "</div>";
        book_seach_result += "</td></tr>";
        book_seach_result += "</table>";
        book_seach_result += "</label>";
        $("#kakao_bookSearch_result").append(book_seach_result);
		
		$("#search").on("click", () => {
			$("#kakao_bookSearch_result").html("");
			//console.log($("#query").val());
			
			if($("#query").val()=='') {
				return false;	
			}
			
			$.ajax({
			    method: "GET",
			    url: "https://dapi.kakao.com/v3/search/book?target=title",
			    data: { query: $("#query").val(), page: pageNum},
			    headers: {Authorization: "KakaoAK 4169af87ec57642db130af59093e6bbc"} // ########부분에 본인의 REST API 키를 넣어주세요.
			
			})
			.done((msg) => {
			    //console.log(msg);
			    //console.log("검색 문서 수 : "+msg.meta.total_count);
			    //console.log("중복문서 제외 노출 문서 수 : "+msg.meta.pageable_count);
			 	//console.log("현재 페이지가 마지막 페이지인지? : "+msg.meta.is_end);
			 	
				book_search_is_end = msg.meta.is_end;
	// 			console.log(book_search_is_end);
				
				let search_count = 5;
				
				if(msg.meta.total_count < 5) {
					search_count = msg.meta.total_count;
				}
			 	
			    for (var i = 0; i < search_count; i++){
			        let html = "";
			        html += "<label class='list-group-item list-group-item-action'>";
			        html += "<table>";
			        html += "<tr><td>";
			        html += "<input class='form-check-input me-1' type='radio' value='' name='bookRadio'/>";
			        html += "</td>";
			        html += "<td>";
			        html += "<div class='d-grid d-sm-flex p-3'>";
			        html += "<img src='" + msg.documents[i].thumbnail + "' style='width: 120px' class='me-4 mb-sm-0 mb-2'/>";
			        html += "<span>";
			        html += "<h6><a href='"+ msg.documents[i].url +"'>" + msg.documents[i].title + "</a></h6>";
			        html += "<strong>저자:</strong> <span class='span_author'>" + msg.documents[i].authors + "</span><br>";
			        html += "<strong>출판사:</strong> <span class='span_publisher'>" + msg.documents[i].publisher + "</span><br>";
			        html += "<strong>요약:</strong> <span class='span_summary'>" + msg.documents[i].contents + "...</span><br>";
			        html += "</span>";
			        html += "</div>";
			        html += "</td></tr>";
			        html += "</table>";
			        html += "</label>";
			        $("#kakao_bookSearch_result").append(html);
			        
			        $("#query").html("");
			        //console.log($("#kakao_bookSearch_result").html());
			    }
			});
		});
		$(window).scroll(function(){
			if($("#query").val()=='') {
				return false;	
			}
			
			if(book_search_is_end) {
				return false;
			}
			
	        if (Math.ceil($(window).scrollTop()) + $(window).height() >= $(document).height()) {
	            pageNum++;

	            $.ajax({
	                method: "GET",
	                url: "https://dapi.kakao.com/v3/search/book?target=title",
	                data: { query: $("#query").val(),  page: pageNum},
	                headers: {Authorization: "KakaoAK 4169af87ec57642db130af59093e6bbc"} // ########부분에 본인의 REST API 키를 넣어주세요.

	            })
	            .done(function (msg) {
	                //console.log(msg);
	                
	                book_total_search_count = msg.meta.is_end;
	                book_search_is_end = msg.meta.is_end;
	                
					let search_count = 5;
	 				
	 				if(msg.meta.total_count < 5) {
	 					search_count = msg.meta.total_count;
	 				}
		                
		                for (var i = 0; i < search_count; i++){
		                	if($("input[name='bookRadio']:checked").parent().parent().find('a').html() != msg.documents[i].title) {
		                		let html = "";
			    		        html += "<label class='list-group-item list-group-item-action'>";
			    		        html += "<table>";
			    		        html += "<tr><td>";
			    		        html += "<input class='form-check-input me-1' type='radio' value='' name='bookRadio'/>";
			    		        html += "</td>";
			    		        html += "<td>";
			    		        html += "<div class='d-grid d-sm-flex p-3'>";
			    		        html += "<img src='" + msg.documents[i].thumbnail + "' style='width: 120px' class='me-4 mb-sm-0 mb-2'/>";
			    		        html += "<span>";
			    		        html += "<h6><a href='"+ msg.documents[i].url +"'>" + msg.documents[i].title + "</a></h6>";
			    		        html += "<strong>저자:</strong> <span class='span_author'>" + msg.documents[i].authors + "</span><br>";
			    		        html += "<strong>출판사:</strong> <span class='span_publisher'>" + msg.documents[i].publisher + "</span><br>";
			    		        html += "<strong>요약:</strong> <span class='span_summary'>" + msg.documents[i].contents + "...</span><br>";
			    		        html += "</span>";
			    		        html += "</div>";
			    		        html += "</td></tr>";
			    		        html += "</table>";
			    		        html += "</label>";
			    		        $("#kakao_bookSearch_result").append(html);
		                	}
		                }
		            });
		        }
	    });
		
		$('.btn-check').on('click', function(e) {
			tag_radio = $(this).next().text();
		});
		
		const toastHtml = function(title, message) {
			toastr.error(message, title);
		};
		
		
		
		$('#board_submit').on("click", function(e) {
			if($('#defaultFormControlInput').val() == '') {
				toastHtml('입력 오류!', '제목을 입력하세요.');
				return false;
			}
			
			if(editor.getHTML() == '') {
				console.log(editor.getHTML());
				toastHtml('입력 오류!', '본문을 입력하세요.');
				return false;
			}
			
			if(tag_radio == '') {
				toastHtml('선택 오류!', '해시태그를 선택하세요.');
				return false;	
			}
			
			if($("#query").val() == '') {
				toastHtml('입력 오류!', '읽은 책을 검색하세요.');
				return false;	
			}
			
			if($("input[name='bookRadio']").length == $("input[name='bookRadio']:not(:checked)").length) {
				toastHtml('선택 오류!', '읽은 책을 선택하세요.');
				return false;
			}
			
			let img_url = $("input[name='bookRadio']:checked").parent().parent().html();
			let startImgUrl = img_url.indexOf("src=\"");
			let lastImgUrl = img_url.indexOf("\"", startImgUrl+5);
			let subImgUrl = img_url.substring(startImgUrl+5, lastImgUrl).replaceAll("amp;", "");
			
			let info_url = $("input[name='bookRadio']:checked").parent().parent().find('h6').html();
			let startInfoUrl = info_url.indexOf("\"");
			let lastInfoUrl = info_url.lastIndexOf("\"");
			let subInfoUrl = info_url.substring(startInfoUrl+1, lastInfoUrl).replaceAll("amp;", "");
				
			let f = document.createElement('form');
			
			let obj0;
			obj0 = document.createElement('input');
			obj0.setAttribute('type', 'hidden');
			obj0.setAttribute('name', 'seq');
			obj0.setAttribute('value', <%= seq %>);
			
			let obj1;
			obj1 = document.createElement('input');
			obj1.setAttribute('type', 'hidden');
			obj1.setAttribute('name', 'subject');
			obj1.setAttribute('value', $('#defaultFormControlInput').val());
			
			let obj2;
			obj2 = document.createElement('input');
			obj2.setAttribute('type', 'hidden');
			obj2.setAttribute('name', 'user_num');
	//			obj2.setAttribute('value', user_num);
			obj2.setAttribute('value', 4);
			
			let obj3;
			obj3 = document.createElement('input');
			obj3.setAttribute('type', 'hidden');
			obj3.setAttribute('name', 'content');
			obj3.setAttribute('value', editor.getHTML());
			
			let obj4;
			obj4 = document.createElement('input');
			obj4.setAttribute('type', 'hidden');
			obj4.setAttribute('name', 'hash_tag');
			obj4.setAttribute('value', tag_radio);
			
			let obj5;
			obj5 = document.createElement('input');
			obj5.setAttribute('type', 'hidden');
			obj5.setAttribute('name', 'book_img_url');
			obj5.setAttribute('value', subImgUrl);
			
			let obj6;
			obj6 = document.createElement('input');
			obj6.setAttribute('type', 'hidden');
			obj6.setAttribute('name', 'book_info_url');
			obj6.setAttribute('value', subInfoUrl);
			
			let obj7;
			obj7 = document.createElement('input');
			obj7.setAttribute('type', 'hidden');
			obj7.setAttribute('name', 'book_title');
			obj7.setAttribute('value', $("input[name='bookRadio']:checked").parent().parent().find('a').html());
			
			let obj8;
			obj8 = document.createElement('input');
			obj8.setAttribute('type', 'hidden');
			obj8.setAttribute('name', 'book_author');
			obj8.setAttribute('value', $("input[name='bookRadio']:checked").parent().parent().find('.span_author').html());
			
			let obj9;
			obj9 = document.createElement('input');
			obj9.setAttribute('type', 'hidden');
			obj9.setAttribute('name', 'book_publisher');
			obj9.setAttribute('value', $("input[name='bookRadio']:checked").parent().parent().find('.span_publisher').html());
			
			let obj10;
			obj10 = document.createElement('input');
			obj10.setAttribute('type', 'hidden');
			obj10.setAttribute('name', 'book_summary');
			obj10.setAttribute('value', $("input[name='bookRadio']:checked").parent().parent().find('.span_summary').html());
			
			f.appendChild(obj0);
			f.appendChild(obj1);
			f.appendChild(obj2);
			f.appendChild(obj3);
			f.appendChild(obj4);
			f.appendChild(obj5);
			f.appendChild(obj6);
			f.appendChild(obj7);
			f.appendChild(obj8);
			f.appendChild(obj9);
			f.appendChild(obj10);
			
			f.setAttribute('method', 'post');
			f.setAttribute('action', '/review_modify_ok.do');
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
		    initialValue: '',
		    // 이미지가 Base64 형식으로 입력되는 것 가로채주는 옵션
		    hooks: {
		    	addImageBlobHook: (blob, callback) => {
		    		// blob : Java Script 파일 객체
		    		//console.log(blob);
		    		
		    		const formData = new FormData();
		        	formData.append('image', blob);
		        	
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
		           			
		           			// callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
		        			// 형식 : ![대체 텍스트](주소)
		           			callback(url, '사진 대체 텍스트 입력');
		           		},
		           		error: function(e) {
		           			//console.log('ajax 이미지 업로드 실패');
		           			//console.log(e.abort([statusText]));
		           			
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
			
			<!-- Toast -->
			<div id="toastHtml" class="bs-toast toast toast-placement-ex m-2 fade bg-danger top-0 end-0" role="alert" aria-live="assertive" aria-atomic="true" data-delay="100">
				<div class="toast-header">
				<i class="bx bx-bell me-2"></i>
				<div class="me-auto fw-semibold" id="toast_title">Toast Title Space</div>
				<small>방금 전</small>
				<!-- <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button> -->
				</div>
				<div class="toast-body" id="toast_content">Toast Content Space</div>
			</div>
			<!-- /Toast -->

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
					<li class="menu-item active"><a href="/review_list.do"
						class="menu-link"> <i
							class='menu-icon bx bx-book-open bx-tada' style='color: #646363'></i>
							<!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
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
						<div class="navbar-nav align-items-center">
							<div class="nav-item d-flex align-items-center">
								<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
									class="form-control border-0 shadow-none"
									placeholder="Search..." aria-label="Search..." />
							</div>
						</div>
						<!-- /Search -->

						<ul class="navbar-nav flex-row align-items-center ms-auto">
							<!-- Place this tag where you want the button to render. -->

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
								<input type="text" class="form-control"
									id="defaultFormControlInput" placeholder="제목을 입력하세요"
									aria-describedby="defaultFormControlHelp" value="<%= subject %>" />
							</div>
							<br />
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
										</tr>
									</tbody>
								</table>
							</div>

							<br />

							<!-- Hoverable Table rows -->

							<!-- TOAST UI Editor가 들어갈 div태그 -->
							<div id="editor">
								<%= content %>
							</div>
							
						</div>
						<!--/ Hoverable Table rows -->

						<br />

						<div class="card">
							<h5 class="card-header">
								<strong>책 선택하기</strong>
							</h5>

							<!-- Search -->
							<div class="input-group">
								<button id="search" class="input-group-text">
									<i class="tf-icons bx bx-search"></i>
								</button>
								<input type="text" id="query" class="form-control"
									placeholder="도서명을 입력하시고 검색 버튼을 눌러주세요!" />
							</div>
							<!-- /Search -->

							<div class="list-group" id="kakao_bookSearch_result"></div>
						</div>
					</div>
					<!-- / Content -->


					<!-- Footer -->
<!-- 					<footer class="content-footer footer bg-footer-theme"> -->
<!-- 						<div -->
<!-- 							class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column"> -->
<!-- 							<div class="mb-2 mb-md-0"> -->
<!-- 								© -->
<!-- 								<script> -->
<!--  						            document.write(new Date().getFullYear()); -->
<!-- 								</script> -->
<!-- 								, made with ❤️ by <a href="https://themeselection.com" -->
<!-- 									target="_blank" class="footer-link fw-bolder">ThemeSelection</a> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<a href="https://themeselection.com/license/" -->
<!-- 									class="footer-link me-4" target="_blank">License</a> <a -->
<!-- 									href="https://themeselection.com/" target="_blank" -->
<!-- 									class="footer-link me-4">More Themes</a> <a -->
<!-- 									href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" -->
<!-- 									target="_blank" class="footer-link me-4">Documentation</a> <a -->
<!-- 									href="https://github.com/themeselection/sneat-html-admin-template-free/issues" -->
<!-- 									target="_blank" class="footer-link me-4">Support</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</footer> -->
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
		<a
			href="javascript:void(0);"
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
