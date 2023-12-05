<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<!-- Page content-->
<!-- Breadcrumb-->
<div class="container mt-5 mb-md-4 pt-5">
    <nav class="mb-3 pt-md-3" aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Contact us</li>
        </ol>
    </nav>
</div>
<!-- Hero-->
<section class="container mb-5 pb-2 pb-md-4 pb-lg-5">
    <div class="row align-items-md-start align-items-center gy-4">
        <div class="col-lg-5 col-md-6">
            <div class="mx-md-0 mx-auto mb-md-5 mb-4 pb-md-4 text-md-start text-center" style="max-width: 416px;">
                <h1 class="mb-4">Get in touch!</h1>
                <p class="mb-0 fs-lg text-muted">Fill out the form and out team will try to get back to you within 24 hours.</p>
            </div><img class="d-block mx-auto" src="img/real-estate/illustrations/contact.svg" alt="Illustration">
        </div>
        <div class="col-md-6 offset-lg-1">
            <div class="card border-0 bg-secondary p-sm-3 p-2">
                <div class="card-body m-1">
                    <form class="needs-validation" novalidate>
                        <div class="mb-4">
                            <label class="form-label" for="c-name">Full Name</label>
                            <input class="form-control form-control-lg" id="c-name" type="text" required>
                            <div class="invalid-tooltip mt-1">Please, enter your name</div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="c-email">Your Email</label>
                            <input class="form-control form-control-lg" id="c-email" type="email" required>
                            <div class="invalid-tooltip mt-1">Please, enter your email</div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="c-message">Message</label>
                            <textarea class="form-control form-control-lg" id="c-message" rows="4" placeholder="Leave your message" required></textarea>
                            <div class="invalid-tooltip mt-1">Please, type your message</div>
                        </div>
                        <div class="pt-sm-2 pt-1">
                            <button class="btn btn-lg btn-primary w-sm-auto w-100" type="submit">Submit form</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Contact cards-->
<section class="container mb-5 pb-2 pb-md-4 pb-lg-5">
    <div class="row g-4">
        <!-- Item-->
        <div class="col-md-4"><a class="icon-box card card-hover h-100" href="mailto:example@email.com">
            <div class="card-body">
                <div class="icon-box-media text-primary rounded-circle shadow-sm mb-3"><i class="fi-mail"></i></div><span class="d-block mb-1 text-body">Drop us a line</span>
                <h3 class="h4 icon-box-title mb-0 opacity-90">example@email.com</h3>
            </div></a></div>
        <!-- Item-->
        <div class="col-md-4"><a class="icon-box card card-hover h-100" href="tel:4065550120">
            <div class="card-body">
                <div class="icon-box-media text-primary rounded-circle shadow-sm mb-3"><i class="fi-device-mobile"></i></div><span class="d-block mb-1 text-body">Call us any time</span>
                <h3 class="h4 icon-box-title mb-0 opacity-90">(406) 555-0120</h3>
            </div></a></div>
        <!-- Item-->
        <div class="col-md-4"><a class="icon-box card card-hover h-100" href="#">
            <div class="card-body">
                <div class="icon-box-media text-primary rounded-circle shadow-sm mb-3"><i class="fi-instagram"></i></div><span class="d-block mb-1 text-body">Follow us</span>
                <h3 class="h4 icon-box-title mb-0 opacity-90">@finder_directory</h3>
            </div></a></div>
    </div>
</section>