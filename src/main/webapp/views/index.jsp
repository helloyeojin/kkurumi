<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%--카카오맵--%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da86c8457c75372952796f5bbc52cb25"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da86c8457c75372952796f5bbc52cb25&libraries=services,clusterer,drawing"></script>

<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

  <!-- Favicon and Touch Icons-->
  <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
  <link rel="icon" type="/image/png" sizes="32x32" href="favicon-32x32.png">
  <link rel="icon" type="/image/png" sizes="16x16" href="favicon-16x16.png">
  <link rel="stylesheet" href="/css/theme.css">
  <link rel="stylesheet" href="/vendor/tiny-slider/dist/tiny-slider.css">
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
</head>

<!-- Body-->
<body>
  <!-- Page loading spinner-->
  <div class="page-loading active">
    <div class="page-loading-inner">
      <div class="page-spinner"></div><span>Loading...</span>
    </div>
  </div>
  <jsp:include page="header.jsp"/>
  <!-- center start  -->
  <main class="page-wrapper">

    <c:choose>
      <c:when test="${center == null}">
        <jsp:include page="/views/center.jsp"/>
      </c:when>
      <c:otherwise>
        <jsp:include page="${center}.jsp"/>
      </c:otherwise>
    </c:choose>

  </main>
  <!--  Main Center End -->
  <!-- --------------------------------------------------------------------------------- -->
  <jsp:include page="footer.jsp"/>
  <!-- Vendor scrits: js libraries and plugins-->
  <script src="/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/vendor/simplebar/dist/simplebar.min.js"></script>
  <script src="/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
  <script src="/vendor/nouislider/dist/nouislider.min.js"></script>
  <script src="/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
  <!-- Main theme script-->
  <script src="/js/theme.min.js"></script>
</body>
</html>