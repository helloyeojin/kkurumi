<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">





<script>
    function searchAndDisplay() {
        var customerPin = $('#customerPin').val();
        $('#customerProfile2').hide();


        if (customerPin === '12345') {
            $('#customerProfile').show();
            $('#customerProfile2').show();
            $('#hello').css('opacity', 0); // 투명도를 조절하여 요소를 숨김
            setTimeout(function() {
                $('#hello').hide(); // 숨겨진 후에 display를 변경하여 완전히 사라지게 함
                $('#customerProfile3').hide();
            }, 500); // 투명도 변경 애니메이션 시간 (0.5초 = 500밀리초)
        } else {
            alert('잘못된 핀번호 입니다!');
        }


    }









        $(document).ready(function() {

            Highcharts.chart('container1', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'KB 국민은행 상품 가입 관심도',
                    align: 'left',
                    margin: 20 ,
                    style: {
                        fontFamily: 'Arial, sans-serif', // Change the font family
                        fontWeight: 'bold', // Optionally, set the font weight
                        fontSize: '20px' // Optionally, set the font size
                    }

                },
                subtitle: {
                    text: '해당고객의 주 관심 카테고리는 요구불 입니다.',
                    align: 'left',
                    margin: 10,
                    style: {
                        fontFamily: 'Arial',
                        fontSize: '12px' // Optionally, set the font size
                    }
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                accessibility: {
                    point: {
                        valueSuffix: '%'
                    }
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: false
                        },
                        showInLegend: true
                    }
                },
                series: [{
                    name: 'Product',
                    colorByPoint: true,
                    data: [{
                        name: '요구불',
                        y: 74.77,
                        sliced: true,
                        selected: true
                    },  {
                        name: '정기예금',
                        y: 12.82
                    },  {
                        name: '적금',
                        y: 4.63
                    }, {
                        name: '개인대출',
                        y: 2.44
                    }, {
                        name: '사업자대출',
                        y: 2.02
                    }, {
                        name: 'KB카드',
                        y: 3.28
                    }]
                }]
            });

            Highcharts.chart('container2', {
            chart: {
                type: 'spline',
                scrollablePlotArea: {
                    minWidth: 600,
                    scrollPositionX: 1
                }
            },
            title: {
                text: 'KB국민은행 접속 경로',
                align: 'left',
                margin: 20 // Set the margin between subtitle and plot area
            },
            subtitle: {
                text: '해당 고객은 주로 "스타뱅킹"을 사용해요. \n\ 최근 접속빈도는 "30% 줄었어요".',
                align: 'left',
                margin: 10 // Set the margin between subtitle and plot area
            },
            xAxis: {
                type: 'datetime',
                labels: {
                    overflow: 'justify'
                }
            },
            yAxis: {
                title: {

                },
                minorGridLineWidth: 0,
                gridLineWidth: 0,
                alternateGridColor: null,
                plotBands: [{ // Light air
                    from: 0.3,
                    to: 1.5,
                    color: 'rgba(68, 170, 213, 0.1)',
                    label: {
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Light breeze
                    from: 1.5,
                    to: 3.3,
                    color: 'rgba(0, 0, 0, 0)',
                    label: {

                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Gentle breeze
                    from: 3.3,
                    to: 5.5,
                    color: 'rgba(68, 170, 213, 0.1)',
                    label: {

                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Moderate breeze
                    from: 5.5,
                    to: 8,
                    color: 'rgba(0, 0, 0, 0)',
                    label: {

                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Fresh breeze
                    from: 8,
                    to: 11,
                    color: 'rgba(68, 170, 213, 0.1)',
                    label: {
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Strong breeze
                    from: 11,
                    to: 14,
                    color: 'rgba(0, 0, 0, 0)',
                    label: {
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Near Gale
                    from: 14,
                    to: 17,
                    color: 'rgba(68, 170, 213, 0.1)',
                    label: {
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Fresh Gale
                    from: 17,
                    to: 20.5,
                    color: 'rgba(0, 0, 0, 0)',
                    label: {
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Strong Gale
                    from: 20.5,
                    to: 24,
                    color: 'rgba(68, 170, 213, 0.1)',
                    label: {
                        style: {
                            color: '#606060'
                        }
                    }
                }]
            },
            tooltip: {
                valueSuffix: ' m/s'
            },
            plotOptions: {
                spline: {
                    lineWidth: 4,
                    states: {
                        hover: {
                            lineWidth: 5
                        }
                    },
                    marker: {
                        enabled: false
                    },
                    pointInterval: 3600000, // one hour
                    pointStart: Date.UTC(2020, 3, 15, 0, 0, 0)
                }
            },
            series: [{
                name: '스타뱅킹',
                data: [5.4, 5.2, 5.7, 6.3, 5.2, 5.6, 6.1,
                    5.6, 5.9, 7.1, 8.6, 7.8, 8.6,
                    8.0, 9.7, 11.2, 12.5, 13.1, 10.6,
                    10.9, 8.9, 9.5, 7.5, 3.5, 4.2]

            }, {
                name: '인터넷뱅킹',
                data: [0.2, 0.1, 0.1, 0.5, 0.3, 0.2, 0.1,
                    0.1, 0.1, 0.1, 0.2, 1.1, 1.3,
                    2.0, 1.5, 1.5, 1.5, 1.4, 1.7,
                    2.0, 2.9, 2.1, 2.1, 3.5, 2.9]
            }],
            navigation: {
                menuItemStyle: {
                    fontSize: '10px'
                }
            }
        })
        });

        $(document).ready(function () {
            // Initialize datepicker
            $('#datepicker').datepicker({
                format: 'yyyy-mm-dd', // Set the desired date format
                autoclose: true
            });
        });





    function startTyping() {
        const text = "(광고) 당신의 믿음 가는 파트너, 국민은행에서 직장인을 우대하는 <br> 특화 상품을 제공합니다. <br>지금 신청하세요!"; // 타이핑될 텍스트

        // 타이핑 효과
        const typedText = document.getElementById('typedText');
        typedText.textContent = ''; // 기존 텍스트 초기화

        let index = 0;
        const typingInterval = setInterval(() => {
            typedText.textContent += text[index];
            index++;

            if (index === text.length) {
                clearInterval(typingInterval);
            }
        }, 100); // 100ms 간격으로 글자가 타이핑됨
    }


    function updateSearchRanking() {
        var searchKeywords = [
            "KB국민ONE통장", "직장인우대통장", "주택청약종합저축", "KB수퍼정기예금", "외화수출입통장", "맑은하늘적금", "맑은바다적금", "마이핏통장"
        ];
        var searchRanking = document.getElementById('searchRanking');
        var searchRanking2 = document.getElementById('searchRanking2');
        var searchRanking3 = document.getElementById('searchRanking3');

        // 랜덤 검색어로 실시간 검색어 순위 갱신
        searchRanking.innerHTML = ''; // 이전 내용 비우기
        for (var i = 0; i < 5; i++) {
            var randomIndex = Math.floor(Math.random() * searchKeywords.length);
            var newKeyword = searchKeywords[randomIndex];

            var listItem = document.createElement('li');
            listItem.textContent = (i + 1) + '. ' + newKeyword;
            searchRanking.appendChild(listItem);
        }


        searchRanking2.innerHTML = ''; // 이전 내용 비우기
        for (var i = 0; i < 5; i++) {
            var randomIndex = Math.floor(Math.random() * searchKeywords.length);
            var newKeyword = searchKeywords[randomIndex];

            var listItem = document.createElement('li');
            listItem.textContent = (i + 1) + '. ' + newKeyword;
            searchRanking2.appendChild(listItem);
        }


        searchRanking3.innerHTML = ''; // 이전 내용 비우기
        for (var i = 0; i < 5; i++) {
            var randomIndex = Math.floor(Math.random() * searchKeywords.length);
            var newKeyword = searchKeywords[randomIndex];

            var listItem = document.createElement('li');
            listItem.textContent = (i + 1) + '. ' + newKeyword;
            searchRanking3.appendChild(listItem);
        }

    }


    // 1초마다 실시간 검색어 순위 업데이트
    setInterval(updateSearchRanking, 1500);
    updateSearchRanking(); // 페이지 로딩시에도 한 번 호출하여 초기 데이터 표시



    </script>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Initialize flatpickr for the sidebar
        const sidebarDatePicker = flatpickr('#sidebarDatepicker', {
            mode: 'range',
            dateFormat: 'Y-m-d',
            theme: 'airbnb',
            onClose: function (selectedDates, dateStr, instance) {
                console.log('Selected Dates (Sidebar):', selectedDates);
                // Add your logic to update the main content based on the selected date range
            },
        });

        // Update the main datepicker when a date range option is selected in the sidebar
        flatpickr('.date-range-options', {
            enable: Object.fromEntries(Object.entries(dateRangeOptions).map(([key, value]) => [key, true])),
            disable: [function (date) {
                return (date < dateRangeOptions['Last 1 Year'][0] || date > dateRangeOptions.Today[1]);
            }],
            onValueUpdate: function (selectedDates, dateStr, instance) {
                sidebarDatePicker.setDate(dateRangeOptions[dateStr]);
            },
        });
    });


</script>
<style>

    .phone-box {
        width: 300px;
        height: 500px;
        background-color: #ccc;
        border-radius: 20px;
        padding: 20px;
        position: relative;
        overflow: hidden;
        margin: 20px;
    }

    /* 휴대폰 상단 바 */
    .phone-box:before {
        content: '';
        display: block;
        width: 100%;
        height: 30px;
        background: #444;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        position: absolute;
        top: 0;
    }

    /* 화면 영역 */
    .phone-screen {
        width: calc(100% - 40px);
        height: calc(100% - 80px);
        background: #fff;
        border-radius: 10px;
        overflow: hidden;
        position: relative;
        top: 40px;
        left: 50%;
        transform: translateX(-50%);
        padding: 10px;
        display: inline-flex;
    }







    .custom-box {
        background-color: white;
        padding: 10px;
        margin: 10px;
        text-align: center;
        border: 1px solid #ddd;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add box shadow for depth */
        border-radius: 8px; /* Add rounded corners */
    }

    .red-arrow {
        color: red;
    }

    .search-ranking ul {
        list-style-type: none;
        padding: 0;
    }
    .search-ranking li {
        margin-bottom: 5px;
        padding: 8px;

        border-radius: 5px;


        background-color: beige; /* 배경색을 베이지로 변경 */

    }


    .search-ranking2 ul {
        list-style-type: none;
        padding: 0;
    }
    .search-ranking2 li {
        margin-bottom: 5px;
        padding: 8px;

        border-radius: 5px;
        background-color: beige; /* 배경색을 베이지로 변경 */

    }


    .search-ranking3 ul {
        list-style-type: none;
        padding: 0;
    }
    .search-ranking3 li {
        margin-bottom: 5px;
        padding: 8px;

        border-radius: 5px;
        background-color: beige; /* 배경색을 베이지로 변경 */

    }
    #hello {
        transition: opacity 0.5s ease; /* 투명도를 변경하는 것에 대한 transition 설정 */
    }

    @keyframes typing {
        from {
            width: 0;
        }
        to {
            width: 100%;
        }
    }
    .typed-text {
        word-wrap: break-word;
        overflow: hidden;
        border-right: .15em solid orange; /* 입력되는 커서 스타일 */
        white-space: nowrap;
        margin: 0 auto;
        letter-spacing: .15em;
        animation: typing 3s steps(40, end), blink-caret .75s step-end infinite;
    }
    /* 입력되는 커서 깜빡임 효과 */
    @keyframes blink-caret {
        from, to {
            border-color: transparent;
        }
        50% {
            border-color: orange;
        }
    }

</style>

<!-- Page container-->
<div class="container-fluid mt-5 pt-5 p-0">
    <div class="row g-0 mt-n3">
        <!-- Filters sidebar (Offcanvas on mobile)-->
        <aside class="col-lg-4 col-xl-3 border-top-lg border-end-lg shadow-sm px-3 px-xl-4 px-xxl-5 pt-lg-2">
            <div class="offcanvas-lg offcanvas-start" id="filters-sidebar">
                <div class="offcanvas-header d-flex d-lg-none align-items-center">
                    <h2 class="h5 mb-0">Filters</h2>
                    <button class="btn-close" type="button" data-bs-dismiss="offcanvas" data-bs-target="#filters-sidebar"></button>
                </div>
                <!-- Search form-->
                <div class="offcanvas-header d-block border-bottom pt-0 pt-lg-4 px-lg-0">
                    <form class="form-group mb-lg-2 rounded-pill">
                        <div class="input-group">
                            <span class="input-group-text text-muted"><i class="fi-search"></i></span>
                            <input class="form-control" type="text" placeholder="고객PIN 입력" id="customerPin">
                        </div>
                        <button class="btn btn-primary rounded-pill d-lg-inline-block d-none" type="button" onclick="searchAndDisplay()">검색</button>
                        <button class="btn btn-icon btn-primary rounded-circle flex-shrink-0 d-lg-none d-inline-flex" type="button" onclick="searchAndDisplay()"><i class="fi-search mt-n2"></i></button>
                    </form>
                </div>

                <div class="box-media bg-faded-warning text-warning mb-3 mx-auto" style="width: 13em; height: 13em; border-radius: 0.5rem; display: none;" id="customerProfile">
                    <button id="closeButton">닫기</button>
                    <img src="img/real-estate/profile.png" style="width: 100%; height: 100%; object-fit: cover; border-radius: inherit;">



                    <p style="margin-top: 8px; text-align: center; color: black; font-weight: bold;">김국민</p>
                    <div class="collapse d-md-block" id="account-nav1">
                        <ul class="nav nav-pills flex-column flex-md-row pt-3 pt-md-0 pb-md-4 border-bottom-md">
                            <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#30대 남자</a></li>
                            <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#서울</a></li>
                            <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#증권사근무</a></li>
                            <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#100백만초과</a></li>
                        </ul>

                        <button type="button" class="btn btn-outline-secondary col-6 text-right">전화 걸기</button>
                        <button onclick="startTyping()" type="button" class="btn btn-outline-secondary col-6 text-right">SMS 보내기</button>







                    </div>


                </div>





               <div id = hello>
                <div class="offcanvas-header d-block border-bottom py-lg-4 py-3 px-lg-0"  style= "margin-top:30px; ">
                    <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item"><a class="nav-link d-flex align-items-center active" href="#categories" data-bs-toggle="tab" role="tab"><i class="fi-list me-2"></i>상품카테고리</a></li>
                        <li class="nav-item"><a class="nav-link d-flex align-items-center" href="#filters" data-bs-toggle="tab" role="tab"><i class="fi-filter-alt-horizontal me-2"></i>필터</a></li>
                    </ul>
                </div>


                <div class="offcanvas-body py-lg-4">
                    <!-- Tabs content-->
                    <div class="tab-content">
                        <!-- Categories-->
                        <div class="tab-pane fade show active" id="categories" role="tabpanel">
                            <div class="row row-cols-lg-2 row-cols-1 g-3">
                                <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="/K10100">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto pt-1"><img src="/img/real-estate/coli.png" style="width:1.5em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">요구불</h3></a></div>
                                <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="/K10200">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="/img/real-estate/bibi.png" style="width:1.4em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">정기예금</h3></a></div>
                                <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="/K10300">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="/img/real-estate/ageo.png" style="width:1.8em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">적금</h3></a></div>
                                <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="/K20100">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="/img/real-estate/kiki.png" style="width:1.9em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">개인대출</h3></a></div>
                                <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="/K20200">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="/img/real-estate/lamu.png" style="width:2em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">사업자대출</h3></a></div>
                                <div class="col">
                                    <div class="dropdown h-100"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover text-center" href="#" data-bs-toggle="dropdown">
                                        <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto pt-2"><img src="/img/real-estate/heart.png" style="width:1.4em"></div>
                                        <h3 class="icon-box-title fs-base mb-0">KB카드</h3></a>
                                        <div class="dropdown-menu dropdown-menu-end my-1"><a class="dropdown-item fw-bold" href="/K30100"><i class="fi-single-bed fs-base opacity-60 me-2"></i>Room</a><a class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i class="fi-computer fs-base opacity-60 me-2"></i>Office</a><a class="dropdown-item fw-bold" href="real-estate-catalog-sale.html"><i class="fi-real-estate-buy fs-base opacity-60 me-2"></i>Land</a><a class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i class="fi-parking fs-base opacity-60 me-2"></i>Parking lot</a></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Filters-->
                        <div class="tab-pane fade" id="filters" role="tabpanel">
                            <div class="py-4" style="margin-left: 25%; margin-top: -5%;">
                                <button class="btn btn-outline-primary rounded-pill" type="button"><i class="fi-rotate-right me-2"></i>분석 시작하기</button>
                            </div>
                            <div class="pb-4 mb-2">
                                <h3 class="h6">연령</h3>

                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="ageTotal">
                                        <label class="form-check-label fs-sm" for="ageTotal">전체선택</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age10">
                                        <label class="form-check-label fs-sm" for="age10">10대이하</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age20">
                                        <label class="form-check-label fs-sm" for="age20">20대</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age30">
                                        <label class="form-check-label fs-sm" for="age30">30대</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age40" checked>
                                        <label class="form-check-label fs-sm" for="age40">40대</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age50">
                                        <label class="form-check-label fs-sm" for="age50">50대</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age60">
                                        <label class="form-check-label fs-sm" for="age60">60대이상</label>
                                    </div>
                                </div>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">성별</h3>
                                <select class="form-select mb-2">
                                    <option value="" selected>전체</option>
                                    <option value="Berlin" >남</option>
                                    <option value="Hamburg">여</option>
                                </select>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">지역</h3>
                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="districtTotal">
                                        <label class="form-check-label fs-sm" for="districtTotal">전체지역</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="seoul">
                                        <label class="form-check-label fs-sm" for="seoul">서울</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="kangwon">
                                        <label class="form-check-label fs-sm" for="kangwon">강원</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="kyungsang">
                                        <label class="form-check-label fs-sm" for="kyungsang">경상</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="jeonra">
                                        <label class="form-check-label fs-sm" for="jeonra">전라</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="choongchung">
                                        <label class="form-check-label fs-sm" for="choongchung">충청</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="jeju">
                                        <label class="form-check-label fs-sm" for="jeju">제주</label>
                                    </div>
                                </div>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">소득구간</h3>
                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="payTotal">
                                        <label class="form-check-label fs-sm" for="payTotal">전체 구간</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="2000">
                                        <label class="form-check-label fs-sm" for="2000">20백만 이하</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="5500">
                                        <label class="form-check-label fs-sm" for="5500">20백만 ~ 55백만</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="10000">
                                        <label class="form-check-label fs-sm" for="10000">55백만 ~ 100백만</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="100000">
                                        <label class="form-check-label fs-sm" for="100000">100백만 초과</label>
                                    </div>
                                </div>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">직업</h3>
                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="jobTotal">
                                        <label class="form-check-label fs-sm" for="jobTotal">직업 전체</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="employee">
                                        <label class="form-check-label fs-sm" for="employee">직장인</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="soho">
                                        <label class="form-check-label fs-sm" for="soho">개인사업자</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="unemployed">
                                        <label class="form-check-label fs-sm" for="unemployed">무직</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="student">
                                        <label class="form-check-label fs-sm" for="student">학생</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="householder">
                                        <label class="form-check-label fs-sm" for="householder">주부</label>
                                    </div>
                                </div>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">신용도</h3>
                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="csoreTotal">
                                        <label class="form-check-label fs-sm" for="csoreTotal">전체 등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="4">
                                        <label class="form-check-label fs-sm" for="4">1 ~ 4등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="6">
                                        <label class="form-check-label fs-sm" for="6">5 ~ 6등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="10">
                                        <label class="form-check-label fs-sm" for="10">7 ~ 10등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="12">
                                        <label class="form-check-label fs-sm" for="12">10등급 이상</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </aside>

        <div class="col-lg-8 col-xl-9 position-relative overflow-hidden pb-5 pt-4 px-3 px-xl-4 px-xxl-5">
            <div class="collapse d-md-block" id="account-nav">
                <ul class="nav nav-pills flex-column flex-md-row pt-3 pt-md-0 pb-md-4">
                    <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link bg-faded-primary text-primary">#전연령대</a></li>
                    <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link bg-faded-primary text-primary">#직업전체</a></li>
                    <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link bg-faded-primary text-primary">#소득전체</a></li>
                </ul>
            </div>


            <div class="btn-group" role="group" aria-label="Date Range Options">
                <button type="button" class="btn btn-outline-secondary date-range-options" data-date-range="Today">오늘 </button>
                <button type="button" class="btn btn-outline-secondary date-range-options" data-date-range="Last 30 Days">최근 일주일</button>
                <button type="button" class="btn btn-outline-secondary date-range-options" data-date-range="Last 1 Year">최근 한달</button>
            </div>

            <div class="수치" id="customerProfile3" style="background-color: #f9f9f9; margin-top: 50px;" >

                <div class="container">

                    <div class="row justify-content-center">
                        <div style="margin-top: 50px;"> </div>
                        <div class="col-md-4">
                            <div class="custom-box"><h4>실시간 많이 본 상품</h4>

<%--                                    <div class>         전월 대비 상승 2.2% <i class=" fi-arrow-up red-arrow "></i>   <div class="triangle" style="border-left: 5px solid transparent; border-right: 5px solid transparent; border-bottom: 8px solid red; position: absolute; top: 50%; right: -10px; transform: translateY(-50%);"></div></div>--%>
                                    <ul id="searchRanking" class="search-ranking"></ul>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="custom-box"><h4>재 가입이 높은 상품</h4>
                                <!-- Table with contextual rows -->
                                <div class="table-responsive">
                                </div>
                                <ul id="searchRanking2" class="search-ranking2"></ul>

                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="custom-box"><h4>실시간 판매량 순위</h4>       <ul id="searchRanking3" class="search-ranking"></ul></div>
                        </div>
                        <div style="margin-bottom: 20px;"></div>
                    </div>
                </div>
            </div>



            <div class="수치" id="customerProfile2" style="background-color: #f9f9f9; margin-top: 50px;" >

                <div class="container">

                    <div class="row justify-content-center">
                        <div style="margin-top: 50px;"> </div>
                        <div class="col-md-4">
                            <div class="custom-box"><h4>고객님이 가장 많이 본 상품</h4>

                                <%--                                    <div class>         전월 대비 상승 2.2% <i class=" fi-arrow-up red-arrow "></i>   <div class="triangle" style="border-left: 5px solid transparent; border-right: 5px solid transparent; border-bottom: 8px solid red; position: absolute; top: 50%; right: -10px; transform: translateY(-50%);"></div></div>--%>


                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>순위</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-active">
                                        <th scope="row">1 <span class="badge bg-primary">hot</span> </th>
                                        <td>직장인든든신용대출</td>
                                    </tr>
                                    <tr class="table">
                                        <th scope="row">2</th>
                                        <td>국민전세자금대출</td>
                                    </tr>
                                    <tr class="table">
                                        <th scope="row">3  </th>
                                        <td>새희망홀씨</td>
                                    </tr>
                                    <tr class="table">
                                        <th scope="row">4 <span class="badge bg-success"> new </span></th>
                                        <td>one신용대출</td>
                                    </tr>
                                    <tr class="table">
                                        <th scope="row">5 </th>
                                        <td>주택담보대출</td>
                                    </tr>
                                    </tbody>
                                </table>





                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="custom-box"><h4> 과거 가입하신 상품</h4>
                                <!-- Table with contextual rows -->
                                <div class="table-responsive">
                                                                        <table class="table table-striped">
                                                                            <thead>
                                                                            <tr>
                                                                                <th>#</th>
                                                                                <th>순위</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <tr class="table-active">
                                                                                <th scope="row">1  </th>
                                                                                <td>주택청약종합저축</td>
                                                                            </tr>
                                                                            <tr class="table">
                                                                                <th scope="row">2 <span class="badge bg-success"> new </span> </th>
                                                                                <td>직장인우대적금</td>
                                                                            </tr>
                                                                            <tr class="table">
                                                                                <th scope="row">3  <i class=" fi-arrow-up red-arrow "></i> </th>
                                                                                <td>마이핏우대적금</td>
                                                                            </tr>
                                                                            <tr class="table">
                                                                                <th scope="row">4 </th>
                                                                                <td>소소한여행적금</td>
                                                                            </tr>
                                                                            <tr class="table">
                                                                                <th scope="row">5 <i class=" fi-arrow-down blue-arrow "></i></th>
                                                                                <td>행복언제나적금</td>
                                                                            </tr>
                                                                            </tbody>
                                                                        </table>
                                </div>


                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="custom-box"><h4> 가입확률이 높은 상품</h4>                       <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>순위</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="table-active">
                                    <th scope="row">1 <i class=" fi-arrow-up red-arrow "></i> </th>
                                    <td>노리체크카드</td>
                                </tr>
                                <tr class="table">
                                    <th scope="row">2 <i class=" fi-arrow-down blue-arrow "></i> </th>
                                    <td>스카이마일리지카드</td>
                                </tr>
                                <tr class="table">
                                    <th scope="row">3  <i class=" fi-arrow-up red-arrow "></i> </th>
                                    <td>베브3카드</td>
                                </tr>
                                <tr class="table">
                                    <th scope="row">4 </th>
                                    <td>이지올카드</td>
                                </tr>
                                <tr class="table">
                                    <th scope="row">5 </th>
                                    <td>올라운드티타늄카드</td>
                                </tr>
                                </tbody>
                            </table>  </div>
                        </div>
                        <div style="margin-bottom: 20px;"></div>
                    </div>
                </div>
            </div>







            <div class="수치" id="customerProfile4" style="background-color: #f9f9f9; margin-top: 50px;" >

                <div class="container">

                    <div class="row justify-content-center">
                        <div style="margin-top: 50px;"> </div>
                        <div class="col-md-4">
                            <div class="phone-box">

                                <%--                                    <div class>         전월 대비 상승 2.2% <i class=" fi-arrow-up red-arrow "></i>   <div class="triangle" style="border-left: 5px solid transparent; border-right: 5px solid transparent; border-bottom: 8px solid red; position: absolute; top: 50%; right: -10px; transform: translateY(-50%);"></div></div>--%>
                                    <div class="phone-screen">
                                    <div class="collapse d-md-block custom-bg" id="typingContainer">

                                        <li>AI 마케팅 문자</li>
                                        <ul class="nav nav-pills flex-column flex-md-row pt-3 pt-md-0 pb-md-4 border-bottom-md">
                                            <!-- 텍스트가 나타나는 부분 -->


                                            <li class="nav-item mb-md-0 me-md-2 pe-md-1 left">

                                            </li>

                                            <!-- 나머지 항목들도 동일하게 수정 가능 -->
                                        </ul>
                                        <span class="typed-text" id="typedText"></span>
                                    </div>
                                    </div>





                            </div>
                        </div>
                        <div class="col-md-4">
<%--                            다시--%>
<%--                            <div class="custom-box">--%>
<%--                                <!-- Table with contextual rows -->--%>
<%--                                <div class="table-responsive">--%>

<%--                                </div>--%>


<%--                            </div>--%>

                        </div>
<%--                        <div class="col-md-4">--%>
<%--                            <div class="custom-box">                         </div>--%>
<%--                        </div>--%>
                        <div style="margin-bottom: 20px;"></div>
                    </div>
                </div>
            </div>







            <!-- Add two additional boxes below the "고객 맞춤형 상품" section -->
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-md-5 text-center" >

                    </div>

                    <div class="col-md-5 text-left" >
                        <div class></div>
                    </div>
                </div>
            </div>



            <div style="background-color: white; margin-bottom: 50px;"></div>



            <div class="화면 통계" style="background-color: #f9f9f9; padding: 20px;"> 화면통계
            <div class="row">
                <div class="col-md-6">
                    <figure class="highcharts-figure" style="margin-top: 5%; background-color: #f0f0f0;">
                        <div id="containerdh1"></div>
                    </figure>
                </div>
                <div class="col-md-6">
                    <figure class="highcharts-figure" style="margin-top: 5%; background-color: #f0f0f0;">
                        <div id="containerdh2"></div>
                    </figure>
                </div>
            </div>
        </div>
        </div>
        </div>
    </div>
</div>