<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	String logo = (String)request.getAttribute("logo");
	
	//상단 네비게이션바와 좌측 메뉴바
	String navBar = (String)request.getAttribute("navBar");
	String menuBar =(String)request.getAttribute("menuBar");
	
	//출석체크 스탬프 관련
	String checkAt = (String)request.getAttribute("checkAt");
	String addStamp = (String)request.getAttribute("addStamp");
	String listAt = (String)request.getAttribute("listAt");
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

.fc-toolbar-title{

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

.fc-myCustomButton-button:hover {
  color: #fff !important;
  background-color: #696cff !important;
  border-color: #696cff !important;
  box-shadow: 0 0.125rem 0.25rem 0 rgba(113, 221, 55, 0.4) !important;
  transform: translateY(-1px) !important;
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

<!-- FullCalendar -->
<link href='../libs/fullcalendar/main.css' rel='stylesheet' />
<script src='../libs/fullcalendar/main.js'></script>

<!-- build:js assets/vendor/js/core.js -->
<script src="../assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assets/vendor/libs/popper/popper.js"></script>
<script src="../assets/vendor/js/bootstrap.js"></script>
<script
	src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assets/vendor/js/menu.js"></script>

<!-- Toastr -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="../js/toastr.js"></script>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
		
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth',
		customButtons: {
			myCustomButton: {
				text: '출석 체크',
			    click: function() {
			    	if( "<%=checkAt%>" == "0"){
			    		addAt();
			    		calendar.addEvent({
			        		start: "<%=addStamp%>",
							image_url : "../assets/img/stamps/stamp.png"
						});
			    		 //$('#calendar').load(location.href+' #calendar');
			    		 window.location.href = "/mypage.do";
						toastr.success('출석체크가 완료되었습니다.', '성공!');
					} else {
						toastr.error('이미 출석체크가 완료되었습니다.', '실패!');
					}
				}
			}
		},
		events : [
					<%=listAt%>
		],
		//image content
		eventContent : function(arg) {
			let arrayOfDomNodes = []
			// title event
			let titleEvent = document.createElement('div')
			if (arg.event._def.title) {
				titleEvent.innerHTML = arg.event._def.title
				titleEvent.classList = "fc-event-title fc-sticky"
			}
			// image event
			let imgEventWrap = document.createElement('div')
			if (arg.event.extendedProps.image_url) {
				let imgEvent = '<img class="stamp" src="'+arg.event.extendedProps.image_url+'" >'
				imgEventWrap.classList = "fc-event-img"
				imgEventWrap.innerHTML = imgEvent;
			}
			arrayOfDomNodes = [ 
				titleEvent, imgEventWrap
			]
			return {
				domNodes : arrayOfDomNodes
			}
		},

	});
	calendar.render();
});

function addAt() {
	$.ajax({
		type : 'POST',
		url : "add_attendance.do",
		datatype : "text",
		success : function(data) {
			console.log("data : " + data);
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
					<%=logo %>
				</div>
				<div class="menu-inner-shadow"></div>
				<%=menuBar %>
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->

				<%=navBar %>

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