<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");

	String logo = (String) request.getAttribute("logo");
	
	String reviewList = (String)request.getAttribute("reviewList");
	String albumList = (String)request.getAttribute("albumList");
	String shareList = (String)request.getAttribute("shareList");
	String atList = (String)request.getAttribute("atList");
	
	String navBar = (String)request.getAttribute("navBar");

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
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title><%= title %></title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
	<link rel="stylesheet" type="text/css" href="../css/home.css">
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
    	    	

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
            <li class="menu-header small text-uppercase"><span class="menu-header-text">당신의 순위는 어디일까요?</span></li>
            
            <!-- Tables -->
            <li class="menu-item active">
              <a href="/ranking.do" class="menu-link">
                <!-- <i class='menu-icon bx bx-crown' style='color:#646363' ></i> -->
                <i class='menu-icon bx bx-crown bx-tada' style='color:#646363' ></i>
                <div data-i18n="Tables">업적과 순위</div>
              </a>
            </li>

            <!-- Forms & Tables -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">책을 읽고 느낀점을 나눠봐요!</span></li>
            
            <!-- Tables -->
            <li class="menu-item">
              <a href="/review_list.do" class="menu-link">
                <!-- <i class='menu-icon bx bx-book-open bx-tada' style='color:#646363'  ></i> -->
                <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i>
                <div data-i18n="Tables">독후감 나누기</div>
              </a>
            </li>
            
            <!-- Forms & Tables -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">하루하루 책을 읽어봐요!</span></li>
            
            <!-- Tables -->
            <li class="menu-item">
              <a href="/album_list.do" class="menu-link">
                <i class='menu-icon bx bx-photo-album' style='color:#646363' ></i>
                <!-- <i class='menu-icon bx bx-photo-album bx-tada' style='color:#646363' ></i> -->
                <div data-i18n="Tables">찔끔 챌린지</div>
              </a>
            </li>
            
            <!-- Forms & Tables -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">다른 사람들과 책을 나눠봐요!</span></li>
            
            <!-- Tables -->
            <li class="menu-item">
              <a href="/share_list.do" class="menu-link">
                <i class='menu-icon bx bx-gift' style='color:#646363' ></i>
                <!-- <i class='menu-icon bx bx-bx-gift bx-tada' style='color:#646363' ></i> -->
                <div data-i18n="Tables">나눔과 공유하기</div>
              </a>
            </li>
            
            
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
	            <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">업적과 순위</span></h4>
              
              <!-- Hoverable Table rows -->
              	<div>
              			<%=atList %>
						<%=reviewList %>
						<%=albumList %>
						<%=shareList %>	
              </div>
            </div>
		  </div>

          <!-- Footer -->
<!--           <footer class="content-footer footer bg-footer-theme"> -->
<!--               <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column"> -->
<!--                 <div class="mb-2 mb-md-0"> -->
<!--                   © -->
<!--                   <script> -->
<!--  						document.write(new Date().getFullYear()); -->
<!--                   </script> -->
<!--                   , made with ❤️ by -->
<!--                   <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a> -->
<!--                 </div> -->
<!--                 <div> -->
<!--                   <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a> -->
<!--                   <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a> -->

<!--                   <a -->
<!--                     href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" -->
<!--                     target="_blank" -->
<!--                     class="footer-link me-4" -->
<!--                     >Documentation</a -->
<!--                   > -->

<!--                   <a -->
<!--                     href="https://github.com/themeselection/sneat-html-admin-template-free/issues" -->
<!--                     target="_blank" -->
<!--                     class="footer-link me-4" -->
<!--                     >Support</a> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </footer> -->
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
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

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
