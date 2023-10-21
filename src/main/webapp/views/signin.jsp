<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>



<head>
    <%@ include file="header.jsp" %>
</head>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Finder | Sign In Page</title>
  <!-- SEO Meta Tags-->
  <meta name="description" content="Finder - Directory &amp; Listings Bootstrap Template">
  <meta name="keywords" content="bootstrap, business, directory, listings, e-commerce, car dealer, city guide, real estate, job board, user account, multipurpose, ui kit, html5, css3, javascript, gallery, slider, touch">
  <meta name="author" content="Createx Studio">
  <!-- Viewport-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Favicon and Touch Icons-->
  <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
  <link rel="manifest" href="site.webmanifest">
  <link rel="mask-icon" color="#5bbad5" href="safari-pinned-tab.svg">
  <meta name="msapplication-TileColor" content="#766df4">
  <meta name="theme-color" content="#ffffff">
  <!-- Page loading styles-->
  <style>
    .page-loading {
      position: fixed;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 100%;
      -webkit-transition: all .4s .2s ease-in-out;
      transition: all .4s .2s ease-in-out;
      background-color: #fff;
      opacity: 0;
      visibility: hidden;
      z-index: 9999;
    }
    .page-loading.active {
      opacity: 1;
      visibility: visible;
    }
    .page-loading-inner {
      position: absolute;
      top: 50%;
      left: 0;
      width: 100%;
      text-align: center;
      -webkit-transform: translateY(-50%);
      transform: translateY(-50%);
      -webkit-transition: opacity .2s ease-in-out;
      transition: opacity .2s ease-in-out;
      opacity: 0;
    }
    .page-loading.active > .page-loading-inner {
      opacity: 1;
    }
    .page-loading-inner > span {
      display: block;
      font-size: 1rem;
      font-weight: normal;
      color: #666276;;
    }
    .page-spinner {
      display: inline-block;
      width: 2.75rem;
      height: 2.75rem;
      margin-bottom: .75rem;
      vertical-align: text-bottom;
      border: .15em solid #bbb7c5;
      border-right-color: transparent;
      border-radius: 50%;
      -webkit-animation: spinner .75s linear infinite;
      animation: spinner .75s linear infinite;
    }
    @-webkit-keyframes spinner {
      100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    @keyframes spinner {
      100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }

  </style>
  <!-- Page loading scripts-->
  <script>
    (function () {
      window.onload = function () {
        var preloader = document.querySelector('.page-loading');
        preloader.classList.remove('active');
        setTimeout(function () {
          preloader.remove();
        }, 2000);
      };
    })();

  </script>
  <!-- Vendor Styles-->
  <link rel="stylesheet" media="screen" href="vendor/simplebar/dist/simplebar.min.css"/>
  <!-- Main Theme Styles + Bootstrap-->
  <link rel="stylesheet" media="screen" href="css/theme.min.css">
</head>
<!-- Body-->
<body class="bg-secondary">
<!-- Page loading spinner-->
<div class="page-loading active">
  <div class="page-loading-inner">
    <div class="page-spinner"></div><span>Loading...</span>
  </div>
</div>
<main class="page-wrapper">
  <!-- Page content-->
  <div class="container-fluid d-flex h-100 align-items-center justify-content-center py-4 py-sm-5">
    <div class="card card-body" style="max-width: 940px"><a class="position-absolute top-0 end-0 nav-link fs-sm py-1 px-2 mt-3 me-3" href="#" onclick="window.history.go(-1); return false;"><i class="fi-arrow-long-left fs-base me-2"></i>국민은행이 처음이신가요?</a>




         <div class="row mx-0 align-items-center">





        <div class="col-md-6 border-end-md p-2 p-sm-5">





<a>디테일은 추후에 잡겠습니다.</a>
           <div id="myCarousel" class="carousel slide" width="600"  data-ride="carousel">
             <!-- 슬라이더 인디케이터 추가 (선택 사항) -->
             <ul class="carousel-indicators">
               <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
               <li data-target="#myCarousel" data-slide-to="1"></li>
               <li data-target="#myCarousel" data-slide-to="2"></li>
             </ul>
             <!-- 슬라이더 내용 추가 -->
               <div class="carousel-inner">
                   <div class="carousel-item active">
                       <img src="img/signin-modal/signin.png" alt="Slide 1" width="600" height="400">
                   </div>
                   <div class="carousel-item">
                       <img src="img/signin-modal/signin2.png" alt="Slide 2" width="600" height="400">
                   </div>
                   <div class carousel-item">
                   <img src="img/signin-modal/signin3.png" alt="Slide 3" width="600" height="400">
               </div>
           </div>

            <!-- 이전 및 다음 버튼 추가 (선택 사항) -->

           </div>






         </div>


        <a class="carousel-control-prev text-dark" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon text-dark" aria-hidden="true"></span>
        </a>
        <a class="carousel-control-next text-dark" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon text-dark" aria-hidden="true"></span>
        </a>



         <div class="col-md-6 px-2 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5">

           </i></a>


          <div class="mb-4">
            <label class="form-label mb-2" for="signin-email">이름</label>
            <input class="form-control" type="email" id="signin-email" placeholder="이름을 입력해주세요" required>
          </div>
          <div class="mb-4">
            <div class="d-flex align-items-center justify-content-between mb-2">
              <label class="form-label mb-0" for="signin-password">휴대폰번호</label><a class="fs-sm" href="#">Forgot password?</a>
            </div>
            <div class="password-toggle">
              <input class="form-control" type="password" id="signin-password" placeholder="휴대폰 번호를 입력해주세요" required>
              <label class="password-toggle-btn" aria-label="Show/hide password">
                <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
              </label>
            </div>
          </div>
          <button class="btn btn-warning btn-lg w-100" type="submit" style="color: black;">KB모바일인증서 로그인</button>




          <div class="d-flex align-items-center py-3 mb-3">

            <hr class="w-100">



            <div class="px-3">Or</div>



            <hr class="w-100">

          </div>
             <a class="btn btn-outline-info w-100 mb-3" href="#">   </i>금융인증서 로그인</a>






             <a class="btn btn-outline-info w-100 mb-3" href="#"></i>공동인증서 로그인</a>
          <form class="needs-validation" novalidate>






          </form>
        </div>
      </div>
    </div>
  </div>
</main>
<!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
<!-- Vendor scrits: js libraries and plugins-->
<script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="vendor/simplebar/dist/simplebar.min.js"></script>
<script src="vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>




<script>
  $(document).ready(function() {
    $('#myCarousel').carousel({
      interval: 300 // 3초마다 슬라이드
    });
  });
</script>


<!-- Main theme script-->
<script src="js/theme.min.js"></script>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>