<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- beautify ignore:start -->
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

    <title>카카오 추가 정보 입력</title>

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
    <script type="text/javascript">		
			// $("#signBtn").on("click", function() {
			// 	$.ajax({
			// 		type: "POST",
			// 		url:"http://localhost:8080/kakaoUser/userInfo",
			// 		dataType:"text",
			// 		success : function(result){
			// 			alert(result);
			// 		},
			// 		error : function(a, b, c){
			// 			alert("통신 장애");
			// 		}
			// 	});		
			// })
    

    $(document).ready(function() {
        phoneNo();

        $("#kakaoChkSameId").on("click", () => {
          let sendData = {
            user_mail: $("#userId").val().trim()
          };

          $.ajax({
            url:"http://localhost:8080/signUp/chkSameId",
            type: "post",
            contentType: "application/json; charset=utf-8",
            data : JSON.stringify(sendData),
            dataType:"json",
            success : function(result){
              if(result === 0) {
                $("#signBtn").attr("status", "true");
                $("#userId").css("border", "1px solid red");
                alert("아이디가 중복 됩니다.");
              } else {
                $("#signBtn").attr("status", "false");
                // $("#userId").css("border", "1px solid #d9dee3");
                // $("#userId").css("border", "1px solid #696cff");
                $("#userId").css("border", "1px solid green");
              }
            },
            error : function(jqXHR,textStatus,errorThrown){
              console.log(jqXHR);
              console.log(textStatus);
              console.log(errorThrown);
            }
          });

        }); 

        $("#kakaoChkSameNickname").on("click", () => {
          let sendData = {
            user_nickname: $("#userNickname").val().trim()
          };

          $.ajax({
            url:"http://localhost:8080/signUp/chkSameNickname",
            type: "post",
            contentType: "application/json; charset=utf-8",
            data : JSON.stringify(sendData),
            dataType:"json",
            success : function(result){
              if(result === 0) {
                $("#signBtn").attr("status", "true");
                $("#userNickname").css("border", "1px solid red");
                alert("닉네임이 중복 됩니다.");
              } else {
                $("#signBtn").attr("status", "false");
                // $("#userId").css("border", "1px solid #d9dee3");
                // $("#userId").css("border", "1px solid #696cff");
                $("#userNickname").css("border", "1px solid green");
              }
            },
            error : function(jqXHR,textStatus,errorThrown){
              console.log(jqXHR);
              console.log(textStatus);
              console.log(errorThrown);
            }
          });

        }); 

        $('#signBtn').on("click", function() {
          if($(this).attr("status") === "true") {
            $("#userId").css("border", "1px solid red");
            return alert("아이디 중복검사를 해주세요.");
          }

          if($('#userId').val().trim() === ''){
            return alert('ID를 입력 해주세요.');
          }
      
          if($('#userName').val().trim() === ''){
            return alert('이름을 입력 해주세요.');
          }

          if($(this).attr("status") === "true") {
            $("#userNickname").css("border", "1px solid red");
            return alert("닉네임 중복검사를 해주세요.");
          }

          if($('#userNickname').val().trim() === ''){
            return alert('닉네임을 입력 해주세요.');
          }

          if($('#phonenumber').val().trim() === ''){
            return alert('휴대전화번호를 입력 해주세요.');
          }
        
          if(!$("#checkbox").prop("checked")){
            return alert('개인정보 정책에 동의 해주세요.');
          }

          signUp();
        })
      });

      function phoneNo() {
        $("#phonenumber").on("keyup", () => {
          $("#phonenumber").val( $("#phonenumber").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
        });
      }

      function signUp() {
        let sendData = {
          user_mail: $("#userId").val(),
          user_password: $("#password").val(),
          user_name: $("#userName").val(),
          user_nickname: $("#userNickname").val(),
          user_phonenumber: $("#phonenumber").val().replaceAll("-", ""),
          // userProfile: $("#"),
          // userProfile_size: $("#"),
          // userSelf: $("#"),
          // user_enterdate: new Date().toLocaleDateString(),
          // user_final: new Date().toLocaleDateString(),
          user_enterdate: null,
          user_final: null,
          user_role: "USER",
          user_option: $("#option").val()
        };

        $.ajax({
          url:"http://localhost:8080/kakaoUser/userInfo",
          type: "post",
          contentType: "application/json; charset=utf-8",
          data : JSON.stringify(sendData),
          dataType:"json",
          success : function(result){
            window.location.href = "/";
          },
          error : function(jqXHR,textStatus,errorThrown){
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
          }
        });
      }
		
    </script>
  </head>

  <body>
    <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register Card -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="index" class="app-brand-link gap-2">
                  <span class="app-brand-logo demo">
                    <svg
                      width="25"
                      viewBox="0 0 25 42"
                      version="1.1"
                      xmlns="http://www.w3.org/2000/svg"
                      xmlns:xlink="http://www.w3.org/1999/xlink"
                    >
                      <defs>
                        <path
                          d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                          id="path-1"
                        ></path>
                        <path
                          d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                          id="path-3"
                        ></path>
                        <path
                          d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                          id="path-4"
                        ></path>
                        <path
                          d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                          id="path-5"
                        ></path>
                      </defs>
                      <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                          <g id="Icon" transform="translate(27.000000, 15.000000)">
                            <g id="Mask" transform="translate(0.000000, 8.000000)">
                              <mask id="mask-2" fill="white">
                                <use xlink:href="#path-1"></use>
                              </mask>
                              <use fill="#696cff" xlink:href="#path-1"></use>
                              <g id="Path-3" mask="url(#mask-2)">
                                <use fill="#696cff" xlink:href="#path-3"></use>
                                <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                              </g>
                              <g id="Path-4" mask="url(#mask-2)">
                                <use fill="#696cff" xlink:href="#path-4"></use>
                                <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                              </g>
                            </g>
                            <g
                              id="Triangle"
                              transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                            >
                              <use fill="#696cff" xlink:href="#path-5"></use>
                              <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                            </g>
                          </g>
                        </g>
                      </g>
                    </svg>
                  </span>
                  <span class="app-brand-text demo text-body fw-bolder">Book-Ha</span>
                </a>
              </div>
              <!-- /Logo -->
              <h4 class="mb-2">추가 정보 입력 🚀</h4>
              <p class="mb-4">자신의 생각과 타인의 생각을 찾아서</p>

             <!-- <form id="formAuthentication" class="mb-3" action="/signUp" method="POST"> -->
                <div class="mb-3">
                  <label for="userId" class="form-label">E-mail</label>
                  <input type="text" class="form-control" id="userId" name="userId" placeholder="E-mail"/>
                  <span id="kakaoChkSameId" style="float: right; margin: 5px 0px 0px 0px; color: #5f61e6;">중복검사</span>
                </div>
                <div class="mb-3">
                  <label for="userName" class="form-label">이름</label>
                  <input type="text" class="form-control" id="userName" name="userName" placeholder="이름" />
                </div>
                <div class="mb-3">
                  <label for="userNickname" class="form-label">닉네임</label>
                  <input type="text" class="form-control" id="userNickname" name="userNickname" placeholder="닉네임" />
                  <span id="kakaoChkSameNickname" style="float: right; margin: 5px 0px 0px 0px; color: #5f61e6;">중복검사</span>

                </div>
               <div class="mb-3">
                 <label for="phonenumber" class="form-label">연락처</label>
                 <input type="text" class="form-control" id="phonenumber" name="phonenumber" placeholder="연락처" />
               </div>

                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="checkbox" name="terms" value="1" />
                    <label class="form-check-label" for="terms-conditions">
                      개인정보 정책에 동의합니다.
                      <a href="/register_policy">개인정보 정책</a>
                    </label>
                  </div>
                </div>
                <button type="submit" id="signBtn" class="btn btn-primary d-grid w-100" status="true">Sign up</button>
              <!-- </form> -->

              <p class="text-center">
                <span>회원가입을 하셨나요?</span>
                <a href="/login">
                  <span>로그인하러가기</span>
                </a>
              </p>
            </div>
          </div>
          <!-- Register Card -->
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

  </body>
</html>
