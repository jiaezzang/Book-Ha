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

    <title>비밀번호 찾기</title>

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
    <script>
      $(document).ready(function() {
        $("#findPwBtn").on("click", () => {
          if($("#email").val().length < 1) {
            return alert("이메일을 입력해주세요.");
          }

          if($("#option").val().length < 1) {
            return alert("질문에 대한 답을 입력해주세요.");
          }

          findPw();
        });
      });

      function findPw() {
        let sendData = {
          user_mail: $("#email").val(),
          user_option: $("#option").val()
        };

        $.ajax({
          url:"http://localhost:8080/findPw",
          type: "post",
          contentType: "application/json; charset=utf-8",
          data : JSON.stringify(sendData),
          dataType:"json",
          success : function(result){
            if(result.length < 1) {
              return alert("입력하신 정보로 PW를 못찾음");
            }
            
            let strLength = Math.floor(result[0].user_password.length / 2);
            let str = result[0].user_password.substr(0, strLength);
            let strScTemp = result[0].user_password.substr(strLength);
            let strSc = "";
            
            for(let i = 0; i < strScTemp.length; i++){
              strSc += "*";
            }

            alert($("#email").val() + "ID의 PW는 " + str + strSc + " 입니다."); 
            window.location.href = "/login";
          },
          error : function(jqXHR,textStatus,errorThrown){
            alert("서버와의 통신에 요류가 발생하였습니다.");
          }
        });
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
              <h4 class="mb-2">비밀번호 찾기 🔒</h4>
              <p class="mb-4">가입 하실때 ID와 질문의 답을 입력해 주세요 </p>
              <!-- <form id="formAuthentication" class="mb-3" action="index.html" method="POST"> -->
                <div class="mb-3">
                  <label for="id" class="form-label" style="font-size: 20px; font-weight: bold;">ID</label>
                  <input type="text" class="form-control" id="email" name="email" placeholder="Email을 입력해주세요" autofocus />
                </div>
                <div class="mb-3">
                  <label for="option" class="form-label" style="font-size: 20px; font-weight: bold;">질문</label><br>
                  <label class="form-label">가입시 입력했던 전화번호</label>
                  <input type="text" id="option" class="form-control" name="option" placeholder="전화번호" autofocus />
                </div>
                <button id="findPwBtn" class="btn btn-primary d-grid w-100">비밀번호 찾기</button>
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
