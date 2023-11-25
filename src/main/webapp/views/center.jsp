<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<section class="container pt-5 mt-5 pb-lg-4">
    <div class="row pt-0 pt-md-2 pt-lg-0">
        <div class="col-xl-7 col-lg-6 col-md-5 order-md-2 mb-4 mb-lg-3"><img src="img/real-estate/starfriends.png" alt="스타프렌즈"></div>
        <div class="col-xl-5 col-lg-6 col-md-7 order-md-1 pt-xl-5 pe-lg-0 mb-3 text-md-start text-center">
            <h1 class="display-4 mt-lg-5 mb-md-4 mb-3 pt-md-4 pb-lg-2">KB 고객님이 선택한 <br> BEST 인기상품</h1>
            <p class="position-relative lead me-lg-n5">가장 많이 사랑받은 인기상품만 모아모아 보여드려요</p>
        </div>
    </div>
</section>
<!-- Property categories-->아
<section class="container mb-5">
    <div class="row row-cols-lg-6 row-cols-sm-3 row-cols-2 g-3 g-xl-4">
        <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="/K10100">
            <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto pt-1"><img src="img/real-estate/coli.png" style="width:1.5em"></div>
            <h3 class="icon-box-title fs-base mb-0">요구불</h3></a></div>
        <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="/K10200">
            <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="img/real-estate/bibi.png" style="width:1.4em"></div>
            <h3 class="icon-box-title fs-base mb-0">정기예금</h3></a></div>
        <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="/K10300">
            <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="img/real-estate/ageo.png" style="width:1.8em"></div>
            <h3 class="icon-box-title fs-base mb-0">적금</h3></a></div>
        <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="/K20100">
            <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="img/real-estate/kiki.png" style="width:1.9em"></div>
            <h3 class="icon-box-title fs-base mb-0">개인대출</h3></a></div>
        <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="/K20200">
            <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="img/real-estate/lamu.png" style="width:2em"></div>
            <h3 class="icon-box-title fs-base mb-0">사업자대출</h3></a></div>
        <div class="col">
            <div class="dropdown h-100"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover text-center" href="#" data-bs-toggle="dropdown">
                <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto pt-2"><img src="img/real-estate/heart.png" style="width:1.4em"></div>
                <h3 class="icon-box-title fs-base mb-0">KB카드</h3></a>
                <div class="dropdown-menu dropdown-menu-end my-1"><a class="dropdown-item fw-bold" href="/K30100"><i class="fi-single-bed fs-base opacity-60 me-2"></i>Room</a><a class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i class="fi-computer fs-base opacity-60 me-2"></i>Office</a><a class="dropdown-item fw-bold" href="real-estate-catalog-sale.html"><i class="fi-real-estate-buy fs-base opacity-60 me-2"></i>Land</a><a class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i class="fi-parking fs-base opacity-60 me-2"></i>Parking lot</a></div>
            </div>
        </div>
    </div>
</section>

<hr class="mt-n1 mb-5 d-md-none">
<!-- Top offers (carousel)-->
<section class="container mb-5 pb-md-4">
    <div class="d-flex align-items-center justify-content-between mb-3">
        <h2 class="h3 mb-0">금융상품</h2><a class="btn btn-link fw-normal p-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
    </div>
    <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
        <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
            <!-- Item-->
            <div class="col">
                <div class="card shadow-sm card-hover border-0 h-100">
                    <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                        <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">예금BEST</span></div>
                        <div class="content-overlay end-0 top-0 pt-3 pe-3">
                        </div><img src="img/real-estate/catalog/01.png  " alt="Image">
                    </div>
                    <div class="card-body position-relative pb-3">
                        <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">적금</h4>
                        <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">KB내맘대로적금</a></h3>
                        <p class="mb-2 fs-sm text-muted">누구나 쉽게 우대받는 DIY</p>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>내 맘대로 선택하는 우대이율 조건</div>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>내 맘대로 선택하는 무료보험 서비스</div>
                    </div>
                </div>
            </div>
            <!-- Item-->
            <div class="col">
                <div class="card shadow-sm card-hover border-0 h-100">
                    <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                        <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">예금BEST</span></div>
                        <div class="content-overlay end-0 top-0 pt-3 pe-3">
                        </div><img src="img/real-estate/catalog/02.png" alt="Image">
                    </div>
                    <div class="card-body position-relative pb-3">
                        <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">정기예금</h4>
                        <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">KB국민UP정기예금</a></h3>
                        <p class="mb-2 fs-sm text-muted">월복리로 목돈 굴리는 예금</p>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>매월 복리로 상승하는 이율</div>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>급할 땐 해지하지 않아도 일부출금</div>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>최대 0.2%p 우대이율 혜택</div>
                    </div>
                </div>
            </div>
            <!-- Item-->
            <div class="col">
                <div class="card shadow-sm card-hover border-0 h-100">
                    <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                        <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">대출BEST</span></div>
                        <div class="content-overlay end-0 top-0 pt-3 pe-3">
                        </div><img src="img/real-estate/catalog/03.png" alt="Image">
                    </div>
                    <div class="card-body position-relative pb-3">
                        <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">개인대출</h4>
                        <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">부동산담보대출</a></h3>
                        <p class="mb-2 fs-sm text-muted">담보대출도 쉽고 빠르게</p>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>쉽게 비대면으로 신청하는 담보대출</div>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>혼합금리/변동금리 선택 가능</div>
                    </div>
                </div>
            </div>
            <!-- Item-->
            <div class="col">
                <div class="card shadow-sm card-hover border-0 h-100">
                    <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                        <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">대출BEST</span></div>
                        <div class="content-overlay end-0 top-0 pt-3 pe-3">
                        </div><img src="img/real-estate/catalog/04.png" alt="Image">
                    </div>
                    <div class="card-body position-relative pb-3">
                        <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">사업자대출</h4>
                        <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">비대면소상공인대출</a></h3>
                        <p class="mb-2 fs-sm text-muted">담보없이 최대 1억원</p>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>개인사업자를 위한 간편한 신용대출</div>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>필요할 때 365일 24시간 언제든지</div>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>중도상환수수료 면제</div>
                    </div>
                </div>
            </div>
            <!-- Item-->
            <div class="col">
                <div class="card shadow-sm card-hover border-0 h-100">
                    <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                        <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-warning mb-1">카드BEST</span><span class="d-table badge bg-danger mb-1">NEW</span></div>
                        <div class="content-overlay end-0 top-0 pt-3 pe-3">
                        </div><img src="img/real-estate/catalog/05.png" alt="Image">
                    </div>
                    <div class="card-body position-relative pb-3">
                        <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">카드</h4>
                        <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">WE:SH All 카드</a></h3>
                        <p class="mb-2 fs-sm text-muted">쇼핑 필수카드!</p>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>실적, 한도 없이 국내가맹점 1% 할인</div>
                        <div class="fw-semibold"><i class="fi-check mt-n1 me-2 lead align-middle opacity-50"></i>쇼핑멤버십 50% 할인</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Recently added-->
<section class="container pb-4 pt-1 mb-5">
    <div class="d-flex align-items-end align-items-lg-center justify-content-between mb-4 pb-md-2">
        <div class="d-flex w-100 align-items-center justify-content-between justify-content-lg-start">
            <h2 class="h3 mb-0 me-md-4">이벤트</h2>
            <div class="dropdown d-md-none" data-bs-toggle="select">
                <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown"><span class="dropdown-toggle-label">Houses</span></button>
                <input type="hidden">
                <div class="dropdown-menu"><a class="dropdown-item" href="#"><span class="dropdown-item-label">Apartments</span></a><a class="dropdown-item" href="#"><span class="dropdown-item-label">Houses</span></a><a class="dropdown-item" href="#"><span class="dropdown-item-label">Rooms</span></a><a class="dropdown-item" href="#"><span class="dropdown-item-label">Commercial</span></a></div>
            </div>
        </div><a class="btn btn-link fw-normal d-none d-lg-block p-0" href="/E00001">전체보기<i class="fi-arrow-long-right ms-2"></i></a>
    </div>
    <div class="row g-4">
        <div class="col-md-6">
            <div class="card bg-size-cover bg-position-center border-0 overflow-hidden h-100" style="background-image: url(img/real-estate/recent/01.png);"><span class="img-gradient-overlay"></span>
                <div class="card-body content-overlay pb-0">
                    <div class="d-flex"></div>
                </div>
                <div class="card-footer content-overlay border-0 pt-0 pb-4">
                    <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5"><a class="text-decoration-none text-light pe-2" href="real-estate-single-v1.html">
                        <div class="fs-sm text-uppercase pt-2 mb-1">카드</div>
                        <h3 class="h5 text-light mb-1">개인사업자 카드 결제대금 정산 이벤트</h3>
                        <div class="fs-sm opacity-70"><i class="fi-calendar me-1"></i>2023년 12월 15일까지</div></a>
                        <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="real-estate-single-v1.html" style="height: 2.75rem;">참여하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card bg-size-cover bg-position-center border-0 overflow-hidden mb-4" style="background-image: url(img/real-estate/recent/02.jpg);"><span class="img-gradient-overlay"></span>
                <div class="card-body content-overlay pb-0"></div>
                <div class="card-footer content-overlay border-0 pt-0 pb-4">
                    <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5"><a class="text-decoration-none text-light pe-2" href="real-estate-single-v1.html">
                        <div class="fs-sm text-uppercase pt-2 mb-1">퇴직연금</div>
                        <h3 class="h5 text-light mb-1">연말정산 시즌이 돌아왔다! 절세끝판왕, KB IRP로 무빙!</h3>
                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>2023년 12월 29일까지</div></a>
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