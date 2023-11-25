<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Page container-->
<div class="container mt-5 mb-md-4 py-5">
    <!-- Title + Breadcrumb-->
    <nav class="mb-3 pt-md-3" aria-label="Breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">금융상품</a></li>
            <li class="breadcrumb-item active" aria-current="page">정기예금</li>
        </ol>
    </nav>
    <h1 class="h2 mb-4">KB 고객님이 선택한 BEST 인기상품</h1>
    <p class="position-relative lead me-lg-n5">가장 많이 사랑받은 정기예금 상품입니다</p>
    <div class="row">
        <div class="col-sm-6 col-md-4 mb-4">
            <div class="card shadow-sm">
                <div class="card-body"><img class="d-block mx-auto mt-2 mb-4" src="img/real-estate/비비.png" style="height: 7rem;" alt="Icon">
                    <h2 class="h5 fw-normal text-center py-1 mb-0">월복리로 목돈 굴리는 예금</h2>
                    <div class="d-flex align-items-end justify-content-center mb-4">
                        <div class="h1 mb-0">국민UP정기예금</div>
                    </div>
                    <ul class="list-unstyled d-block mb-0 mx-auto" style="max-width: 16rem;">
                        <li class="d-flex"><i class="fi-check text-primary fs-sm mt-1 me-2"></i><span>매월 복리로 상승하는 이율</span></li>
                        <li class="d-flex"><i class="fi-check text-primary fs-sm mt-1 me-2"></i><span>급할 땐 일부 출금 가능</span></li>
                        <li class="d-flex"><i class="fi-check text-primary fs-sm mt-1 me-2"></i><span>우대 이율 혜택 제공</span></li>
                    </ul>
                </div>
                <div class="card-footer py-2 border-0">
                    <div class="border-top text-center pt-4 pb-3"><a class="btn btn-outline-primary" href="/K10201">상품 보기</a></div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4 mb-4">
            <div class="card shadow">
                <div class="card-body"><img class="d-block mx-auto mt-2 mb-4" src="img/real-estate/아거.png" style="height: 7rem;" alt="Icon">
                    <h2 class="h5 fw-normal text-center py-1 mb-0">다양한 통화로 예치가능한</h2>
                    <div class="d-flex align-items-end justify-content-center mb-4">
                        <div class="h1 mb-0">외화정기예금</div>
                    </div>
                    <ul class="list-unstyled d-block mb-0 mx-auto" style="max-width: 16rem;">
                        <li class="d-flex"><i class="fi-check text-primary fs-sm mt-1 me-2"></i><span>외국통화를 자유롭게 예치</span></li>
                        <li class="d-flex"><i class="fi-check text-primary fs-sm mt-1 me-2"></i><span>제한없고, 자동갱신까지</span></li>
                        <li class="d-flex"><i class="fi-check text-primary fs-sm mt-1 me-2"></i><span>대한민국 국민이라면 누구나</span></li>
                    </ul>
                </div>
                <div class="card-footer py-2 border-0">
                    <div class="border-top text-center pt-4 pb-3"><a class="btn btn-outline-primary" href="/K10202">상품 보기</a></div>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm">
                <div class="card-body"><img class="d-block mx-auto mt-2 mb-4" src="img/real-estate/키키.png" style="height: 7rem;" alt="Icon">
                    <h2 class="h5 fw-normal text-center py-1 mb-0">Digital KB의 대표 정기예금</h2>
                    <div class="d-flex align-items-end justify-content-center mb-4">
                        <div class="h1 mb-0">KB Star 정기예금</div>
                    </div>
                    <ul class="list-unstyled d-block mb-0 mx-auto" style="max-width: 16rem;">
                        <li class="d-flex"><i class="fi-check text-primary fs-sm mt-1 me-2"></i><span>만기 자동 재예치</span></li>
                        <li class="d-flex"><i class="fi-check text-primary fs-sm mt-1 me-2"></i><span>급할 땐 분할 인출</span></li>
                        <li class="d-flex"><i class="fi-check text-primary fs-xs mt-2 me-2"></i><span>목돈 불리는 예금</span></li>
                    </ul>
                </div>
                <div class="card-footer py-2 border-0">
                    <div class="border-top text-center pt-4 pb-3"><a class="btn btn-outline-primary" href="/K10201">상품 보기</a></div>
                </div>
            </div>
        </div>
    </div>
</div>