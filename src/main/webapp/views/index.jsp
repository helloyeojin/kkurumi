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
</head>

<!-- Body-->
<body>
  <!-- Page loading spinner-->
  <div class="page-loading active">
    <div class="page-loading-inner">
      <div class="page-spinner"></div><span>Loading...</span>
    </div>
  </div>
  <main class="page-wrapper">
    <jsp:include page="header.jsp"/>
    <!-- Page content-->
    <!-- Property cost calculator modal-->
    <div class="modal fade" id="cost-calculator" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header d-block position-relative border-0 px-sm-5 px-4">
            <h3 class="h4 modal-title mt-4 text-center">Explore your property’s value</h3>
            <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body px-sm-5 px-4">
            <form class="needs-validation" novalidate>
              <div class="mb-3">
                <label class="form-label fw-bold mb-2" for="property-city">Property location</label>
                <select class="form-control form-select" id="property-city" required>
                  <option value="" selected disabled hidden>Choose city</option>
                  <option value="Chicago">Chicago</option>
                  <option value="Dallas">Dallas</option>
                  <option value="Los Angeles">Los Angeles</option>
                  <option value="New York">New York</option>
                  <option value="San Diego">San Diego</option>
                </select>
                <div class="invalid-feedback">Please choose the city.</div>
              </div>
              <div class="mb-3">
                <select class="form-control form-select" id="property-district" required>
                  <option value="" selected disabled hidden>Choose district</option>
                  <option value="Brooklyn">Brooklyn</option>
                  <option value="Manhattan">Manhattan</option>
                  <option value="Staten Island">Staten Island</option>
                  <option value="The Bronx">The Bronx</option>
                  <option value="Queens">Queens</option>
                </select>
                <div class="invalid-feedback">Please choose the district.</div>
              </div>
              <div class="pt-2 mb-3">
                <label class="form-label fw-bold mb-2" for="property-address">Address</label>
                <input class="form-control" type="text" id="property-address" placeholder="Enter your address" required>
                <div class="invalid-feedback">Please enter your property's address.</div>
              </div>
              <div class="pt-2 mb-3">
                <label class="form-label fw-bold mb-2">Number of rooms</label>
                <div class="btn-group" role="group" aria-label="Choose number of rooms">
                  <input class="btn-check" type="radio" id="rooms-1" name="rooms">
                  <label class="btn btn-outline-secondary" for="rooms-1">1</label>
                  <input class="btn-check" type="radio" id="rooms-2" name="rooms">
                  <label class="btn btn-outline-secondary" for="rooms-2">2</label>
                  <input class="btn-check" type="radio" id="rooms-3" name="rooms">
                  <label class="btn btn-outline-secondary" for="rooms-3">3</label>
                  <input class="btn-check" type="radio" id="rooms-4" name="rooms">
                  <label class="btn btn-outline-secondary" for="rooms-4">4</label>
                  <input class="btn-check" type="radio" id="rooms-5" name="rooms">
                  <label class="btn btn-outline-secondary" for="rooms-5">5+</label>
                </div>
              </div>
              <div class="pt-2 mb-4">
                <label class="form-label fw-bold mb-2" for="property-area">Total area, sq.m.</label>
                <input class="form-control" type="text" id="property-area" placeholder="Enter your area" required>
                <div class="invalid-feedback">Please enter your property's area.</div>
              </div>
              <button class="btn btn-primary d-block w-100 mb-4" type="submit"><i class="fi-calculator me-2"></i>Calculate</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- Hero-->
    <section class="container pt-5 my-5 pb-lg-4">
      <div class="row pt-0 pt-md-2 pt-lg-0">
        <div class="col-xl-7 col-lg-6 col-md-5 order-md-2 mb-4 mb-lg-3"><img src="img/real-estate/hero-image.jpg" alt="Hero image"></div>
        <div class="col-xl-5 col-lg-6 col-md-7 order-md-1 pt-xl-5 pe-lg-0 mb-3 text-md-start text-center">
          <h1 class="display-4 mt-lg-5 mb-md-4 mb-3 pt-md-4 pb-lg-2">Easy way to find <br> a perfect property</h1>
          <p class="position-relative lead me-lg-n5">We provide a complete service for the sale, purchase or rental of real estate. We have been operating more than 10 years. Search millions of apartments and houses on Finder.</p>
        </div>
        <!-- Search property form group-->
        <div class="col-xl-8 col-lg-10 order-3 mt-lg-n5">
          <form class="form-group d-block">
            <div class="row g-0 ms-sm-n2">
              <div class="col-md-8 d-sm-flex align-items-center">
                <div class="dropdown w-sm-50 border-end-sm" data-bs-toggle="select">
                  <button class="btn btn-link dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-home me-2"></i><span class="dropdown-toggle-label">For rent</span></button>
                  <input type="hidden">
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">For rent</span></a></li>
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">For sale</span></a></li>
                  </ul>
                </div>
                <hr class="d-sm-none my-2">
                <div class="dropdown w-sm-50 border-end-sm" data-bs-toggle="select">
                  <button class="btn btn-link dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-map-pin me-2"></i><span class="dropdown-toggle-label">Location</span></button>
                  <input type="hidden">
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">New York</span></a></li>
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">Chicago</span></a></li>
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">Los Angeles</span></a></li>
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">San Diego</span></a></li>
                  </ul>
                </div>
                <hr class="d-sm-none my-2">
                <div class="dropdown w-sm-50 border-end-md" data-bs-toggle="select">
                  <button class="btn btn-link dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-list me-2"></i><span class="dropdown-toggle-label">Property type</span></button>
                  <input type="hidden">
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">Houses</span></a></li>
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">Apartments</span></a></li>
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">Commercial</span></a></li>
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">Daily rental</span></a></li>
                    <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">New buildings</span></a></li>
                  </ul>
                </div>
              </div>
              <hr class="d-md-none mt-2">
              <div class="col-md-4 d-sm-flex align-items-center pt-4 pt-md-0">
                <div class="d-flex align-items-center w-100 pt-2 pb-4 py-sm-0 ps-2 ps-sm-3"><i class="fi-cash fs-lg text-muted me-2"></i><span class="text-muted">Price</span>
                  <div class="range-slider pe-0 pe-sm-3" data-start-min="450" data-min="0" data-max="1000" data-step="1">
                    <div class="range-slider-ui"></div>
                    <input class="form-control range-slider-value-min" type="hidden">
                  </div>
                </div>
                <button class="btn btn-icon btn-primary px-3 w-100 w-sm-auto flex-shrink-0" type="button"><i class="fi-search"></i><span class="d-sm-none d-inline-block ms-2">Search</span></button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
    <!-- Property categories-->
    <section class="container mb-5">
      <div class="row row-cols-lg-6 row-cols-sm-3 row-cols-2 g-3 g-xl-4">
        <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-rent.html">
          <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-real-estate-house"></i></div>
          <h3 class="icon-box-title fs-base mb-0">Houses</h3></a></div>
        <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-sale.html">
          <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-apartment"></i></div>
          <h3 class="icon-box-title fs-base mb-0">Apartments</h3></a></div>
        <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-rent.html">
          <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-shop"></i></div>
          <h3 class="icon-box-title fs-base mb-0">Commercial</h3></a></div>
        <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-sale.html">
          <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-rent"></i></div>
          <h3 class="icon-box-title fs-base mb-0">Daily rental</h3></a></div>
        <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-rent.html">
          <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-house-chosen"></i></div>
          <h3 class="icon-box-title fs-base mb-0">New buildings</h3></a></div>
        <div class="col">
          <div class="dropdown h-100"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover text-center" href="#" data-bs-toggle="dropdown">
            <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-dots-horisontal"></i></div>
            <h3 class="icon-box-title fs-base mb-0">More</h3></a>
            <div class="dropdown-menu dropdown-menu-end my-1"><a class="dropdown-item fw-bold" href="real-estate-catalog-sale.html"><i class="fi-single-bed fs-base opacity-60 me-2"></i>Room</a><a class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i class="fi-computer fs-base opacity-60 me-2"></i>Office</a><a class="dropdown-item fw-bold" href="real-estate-catalog-sale.html"><i class="fi-real-estate-buy fs-base opacity-60 me-2"></i>Land</a><a class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i class="fi-parking fs-base opacity-60 me-2"></i>Parking lot</a></div>
          </div>
        </div>
      </div>
    </section>
    <!-- Services-->
    <section class="container mb-5 mt-n3 mt-lg-0">
      <div class="tns-carousel-wrapper tns-nav-outside tns-nav-outside-flush mx-n2">
        <div class="tns-carousel-inner row gx-4 mx-0 py-3" data-carousel-options="{&quot;items&quot;: 3, &quot;controls&quot;: false, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3}}}">
          <div class="col">
            <div class="card card-hover border-0 h-100 pb-2 pb-sm-3 px-sm-3 text-center"><img class="d-block mx-auto my-3" src="img/real-estate/illustrations/buy.svg" width="256" alt="Illustration">
              <div class="card-body">
                <h2 class="h4 card-title">Buy a property</h2>
                <p class="card-text fs-sm">Blandit lorem dictum in velit. Et nisi at faucibus mauris pretium enim. Risus sapien nisi aliquam egestas leo dignissim.</p>
              </div>
              <div class="card-footer pt-0 border-0"><a class="btn btn-outline-primary stretched-link" href="real-estate-catalog-sale.html">Find a home</a></div>
            </div>
          </div>
          <div class="col">
            <div class="card card-hover border-0 h-100 pb-2 pb-sm-3 px-sm-3 text-center"><img class="d-block mx-auto my-3" src="img/real-estate/illustrations/sell.svg" width="256" alt="Illustration">
              <div class="card-body">
                <h2 class="h4 card-title">Sell a property</h2>
                <p class="card-text fs-sm">Amet, cras orci justo, tortor nisl aliquet. Enim tincidunt tellus nunc, nulla arcu posuere quis. Velit turpis orci venenatis.</p>
              </div>
              <div class="card-footer pt-0 border-0"><a class="btn btn-outline-primary stretched-link" href="#">Place an ad</a></div>
            </div>
          </div>
          <div class="col">
            <div class="card card-hover border-0 h-100 pb-2 pb-sm-3 px-sm-3 text-center"><img class="d-block mx-auto my-3" src="img/real-estate/illustrations/rent.svg" width="256" alt="Illustration">
              <div class="card-body">
                <h2 class="h4 card-title">Rent a property</h2>
                <p class="card-text fs-sm">Sed sed aliquet sed id purus malesuada congue viverra. Habitant quis lacus, volutpat natoque ipsum iaculis cursus.</p>
              </div>
              <div class="card-footer pt-0 border-0"><a class="btn btn-outline-primary stretched-link" href="real-estate-catalog-rent.html">Find a rental</a></div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <hr class="mt-n1 mb-5 d-md-none">
    <!-- Top offers (carousel)-->
    <section class="container mb-5 pb-md-4">
      <div class="d-flex align-items-center justify-content-between mb-3">
        <h2 class="h3 mb-0">Top offers</h2><a class="btn btn-link fw-normal p-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
      </div>
      <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
        <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
          <!-- Item-->
          <div class="col">
            <div class="card shadow-sm card-hover border-0 h-100">
              <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-info">New</span></div>
                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                  <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                </div><img src="img/real-estate/catalog/01.jpg" alt="Image">
              </div>
              <div class="card-body position-relative pb-3">
                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For rent</h4>
                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">3-bed Apartment | 67 sq.m</a></h3>
                <p class="mb-2 fs-sm text-muted">3811 Ditmars Blvd Astoria, NY 11105</p>
                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$1,629</div>
              </div>
              <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">3<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
            </div>
          </div>
          <!-- Item-->
          <div class="col">
            <div class="card shadow-sm card-hover border-0 h-100">
              <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-danger">Featured</span></div>
                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                  <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                </div><img src="img/real-estate/catalog/02.jpg" alt="Image">
              </div>
              <div class="card-body position-relative pb-3">
                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For sale</h4>
                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">Family Home| 120 sq.m</a></h3>
                <p class="mb-2 fs-sm text-muted">67-04 Myrtle Ave Glendale, NY 11385</p>
                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$84,000</div>
              </div>
              <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">4<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
            </div>
          </div>
          <!-- Item-->
          <div class="col">
            <div class="card shadow-sm card-hover border-0 h-100">
              <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success">Verified</span></div>
                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                  <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                </div><img src="img/real-estate/catalog/03.jpg" alt="Image">
              </div>
              <div class="card-body position-relative pb-3">
                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For rent</h4>
                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">Greenpoint Rentals | 85 sq.m</a></h3>
                <p class="mb-2 fs-sm text-muted">1510 Castle Hill Ave Bronx, NY 10462</p>
                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$1,330</div>
              </div>
              <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">1<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">1<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">1<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
            </div>
          </div>
          <!-- Item-->
          <div class="col">
            <div class="card shadow-sm card-hover border-0 h-100">
              <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-info">New</span></div>
                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                  <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                </div><img src="img/real-estate/catalog/04.jpg" alt="Image">
              </div>
              <div class="card-body position-relative pb-3">
                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For sale</h4>
                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">Studio | 32 sq.m</a></h3>
                <p class="mb-2 fs-sm text-muted">140-60 Beech Ave Flushing, NY 11355</p>
                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$65,000</div>
              </div>
              <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">1<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">1<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
            </div>
          </div>
          <!-- Item-->
          <div class="col">
            <div class="card shadow-sm card-hover border-0 h-100">
              <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span></div>
                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                  <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                </div><img src="img/real-estate/catalog/05.jpg" alt="Image">
              </div>
              <div class="card-body position-relative pb-3">
                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For sale</h4>
                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">Cottage | 120 sq.m</a></h3>
                <p class="mb-2 fs-sm text-muted">42 Broadway New York, NY 10004</p>
                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$184,000</div>
              </div>
              <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">4<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">1<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Recently added-->
    <section class="container pb-4 pt-1 mb-5">
      <div class="d-flex align-items-end align-items-lg-center justify-content-between mb-4 pb-md-2">
        <div class="d-flex w-100 align-items-center justify-content-between justify-content-lg-start">
          <h2 class="h3 mb-0 me-md-4">Added today</h2>
          <div class="dropdown d-md-none" data-bs-toggle="select">
            <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown"><span class="dropdown-toggle-label">Houses</span></button>
            <input type="hidden">
            <div class="dropdown-menu"><a class="dropdown-item" href="#"><span class="dropdown-item-label">Apartments</span></a><a class="dropdown-item" href="#"><span class="dropdown-item-label">Houses</span></a><a class="dropdown-item" href="#"><span class="dropdown-item-label">Rooms</span></a><a class="dropdown-item" href="#"><span class="dropdown-item-label">Commercial</span></a></div>
          </div>
          <ul class="nav nav-tabs d-none d-md-flex ps-lg-2 mb-0">
            <li class="nav-item"><a class="nav-link fs-sm mb-2 mb-md-0" href="#">Apartments</a></li>
            <li class="nav-item"><a class="nav-link fs-sm active mb-2 mb-md-0" href="#">Houses</a></li>
            <li class="nav-item"><a class="nav-link fs-sm mb-2 mb-md-0" href="#">Rooms</a></li>
            <li class="nav-item"><a class="nav-link fs-sm mb-2 mb-md-0" href="#">Commercial</a></li>
          </ul>
        </div><a class="btn btn-link fw-normal d-none d-lg-block p-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
      </div>
      <div class="row g-4">
        <div class="col-md-6">
          <div class="card bg-size-cover bg-position-center border-0 overflow-hidden h-100" style="background-image: url(img/real-estate/recent/01.jpg);"><span class="img-gradient-overlay"></span>
            <div class="card-body content-overlay pb-0">
              <div class="d-flex"><span class="badge bg-success fs-sm me-2">Verified</span><span class="badge bg-info fs-sm">New</span></div>
            </div>
            <div class="card-footer content-overlay border-0 pt-0 pb-4">
              <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5"><a class="text-decoration-none text-light pe-2" href="real-estate-single-v1.html">
                <div class="fs-sm text-uppercase pt-2 mb-1">For rental</div>
                <h3 class="h5 text-light mb-1">Luxury Rental Villa</h3>
                <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>118-11 Sutphin Blvd Jamaica, NY 11434</div></a>
                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="real-estate-single-v1.html" style="height: 2.75rem;">From $3,850</a>
                  <button class="btn btn-primary btn-icon border-end-0 border-top-0 border-bottom-0 border-light fs-sm" type="button"><i class="fi-heart"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card bg-size-cover bg-position-center border-0 overflow-hidden mb-4" style="background-image: url(img/real-estate/recent/02.jpg);"><span class="img-gradient-overlay"></span>
            <div class="card-body content-overlay pb-0"><span class="badge bg-info fs-sm">New</span></div>
            <div class="card-footer content-overlay border-0 pt-0 pb-4">
              <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5"><a class="text-decoration-none text-light pe-2" href="real-estate-single-v1.html">
                <div class="fs-sm text-uppercase pt-2 mb-1">For sale</div>
                <h3 class="h5 text-light mb-1">Duplex with Garage</h3>
                <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>21 Pulaski Road Kings Park, NY 11754</div></a>
                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="real-estate-single-v1.html" style="height: 2.75rem;">$200,410</a>
                  <button class="btn btn-primary btn-icon border-end-0 border-top-0 border-bottom-0 border-light fs-sm" type="button"><i class="fi-heart"></i></button>
                </div>
              </div>
            </div>
          </div>
          <div class="card bg-size-cover bg-position-center border-0 overflow-hidden" style="background-image: url(img/real-estate/recent/03.jpg);"><span class="img-gradient-overlay"></span>
            <div class="card-body content-overlay pb-0"><span class="badge bg-info fs-sm">New</span></div>
            <div class="card-footer content-overlay border-0 pt-0 pb-4">
              <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5"><a class="text-decoration-none text-light pe-2" href="real-estate-single-v1.html">
                <div class="fs-sm text-uppercase pt-2 mb-1">For sale</div>
                <h3 class="h5 text-light mb-1">Country House</h3>
                <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>6954 Grand AveMaspeth, NY 11378</div></a>
                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="real-estate-single-v1.html" style="height: 2.75rem;">$162,000</a>
                  <button class="btn btn-primary btn-icon border-end-0 border-top-0 border-bottom-0 border-light fs-sm" type="button"><i class="fi-heart"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Property cost calculator-->
    <section class="container mb-5 pb-2 pb-lg-4">
      <div class="row align-items-center">
        <div class="col-md-5"><img class="d-block mx-md-0 mx-auto mb-md-0 mb-4" src="img/real-estate/illustrations/calculator.svg" width="416" alt="Illustration"></div>
        <div class="col-xxl-6 col-md-7 text-md-start text-center">
          <h2>Сalculate the cost of your property</h2>
          <p class="pb-3 fs-lg">Real estate appraisal is a procedure that allows you to determine the average market value of real estate (apartment, house, land, etc.). Сalculate the cost of your property with our new Calculation Service.</p><a class="btn btn-lg btn-primary" href="#cost-calculator" data-bs-toggle="modal"><i class="fi-calculator me-2"></i>Calculate</a>
        </div>
      </div>
    </section>
    <!-- Cities (carousel)-->
    <section class="container mb-5 pb-2">
      <div class="d-flex align-items-center justify-content-between mb-3">
        <h2 class="h3 mb-0">Search property by city</h2><a class="btn btn-link fw-normal ms-md-3 pb-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
      </div>
      <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
        <div class="tns-carousel-inner row gx-4 mx-0 py-md-4 py-3" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
          <!-- Item-->
          <div class="col"><a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="img/real-estate/city/new-york.jpg" alt="New York">
              <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                <div class="w-100 p-1">
                  <div class="mb-2">
                    <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-wallet mt-n1 me-2 fs-sm align-middle"></i>Property for sale</h4>
                    <div class="d-flex align-items-center">
                      <div class="progress progress-light w-100">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                      </div><span class="text-light fs-sm ps-1 ms-2">893</span>
                    </div>
                  </div>
                  <div class="pt-1">
                    <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-home mt-n1 me-2 fs-sm align-middle"></i>Property for rent</h4>
                    <div class="d-flex align-items-center">
                      <div class="progress progress-light w-100">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                      </div><span class="text-light fs-sm ps-1 ms-2">3756</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body text-center">
              <h3 class="mb-0 fs-base text-nav">New York</h3>
            </div></a></div>
          <!-- Item-->
          <div class="col"><a class="card shadow-sm card-hover border-0" href="real-estate-catalog-rent.html">
            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="img/real-estate/city/chicago.jpg" alt="Chicago">
              <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                <div class="w-100 p-1">
                  <div class="mb-2">
                    <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-wallet mt-n1 me-2 fs-sm align-middle"></i>Property for sale</h4>
                    <div class="d-flex align-items-center">
                      <div class="progress progress-light w-100">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 37%" aria-valuenow="37" aria-valuemin="0" aria-valuemax="100"></div>
                      </div><span class="text-light fs-sm ps-1 ms-2">268</span>
                    </div>
                  </div>
                  <div class="pt-1">
                    <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-home mt-n1 me-2 fs-sm align-middle"></i>Property for rent</h4>
                    <div class="d-flex align-items-center">
                      <div class="progress progress-light w-100">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                      </div><span class="text-light fs-sm ps-1 ms-2">1540</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body text-center">
              <h3 class="mb-0 fs-base text-nav">Chicago</h3>
            </div></a></div>
          <!-- Item-->
          <div class="col"><a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="img/real-estate/city/los-angeles.jpg" alt="Los Angeles">
              <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                <div class="w-100 p-1">
                  <div class="mb-2">
                    <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-wallet mt-n1 me-2 fs-sm align-middle"></i>Property for sale</h4>
                    <div class="d-flex align-items-center">
                      <div class="progress progress-light w-100">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                      </div><span class="text-light fs-sm ps-1 ms-2">2750</span>
                    </div>
                  </div>
                  <div class="pt-1">
                    <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-home mt-n1 me-2 fs-sm align-middle"></i>Property for rent</h4>
                    <div class="d-flex align-items-center">
                      <div class="progress progress-light w-100">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                      </div><span class="text-light fs-sm ps-1 ms-2">692</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body text-center">
              <h3 class="mb-0 fs-base text-nav">Los Angeles</h3>
            </div></a></div>
          <!-- Item-->
          <div class="col"><a class="card shadow-sm card-hover border-0" href="real-estate-catalog-rent.html">
            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="img/real-estate/city/san-diego.jpg" alt="San Diego">
              <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                <div class="w-100 p-1">
                  <div class="mb-2">
                    <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-wallet mt-n1 me-2 fs-sm align-middle"></i>Property for sale</h4>
                    <div class="d-flex align-items-center">
                      <div class="progress progress-light w-100">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                      </div><span class="text-light fs-sm ps-1 ms-2">1739</span>
                    </div>
                  </div>
                  <div class="pt-1">
                    <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-home mt-n1 me-2 fs-sm align-middle"></i>Property for rent</h4>
                    <div class="d-flex align-items-center">
                      <div class="progress progress-light w-100">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                      </div><span class="text-light fs-sm ps-1 ms-2">1854</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body text-center">
              <h3 class="mb-0 fs-base text-nav">San Diego</h3>
            </div></a></div>
          <!-- Item-->
          <div class="col"><a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="img/real-estate/city/dallas.jpg" alt="Dallas">
              <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                <div class="w-100 p-1">
                  <div class="mb-2">
                    <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-wallet mt-n1 me-2 fs-sm align-middle"></i>Property for sale</h4>
                    <div class="d-flex align-items-center">
                      <div class="progress progress-light w-100">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                      </div><span class="text-light fs-sm ps-1 ms-2">2567</span>
                    </div>
                  </div>
                  <div class="pt-1">
                    <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-home mt-n1 me-2 fs-sm align-middle"></i>Property for rent</h4>
                    <div class="d-flex align-items-center">
                      <div class="progress progress-light w-100">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                      </div><span class="text-light fs-sm ps-1 ms-2">1204</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body text-center">
              <h3 class="mb-0 fs-base text-nav">Dallas</h3>
            </div></a></div>
        </div>
      </div>
    </section>
    <!-- Partners (carousel)-->
    <section class="container mb-5 pb-2 pb-lg-4">
      <h2 class="h3 mb-4 text-center text-md-start">Our partners</h2>
      <div class="tns-carousel-wrapper tns-nav-outside tns-nav-outside-flush">
        <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 6, &quot;controls&quot;: false, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:2}, &quot;500&quot;:{&quot;items&quot;:4}, &quot;992&quot;:{&quot;items&quot;:5, &quot;gutter&quot;: 16}, &quot;1200&quot;:{&quot;items&quot;:6, &quot;gutter&quot;: 24}}}">
          <div><a class="swap-image" href="#"><img class="swap-to" src="img/real-estate/brands/01_color.svg" alt="Logo" width="196"><img class="swap-from" src="img/real-estate/brands/01_gray.svg" alt="Logo" width="196"></a></div>
          <div><a class="swap-image" href="#"><img class="swap-to" src="img/real-estate/brands/02_color.svg" alt="Logo" width="196"><img class="swap-from" src="img/real-estate/brands/02_gray.svg" alt="Logo" width="196"></a></div>
          <div><a class="swap-image" href="#"><img class="swap-to" src="img/real-estate/brands/03_color.svg" alt="Logo" width="196"><img class="swap-from" src="img/real-estate/brands/03_gray.svg" alt="Logo" width="196"></a></div>
          <div><a class="swap-image" href="#"><img class="swap-to" src="img/real-estate/brands/04_color.svg" alt="Logo" width="196"><img class="swap-from" src="img/real-estate/brands/04_gray.svg" alt="Logo" width="196"></a></div>
          <div><a class="swap-image" href="#"><img class="swap-to" src="img/real-estate/brands/05_color.svg" alt="Logo" width="196"><img class="swap-from" src="img/real-estate/brands/05_gray.svg" alt="Logo" width="196"></a></div>
          <div><a class="swap-image" href="#"><img class="swap-to" src="img/real-estate/brands/06_color.svg" alt="Logo" width="196"><img class="swap-from" src="img/real-estate/brands/06_gray.svg" alt="Logo" width="196"></a></div>
        </div>
      </div>
    </section>
    <!-- Top agents (lnked carousel)-->
    <section class="container mb-5 pb-2 pb-lg-4">
      <h2 class="h3 mb-4 pb-3 text-center text-md-start">Top real estate agents</h2>
      <div class="tns-carousel-wrapper">
        <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 1, &quot;mode&quot;: &quot;gallery&quot;, &quot;controlsContainer&quot;: &quot;#agents-carousel-controls&quot;, &quot;nav&quot;: false}">
          <div>
            <div class="row align-items-center">
              <div class="col-xl-4 d-none d-xl-block"><img class="rounded-3" src="img/real-estate/agents/01.jpg" alt="Agent picture"></div>
              <div class="col-xl-4 col-md-5 col-sm-4"><img class="rounded-3" src="img/real-estate/agents/02.jpg" alt="Agent picture"></div>
              <div class="col-xl-4 col-md-7 col-sm-8 px-4 px-sm-3 px-md-0 ms-md-n4 mt-n5 mt-sm-0 py-3">
                <div class="card border-0 shadow-sm ms-sm-n5">
                  <blockquote class="blockquote card-body">
                    <h4 style="max-width: 22rem;">&quot;I will select the best accommodation for you&quot;</h4>
                    <p class="d-sm-none d-lg-block">Amet libero morbi venenatis ut est. Iaculis leo ultricies nunc id ante adipiscing. Vel metus odio at faucibus ac. Neque id placerat et id ut. Scelerisque eu mi ullamcorper sit urna. Est volutpat dignissim nec.</p>
                    <footer class="d-flex justify-content-between">
                      <div class="pe-3"><a class="text-decoration-none" href="real-estate-vendor-properties.html">
                        <h6 class="mb-0">Floyd Miles</h6>
                        <div class="text-muted fw-normal fs-sm mb-3">Imperial Property Group Agent</div></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-facebook"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-twitter"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-linkedin"></i></a></div>
                      <div><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
                        <div class="text-muted fs-sm mt-1">45 reviews</div>
                      </div>
                    </footer>
                  </blockquote>
                </div>
              </div>
            </div>
          </div>
          <div>
            <div class="row align-items-center">
              <div class="col-xl-4 d-none d-xl-block"><img class="rounded-3" src="img/real-estate/agents/02.jpg" alt="Agent picture"></div>
              <div class="col-xl-4 col-md-5 col-sm-4"><img class="rounded-3" src="img/real-estate/agents/03.jpg" alt="Agent picture"></div>
              <div class="col-xl-4 col-md-7 col-sm-8 px-4 px-sm-3 px-md-0 ms-md-n4 mt-n5 mt-sm-0 py-3">
                <div class="card border-0 shadow-sm ms-sm-n5">
                  <blockquote class="blockquote card-body">
                    <h4 style="max-width: 22rem;">&quot;I don't say no, I just figure out a way to make it work&quot;</h4>
                    <p class="d-sm-none d-lg-block">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.</p>
                    <footer class="d-flex justify-content-between">
                      <div class="pe-3"><a class="text-decoration-none" href="real-estate-vendor-properties.html">
                        <h6 class="mb-0">Guy Hawkins</h6>
                        <div class="text-muted fw-normal fs-sm mb-3">Imperial Property Group Agent</div></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-facebook"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-twitter"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-linkedin"></i></a></div>
                      <div><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
                        <div class="text-muted fs-sm mt-1">16 reviews</div>
                      </div>
                    </footer>
                  </blockquote>
                </div>
              </div>
            </div>
          </div>
          <div>
            <div class="row align-items-center">
              <div class="col-xl-4 d-none d-xl-block"><img class="rounded-3" src="img/real-estate/agents/03.jpg" alt="Agent picture"></div>
              <div class="col-xl-4 col-md-5 col-sm-4"><img class="rounded-3" src="img/real-estate/agents/01.jpg" alt="Agent picture"></div>
              <div class="col-xl-4 col-md-7 col-sm-8 px-4 px-sm-3 px-md-0 ms-md-n4 mt-n5 mt-sm-0 py-3">
                <div class="card border-0 shadow-sm ms-sm-n5">
                  <blockquote class="blockquote card-body">
                    <h4 style="max-width: 22rem;">&quot;Over 10 years of experience as a real estate agent&quot;</h4>
                    <p class="d-sm-none d-lg-block">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.</p>
                    <footer class="d-flex justify-content-between">
                      <div class="pe-3"><a class="text-decoration-none" href="real-estate-vendor-properties.html">
                        <h6 class="mb-0">Kristin Watson</h6>
                        <div class="text-muted fw-normal fs-sm mb-3">Imperial Property Group Agent</div></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-facebook"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-twitter"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-linkedin"></i></a></div>
                      <div><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
                        <div class="text-muted fs-sm mt-1">24 reviews</div>
                      </div>
                    </footer>
                  </blockquote>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="tns-carousel-controls justify-content-center justify-content-md-start my-2 mt-md-4" id="agents-carousel-controls">
        <button class="mx-2" type="button"><i class="fi-chevron-left"></i></button>
        <button class="mx-2" type="button"><i class="fi-chevron-right"></i></button>
      </div>
    </section>
  </main>
  <!-- Footer-->
  <footer class="footer bg-secondary pt-5">
    <div class="container pt-lg-4 pb-4">
      <!-- Links-->
      <div class="row mb-5 pb-md-3 pb-lg-4">
        <div class="col-lg-6 mb-lg-0 mb-4">
          <div class="d-flex flex-sm-row flex-column justify-content-between mx-n2">
            <div class="mb-sm-0 mb-4 px-2"><a class="d-inline-block mb-4" href="real-estate-home-v1.html"><img src="img/logo/logo-dark.svg" width="116" alt="logo"></a>
              <ul class="nav flex-column mb-sm-4 mb-2">
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="mailto:example@email.com"><i class="fi-mail mt-n1 me-2 align-middle opacity-70"></i>example@email.com</a></li>
                <li class="nav-item"><a class="nav-link p-0 fw-normal" href="tel:4065550120"><i class="fi-device-mobile mt-n1 me-2 align-middle opacity-70"></i>(406) 555-0120</a></li>
              </ul>
              <div class="pt-2"><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-facebook"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-twitter"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-viber"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-telegram"></i></a></div>
            </div>
            <div class="mb-sm-0 mb-4 px-2">
              <h4 class="h5">Quick Links</h4>
              <ul class="nav flex-column">
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Buy a property</a></li>
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Sell a property</a></li>
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Rent a property</a></li>
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Сalculate  your property</a></li>
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Top offers</a></li>
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Top cities</a></li>
              </ul>
            </div>
            <div class="px-2">
              <h4 class="h5">About</h4>
              <ul class="nav flex-column">
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">About Us</a></li>
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Our agents</a></li>
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Help &amp; support</a></li>
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Contacts</a></li>
                <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">News</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-xl-5 col-lg-6 offset-xl-1">
          <h4 class="h5">Recent Posts</h4>
          <article class="d-flex align-items-start" style="max-width: 640px;"><a class="d-none d-sm-block flex-shrink-0 me-sm-4 mb-sm-0 mb-3" href="real-estate-blog-single.html"><img class="rounded-3" src="img/real-estate/blog/th01.jpg" width="100" alt="Blog post"></a>
            <div>
              <h6 class="mb-1 fs-xs fw-normal text-uppercase text-primary">Home improvement</h6>
              <h5 class="mb-2 fs-base"><a class="nav-link" href="real-estate-blog-single.html">Your Guide to a Smart Apartment Searching</a></h5>
              <p class="mb-2 fs-sm">Mi justo, varius vitae cursus ipsum sem massa amet pellentesque. Ipsum enim sit nulla ridiculus semper nam...</p><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-calendar mt-n1 me-1 fs-sm align-middle opacity-70"></i>Dec 4</a><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-chat-circle mt-n1 me-1 fs-sm align-middle opacity-70"></i>2 comments</a>
            </div>
          </article>
          <hr class="text-dark opacity-10 my-4">
          <article class="d-flex align-items-start" style="max-width: 640px;"><a class="d-none d-sm-block flex-shrink-0 me-sm-4 mb-sm-0 mb-3" href="real-estate-blog-single.html"><img class="rounded-3" src="img/real-estate/blog/th02.jpg" width="100" alt="Blog post"></a>
            <div>
              <h6 class="mb-1 fs-xs fw-normal text-uppercase text-primary">Tips &amp; advice</h6>
              <h5 class="mb-2 fs-base"><a class="nav-link" href="real-estate-blog-single.html">Top 10 Ways to Refresh Your Space</a></h5>
              <p class="mb-2 fs-sm">Volutpat, orci, vitae arcu feugiat vestibulum ultricies nisi, aenean eget. Vitae enim, tellus tempor consequat mi vitae...</p><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-calendar mt-n1 me-1 fs-sm align-middle opacity-70"></i>Nov 23</a><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-chat-circle mt-n1 me-1 fs-sm align-middle opacity-70"></i>No comments</a>
            </div>
          </article>
        </div>
      </div>
      <!-- Banner-->
      <div class="bg-dark rounded-3">
        <div class="col-xxl-10 col-md-11 col-10 d-flex flex-md-row flex-column-reverse align-items-md-end align-items-center mx-auto px-0"><img class="flex-shrink-0 mt-md-n5 me-md-5" src="img/real-estate/illustrations/mobile.svg" width="240" alt="Finder mobile app">
          <div class="align-self-center d-flex flex-lg-row flex-column align-items-lg-center pt-md-3 pt-5 ps-xxl-4 text-md-start text-center">
            <div class="me-md-5">
              <h4 class="text-light">Download Our App</h4>
              <p class="mb-lg-0 text-light">Find everything you need for buying, selling &amp; renting property in our new Finder App!</p>
            </div>
            <div class="flex-shrink-0"><a class="btn-market mx-2 ms-sm-0 me-sm-4 mb-3" href="#" role="button"><svg xmlns='http://www.w3.org/2000/svg' width='132' height='34' fill='#fff'><path d='M20.047 15.814c-.031-3.755 3.054-5.581 3.189-5.665-1.751-2.56-4.461-2.916-5.41-2.948-2.272-.241-4.482 1.374-5.639 1.374-1.178 0-2.971-1.343-4.889-1.311-2.47.042-4.795 1.479-6.056 3.724-2.616 4.563-.667 11.277 1.845 14.969 1.261 1.804 2.72 3.829 4.649 3.755 1.876-.073 2.585-1.206 4.847-1.206 2.251 0 2.908 1.206 4.868 1.164 2.022-.032 3.283-1.815 4.503-3.64 1.449-2.067 2.033-4.112 2.053-4.217-.052-.021-3.919-1.511-3.961-6zM16.346 4.779c1.011-1.269 1.699-3 1.511-4.763-1.459.063-3.294 1.018-4.347 2.266-.928 1.101-1.762 2.895-1.553 4.584 1.647.126 3.335-.839 4.388-2.088zm35.509 24.673h-2.627l-1.438-4.553h-5.003l-1.366 4.553h-2.554l4.951-15.494h3.064l4.972 15.494zm-4.492-6.462l-1.303-4.039c-.136-.42-.396-1.385-.771-2.916h-.052l-.73 2.916-1.282 4.039h4.138zm17.219.745c0 1.899-.511 3.399-1.543 4.5-.917.986-2.064 1.469-3.419 1.469-1.47 0-2.522-.524-3.169-1.584v5.864h-2.47V21.951l-.094-3.672h2.168l.136 1.773h.042c.823-1.332 2.074-2.004 3.742-2.004 1.313 0 2.397.524 3.273 1.563.897 1.049 1.334 2.413 1.334 4.123zm-2.512.084c0-1.091-.24-1.983-.73-2.686a2.52 2.52 0 0 0-2.147-1.101c-.605 0-1.157.21-1.657.608a2.81 2.81 0 0 0-.969 1.595c-.073.304-.115.556-.115.755v1.867c0 .808.25 1.5.74 2.056s1.136.839 1.928.839c.928 0 1.647-.367 2.168-1.08.521-.724.782-1.668.782-2.853zm15.27-.084c0 1.899-.511 3.399-1.543 4.5-.917.986-2.064 1.469-3.419 1.469-1.47 0-2.522-.524-3.169-1.584v5.864h-2.47V21.951l-.094-3.672h2.168l.136 1.773h.042c.823-1.332 2.074-2.004 3.742-2.004 1.313 0 2.397.524 3.273 1.563.896 1.049 1.334 2.413 1.334 4.123zm-2.512.084c0-1.091-.24-1.983-.73-2.686a2.52 2.52 0 0 0-2.147-1.101c-.605 0-1.157.21-1.657.608-.49.409-.813.934-.969 1.595-.073.304-.115.556-.115.755v1.867c0 .808.25 1.5.74 2.056s1.136.839 1.928.839c.928 0 1.657-.367 2.168-1.08.532-.724.782-1.668.782-2.853zm16.792 1.29c0 1.322-.459 2.392-1.365 3.221-1.001.902-2.397 1.353-4.19 1.353-1.657 0-2.981-.325-3.982-.965l.573-2.067a6.89 6.89 0 0 0 3.565.965c.928 0 1.657-.21 2.168-.629.521-.42.782-.986.782-1.689a2.19 2.19 0 0 0-.636-1.584c-.427-.43-1.136-.829-2.126-1.196-2.721-1.018-4.065-2.497-4.065-4.437 0-1.269.48-2.308 1.428-3.126.948-.808 2.21-1.217 3.784-1.217 1.397 0 2.564.241 3.492.734l-.625 2.014c-.876-.472-1.855-.713-2.96-.713-.865 0-1.553.22-2.043.64-.406.388-.615.85-.615 1.406a1.89 1.89 0 0 0 .709 1.511c.407.367 1.157.766 2.241 1.196 1.324.535 2.293 1.164 2.919 1.888.636.724.948 1.626.948 2.696zm8.172-4.962h-2.721v5.423c0 1.374.48 2.067 1.438 2.067.438 0 .803-.042 1.094-.115l.073 1.888c-.49.178-1.126.273-1.918.273-.98 0-1.73-.304-2.283-.902s-.823-1.605-.823-3.011v-5.633h-1.616V18.28h1.616v-2.046l2.418-.734v2.78h2.721v1.867zm12.237 3.63c0 1.72-.49 3.126-1.459 4.228-1.021 1.133-2.377 1.699-4.065 1.699-1.626 0-2.929-.546-3.898-1.626s-1.449-2.455-1.449-4.112c0-1.731.5-3.147 1.49-4.248 1.001-1.101 2.346-1.657 4.034-1.657 1.626 0 2.939.546 3.93 1.636.948 1.049 1.417 2.413 1.417 4.081zm-2.553.052c0-1.028-.219-1.899-.657-2.633-.521-.892-1.261-1.332-2.22-1.332-.991 0-1.751.441-2.262 1.332-.448.734-.657 1.626-.657 2.685 0 1.028.219 1.909.657 2.633.531.892 1.282 1.332 2.241 1.332.938 0 1.678-.451 2.22-1.353.448-.755.678-1.637.678-2.665zm10.579-3.367c-.24-.042-.5-.063-.782-.063-.865 0-1.542.325-2.011.986-.407.577-.615 1.322-.615 2.203v5.864h-2.471v-7.658l-.072-3.514h2.147l.094 2.14h.072c.261-.734.668-1.332 1.23-1.773.553-.399 1.147-.598 1.783-.598.229 0 .438.021.615.042l.01 2.371zm11.028 2.874c0 .441-.031.818-.094 1.122h-7.4c.031 1.101.385 1.951 1.073 2.528.626.514 1.428.776 2.419.776 1.094 0 2.095-.178 2.991-.524l.386 1.72c-1.053.462-2.293.692-3.721.692-1.72 0-3.075-.514-4.055-1.532s-1.47-2.392-1.47-4.102c0-1.678.459-3.084 1.376-4.207.959-1.196 2.251-1.794 3.878-1.794 1.594 0 2.814.598 3.627 1.794.657.965.99 2.13.99 3.525zm-2.356-.64c.021-.734-.146-1.374-.479-1.909-.427-.692-1.084-1.038-1.96-1.038-.802 0-1.459.336-1.959 1.007-.407.535-.657 1.185-.73 1.93l5.128.011zM46.175 8.419h-1.293l-.709-2.234h-2.46l-.678 2.234h-1.251l2.43-7.616h1.501l2.46 7.616zm-2.22-3.179l-.636-1.993-.386-1.437h-.021l-.365 1.437-.625 1.993h2.033zm8.307-2.318l-2.064 5.497H49.02l-2.001-5.497h1.303l.928 2.906.396 1.385h.031l.396-1.385.917-2.906h1.272zm4.399 5.497l-.094-.629h-.031c-.375.504-.907.755-1.595.755-.98 0-1.668-.692-1.668-1.615 0-1.353 1.167-2.056 3.189-2.056v-.105c0-.724-.386-1.08-1.136-1.08-.542 0-1.011.136-1.428.409l-.25-.797c.5-.315 1.136-.472 1.876-.472 1.428 0 2.147.755 2.147 2.276V7.13c0 .556.021.986.083 1.311L56.66 8.42zm-.167-2.738c-1.345 0-2.022.325-2.022 1.112 0 .577.344.86.834.86.615 0 1.188-.472 1.188-1.122v-.85zm3.878-3.661c-.407 0-.72-.315-.72-.734s.323-.724.741-.724.751.304.74.724c0 .441-.313.734-.761.734zm-.584.902h1.21v5.486h-1.21V2.922zM63.155.404h1.209v8.004h-1.209V.404zm6.358 8.015l-.094-.629h-.031c-.375.504-.907.755-1.595.755-.98 0-1.668-.692-1.668-1.615 0-1.353 1.167-2.056 3.19-2.056v-.105c0-.724-.386-1.08-1.136-1.08-.542 0-1.011.136-1.428.409l-.25-.808c.5-.315 1.136-.472 1.876-.472 1.428 0 2.147.755 2.147 2.276v2.025c0 .556.021.986.073 1.311h-1.084v-.01zm-.167-2.738c-1.345 0-2.022.325-2.022 1.112 0 .577.344.86.834.86.615 0 1.188-.472 1.188-1.122v-.85zm6.098 2.864a1.85 1.85 0 0 1-1.72-.976h-.021l-.073.85h-1.032l.042-1.479V.404h1.22V3.73h.021c.365-.608.938-.913 1.741-.913 1.313 0 2.231 1.133 2.231 2.78 0 1.699-1.022 2.948-2.408 2.948zm-.25-4.773c-.698 0-1.334.608-1.334 1.458v.965c0 .755.573 1.374 1.313 1.374.907 0 1.449-.745 1.449-1.93 0-1.112-.563-1.867-1.428-1.867zm4.45-3.368h1.209v8.004h-1.209V.404zm7.807 5.56h-3.638c.021 1.039.709 1.626 1.72 1.626.542 0 1.032-.094 1.47-.262l.188.85c-.511.231-1.115.336-1.824.336-1.709 0-2.721-1.08-2.721-2.769 0-1.678 1.032-2.948 2.585-2.948 1.386 0 2.272 1.039 2.272 2.612 0 .22-.01.409-.052.556zm-1.105-.871c0-.85-.427-1.448-1.199-1.448-.698 0-1.24.608-1.324 1.448h2.522zM94.8 8.545c-1.595 0-2.627-1.196-2.627-2.822 0-1.699 1.053-2.906 2.721-2.906 1.574 0 2.627 1.143 2.627 2.811 0 1.71-1.084 2.916-2.721 2.916zm.052-4.836c-.876 0-1.438.829-1.438 1.972 0 1.133.573 1.951 1.428 1.951s1.428-.881 1.428-1.983c-.01-1.112-.563-1.941-1.418-1.941zm9.183 4.709h-1.209V5.261c0-.976-.375-1.458-1.105-1.458-.719 0-1.209.619-1.209 1.343v3.262h-1.209V4.495l-.042-1.574h1.063l.052.85h.032c.323-.587.99-.965 1.73-.965 1.146 0 1.897.881 1.897 2.318v3.294zm7.932-4.573h-1.334V6.51c0 .682.24 1.018.709 1.018a2.64 2.64 0 0 0 .542-.052l.031.923c-.24.094-.552.136-.938.136-.959 0-1.522-.535-1.522-1.92v-2.77h-.792v-.913h.792V1.925l1.188-.367v1.364h1.334v.923m6.411 4.574h-1.209V5.282c0-.986-.376-1.479-1.105-1.479-.626 0-1.209.43-1.209 1.301v3.304h-1.209V.404h1.209v3.294h.02a1.83 1.83 0 0 1 1.637-.892c1.157 0 1.866.902 1.866 2.339v3.273zm6.191-2.455h-3.638c.021 1.039.709 1.626 1.72 1.626a4.08 4.08 0 0 0 1.47-.262l.188.85c-.511.231-1.116.336-1.825.336-1.709 0-2.72-1.08-2.72-2.769 0-1.678 1.032-2.948 2.585-2.948 1.386 0 2.272 1.039 2.272 2.612 0 .22-.01.409-.052.556zm-1.105-.871c0-.85-.427-1.448-1.198-1.448-.699 0-1.251.608-1.324 1.448h2.522z'/></svg></a><a class="btn-market mb-3" href="#" role="button"><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' width='140' height='34' fill='none'><g fill='#fff'>
              <path d='M45.373 4.152c0 1.003-.241 1.88-.843 2.507a3.47 3.47 0 0 1-2.649 1.128 3.47 3.47 0 0 1-2.649-1.128c-.723-.752-1.084-1.629-1.084-2.757s.361-2.005 1.084-2.757A3.47 3.47 0 0 1 41.881.016c.482 0 .963.125 1.445.376s.843.501 1.084.877l-.602.627c-.482-.627-1.084-.877-1.927-.877-.723 0-1.445.251-1.927.877-.602.501-.843 1.253-.843 2.131s.241 1.629.843 2.131 1.204.877 1.927.877c.843 0 1.445-.251 2.047-.877.361-.376.602-.877.602-1.504h-2.649V3.651h3.492v.501zm5.54-3.134h-3.252V3.4h3.011v.877h-3.011v2.381h3.252v1.003h-4.215V.141h4.215v.877zm3.974 6.643h-.963V1.019h-2.047V.141h5.058v.877h-2.047v6.643zm5.54 0V.141h.963v7.52h-.963zm5.058 0h-.964V1.019h-2.047V.141h4.938v.877h-2.047v6.643h.121zm11.441-1.003a3.47 3.47 0 0 1-2.649 1.128 3.47 3.47 0 0 1-2.649-1.128c-.723-.752-1.084-1.629-1.084-2.757s.361-2.005 1.084-2.757A3.47 3.47 0 0 1 74.275.016a3.47 3.47 0 0 1 2.649 1.128c.722.752 1.084 1.629 1.084 2.757s-.361 2.005-1.084 2.757zm-4.576-.627c.482.501 1.204.877 1.927.877s1.445-.251 1.927-.877c.482-.501.843-1.253.843-2.131s-.241-1.629-.843-2.131C75.722 1.268 75 .892 74.277.892s-1.445.251-1.927.877c-.482.501-.843 1.253-.843 2.131s.241 1.629.843 2.131zm6.985 1.629V.141h1.084l3.492 5.891V.141h.963v7.52h-.963L80.176 1.52v6.142h-.843zm-9.034 11.032c-2.89 0-5.178 2.256-5.178 5.39 0 3.008 2.288 5.39 5.178 5.39s5.178-2.256 5.178-5.39c0-3.259-2.288-5.39-5.178-5.39zm0 8.523c-1.565 0-2.89-1.379-2.89-3.259s1.325-3.259 2.89-3.259 2.89 1.253 2.89 3.259c0 1.88-1.325 3.259-2.89 3.259zm-11.2-8.523c-2.89 0-5.178 2.256-5.178 5.39 0 3.008 2.288 5.39 5.178 5.39s5.178-2.256 5.178-5.39c0-3.259-2.288-5.39-5.178-5.39zm0 8.523c-1.566 0-2.89-1.379-2.89-3.259s1.325-3.259 2.89-3.259 2.89 1.253 2.89 3.259c0 1.88-1.325 3.259-2.89 3.259zm-13.367-6.894v2.256h5.178c-.12 1.253-.602 2.256-1.204 2.883-.723.752-1.927 1.629-3.974 1.629-3.251 0-5.66-2.632-5.66-6.016s2.529-6.016 5.66-6.016c1.686 0 3.011.752 3.974 1.629l1.566-1.629c-1.325-1.253-3.011-2.256-5.419-2.256-4.335 0-8.069 3.76-8.069 8.272s3.733 8.273 8.069 8.273c2.408 0 4.094-.752 5.54-2.381 1.445-1.504 1.927-3.635 1.927-5.264 0-.501 0-1.003-.12-1.379h-7.466zm54.674 1.755c-.482-1.253-1.686-3.384-4.336-3.384s-4.817 2.131-4.817 5.39c0 3.008 2.168 5.39 5.058 5.39 2.288 0 3.733-1.504 4.215-2.381l-1.686-1.253c-.602.877-1.325 1.504-2.529 1.504s-1.927-.501-2.529-1.63l6.865-3.008-.241-.627zm-6.985 1.755c0-2.005 1.566-3.133 2.649-3.133.843 0 1.686.501 1.927 1.128l-4.576 2.005zm-5.66 5.139h2.288V13.303h-2.288V28.97zm-3.613-9.15c-.602-.627-1.566-1.253-2.77-1.253-2.529 0-4.937 2.381-4.937 5.39s2.288 5.264 4.938 5.264c1.204 0 2.168-.627 2.649-1.253h.12v.752c0 2.006-1.084 3.134-2.77 3.134-1.325 0-2.288-1.003-2.529-1.88l-1.927.877c.602 1.379 2.047 3.134 4.576 3.134 2.649 0 4.817-1.629 4.817-5.515v-9.526H84.15v.877zm-2.649 7.395c-1.565 0-2.89-1.379-2.89-3.259s1.325-3.259 2.89-3.259 2.77 1.379 2.77 3.259-1.204 3.259-2.77 3.259zm29.384-13.913h-5.419V28.97h2.288v-5.891h3.131c2.529 0 4.937-1.88 4.937-4.888s-2.408-4.888-4.937-4.888zm.12 7.521h-3.251v-5.39h3.251c1.686 0 2.65 1.504 2.65 2.632-.121 1.379-1.084 2.758-2.65 2.758zm13.849-2.256c-1.686 0-3.372.752-3.974 2.381l2.047.877c.482-.877 1.205-1.128 2.048-1.128 1.204 0 2.288.752 2.408 2.005v.125c-.361-.251-1.325-.627-2.288-.627-2.168 0-4.335 1.253-4.335 3.51 0 2.131 1.806 3.51 3.733 3.51 1.565 0 2.288-.752 2.89-1.504h.121v1.253h2.167v-6.016c-.241-2.757-2.288-4.387-4.817-4.387zm-.241 8.648c-.722 0-1.806-.376-1.806-1.379 0-1.253 1.325-1.629 2.409-1.629.963 0 1.445.251 2.047.501-.241 1.504-1.445 2.507-2.65 2.507zm12.645-8.272l-2.529 6.768h-.12l-2.65-6.768h-2.408l3.974 9.526-2.288 5.264h2.288l6.142-14.79h-2.409zM117.027 28.97h2.288V13.303h-2.288V28.97z'/><path d='M.583 3.637c0-.542.072-.961.234-1.249l14.121 14.18L1.021 30.742c-.255-.301-.438-.786-.438-1.386V3.637zm19.186 8.376l5.576 3.245c.754.439 1.076.98 1.076 1.471s-.321 1.031-1.073 1.47l-5.544 3.049-4.48-4.563v-.145l4.446-4.528zM1.156 31.086l13.917-14.174 4.396 4.477-16.394 9.607c-.49.22-.903.32-1.247.307-.254-.009-.476-.079-.672-.217zm1.91-28.86l16.402 9.497-4.395 4.477L1.155 2.138a1.27 1.27 0 0 1 .683-.257c.337-.024.744.072 1.229.346z' stroke='#454056' stroke-width='.5'/></g><g opacity='.2'><mask id='A' fill='#fff'><use xlink:href='#E'/></mask><use xlink:href='#E' fill='#fff'/><path d='M19.758 21.326l.254.431-.504-.864.25.433zM3.19 30.869l-.25-.433-.01.005-.009.006.268.422zm-2.285 0l.316-.388-.353-.288-.319.325.357.35zm-.114.116l-.357-.35-.344.35.344.35.357-.35zm.114.116l-.357.35.019.02.022.018.316-.388zm2.285 0l-.254-.431-.007.004-.007.005.268.422zm16.318-10.208L2.941 30.435l.499.867 16.568-9.543-.499-.866zM2.922 30.447c-.388.247-.717.325-.984.315a1.19 1.19 0 0 1-.717-.281l-.632.775a2.19 2.19 0 0 0 1.311.505c.505.019 1.032-.136 1.559-.471l-.537-.844zm-2.374.072l-.114.116.714.701.114-.116-.714-.701zm-.114.817l.114.116.714-.701-.114-.116-.714.701zm.155.154a2.19 2.19 0 0 0 1.311.505c.505.019 1.032-.136 1.559-.471l-.537-.844c-.388.247-.717.325-.984.315a1.19 1.19 0 0 1-.717-.281l-.632.775zm2.855.043l16.568-9.775-.508-.861-16.568 9.775.508.861z' fill='#454056' mask='url(#A)'/></g><g opacity='.2'><mask id='B' fill='#fff'><use xlink:href='#F'/></mask><use xlink:href='#F' fill='#fff'/><path d='M.79 30.869l-.357.35.147.15h.21v-.5zm.114.116l-.357.35.857.873v-1.223h-.5zm0-.116h.5v-.5h-.5v.5zm18.853-9.542l-.248-.434-.564.322.455.463.357-.35zm.114.116l-.357.35.272.277.336-.195-.252-.432zm5.599-3.258l-.252-.432.252.432zM1.147 30.518c-.194-.198-.314-.599-.314-1.279h-1c0 .716.109 1.479.6 1.98l.714-.701zm-1.314-1.279v.116h1v-.116h-1zm0 .116c0 .798.26 1.517.715 1.98l.714-.701c-.231-.236-.428-.681-.428-1.279h-1zm1.571 1.629v-.116h-1v.116h1zm-.5-.616H.79v1h.114v-1zm24.319-12.735l-5.713 3.258.495.869 5.713-3.258-.495-.869zm-5.822 4.043l.114.116.713-.701-.114-.116-.714.701zm.723.198l5.599-3.259-.503-.864-5.599 3.258.503.864zm5.599-3.259c.905-.526 1.391-1.251 1.391-2.061h-1c0 .354-.199.793-.894 1.197l.503.864zm.391-2.061c0 .298-.233.631-.923 1.099l.562.827c.681-.463 1.362-1.061 1.362-1.927h-1z' fill='#454056' mask='url(#B)'/></g><g opacity='.2'><mask id='C' fill='#fff'><use xlink:href='#G'/></mask><use xlink:href='#G' fill='#fff'/><path d='M3.19 2.125l-.252.432h.001l.251-.433zm22.281 12.917l.281-.414-.015-.01-.015-.009-.251.432zm0-.116l.252-.432h-.001l-.251.433zM3.19 2.008l-.252.432h.001l.251-.433zm-.251.549L25.22 15.475l.502-.865L3.441 1.692l-.502.865zM25.19 15.456c.69.468.923.801.923 1.099h1c0-.866-.68-1.464-1.362-1.927l-.562.827zm1.923 1.099c0-.81-.486-1.535-1.391-2.061l-.503.864c.695.405.894.844.894 1.197h1zm-1.392-2.062L3.441 1.576l-.502.865L25.22 15.358l.502-.865zM3.441 1.576C2.56 1.063 1.645.928.915 1.34S-.167 2.61-.167 3.637h1c0-.834.278-1.259.575-1.427s.812-.188 1.53.23l.503-.864zM-.167 3.637v.116h1v-.116h-1zm1 .116c0-.764.272-1.203.584-1.388.306-.182.818-.218 1.521.191l.503-.864c-.897-.522-1.813-.616-2.535-.187C.19 1.931-.167 2.772-.167 3.754h1z' fill='#454056' mask='url(#C)'/></g><defs ><path id='E' d='M19.758 21.326L3.19 30.869c-.914.582-1.714.465-2.285 0l-.114.116.114.116c.571.465 1.371.582 2.285 0l16.568-9.775z'/><path id='F' d='M.79 30.869c-.343-.349-.457-.931-.457-1.629v.116c0 .698.229 1.28.571 1.629v-.116H.79zm24.681-12.801l-5.713 3.259.114.116 5.599-3.258c.8-.466 1.143-1.047 1.143-1.629 0 .582-.457 1.047-1.143 1.513z'/><path id='G' d='M3.19 2.125l22.281 12.917c.686.466 1.143.931 1.143 1.513 0-.582-.343-1.164-1.143-1.629L3.19 2.008C1.59 1.077.333 1.775.333 3.637v.116c0-1.746 1.257-2.56 2.857-1.629z'/></defs>
            </svg></a></div>
          </div>
        </div>
      </div>
      <div class="text-center fs-sm pt-4 mt-3 pb-2">&copy; All rights reserved. Made by <a href='https://createx.studio/' class='d-inline-block nav-link p-0' target='_blank' rel='noopener'>Createx Studio</a></div>
    </div>
  </footer>
  <!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
  <!-- Vendor scrits: js libraries and plugins-->
  <script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/simplebar/dist/simplebar.min.js"></script>
  <script src="vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
  <script src="vendor/nouislider/dist/nouislider.min.js"></script>
  <script src="vendor/tiny-slider/dist/min/tiny-slider.js"></script>
  <!-- Main theme script-->
  <script src="js/theme.min.js"></script>
</body>
</html>