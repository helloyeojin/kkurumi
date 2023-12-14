<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/theme.min.js"></script>


<script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="vendor/simplebar/dist/simplebar.min.js"></script>
<script src="vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script>
  let loginForm = {
    init:function(){
      $("#loginBtn").click(function(){
        loginForm.send();
      });
    },
    send:function(){
      $("#loginForm").attr({
        'action':'/loginImpl',
        'method':'post'
      });
      $("#loginForm").submit();
    }
  };
  $(function(){
    $('#myCarousel').carousel({
      interval: 200 // 3초마다 슬라이드
    });
    loginForm.init();

    $('.IDloginbtn').click(()=>{
      $('#IDlogin').show();
      $('#CERTlogin').hide();
      $('.IDloginbtn').addClass('active');
      $('.CERTloginbtn').removeClass('active');
    });
    $('.CERTloginbtn').click(()=>{
      $('#CERTlogin').show();
      $('#IDlogin').hide();
      $('.IDloginbtn').removeClass('active');
      $('.CERTloginbtn').addClass('active');
    });
  });
</script>



<!-- Vendor Styles-->
<link rel="stylesheet" media="screen" href="vendor/simplebar/dist/simplebar.min.css"/>
<!-- Main Theme Styles + Bootstrap-->
<link rel="stylesheet" media="screen" href="css/theme.min.css">



<!-- Sign In Modal-->
<div class="modal fade" id="signin-modal" tabindex="-1" aria-hidden="true">


  <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="max-width: 950px;">
    <div class="modal-content">
      <div class="container-fluid d-flex h-100 align-items-center justify-content-center py-4 py-sm-5">
        <div class="card card-body" style="max-width: 940px"><a class="position-absolute top-0 end-0 nav-link fs-sm py-1 px-2 mt-3 me-3" href="#" onclick="window.history.go(-1); return false;"><i class="fi-arrow-long-left fs-base me-2"></i>국민은행이 처음이신가요?</a>
          <div class="row mx-0 align-items-center">
            <div class="col-md-6 border-end-md p-2">
              <div id="myCarousel" class="carousel slide" width="600"  data-ride="carousel">
                <!-- 슬라이더 인디케이터 추가 (선택 사항) -->
                <ul class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
                </ul>
                <!-- 슬라이더 내용 추가 -->
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="/img/loginimg1.png" alt="Slide 2" width="600" height="400">
                  </div>
                  <div class="carousel-item ">
                    <img src="/img/loginimg2.png" alt="Slide 1" width="600" height="400">
                  </div>
                  <div class="carousel-item">
                    <img src="/img/loginimg3.png" alt="Slide 3" width="600" height="400">
                  </div>
                </div>
                <!-- 이전 및 다음 버튼 추가 (선택 사항) -->
                <a class="carousel-control-prev text-dark" href="#myCarousel" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon text-dark" aria-hidden="true"></span>
                </a>
                <a class="carousel-control-next text-dark" href="#myCarousel" role="button" data-slide="next">
                  <span class="carousel-control-next-icon text-dark" aria-hidden="true"></span>
                </a>
              </div>

            </div>



            <div class="col-md-6 px-2 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5">
              <div class="" style="margin-left: 5.5%;margin-bottom: 8%;">
                <button type="button" class="btn btn-outline-warning rounded-0 IDloginbtn active">아이디 로그인</button>
                <button type="button" class="btn btn-outline-warning rounded-0 CERTloginbtn" style="margin-left: -1.5%;">인증서 로그인</button>
              </div>
              <div id="IDlogin" style="">
                <form class="form-validate" id="loginForm">
                  <div class="mb-4">
                    <label class="form-label mb-2" for="signin-email">아이디</label>
                    <input class="form-control"  id="signin-email" name="user_name" placeholder="아이디를 입력해주세요" value="admin" required>
                  </div>
                  <div class="mb-4">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                      <label class="form-label mb-0" for="signin-password">비밀번호</label><a class="fs-sm" href="#">비밀번호를 잊어버리셨나요?</a>
                    </div>
                    <div class="password-toggle">
                      <input class="form-control" type="password" id="signin-password" placeholder="비밀번호를 입력해주세요" value="admin" required>
                      <label class="password-toggle-btn" aria-label="Show/hide password">
                        <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                      </label>
                    </div>
                  </div>
                  <button class="btn btn-warning btn-lg w-100" id="loginBtn" type="submit" style="color: black;">아이디 로그인</button>
                </form>
              </div>
              <div id="CERTlogin" style="display:none;">
                <form class="form-validate" id="">
                  <div class="mb-4">
                    <label class="form-label mb-2" for="signin-email2">이름</label>
                    <input class="form-control"  id="signin-email2" name="user_name" placeholder="이름을 입력해주세요" required>
                  </div>
                  <div class="mb-4">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                      <label class="form-label mb-0" for="signin-password2">생년월일</label>
                    </div>
                    <div class="password-toggle">
                      <input class="form-control" type="password" id="signin-password2" placeholder="생년월일을 입력해주세요" required>
                      <label class="password-toggle-btn" aria-label="Show/hide password">
                        <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                      </label>
                    </div>
                  </div>
                  <div class="mb-4">
                    <label class="form-label mb-2" for="signin-phonenumber1">휴대폰번호</label>
                    <input class="form-control"  id="signin-phonenumber1" placeholder="휴대폰번호를 입력해주세요" required>
                  </div>
                  <button class="btn btn-warning btn-lg w-100" id="" type="submit" style="color: black;">국민인증서 로그인</button>
                </form>
              </div>



              <div class="d-flex align-items-center py-3 mb-3">

                <hr class="w-100">



                <div class="px-3">Or</div>



                <hr class="w-100">

              </div>
              <a class="btn btn-outline-info w-100 mb-3" href="#"></i>금융인증서 로그인</a>
              <a class="btn btn-outline-info w-100 mb-3" href="#"></i>공동인증서 로그인</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Sign Up Modal-->
<div class="modal fade" id="signup-modal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="max-width: 950px;">
    <div class="modal-content">
      <div class="modal-body px-0 py-2 py-sm-0">
        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
        <div class="row mx-0 align-items-center">
          <div class="col-md-6 border-end-md p-4 p-sm-5">
            <h2 class="h3 mb-4 mb-sm-5">Join Finder.<br>Get premium benefits:</h2>
            <ul class="list-unstyled mb-4 mb-sm-5">
              <li class="d-flex mb-2"><i class="fi-check-circle text-primary mt-1 me-2"></i><span>Add and promote your listings</span></li>
              <li class="d-flex mb-2"><i class="fi-check-circle text-primary mt-1 me-2"></i><span>Easily manage your wishlist</span></li>
              <li class="d-flex mb-0"><i class="fi-check-circle text-primary mt-1 me-2"></i><span>Leave reviews</span></li>
            </ul><img class="d-block mx-auto" src="/img/signin-modal/signup.svg" width="344" alt="Illustartion">
            <div class="mt-sm-4 pt-md-3">Already have an account? <a href="#signin-modal" data-bs-toggle="modal" data-bs-dismiss="modal">로그인</a></div>
          </div>
          <div class="col-md-6 px-4 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5"><a class="btn btn-outline-info w-100 mb-3" href="#"><i class="fi-google fs-lg me-1"></i>Sign in with Google</a><a class="btn btn-outline-info w-100 mb-3" href="#"><i class="fi-facebook fs-lg me-1"></i>Sign in with Facebook</a>
            <div class="d-flex align-items-center py-3 mb-3">
              <hr class="w-100">
              <div class="px-3">Or</div>
              <hr class="w-100">
            </div>
            <form class="needs-validation" novalidate>
              <div class="mb-4">
                <label class="form-label" for="signup-name">Full name</label>
                <input class="form-control" type="text" id="signup-name" placeholder="Enter your full name" required>
              </div>
              <div class="mb-4">
                <label class="form-label" for="signup-email">Email address</label>
                <input class="form-control" type="email" id="signup-email" placeholder="Enter your email" required>
              </div>
              <div class="mb-4">
                <label class="form-label" for="signup-password">Password <span class='fs-sm text-muted'>min. 8 char</span></label>
                <div class="password-toggle">
                  <input class="form-control" type="password" id="signup-password" minlength="8" required>
                  <label class="password-toggle-btn" aria-label="Show/hide password">
                    <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                  </label>
                </div>
              </div>
              <div class="mb-4">
                <label class="form-label" for="signup-password-confirm">Confirm password</label>
                <div class="password-toggle">
                  <input class="form-control" type="password" id="signup-password-confirm" minlength="8" required>
                  <label class="password-toggle-btn" aria-label="Show/hide password">
                    <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                  </label>
                </div>
              </div>
              <div class="form-check mb-4">
                <input class="form-check-input" type="checkbox" id="agree-to-terms" required>
                <label class="form-check-label" for="agree-to-terms">By joining, I agree to the <a href='#'>Terms of use</a> and <a href='#'>Privacy policy</a></label>
              </div>
              <button class="btn btn-primary btn-lg w-100" type="submit">Sign up         </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Navbar-->
<header class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-scroll-header>
  <div class="container"><a class="navbar-brand me-3 me-xl-4" href="/"><img class="d-block" src="/img/logo/logo_bank.png" width="170" alt="KB국민은행"></a>
    <c:choose>
      <c:when test="${loginCust == null}">
        <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button><a class="btn btn-sm text-primary d-none d-lg-block order-lg-3" href="#signin-modal" data-bs-toggle="modal"><i class="fi-user me-2"></i>로그인</a>
      </c:when>
      <c:otherwise>
        <a id="logoutLink" class="btn btn-sm text-primary d-none d-lg-block order-lg-3" href="/logoutImpl">
          <i class="fi-user me-2"></i>로그아웃
        </a>
      </c:otherwise>
    </c:choose>
    <c:if test="${loginCust.user_name != 'admin'}">
      <a class="btn btn-primary btn-sm ms-2 order-lg-3" href="https://obank.kbstar.com/quics?page=C018872"><i class="fi-lock me-2"></i>인증<span class='d-none d-sm-inline'>센터</span></a>
    </c:if>
    <div class="collapse navbar-collapse order-lg-2" id="navbarNav">
      <ul class="navbar-nav navbar-nav-scroll" style="max-height: 35rem;">
        <!-- Menu items-->
        <c:choose>
          <c:when test="${loginCust.user_name == 'admin'}">
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">금융상품</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/K10100">요구불</a></li>
                <li><a class="dropdown-item" href="/K10200">정기예금</a></li>
                <li><a class="dropdown-item" href="/K10300">적금</a></li>
                <li><a class="dropdown-item" href="/K20100">개인대출</a></li>
                <li><a class="dropdown-item" href="/K20200">사업자대출</a></li>
                <li><a class="dropdown-item" href="/K30100">KB카드</a></li>
              </ul>
            </li>
          </c:when>
          <c:otherwise>
            <li class="nav-item dropdown active"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">금융상품</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/K10100">요구불</a></li>
                <li><a class="dropdown-item" href="/K10200">정기예금</a></li>
                <li><a class="dropdown-item" href="/K10300">적금</a></li>
                <li><a class="dropdown-item" href="/K20100">개인대출</a></li>
                <li><a class="dropdown-item" href="/K20200">사업자대출</a></li>
                <li><a class="dropdown-item" href="/K30100">KB카드</a></li>
              </ul>
            </li>
          </c:otherwise>
        </c:choose>
        <li class="nav-item dropdown"><a class="nav-link" href="/E00001" role="button" data-bs-toggle="dropdown" aria-expanded="false">이벤트</a>
        </li>
        <li class="nav-item dropdown"><a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">고객정보</a>
        </li>
        <c:if test="${loginCust.user_name == 'admin'}">
          <li class="nav-item dropdown active"><a class="nav-link" href="/B00002" role="button">통계센터</a>
          </li>
        </c:if>
      </ul>
    </div>
  </div>
</header>

