<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script>

</script>

<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script >



        const chatBody = document.getElementById('chat-body');
        const userInput = document.getElementById('user-input');

        function sendMessage() {
            const userMessage = userInput.value;
            displayMessage(userMessage, 'user');
            userInput.value = '';

            // Implement your logic or API call for ChatBot response here
            const chatBotResponse = "This is a sample response from ChatBot.";
            displayMessage(chatBotResponse, 'chatbot');
        }

        function displayMessage(message, sender) {
            const messageElement = document.createElement('div');
            messageElement.classList.add(sender);
            messageElement.innerText = message;
            chatBody.appendChild(messageElement);
        }



        function changeTab(tabId) {
            // Hide all tab contents
            const tabContents = document.querySelectorAll('.tab-content');
            tabContents.forEach(content => content.style.display = 'none');

            // Show the selected tab content
            const selectedTabContent = document.getElementById(tabId + '-content');
            if (selectedTabContent) {
                selectedTabContent.style.display = 'block';

            }
        }





    </script>
<link rel="stylesheet" href="styles.css">
<script src="script.js"></script>
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
    .custom-box {
        background-color: white;
        padding: 10px;
        margin: 10px;
        text-align: center;
        border: 1px solid #ddd;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add box shadow for depth */
        border-radius: 8px; /* Add rounded corners */
    }




    #chat-window {
        position: fixed;
        bottom: 10px;
        right: 10px;
        width: 300px;
        border: 1px solid #ccc;
        border-radius: 5px;
        overflow: hidden;
    }

    #chat-header {
        background-color: #3498db;
        color: #fff;
        padding: 10px;
        text-align: center;
    }

    #chat-body {
        height: 200px;
        overflow-y: scroll;
        padding: 10px;
    }

    #chat-input {
        display: flex;
        padding: 10px;
    }

    #user-input {
        flex: 1;
        padding: 5px;
    }

    button {
        padding: 5px;
        margin-left: 5px;
    }
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .tab-container {
        max-width: 1200px;
        margin: 50px auto;
    }

    .tabs {
        display: flex;
        border: 1px solid #3498db;
    }

    .tab {
        flex: 1;
        padding: 10px;
        text-align: center;
        background-color: #2c3e50; /* 어두운 색으로 변경 */
        color: #fff;
        cursor: pointer;
    }

    .tab:hover {
        background-color: #34495e;
    }

    .tab-content {
        display: none;
        padding: 20px;
        /*border: 1px solid #3498db;*/
        /*border: 1px solid #2c3e50; !* 어두운 색으로 변경 *!*/


        background-color: #fff8ea; /* 내용 배경색을 어두운 색으로 변경 */
    }
    .red-arrow {
        color: red;
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








                <div class="offcanvas-header d-block border-bottom py-lg-4 py-3 px-lg-0" id="hello" style= "margin-top:30px; ">
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
        </aside>

        <div class="col-lg-8 col-xl-9 position-relative overflow-hidden pb-5 pt-4 px-3 px-xl-4 px-xxl-5">
            <div class="collapse d-md-block" id="account-nav">
                <ul class="nav nav-pills flex-column flex-md-row pt-3 pt-md-0 pb-md-4 border-bottom-md">
                    <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#30대</a></li>
                    <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#40대</a></li>
                    <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#서울</a></li>
                    <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#강원</a></li>
                    <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#직업전체</a></li>
                    <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#100백만초과</a></li>
                </ul>
            </div>



            <div class="tab-container">
                <div class="tabs">
                    <div class="tab" onclick="changeTab('tab1')">Tab 1</div>
                    <div class="tab" onclick="changeTab('tab2')">Tab 2</div>
                </div>
                <div class="tab-content" id="tab1-content">
                    <!-- Content for Tab 1 goes here -->
                    <h2>Tab 1 Content  </h2>
                    <i class=" fi-arrow-up red-arrow "></i>

                    <p>This is the content for Tab 1.</p>
                </div>
                <div class="tab-content" id="tab2-content">
                    <!-- Content for Tab 2 goes here -->
                    <h2>Tab 2 Content</h2>
                    <p>This is the content for Tab 2.</p>
                </div>
            </div>


            <div id="chat-window">
                <div id="chat-header">ChatBot</div>
                <div id="chat-body"></div>
                <div id="chat-input">
                    <input type="text" id="user-input" placeholder="Type your message...">
                    <button onclick="sendMessage()">Send</button>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
            <script src="script.js"></script>

            <div style="background-color: white; margin-bottom: 50px;"></div>




        </div>
        </div>
        </div>
    </div>
</div>