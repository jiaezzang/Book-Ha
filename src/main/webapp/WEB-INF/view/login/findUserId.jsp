<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String logo = (String) request.getAttribute("logo");
%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style customizer-hide"
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

    <title>ID 찾기</title>

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
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="../assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    
    <!-- Toastr -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script src="../js/toastr.js"></script>

    <script>
      $(document).ready(function() {
        $("#findIdBtn").on("click", () => {
          if($("#name").val().length < 1) {
            return toastr.error("이름을 입력해주세요.", "입력 오류!");
          }

          if($("#userPhone").val().length < 1) {
            return toastr.error("연락처를 입력해주세요.", "입력 오류!");
          }

          findId();
        });
      
      
      //휴대폰 번호 정규식 검사
		$("#userPhone").keyup(function() {
			$("#userPhone").val( $("#userPhone").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
			
	  		var text = $("#userPhone").val().trim();
	
	  		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	  		if(regPhone.test(text) === true) {
	  			$("#alert-correctPhone").css('display', 'none');
	  			$('#userPhone').css('border', '1px solid #696cff');
	  		} else {
	  			$("#alert-correctPhone").css('display', 'inline-block');
	  		}
		});
      });

      function findId() {
        let sendData = {
          user_name: $("#name").val(),
          user_phonenumber: $("#userPhone").val().replaceAll("-", "")
        };

        $.ajax({
          url:"/findUserId",
          type: "post",
          contentType: "application/json; charset=utf-8",
          data : JSON.stringify(sendData),
          dataType:"json",
          success : function(result){
            if(result.length < 1) {
            	return toastr.error("회원 정보가 존재하지 않습니다.", "실패!");
            }
			let info = $("#name").val() + " 님은 <span style='color: #696CFF'>";
			if(result[0].user_path == "kakao") {
				info += "카카오";
			} else {
				info += "Book-Ha";
			}
			info += "</span>로 회원가입하셨습니다.<br /><br />" + $("#name").val() + " 님의 이메일은 <span style='color: #696CFF'>" + result[0].user_mail + "</span> 입니다.";
			$("#userIdShow").html(info);
            $("#modalCenter").modal("show");
          },
          error : function(jqXHR,textStatus,errorThrown){
        	  toastr.error("서버와의 통신을 실패하였습니다.", "실패!");
          }
        });
      }
      const windowLocationHref = function() {
    	  window.location.href = "/login";
      }
    </script>
  </head>

  <body>
    <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner py-4">
          <!-- Forgot Password -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <!-- logo -->
				<%=logo%>
				<!-- /logo -->
              </div>
              <!-- /Logo -->
              <h4 class="mb-2">ID 찾기 🔒</h4>
              <p class="mb-4">가입 시 작성했던 이름과 연락처를 입력해 주세요 </p>
              <!-- <form id="formAuthentication" class="mb-3" action="index.html" method="POST"> -->
                <div class="mb-3">
                  <label for="id" class="form-label" style="font-size: 20px; font-weight: bold;">이름</label>
                  <input type="text" id="name" class="form-control" name="name" placeholder="이름을 입력해주세요" autofocus />
                </div>
                <div class="mb-3">
                  <label for="userPhone" class="form-label" style="font-size: 20px; font-weight: bold;">연락처</label><br>
                  <input type="text" id="userPhone" class="form-control" name="userPhone" placeholder="연락처를 입력해주세요" autofocus />
                  <span id="alert-correctPhone" style="display:none; color:#d92742;">&nbsp;&nbsp;올바른 형식의 연락처를 입력해주세요.</span>
                </div>
                <button id="findIdBtn" class="btn btn-primary d-grid w-100">ID 찾기</button>
              <!-- </form> -->
              <div class="text-center" style="margin-top: 10px;">
                <a href="/login" class="d-flex align-items-center justify-content-center">
                  <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
                  로그인 페이지로 이동
                </a>
              </div>
            </div>
          </div>
          <!-- /Forgot Password -->
        </div>
      </div>
    </div>
    
    <!-- find id Modal -->
	<div class="modal fade" id="modalCenter" tabindex="-1" data-bs-backdrop="static" style="display: none;" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-m" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel4" style="color: #696CFF">이메일 찾기</h4>
				</div>
				<div class="modal-body">
					<p id="userIdShow"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="windowLocationHref();">확인</button>
				</div>
			</div>
		</div>
	</div>
    <!--/ find id Modal -->

    <!-- / Content -->

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
