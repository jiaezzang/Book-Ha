<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<%@page import="com.bookha.main.dto.DTOAttendance"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String title = (String) request.getAttribute("title");
	String profile = (String) request.getAttribute("profile");
	String logo = (String) request.getAttribute("logo");
	String navBar = (String)request.getAttribute("navBar");
	
	
	
	int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
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

<style type="text/css">
.demo-inline-spacing {
	margin: auto;
}
</style>

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

<!-- Graph CSS -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<style type="text/css">
.btn-group {
	float: right;
}
</style>

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../assets/js/config.js"></script>

<!-- jQuery UI CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(document).ready(function() {
		getDaily();
		
		// 일간
		$('#btnradio1').on('click',function() {	
			getDaily();
		});
		
		// 주간
		$('#btnradio2').on('click',function() {
			getWeekly();
		});
		
		// 월간
		$('#btnradio3').on('click',function() {		
			getMonthly();
		});
	});
	
	let data = 0;
	const getDaily = function() {

		const today = new Date();
		let day_array = ['일','월','화','수','목','금','토'];
		const day = today.getDay();
		
		let xList = [];
		let dataList = [];
		
		$.ajax({
			type: "POST",
			url: "/getdaily.do",
			dataType: "json",
			success: function(data){
				
				for( let i=0; i<data.length; i++ ) {
					if( data[i].date.substring(8) == 01 ) {
						xList.push([data[i].date.substring(8), data[i].date.substring(5,7)+"월"]);
					} else {
						xList.push(data[i].date.substring(8));
					}
					dataList.push(data[i].cnt-1);
				}
				
				let today = data[data.length-1].date + " " + day_array[day];
				$('#standard').text( today );
				
				
				//그래프 그리기
				myChart = new Chart(document.getElementById('myChart'), {
					type: 'line',
					data: {
						labels: xList,
						datasets: [{
							backgroundColor : 'transparent',
							borderColor : "#696cff",
							data: dataList
						}]
					},
					options : {
						legend : {
							display : false
						},
						scales: {
							yAxes: [{
								// y축
								ticks: {
									min: 0,
									stepSize: 10,
									max: 80
								}
							}]
						}
					}
				});
			}
		});
	}
	
	const getWeekly = function() {

		let xList = [];
		let dataList = [];
		
		$.ajax({
			type: "POST",
			url: "/getweekly.do",
			dataType: "json",
			success: function(data){
				let check = "";
				
				for( let i=0; i<data.length; i++ ) {
					let j = i + 1;
					
					let now = data[i].start.substring(8);
					
					let next = "32";
					if(j < data.length) {
						next = data[j].start.substring(8)
					}
					
					if(parseInt(now) < parseInt(next)) {
						if(check != data[i].start.substring(5,7)) {
							xList.push([data[i].start.substring(8), data[i].start.substring(5,7)+"월"]);
						} else{
							xList.push(data[i].start.substring(8));
						}
					} else{
						xList.push(data[i].start.substring(8));
					}
					
					check = data[i].start.substring(5,7);
					dataList.push(data[i].cnt-1);
				}
				
				let startday = data[data.length - 1].start;
				let endday = data[data.length - 1].end;
				$('#standard').text( startday + " ~ " + endday );

				
				
				//그래프 그리기
				myChart = new Chart(document.getElementById('myChart'), {
					type: 'line',
					data: {
						labels: xList,
						datasets: [{
							backgroundColor : 'transparent',
							borderColor : "#696cff",
							data: dataList
						}]
					},
					options : {
						legend : {
							display : false
						},
						scales: {
							yAxes: [{
								// y축
								ticks: {
									min: 0,
									stepSize: 20,
									max: 150
								}
							}]
						}
					}
				});
			}
		});
	}
	
	const getMonthly = function() {

		let xList = [];
		let dataList = [];
		
		$.ajax({
			type: "POST",
			url: "/getmonthly.do",
			dataType: "json",
			success: function(data){
				
				for( let i=0; i<data.length; i++ ) {
					xList.push(data[i].date.substring(5));
					
					dataList.push(data[i].cnt-1);
					//console.log(data[i].cnt-1);
				}
				
				let today = data[data.length - 1].date;
				$('#standard').text( today );
				
				
				//그래프 그리기
				myChart = new Chart(document.getElementById('myChart'), {
					type: 'line',
					data: {
						labels: xList,
						datasets: [{
							backgroundColor : 'transparent',
							borderColor : "#696cff",
							data: dataList
						}]
					},
					options : {
						legend : {
							display : false
						},
						scales: {
							yAxes: [{
								// y축
								ticks: {
									min: 0,
									stepSize: 30,
									max: 300
								}
							}]
						}
					}
				});
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

				<ul class="menu-inner py-1">

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text"></span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/list.do"
						class="menu-link"> <i class='menu-icon bx bx-book-open '
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
						<h4 class="fw-bold py-3 mb-2">
							<span class="text-muted fw-light">방문 통계</span>
						</h4>

						<!-- Hoverable Table rows -->

						<!--/ Hoverable Table rows -->

						<br />

						<div class="card">
							<br />
							<h3 class="card-header">

								<div class="tab_graph">
									<div class="btn-group" role="group" aria-label="Basic radio toggle button group" id="btngroup">
										<input type="radio" class="btn-check" name="btnradio" id="btnradio1" checked="" autocomplete="off">
										<label class="btn btn-outline-primary" for="btnradio1">일간</label>
										
										<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
										<label class="btn btn-outline-primary" for="btnradio2">주간</label>
										
										<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
										<label class="btn btn-outline-primary" for="btnradio3">월간</label>
									</div>
								</div>
								<div id="standard">
								</div>
							</h3>
							<br />
							<br />

							<!-- Hoverable Table rows -->
							<div class="table-responsive text-nowrap">
								<div class="container" id="chartArea">
									<canvas id="myChart"></canvas>
								</div>
								<script>
								
								</script>
							</div>
							<br /> <br />

						</div>
						<!--/Hoverable Table rows -->

					</div>
					<!-- /Content -->
				</div>

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
