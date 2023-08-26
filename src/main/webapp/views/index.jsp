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

  <%--datepicker--%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <%--iamport--%>
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>

  <%--web socket--%>
  <script src="/webjars/sockjs-client/sockjs.min.js"></script>
  <script src="/webjars/stomp-websocket/stomp.min.js"></script>

  <%-- font --%>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

  <%-- fixed-tab icon --%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%--toastr library--%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<%--  <link href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css" rel="stylesheet">--%>

  <style>
    * {
      font-family: 'Nanum Gothic', sans-serif;
    }
  </style>

  <!-- -------------------------------------------------------------------------------- -->
  <!-- Favicon -->
  <link rel="shortcut icon" href="/assets/favicon/logo.png" type="image/x-icon" />
  <!-- Libs CSS -->
  <link rel="stylesheet" href="/assets/css/libs.bundle.css" />
  <!-- Theme CSS -->
  <link rel="stylesheet" href="/assets/css/theme.bundle.css" />
  <!-- -------------------------------------------------------------------------------- -->
  <title>:: 봄의 향기</title>




</head>

<!-- -------------------------------------------------------------------------------- -->
<body>
<%--===============================================1:1채팅 모달 시작==========================================--%>
<div>
  <h2>hello</h2>

</div>