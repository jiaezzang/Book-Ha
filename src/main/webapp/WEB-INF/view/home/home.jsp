<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = (String)request.getAttribute("title");
	String setting = (String)request.getAttribute("setting");
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><%= title %></title>

	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

	<!-- Main Style -->

	<link rel="stylesheet" type="text/css" href="../css/home.css">
	

	<!--Icon Fonts-->
	<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
	<header>
		<div class="logoandmp">
			<a href="/login/mainpage" class="logo">
				<img src="../assets/img/logo/logo2.png" title="Book-Ha!" />
			</a>
			<a href=<%=setting %> class="mypage">
				<i class="bx bx-user-circle bx-md" style="color:#696cff; font-size:45px !important;"></i>
			</a>
	</header>
	<!-- Pricing Table Section -->
	<section id="menu">

		<div class="col-md-3 col-lg-3 mb-3">
			<a href="/ranking.do" class="card card1">
				<div class="line">
					<div class="card-body" style="background-image: url(../assets/img/mainpage/ranking.jpg)">
						<h5 class="card-title">Ranking</h5>
					</div>
				</div>
			</a>
		</div>
		<div class="col-md-3 col-lg-3 mb-3">
			<a href="/review_list.do" class="card card1">
				<div class="line">
					<div class="card-body" style="background-image: url(../assets/img/mainpage/review.jpg)">
						<h5 class="card-title">Review</h5>
					</div>
				</div>
			</a>
		</div>
		<div class="col-md-3 col-lg-3 mb-3">
			<a href="/album_list.do" class="card card1">
				<div class="line">
					<div class="card-body" style="background-image: url(../assets/img/mainpage/challenge.jpg)">
						<h5 class="card-title">Challenge</h5>
					</div>
				</div>
			</a>
		</div>
		<div class="col-md-3 col-lg-3 mb-3">
			<a href="/share_list.do" class="card card1">
				<div class="line">
					<div class="card-body" style="background-image: url(../assets/img/mainpage/sharing.jpg)">
						<h5 class="card-title">Sharing</h5>
					</div>
				</div>
			</a>
		</div>

	</section>
	<!-- Pricing Table Section End -->
</body>
</html>