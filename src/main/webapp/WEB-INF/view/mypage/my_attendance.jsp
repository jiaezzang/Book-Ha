<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String title = (String) request.getAttribute("title");
String profile = (String) request.getAttribute("profile");
%>
<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>출석 체크</title>

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
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}


.fc-daygrid-day-events {
	position: relative;
	min-height: 7em !important;
	
}

.fc-myCustomButton-button{
	display: inline-block !important;
    font-weight: 400 !important;
    line-height: 1.53 !important;
    text-align: center !important;
    vertical-align: middle !important;
    user-select: none !important;
    border: 1px solid transparent !important;
    padding: 0.4375rem 1.25rem !important;
    font-size: 0.9375rem !important;
    border-radius: 0.375rem !important;
    transition: all 0.2s ease-in-out !important;
    
    color: #696cff !important;
    border-color: #696cff !important;
    background: transparent !important;
    border-radius: 50rem !important;
}

.fc-today-button{
    color: #fff !important;
    background-color: #696cff !important;
    border-color: #696cff !important;
    box-shadow: 0 0.125rem 0.25rem 0 rgb(105 108 255 / 40%) !important;

}

.fc-button-group{
    position: relative !important;
    display: inline-flex !important;
    vertical-align: middle !important;
}

.fc-prev-button, .fc-next-button{
	color: #fff;
    background-color: #696cff !important;
    border-color: #696cff !important;
    box-shadow: 0 0.125rem 0.25rem 0 rgb(105 108 255 / 40%) !important;
}
.stamp {
	width:50%;
	display: block; 
	margin: 0px auto;
}
</style>

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../assets/js/config.js"></script>

<link href='../libs/fullcalendar/main.css' rel='stylesheet' />
<script src='../libs/fullcalendar/main.js'></script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
		    customButtons: {
			    myCustomButton: {
			      text: '출석 체크',
			      click: function() {
			        alert('출석체크 완료!');
			        //click 시 스탬프 이미지 추가 action
			      }
			    }
			},
			 		    events: [
 		    	{
 		    		 start : "2022-08-01",
 		    		 image_url : "../assets/img/stamps/stamp.png"
 		    	},

 		    	{
		    		 start : "2022-08-15",
		    		 image_url : "../assets/img/stamps/stamp.png"
		    	},

		    	{
		    		 start : "2022-08-29",
		    		 image_url : "../assets/img/stamps/stamp.png"
		    	}
 		    ],
 			//image content
 			eventContent: function(arg) {
                let arrayOfDomNodes = []
                // title event
                let titleEvent = document.createElement('div')
                if(arg.event._def.title) {
                  titleEvent.innerHTML = arg.event._def.title
                  titleEvent.classList = "fc-event-title fc-sticky"
                }
    
                // image event
                let imgEventWrap = document.createElement('div')
                if(arg.event.extendedProps.image_url) {
                  let imgEvent = '<img class="stamp" src="'+arg.event.extendedProps.image_url+'" >'
                  imgEventWrap.classList = "fc-event-img"
                  imgEventWrap.innerHTML = imgEvent;
                }
    
                arrayOfDomNodes = [ titleEvent,imgEventWrap ]
    
                return { domNodes: arrayOfDomNodes }
              }, 
 			
		});
		calendar.render();
	});
	

</script>
<!-- 
<script type="text/javascript">
$(document).ready(function(){
	  $('#calendar').fullCalendar({
	    header: {
	      right: 'checkButton prevYear,prev,next,nextYear'
	    },
        // 출석체크를 위한 버튼 생성
	    customButtons: { 
	        checkButton: {
	          text: '출석체크하기',
	          id: 'check',
	          click: function() {	
                    // ajax 통신으로 출석 정보 저장하기 
                    // POST "/users/attendances" -> { status: "success", date:"2022-08-08"}
                    // 통신 성공시 버튼 바꾸고, property disabled 만들기 
	          }
	        }
	    },
       // 달력 정보 가져오기 
	    eventSources: [
	    	{
				// ajax 통신으로 달력 정보 가져오기 
                // GET "/users/attendances" -> {dateList:[ date: "2016-03-21", ... ]}
				color: 'purple',   
			 	textColor: 'white' 
	    	}
	    ]
	  }); 
});
</script>
 -->
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
						class="app-brand-logo demo"> </span> <!--  로고 이미지  --> <img
						class="logo-demo" src="../assets/img/logo/logo2.png">
					</a> <a href="javascript:void(0);"
						class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
						<i class="bx bx-chevron-left bx-sm align-middle"></i>
					</a>
				</div>

				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">마이 페이지</span></li>
					<li class="menu-item"><a href="user_account_setting.html"
						class="menu-link"> <i
							class="menu-icon tf-icons bx bx-dock-top"></i>
							<div data-i18n="Boxicons">개인 정보 수정</div>
					</a></li>

					<!-- Components -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">당신의 순위는 어디일까요?</span></li>


					<li class="menu-item"><a href="/review_list.do"
						class="menu-link"> <i
							class='menu-icon bx bx-crown bx bx-table'></i>
							<div data-i18n="Tables">나의 업적 확인</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">작성글을 확인해 봅시다.</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-table"></i>
							<div data-i18n="Tables">내글 모아 보기</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a href="user_board_review.html"
								class="menu-link">
									<div data-i18n="Without menu">리뷰 게시판</div>
							</a></li></li>
				</ul>
				<ul class="menu-sub">
					<li class="menu-item"><a href="user_board_album.html"
						class="menu-link">
							<div data-i18n="Without menu">앨범 게시판</div>
					</a></li>
					</li>
				</ul>
				<ul class="menu-sub">
					<li class="menu-item"><a href="user_board_share.html"
						class="menu-link">
							<div data-i18n="Without menu">공유 게시판</div>
					</a></li>
					</li>
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



						<ul class="navbar-nav flex-row align-items-center ms-auto">
							<!-- Place this tag where you want the button to render. -->

							<!-- User -->
							<%=profile%>
							<!--/ User -->
						</ul>
					</div>
				</nav>

				<!-- / Navbar -->

				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">

							<!-- calendar -->
							<div id="calendar"></div>

							
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
				<!-- / Content -->

				<!-- Footer -->
				<footer class="content-footer footer bg-footer-theme"> </footer>
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
	<script src="../assets/js/pages-account-settings-account.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>

</body>
</html>