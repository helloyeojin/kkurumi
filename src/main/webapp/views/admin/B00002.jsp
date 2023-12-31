<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--캘린더 style 정의-->
<style>
    .datepicker {
        width: auto;
    }
</style>

<!--툴팁style 정의-->
<style>
    .tooltip {
        position: relative;
        display: inline-block;
        cursor: pointer;
    }

    .tooltip .tooltiptext {
        visibility: hidden;
        width: 120px;
        background-color: #333;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 5px;
        position: absolute;
        z-index: 1;
        bottom: 125%;
        left: 50%;
        margin-left: -60px;
        opacity: 0;
        transition: opacity 0.3s;
    }

    .tooltip:hover .tooltiptext {
        visibility: visible;
        opacity: 1;
    }
</style>

<!--실시간방문자순위 style 정의-->
<style>
    .highcharts-title {
        font-size: 1.2em !important;
    }

    .highlight-label-text {
        font-size: 0.8em !important;
    }

    .highcharts-credits {
        display: none;
    }

    #searchRanking {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .ranking-item {
        display: flex;
        align-items: center;
        opacity: 0;
        transform: translateY(20px);
        transition: opacity 0.5s, transform 0.5s;
        margin-bottom: 0;
        margin-left: 0.5em;
    }

    .ranking-item1 {
        display: flex;
        align-items: center;
        margin-bottom: 0;
        margin-left: 0.5em;
    }

    .ranking-item img {
        margin-right: 10px;
    }

    .badge1 {
        font-size: 110%;
    }
</style>

<!-- AI 마케팅 문자 style 정의-->
<style>
    .phone-box {
        width: 100%;
        height: 500px;
        background-image: url('img/real-estate/phone.png');
        background-size: 260px 500px;
        background-repeat: no-repeat;
        background-position: center;
    }

    .phone-screen {
        width: 220px;
        height: 300px;
        background: transparent;
        overflow: hidden;
        top: 80px;
        left: 37%;
        position: relative;
        transform: translateX(-50%);
        display:inline-flex;
    }

    .typed-text{
        font-size: 16px;
        white-space: normal; /* 줄 바꿈 허용 */
        word-break: break-word; /* 긴 단어들을 필요한 부분에서 줄 바꿈 */
        border-right: .15em solid orange;
        letter-spacing: .15em;
        display: block;
        text-align: left;
        animation: typing 3s steps(40, end), blink-caret .75s step-end infinite;
    }
</style>

<link rel="stylesheet" href="/css/datepick.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
    $(document).ready(function () {

        fn_mainCharts();
        fn_chartStart();
        fn_productChartsStart();
        fn_customerPIN();
        checkboxDefault();
    });

    function fn_chartStart() {
        // 체크박스 컨트롤
        $("#ageTotal").click(function () {
            // 체크박스의 상태 토글
            $("#age10").prop("checked", function (i, value) {
                return !value;
            });
            $("#age20").prop("checked", function (i, value) {
                return !value;
            });
            $("#age30").prop("checked", function (i, value) {
                return !value;
            });
            $("#age40").prop("checked", function (i, value) {
                return !value;
            });
            $("#age50").prop("checked", function (i, value) {
                return !value;
            });
            $("#age60").prop("checked", function (i, value) {
                return !value;
            });
        });
        $("#districtTotal").click(function () {
            // 체크박스의 상태 토글
            $("#seoul").prop("checked", function (i, value) {
                return !value;
            });
            $("#kyungsang").prop("checked", function (i, value) {
                return !value;
            });
            $("#kangwon").prop("checked", function (i, value) {
                return !value;
            });
            $("#jeonra").prop("checked", function (i, value) {
                return !value;
            });
            $("#choongchung").prop("checked", function (i, value) {
                return !value;
            });
            $("#jeju").prop("checked", function (i, value) {
                return !value;
            });
        });
        $("#payTotal").click(function () {
            // 체크박스의 상태 토글
            $("#2000").prop("checked", function (i, value) {
                return !value;
            });
            $("#5500").prop("checked", function (i, value) {
                return !value;
            });
            $("#10000").prop("checked", function (i, value) {
                return !value;
            });
            $("#100000").prop("checked", function (i, value) {
                return !value;
            });
        });
        $("#jobTotal").click(function () {
            // 체크박스의 상태 토글
            $("#employee").prop("checked", function (i, value) {
                return !value;
            });
            $("#soho").prop("checked", function (i, value) {
                return !value;
            });
            $("#unemployed").prop("checked", function (i, value) {
                return !value;
            });
            $("#student").prop("checked", function (i, value) {
                return !value;
            });
            $("#householder").prop("checked", function (i, value) {
                return !value;
            });
        });
        $("#csoreTotal").click(function () {
            // 체크박스의 상태 토글
            $("#4").prop("checked", function (i, value) {
                return !value;
            });
            $("#6").prop("checked", function (i, value) {
                return !value;
            });
            $("#10").prop("checked", function (i, value) {
                return !value;
            });
            $("#12").prop("checked", function (i, value) {
                return !value;
            });
        });

        //분석시작하기 버튼 클릭시 작동함수
        $('#chartsBtn').click(() => {
            tags();
            $('#yogubul').hide();
            $('#termDeposit').hide();
            $('#mainCharts').hide();
            $('#customerProfile').hide();
            $('#customerProfile2').hide();
            $('#customerPIN').hide();
            $('#Charts').show();

            //모든체크박스 checked시 값 크게 만들기
            var checkboxes = $('.form-check-input[type="checkbox"]');

            var anyUnchecked = false;
            checkboxes.each(function () {
                if (!$(this).prop('checked')) {
                    anyUnchecked = true;
                    return false; // 반복 중지
                }
            });

            if (!anyUnchecked) {
                upcount('.total', getRandomNum(3000, 5000, 0));
                upcount('.totalInterest', getRandomNum(500, 600, 0));
                upcount('.totalNotInterest', getRandomNum(200, 300, 0));
                upcount1('.stayMin', getRandomNum(5, 20, 1), 1);
                upcount1('.stayPrdtMin', getRandomNum(4, 7, 1), 1);
                upcount1('.stayLnMin', getRandomNum(18, 28, 1), 1);
            } else {
                upcount('.total', getRandomNum(1000, 3000, 0));
                upcount('.totalInterest', getRandomNum(100, 400, 0));
                upcount('.totalNotInterest', getRandomNum(25, 200, 0));
                upcount1('.stayMin', getRandomNum(5, 20, 1), 1);
                upcount1('.stayPrdtMin', getRandomNum(4, 7, 1), 1);
                upcount1('.stayLnMin', getRandomNum(18, 28, 1), 1);
            }

            Highcharts.chart('container1', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: '상품 카테고리 별 가입자수 추이',
                    align: 'left'
                },
                xAxis: {
                    categories: ['1분기', '2분기', '3분기', '4분기']
                },
                yAxis: {
                    allowDecimals: false,
                    min: 0,
                    title: {
                        text: '인원수'
                    }
                },

                plotOptions: {
                    column: {
                        stacking: 'normal'
                    }
                },

                series: [{
                    name: '요구불',
                    data: [20, 30, 40, 28],
                    stack: 'Europe',
                    color: 'rgba(255, 234, 160, 1)'
                }, {
                    name: '적금',
                    data: [290, 240, 130, 220],
                    stack: 'Europe',
                    color: 'rgba(203, 206, 247, 1)'
                }, {
                    name: '정기예금',
                    data: [320, 300, 315, 280],
                    stack: 'Europe',
                    color: 'rgba(177, 218, 254, 1)'
                }, {
                    name: '개인대출',
                    data: [310, 290, 270, 190],
                    stack: 'North America',
                    color: 'rgba(211, 243, 170, 1)'
                }, {
                    name: '사업자대출',
                    data: [120, 150, 180, 290],
                    stack: 'North America',
                    color: 'rgba(245, 190, 193, 1)'
                }, {
                    name: 'KB카드',
                    data: [77, 72, 80, 80],
                    stack: 'North America',
                    color: 'rgba(170, 149, 127, 1)'
                }]
            });

            const categories = [
                '0-10', '11-20', '21-30', '31-40', '41-50', '51-60', '60+'
            ];
            Highcharts.chart('container2', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: '연령/성별 진입비율 통계차트',
                    align: 'left'
                },
                subtitle: {
                    text: '2023년 연간통계',
                    align: 'left'
                },
                accessibility: {
                    point: {
                        valueDescriptionFormat: '{index}. 연령 {xDescription}, {value}%.'
                    }
                },
                xAxis: [{
                    categories: categories,
                    reversed: false,
                    labels: {
                        step: 1
                    },
                    accessibility: {
                        description: '나이 (남성)'
                    }
                }, { // mirror axis on right side
                    opposite: true,
                    reversed: false,
                    categories: categories,
                    linkedTo: 0,
                    labels: {
                        step: 1
                    },
                    accessibility: {
                        description: '나이 (여성)'
                    }
                }],
                yAxis: {
                    title: {
                        text: null
                    },
                    labels: {
                        format: '{abs value}%'
                    },
                    accessibility: {
                        description: 'Percentage population',
                        rangeDescription: 'Range: 0 to 5%'
                    }
                },

                plotOptions: {
                    series: {
                        stacking: 'normal',
                        borderRadius: '50%'
                    }
                },

                tooltip: {
                    format: '<b>{series.name}, 나이 {point.category}</b><br/>' +
                        '비율: {(point.y):.1f}%'
                },

                series: [{
                    name: '남성',
                    data: [
                        -1.9, -5.2, -20.6, -31.7, -25.8,
                        -10.7, -4.1
                    ],
                    color: 'rgba(177, 218, 254, 1)'
                }, {
                    name: '여성',
                    data: [
                        3.0, 3.2, 8.6, 26.7, 31.8,
                        27.7, 1.1
                    ],
                    color: 'rgba(255, 234, 160, 1)'
                }]
            });

            Highcharts.chart('container3', {
                chart: {
                    height: 250 // 높이 조정
                },
                title: {
                    text: '시간대 별 방문자수 추이',
                    align: 'left'
                },

                subtitle: {
                    text: '전영업일 기준',
                    align: 'left'
                },

                yAxis: {
                    title: {
                        text: '방문자 수'
                    }
                },

                xAxis: {
                    accessibility: {
                        rangeDescription: 'Range: 6:00 to 23:00'
                    }
                },

                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },

                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        pointStart: 6
                    }
                },

                series: [{
                    name: '요구불',
                    data: [4, 4, 65, 81, 112, 142,
                        171, 165, 155, 161, 154, 154,
                        154, 15, 15, 1, 5, 6],
                    color: 'rgba(255, 234, 160, 1)'
                }, {
                    name: '적금',
                    data: [2, 3, 2, 29, 65, 180,
                        250, 368, 337, 342, 310, 280,
                        154, 70, 30, 10, 25, 16],
                    color: 'rgba(203, 206, 247, 1)'
                }, {
                    name: '정기예금',
                    data: [null, null, 2, 29, 35, 150,
                        223, 353, 312, 256, 374, 223,
                        143, 43, 12, 2, 2, 1],
                    color: 'rgba(177, 218, 254, 1)'
                }, {
                    name: '개인대출',
                    data: [1, null, 2, 2, 6, 10,
                        25, 36, 37, 34, 31, 28,
                        15, 7, 3, 1, 2, 1],
                    color: 'rgba(211, 243, 170, 1)'
                }, {
                    name: 'KB카드',
                    data: [null, null, null, null, 5, 1,
                        5, 3, 7, 12, 10, 18,
                        15, 7, 3, null, null, 1],
                    color: 'rgba(170, 149, 127, 1)'
                }],

                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }

            });


        })
        //선택리셋 버튼 클릭시 작동함수
        $('#resetBtn').click(() => {
            untags();
        })
    };

    function fn_productChartsStart() {
        //요구불 클릭시
        $('#yogubulBtn').click(() => {
            $('#Charts').hide();
            $('#termDeposit').hide();
            $('#mainCharts').hide();
            $('#customerPIN').hide();
            $('#customerProfile').hide();
            $('#customerProfile2').hide();
            $('#yogubul').show();

            Highcharts.chart('container_yo1', {

                title: {
                    text: 'KB ONE 종합통장 월별 가입자 수 추이',
                    align: 'left',
                    style: {
                        fontSize: '1.5em'
                    }
        },
                subtitle: {
                    text: '',
                    align: 'left'
                },

                yAxis: {
                    title: {
                        text: '가입자 수'
                    }
                },

                xAxis: {
                    accessibility: {
                        rangeDescription: 'Range: 1 to 10'
                    }
                },

                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },

                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        pointStart: 1
                    }
                },

                series: [{
                    name: '남성',
                    data: [43, 48, 65, 112, 26, 42,
                        19, 65, 55, 61, 54],
                    color: 'rgba(177, 218, 254, 1)'
                }, {
                    name: '여성',
                    data: [24, 37, 29, 98, 32, 30,
                        38, 68, 72, 42, 67],
                    color: 'rgba(255, 234, 160, 1)'
                }, {
                    name: '합계',
                    data: [67, 85, 104, 210, 58, 72,
                        57, 133, 127, 103, 111],
                    color: 'rgba(245, 190, 193, 1)'
                }],

                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 30
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                },
                chart: {
                    type: 'line',
                    height: 250 // 높이 조정
                }

            });
            Highcharts.chart('container_yo2', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '지역별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '1.0em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '비율',
                        colorByPoint: true,
                        data: [
                            {
                                name: '서울',
                                y: 55.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '강원',
                                y: 26.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '충청',
                                y: 1.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '경상',
                                y: 8.5,
                                color: 'rgba(211, 243, 170, 1)'
                            },
                            {
                                name: '전라',
                                y: 6.5,
                                color: 'rgba(245, 190, 193, 1)'
                            },
                            {
                                name: '제주',
                                y: 1.68,
                                color: 'rgba(170, 149, 127, 1)'
                            }
                        ]
                    }
                ]
            });
            Highcharts.chart('container_yo3', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '소득구간별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '비율',
                        colorByPoint: true,
                        data: [
                            {
                                name: '20백만 이하',
                                y: 10.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '20~55백만',
                                y: 36.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '55~100백만',
                                y: 32.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '100백만 이상',
                                y: 21.20,
                                color: 'rgba(245, 190, 193, 1)'
                            }
                        ]
                    }
                ]
            });
            Highcharts.chart('container_yo4', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '직업별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '%',
                        colorByPoint: true,
                        data: [
                            {
                                name: '직장인',
                                y: 42.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '개인사업자',
                                y: 45.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '학생',
                                y: 5.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '무직',
                                y: 0.5,
                                color: 'rgba(211, 243, 170, 1)'
                            },
                            {
                                name: '주부',
                                y: 6.68,
                                color: 'rgba(245, 190, 193, 1)'
                            }
                        ]
                    }
                ]
            });

            Highcharts.chart('container_em1', {

                title: {
                    text: '직장인우대종합통장 월별 가입자 수 추이',
                    align: 'left'
                },

                subtitle: {
                    text: '',
                    align: 'left'
                },

                yAxis: {
                    title: {
                        text: '가입자 수'
                    }
                },

                xAxis: {
                    accessibility: {
                        rangeDescription: 'Range: 1 to 10'
                    }
                },

                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },

                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        pointStart: 1
                    }
                },

                series: [{
                    name: '남성',
                    data: [31, 42, 24, 45, 55, 42,
                        36, 65, 66, 61, 54],
                    color: 'rgba(177, 218, 254, 1)'
                }, {
                    name: '여성',
                    data: [24, 15, 29, 30, 42, 30,
                        38, 68, 66, 65, 59],
                    color: 'rgba(255, 234, 160, 1)'
                }, {
                    name: '합계',
                    data: [65, 87, 53, 75, 87, 72,
                        74, 133, 132, 126, 113],
                    color: 'rgba(245, 190, 193, 1)'
                }],

                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 30
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                },
                chart: {
                    type: 'line',
                    height: 250 // 높이 조정
                }

            });
            Highcharts.chart('container_em2', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '지역별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '비율',
                        colorByPoint: true,
                        data: [
                            {
                                name: '서울',
                                y: 53.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '강원',
                                y: 8.5,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '충청',
                                y: 9.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '경상',
                                y: 23.71,
                                color: 'rgba(211, 243, 170, 1)'
                            },
                            {
                                name: '전라',
                                y: 6.5,
                                color: 'rgba(245, 190, 193, 1)'
                            },
                            {
                                name: '제주',
                                y: 1.68,
                                color: 'rgba(170, 149, 127, 1)'
                            }
                        ]
                    }
                ]
            });
            Highcharts.chart('container_em3', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '소득구간별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '비율',
                        colorByPoint: true,
                        data: [
                            {
                                name: '20백만 이하',
                                y: 10.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '20~55백만',
                                y: 45.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '55~100백만',
                                y: 40.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '100백만 이상',
                                y: 4.20,
                                color: 'rgba(211, 243, 170, 1)'
                            }
                        ]
                    }
                ]
            });
            Highcharts.chart('container_em4', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '직업별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '%',
                        colorByPoint: true,
                        data: [
                            {
                                name: '직장인',
                                y: 78.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '개인사업자',
                                y: 10.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '학생',
                                y: 5.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '무직',
                                y: 0.5,
                                color: 'rgba(211, 243, 170, 1)'
                            },
                            {
                                name: '주부',
                                y: 5.68,
                                color: 'rgba(245, 190, 193, 1)'
                            }
                        ]
                    }
                ]
            });

            Highcharts.chart('container_free1', {

                title: {
                    text: 'KB 종합통장 월별 가입자 수 추이',
                    align: 'left'
                },

                subtitle: {
                    text: '',
                    align: 'left'
                },

                yAxis: {
                    title: {
                        text: '가입자 수'
                    }
                },

                xAxis: {
                    accessibility: {
                        rangeDescription: 'Range: 1 to 10'
                    }
                },

                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },

                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        pointStart: 1
                    }
                },

                series: [{
                    name: '남성',
                    data: [43, 48, 65, 44, 45, 42,
                        19, 37, 35, 40, 28],
                    color: 'rgba(177, 218, 254, 1)'
                }, {
                    name: '여성',
                    data: [24, 37, 29, 41, 32, 30,
                        38, 32, 32, 27, 35],
                    color: 'rgba(255, 234, 160, 1)'
                }, {
                    name: '합계',
                    data: [67, 85, 104, 85, 76, 72,
                        57, 69, 67, 67, 63],
                    color: 'rgba(245, 190, 193, 1)'
                }],

                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 30
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                },
                chart: {
                    type: 'line',
                    height: 250 // 높이 조정
                }

            });
            Highcharts.chart('container_free2', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '지역별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '비율',
                        colorByPoint: true,
                        data: [
                            {
                                name: '서울',
                                y: 45.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '강원',
                                y: 21.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '충청',
                                y: 6.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '경상',
                                y: 13.5,
                                color: 'rgba(211, 243, 170, 1)'
                            },
                            {
                                name: '전라',
                                y: 11.5,
                                color: 'rgba(245, 190, 193, 1)'
                            },
                            {
                                name: '제주',
                                y: 1.68,
                                color: 'rgba(170, 149, 127, 1)'
                            }
                        ]
                    }
                ]
            });
            Highcharts.chart('container_free3', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '소득구간별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '비율',
                        colorByPoint: true,
                        data: [
                            {
                                name: '20백만 이하',
                                y: 23.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '20~55백만',
                                y: 26.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '55~100백만',
                                y: 27.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '100백만 이상',
                                y: 26.20,
                                color: 'rgba(211, 243, 170, 1)'
                            }
                        ]
                    }
                ]
            });
            Highcharts.chart('container_free4', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '직업별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '%',
                        colorByPoint: true,
                        data: [
                            {
                                name: '직장인',
                                y: 30.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '개인사업자',
                                y: 27.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '학생',
                                y: 17.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '무직',
                                y: 10.5,
                                color: 'rgba(211, 243, 170, 1)'
                            },
                            {
                                name: '주부',
                                y: 16.68,
                                color: 'rgba(245, 190, 193, 1)'
                            }
                        ]
                    }
                ]
            });


        })
        //정기예금 클릭시
        $('#termDepositBtn').click(() => {
            $('#Charts').hide();
            $('#yogubul').hide();
            $('#mainCharts').hide();
            $('#termDeposit').show();

            Highcharts.chart('container_up1', {

                title: {
                    text: 'KB국민UP정기예금 월별 가입자 수 추이',
                    align: 'left'
                },

                subtitle: {
                    text: '',
                    align: 'left'
                },

                yAxis: {
                    title: {
                        text: '가입자 수'
                    }
                },

                xAxis: {
                    accessibility: {
                        rangeDescription: 'Range: 1 to 10'
                    }
                },

                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },

                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        pointStart: 1
                    }
                },

                series: [{
                    name: '남성',
                    data: [43, 48, 65, 63, 26, 42,
                        19, 65, 55, 61, 54],
                    color: 'rgba(177, 218, 254, 1)'
                }, {
                    name: '여성',
                    data: [24, 37, 29, 33, 32, 30,
                        38, 68, 72, 42, 67],
                    color: 'rgba(255, 234, 160, 1)'
                }, {
                    name: '합계',
                    data: [67, 85, 94, 96, 58, 72,
                        57, 133, 127, 103, 111],
                    color: 'rgba(245, 190, 193, 1)'
                }],

                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 30
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                },
                chart: {
                    type: 'line',
                    height: 250 // 높이 조정
                }

            });
            Highcharts.chart('container_up2', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '지역별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '비율',
                        colorByPoint: true,
                        data: [
                            {
                                name: '서울',
                                y: 55.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '강원',
                                y: 26.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '충청',
                                y: 1.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '경상',
                                y: 8.5,
                                color: 'rgba(211, 243, 170, 1)'
                            },
                            {
                                name: '전라',
                                y: 6.5,
                                color: 'rgba(245, 190, 193, 1)'
                            },
                            {
                                name: '제주',
                                y: 1.68,
                                color: 'rgba(170, 149, 127, 1)'
                            }
                        ]
                    }
                ]
            });
            Highcharts.chart('container_up3', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '소득구간별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '비율',
                        colorByPoint: true,
                        data: [
                            {
                                name: '20백만 이하',
                                y: 32.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '20~55백만',
                                y: 36.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '55~100백만',
                                y: 21.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '100백만 이상',
                                y: 10.20,
                                color: 'rgba(211, 243, 170, 1)'
                            }
                        ]
                    }
                ]
            });
            Highcharts.chart('container_up4', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '직업별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '%',
                        colorByPoint: true,
                        data: [
                            {
                                name: '직장인',
                                y: 32.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '개인사업자',
                                y: 25.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '학생',
                                y: 5.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '무직',
                                y: 10.5,
                                color: 'rgba(211, 243, 170, 1)'
                            },
                            {
                                name: '주부',
                                y: 26.68,
                                color: 'rgba(245, 190, 193, 1)'
                            }
                        ]
                    }
                ]
            });

            Highcharts.chart('container_fx1', {

                title: {
                    text: '외화정기예금 월별 가입자 수 추이',
                    align: 'left'
                },

                subtitle: {
                    text: '',
                    align: 'left'
                },

                yAxis: {
                    title: {
                        text: '가입자 수'
                    }
                },

                xAxis: {
                    accessibility: {
                        rangeDescription: 'Range: 1 to 10'
                    }
                },

                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },

                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        pointStart: 1
                    }
                },

                series: [{
                    name: '남성',
                    data: [31, 42, 24, 45, 55, 42,
                        36, 65, 66, 61, 54],
                    color: 'rgba(177, 218, 254, 1)'
                }, {
                    name: '여성',
                    data: [34, 45, 29, 30, 32, 30,
                        38, 68, 66, 65, 59],
                    color: 'rgba(255, 234, 160, 1)'
                }, {
                    name: '합계',
                    data: [65, 87, 53, 75, 87, 72,
                        74, 133, 132, 126, 113],
                    color: 'rgba(245, 190, 193, 1)'
                }],

                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 30
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                },
                chart: {
                    type: 'line',
                    height: 250 // 높이 조정
                }

            });
            Highcharts.chart('container_fx2', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '지역별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '비율',
                        colorByPoint: true,
                        data: [
                            {
                                name: '서울',
                                y: 63.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '강원',
                                y: 8.5,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '충청',
                                y: 9.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '경상',
                                y: 13.71,
                                color: 'rgba(211, 243, 170, 1)'
                            },
                            {
                                name: '전라',
                                y: 6.5,
                                color: 'rgba(245, 190, 193, 1)'
                            },
                            {
                                name: '제주',
                                y: 1.68,
                                color: 'rgba(170, 149, 127, 1)'
                            }
                        ]
                    }
                ]
            });
            Highcharts.chart('container_fx3', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '소득구간별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '비율',
                        colorByPoint: true,
                        data: [
                            {
                                name: '20백만 이하',
                                y: 3.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '20~55백만',
                                y: 25.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '55~100백만',
                                y: 47.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '100백만 이상',
                                y: 24.20,
                                color: 'rgba(211, 243, 170, 1)'
                            }
                        ]
                    }
                ]
            });
            Highcharts.chart('container_fx4', {
                chart: {
                    type: 'pie',
                    height: 250,
                    width: 325
                },
                title: {
                    text: '직업별 분포'
                },
                tooltip: {
                    valueSuffix: '%'
                },
                subtitle: {
                    text:
                        ''
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: [{
                            enabled: true,
                            distance: 20
                        }, {
                            enabled: true,
                            distance: -40,
                            format: '{point.percentage:.1f}%',
                            style: {
                                fontSize: '0.9em',
                                textOutline: 'none',
                                opacity: 0.7
                            },
                            filter: {
                                operator: '>',
                                property: 'percentage',
                                value: 10
                            }
                        }]
                    }
                },
                series: [
                    {
                        name: '%',
                        colorByPoint: true,
                        data: [
                            {
                                name: '직장인',
                                y: 28.02,
                                color: 'rgba(255, 234, 160, 1)'
                            },
                            {
                                name: '개인사업자',
                                y: 63.71,
                                color: 'rgba(203, 206, 247, 1)'
                            },
                            {
                                name: '학생',
                                y: 5.09,
                                color: 'rgba(177, 218, 254, 1)'
                            },
                            {
                                name: '무직',
                                y: 0.5,
                                color: 'rgba(211, 243, 170, 1)'
                            },
                            {
                                name: '주부',
                                y: 2.68,
                                color: 'rgba(245, 190, 193, 1)'
                            }
                        ]
                    }
                ]
            });
        })
    };

    function startTyping() {
        const text = "(광고)[KB국민은행] 김*민님, 급여이체 고객님을 위한 특별한 혜택 직장인든든신용대출을 추천드립니다! 자세한 내용이 궁금하다면, 지금 바로 확인해보세요."; // 타이핑될 텍스트

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


    function startTyping2() {
        const text = "(광고)[KB국민은행] 김*민님, 소득공제엔 체크카드도 중요하다는 사실 알고 계신가요? 당신의 맞춤형 NORI카드 지금 바로 확인해보세요."; // 타이핑될 텍스트

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
    function fn_mainCharts() {

        resetRanking();
        setInterval(resetRanking, 4000);

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
        };
        //setInterval(updateSearchRanking(), 1500);

        $('.datepicker').datepicker({
            dateFormat: 'yy-mm-dd',
            prevText: '<',
            nextText: '>',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });

        $('.datepicker').val(getTodayDate());

        $('#inquryBtn').click(() => {
            upcount('.totalClk', getRandomNum(1000, 3000, 0));
            upcount('.Clk101', getRandomNum(500, 1000, 0));
            upcount('.Clk102', getRandomNum(300, 500, 0));
            upcount('.Clk103', getRandomNum(600, 900, 0));
            upcount('.Clk201', getRandomNum(100, 300, 0));
            upcount('.Clk202', getRandomNum(50, 80, 0));
            upcount('.Clk301', getRandomNum(50, 90, 0));
        })

        const onChartLoad = function () {
            const chart = this,
                series = chart.series[0];

            setInterval(function () {
                const x = (new Date()).getTime(), // current time
                    y = Math.floor(Math.random() * (1000 - 500 + 1)) + 500; // Generate random number between 500 and 1000

                series.addPoint([x, y], true, true);
            }, 1000);
        };

        const data = (function () {
            const data = [];
            const time = new Date().getTime();

            for (let i = -19; i <= 0; i += 1) {
                data.push({
                    x: time + i * 1000,
                    y: Math.floor(Math.random() * (1000 - 500 + 1)) + 500 // Generate random number between 500 and 1000
                });
            }
            return data;
        }());

        Highcharts.addEvent(Highcharts.Series, 'addPoint', e => {
            const point = e.point,
                series = e.target;

            if (!series.pulse) {
                series.pulse = series.chart.renderer.circle()
                    .add(series.markerGroup);
            }

            setTimeout(() => {
                series.pulse
                    .attr({
                        x: series.xAxis.toPixels(point.x, true),
                        y: series.yAxis.toPixels(point.y, true),
                        r: series.options.marker.radius,
                        opacity: 1,
                        fill: series.color
                    })
                    .animate({
                        r: 20,
                        opacity: 0
                    }, {
                        duration: 1000
                    });
            }, 1);
        });

        Highcharts.chart('mainContainer', {
            chart: {
                type: 'spline',
                events: {
                    load: onChartLoad
                },
                height: 200
            },

            time: {
                useUTC: false
            },

            title: {
                text: '실시간 방문자 통계',
                margin: 40
            },

            accessibility: {
                announceNewData: {
                    enabled: true,
                    minAnnounceInterval: 15000,
                    announcementFormatter: function (allSeries, newSeries, newPoint) {
                        if (newPoint) {
                            return 'New point added. Value: ' + newPoint.y;
                        }
                        return false;
                    }
                }
            },

            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150,
                maxPadding: 0.1
            },

            yAxis: {
                title: {
                    text: 'Value'
                },
                plotLines: [
                    {
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }
                ]
            },

            tooltip: {
                headerFormat: '<b>{series.name}</b><br/>',
                pointFormat: '{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}'
            },

            legend: {
                enabled: false
            },

            exporting: {
                enabled: false
            },

            series: [
                {
                    name: '방문자수',
                    lineWidth: 2,
                    color: '#499A78',
                    data
                }
            ]
        });

    };

    function fn_customerPIN() {
        $('#customerPINbtn').click(() => {
            var customerPin = $('#customerPin').val();
            $('#customerProfile2').hide();

            if (customerPin === '12345') {
                $('#Charts').hide();
                $('#termDeposit').hide();
                $('#mainCharts').hide();
                $('#yogubul').hide();
                $('#customerPIN').show();
                $('#hello').css('opacity', 0); // 투명도를 조절하여 요소를 숨김
                setTimeout(function () {
                    $('#hello').hide(); // 숨겨진 후에 display를 변경하여 완전히 사라지게 함
                    $('#customerProfile3').hide();
                }, 500); // 투명도 변경 애니메이션 시간 (0.5초 = 500밀리초)
                searchAndDisplay();
            } else if (customerPin === '') {
                alert('고객 핀번호를 입력해주세요.');
            } else {
                alert('잘못된 핀번호 입니다!');
            }
        });
    };

    //숫자세기 함수
    function upcount(location, max) {
        let $counter1 = document.querySelector(location);
        let max1 = max;
        counter($counter1, max1);

        function counter($counter1, max1) {
            let now = max1;
            const handle = setInterval(() => {
                $counter1.innerHTML = Math.ceil(max1 - now).toLocaleString()
                if (now < 1) {
                    clearInterval(handle);
                }
                const step = now / 10;
                now -= step;
            }, 10);
        }
    };

    //숫자세기(소수) 함수
    function upcount1(location, max, decimalPlaces) {
        let $counter1 = document.querySelector(location);

        let max1 = max;
        let decimalPlaces1 = decimalPlaces;

        counter($counter1, max1, decimalPlaces1);

        function counter($counter1, max1, decimalPlaces1) {
            let now = 0;

            const step = Math.pow(10, -decimalPlaces1);

            const handle = setInterval(() => {
                $counter1.innerHTML = now.toLocaleString(undefined, {
                    minimumFractionDigits: decimalPlaces1,
                    maximumFractionDigits: decimalPlaces1
                });

                if (now >= max1) {
                    clearInterval(handle);
                }

                now += step;
            }, 10);
        }
    };

    //체크박스 태그들
    function tags() {
        $("#account-nav ul").empty();
        if ($('#ageTotal').is(":checked")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">#전체 연령</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#age10").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#age10").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#age20").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#age20").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#age30").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#age30").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#age40").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#age40").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#age50").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#age50").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#age60").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#age60").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }

        if ($("#genderTotal").prop("selected")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#genderTotal").val() + '</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#genderMen").prop("selected")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#genderMen").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#genderWomen").prop("selected")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#genderWomen").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }

        if ($('#districtTotal').is(":checked")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">#전체 지역</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#seoul").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#seoul").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#kangwon").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#kangwon").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#kyungsang").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#kyungsang").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#jeonra").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#jeonra").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#choongchung").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#choongchung").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#jeju").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#jeju").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }

        if ($('#payTotal').is(":checked")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">#전체 소득범위</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#2000").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#2000").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#5500").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#5500").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#10000").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#10000").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#100000").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#100000").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }

        if ($('#jobTotal').is(":checked")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">#전체 직업</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#employee").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#employee").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#soho").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#soho").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#unemployed").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#unemployed").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#student").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#student").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#householder").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#householder").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }

        if ($('#csoreTotal').is(":checked")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">#전체 신용등급</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#4").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#4").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#6").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#6").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#10").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#8").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#12").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="btn btn-translucent-primary rounded-pill">' + $("#10").val() + '</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }
    };

    //체크박스 해제 함수
    function untags() {
        $("input[type='checkbox']").each(function () {
            // 체크 상태 확인 후 unchecked로 변경
            if ($(this).is(":checked")) {
                $(this).prop("checked", false);
            }
        });
    };

    //랜덤숫자 만들기 함수
    function getRandomNum(min, max, decimalPlaces) {
        const randomNumber = Math.random() * (max - min) + min;
        return randomNumber.toFixed(decimalPlaces);
    };

    //오늘날짜 가져오는 함수
    function getTodayDate() {
        var today = new Date();
        var year = today.getFullYear();
        var month = ('0' + (today.getMonth() + 1)).slice(-2);
        var day = ('0' + today.getDate()).slice(-2);
        var dateString = year + '-' + month + '-' + day;

        return dateString;
    }

    //프로필 onclick 이벤트
    function searchAndDisplay() {

    }

    //체크박스 전체 체크 함수
    function checkboxDefault() {
        $('.form-check-input[type="checkbox"]').prop('checked', true);
    }

    //실시간 방문자 순위 함수
    function resetRanking() {
        function getRandomKeyword(excludedKeywords) {
            const keywords = ['KB국민ONE통장', 'KB국민UP정기예금', 'KB맑은하늘적금', '직장인든든 신용대출', '직장인우대적금'];
            const availableKeywords = keywords.filter(keyword => !excludedKeywords.includes(keyword));

            if (availableKeywords.length === 0) {
                // 모든 키워드가 사용되었으면 초기화
                return keywords[Math.floor(Math.random() * keywords.length)];
            }

            const randomIndex = Math.floor(Math.random() * availableKeywords.length);
            return availableKeywords[randomIndex];
        }

        // 1부터 5까지의 순위를 가진 검색어 목록을 생성
        let excludedKeywords = [];
        const rankingData = Array.from({length: 5}, (_, index) => {
            const keyword = getRandomKeyword(excludedKeywords);
            excludedKeywords.push(keyword);
            return {
                rank: index + 1,
                keyword: keyword
            };
        });

        // 검색어 목록을 화면에 표시
        const searchRankingElement = document.getElementById('searchRanking');
        searchRankingElement.innerHTML = '';

        rankingData.forEach(item => {
            const li = document.createElement('li');
            li.className = 'ranking-item';
            if (item.rank == 1) {
                li.innerHTML = '<span class="badge bg-faded-primary fw-bold mb-lg-2" style="font-size: medium">' + item.rank + '. ' + item.keyword + '</span>';
            } else if (item.rank == 5) {
                li.innerHTML = '<span class="badge bg-light" style="font-size: medium">' + item.rank + '. ' + item.keyword + '</span>';
            } else {
                li.innerHTML = '<span class="badge bg-light mb-lg-2" style="font-size: medium">' + item.rank + '. ' + item.keyword + '</span>';
            }
            searchRankingElement.appendChild(li);

            // 부드러운 애니메이션 효과
            setTimeout(function () {
                li.style.opacity = '1';
                li.style.transform = 'translateY(0)';
            }, 100);
        });
    }
</script>

<!-- Page container-->
<div class="container-fluid mt-5 pt-5 p-0">
    <div class="row g-0 mt-n3">
        <!-- Filters sidebar (Offcanvas on mobile)-->
        <aside class="col-lg-4 col-xl-3 border-top-lg border-end-lg shadow-sm px-3 px-xl-4 px-xxl-5 pt-lg-2">
            <div class="offcanvas-lg offcanvas-start" id="filters-sidebar">
                <div class="offcanvas-header d-flex d-lg-none align-items-center">
                    <h2 class="h5 mb-0">Filters</h2>
                    <button class="btn-close" type="button" data-bs-dismiss="offcanvas"
                            data-bs-target="#filters-sidebar"></button>
                </div>
                <!-- Search form-->
                <div class="offcanvas-header d-block border-bottom pt-0 pt-lg-4 px-lg-0">
                    <form class="form-group mb-lg-2 rounded-pill">
                        <div class="input-group"><span class="input-group-text text-muted"><i
                                class="fi-search"></i></span>
                            <input class="form-control" type="text" placeholder="고객PIN 입력" id="customerPin">
                        </div>
                        <button class="btn btn-primary rounded-pill d-lg-inline-block d-none" type="button"
                                id="customerPINbtn">검색
                        </button>
                        <button class="btn btn-icon btn-primary rounded-circle flex-shrink-0 d-lg-none d-inline-flex"
                                type="button"><i class="fi-search mt-n2"></i></button>
                    </form>
                </div>
                <!--프로필표출-->
                <div class="box-media bg-faded-warning text-warning mb-3 mx-auto"
                     style="height: 13em; border-radius: 0.5rem; display: none;" id="customerProfile">
                    <div style="height: 100%; display: flex; justify-content: center; align-items: center;">
                        <img src="img/real-estate/profile.png"
                             style="height: 13em; border-radius: 0.5rem; object-fit: cover; border-radius: inherit;">
                    </div>
                    <p style="margin-top: 8px; text-align: center; color: black; font-weight: bold;">김국민</p>
                    <div class="collapse d-md-block" id="account-nav1">
                        <ul class="nav nav-pills flex-column flex-md-row pt-3 pt-md-0 pb-md-4 border-bottom-md">
                            <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#30대 남자</a></li>
                            <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#서울</a></li>
                            <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#증권사근무</a></li>
                            <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">#100백만초과</a></li>
                        </ul>
                        <button type="button" class="btn btn-outline-secondary col-6 text-right">전화 걸기</button>
                        <button onclick="startTyping()" type="button"
                                class="btn btn-outline-secondary col-6 text-right">SMS 발송
                        </button>
                    </div>
                </div>


                <!-- left 네비게이션-->
                <div class="offcanvas-header d-block border-bottom py-lg-4 py-3 px-lg-0">
                    <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item"><a class="nav-link d-flex align-items-center active" href="#categories"
                                                data-bs-toggle="tab" role="tab"><i class="fi-list me-2"></i>상품카테고리</a>
                        </li>
                        <li class="nav-item"><a class="nav-link d-flex align-items-center" href="#filters"
                                                data-bs-toggle="tab" role="tab"><i
                                class="fi-filter-alt-horizontal me-2"></i>필터</a></li>
                    </ul>
                </div>
                <div class="offcanvas-body py-lg-4">
                    <!-- Tabs content-->
                    <div class="tab-content">
                        <!-- Categories-->
                        <div class="tab-pane fade show active" id="categories" role="tabpanel">
                            <div class="row row-cols-lg-2 row-cols-1 g-3">
                                <div class="col" id="yogubulBtn"><a
                                        class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto pt-1">
                                        <img src="/img/real-estate/coli.png" style="width:1.5em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">요구불</h3></a></div>
                                <div class="col" id="termDepositBtn"><a
                                        class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto">
                                        <img src="/img/real-estate/bibi.png" style="width:1.4em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">정기예금</h3></a></div>
                                <div class="col"><a
                                        class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto">
                                        <img src="/img/real-estate/ageo.png" style="width:1.8em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">적금</h3></a></div>
                                <div class="col"><a
                                        class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto">
                                        <img src="/img/real-estate/kiki.png" style="width:1.9em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">개인대출</h3></a></div>
                                <div class="col"><a
                                        class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto">
                                        <img src="/img/real-estate/lamu.png" style="width:2em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">사업자대출</h3></a></div>
                                <div class="col">
                                    <div class="dropdown h-100"><a
                                            class="icon-box card card-body h-100 border-0 shadow-sm card-hover text-center"
                                            data-bs-toggle="dropdown">
                                        <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto pt-2">
                                            <img src="/img/real-estate/heart.png" style="width:1.4em"></div>
                                        <h3 class="icon-box-title fs-base mb-0">KB카드</h3></a>
                                        <div class="dropdown-menu dropdown-menu-end my-1"><a
                                                class="dropdown-item fw-bold" href="/K30100"><i
                                                class="fi-single-bed fs-base opacity-60 me-2"></i>Room</a><a
                                                class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i
                                                class="fi-computer fs-base opacity-60 me-2"></i>Office</a><a
                                                class="dropdown-item fw-bold" href="real-estate-catalog-sale.html"><i
                                                class="fi-real-estate-buy fs-base opacity-60 me-2"></i>Land</a><a
                                                class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i
                                                class="fi-parking fs-base opacity-60 me-2"></i>Parking lot</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Filters-->
                        <div class="tab-pane fade" id="filters" role="tabpanel">
                            <div class="py-4" style="margin-top: -5%;">
                                <button class="btn btn-outline-primary rounded-pill" type="button" id="chartsBtn"><i
                                        class="fi-rotate-right me-2"></i>분석 시작
                                </button>
                                <button class="btn btn-outline-success rounded-pill" type="button" id="resetBtn"
                                        style="margin-left: 2%;"><i class="fi-refresh me-2"></i>리셋
                                </button>
                            </div>
                            <div class="pb-4 mb-2">
                                <h3 class="h6">연령</h3>

                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false"
                                     style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="ageTotal">
                                        <label class="form-check-label fs-sm" for="ageTotal">전체선택</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age10" value="#10대이하">
                                        <label class="form-check-label fs-sm" for="age10">10대이하</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age20" value="#20대">
                                        <label class="form-check-label fs-sm" for="age20">20대</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age30" value="#30대">
                                        <label class="form-check-label fs-sm" for="age30">30대</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age40" value="#40대">
                                        <label class="form-check-label fs-sm" for="age40">40대</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age50" value="#50대">
                                        <label class="form-check-label fs-sm" for="age50">50대</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="age60" value="#60대이상">
                                        <label class="form-check-label fs-sm" for="age60">60대이상</label>
                                    </div>
                                </div>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">성별</h3>
                                <select class="form-select mb-2" id="gender">
                                    <option id="genderTotal" value="#전체성별" selected>전체</option>
                                    <option id="genderMen" value="#남자">남</option>
                                    <option id="genderWomen" value="#여자">여</option>
                                </select>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">지역</h3>
                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false"
                                     style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="districtTotal">
                                        <label class="form-check-label fs-sm" for="districtTotal">전체지역</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="seoul" value="#서울">
                                        <label class="form-check-label fs-sm" for="seoul">서울</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="kangwon" value="#강원">
                                        <label class="form-check-label fs-sm" for="kangwon">강원</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="kyungsang" value="#경상">
                                        <label class="form-check-label fs-sm" for="kyungsang">경상</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="jeonra" value="#전라">
                                        <label class="form-check-label fs-sm" for="jeonra">전라</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="choongchung" value="#충청">
                                        <label class="form-check-label fs-sm" for="choongchung">충청</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="jeju" value="#제주">
                                        <label class="form-check-label fs-sm" for="jeju">제주</label>
                                    </div>
                                </div>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">소득구간</h3>
                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false"
                                     style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="payTotal">
                                        <label class="form-check-label fs-sm" for="payTotal">전체 구간</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="2000" value="#연소득 20백만이하">
                                        <label class="form-check-label fs-sm" for="2000">20백만 이하</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="5500"
                                               value="#연소득 20백만 ~ 55백만">
                                        <label class="form-check-label fs-sm" for="5500">20백만 ~ 55백만</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="10000"
                                               value="#연소득 55백만 ~ 100백만">
                                        <label class="form-check-label fs-sm" for="10000">55백만 ~ 100백만</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="100000"
                                               value="#연소득 100백만 초과">
                                        <label class="form-check-label fs-sm" for="100000">100백만 초과</label>
                                    </div>
                                </div>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">직업</h3>
                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false"
                                     style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="jobTotal">
                                        <label class="form-check-label fs-sm" for="jobTotal">직업 전체</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="employee" value="#직장인">
                                        <label class="form-check-label fs-sm" for="employee">직장인</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="soho" value="#개인사업자">
                                        <label class="form-check-label fs-sm" for="soho">개인사업자</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="unemployed" value="#무직">
                                        <label class="form-check-label fs-sm" for="unemployed">무직</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="student" value="#학생">
                                        <label class="form-check-label fs-sm" for="student">학생</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="householder" value="#주부">
                                        <label class="form-check-label fs-sm" for="householder">주부</label>
                                    </div>
                                </div>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">신용도</h3>
                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false"
                                     style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="csoreTotal">
                                        <label class="form-check-label fs-sm" for="csoreTotal">전체 등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="4" value="#신용 1~4등급">
                                        <label class="form-check-label fs-sm" for="4">1 ~ 4등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="6" value="#신용 5~6등급">
                                        <label class="form-check-label fs-sm" for="6">5 ~ 6등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="10" value="#신용 7~10등급">
                                        <label class="form-check-label fs-sm" for="10">7 ~ 10등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="12" value="#신용 10등급이상">
                                        <label class="form-check-label fs-sm" for="12">10등급 이상</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </aside>

        <div id="mainArticle"
             class="col-lg-8 col-xl-9 position-relative overflow-hidden pb-5 pt-4 px-3 px-xl-4 px-xxl-5">
            <%--분석 메인화면--%>
            <div id="mainCharts">
                <img src="img/real-estate/kkurumi_title.png"/>
                <%--<h3 class="h2 mb-2"> KB 꾸러미 통계센터</h3>--%>
                <div class="card mb-4 p-2 shadow-sm" style="margin-top: 2%;">
                    <div class="card-body pb-1">
                        <figure class="highcharts-figure" style="">
                            <div id="mainContainer"></div>
                        </figure>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 mb-4" style="margin-top: 1%;">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <div class="row justify-content-center">
                                    <div class="custom-box">
                                        <h4 class="h4 fw-bold text-center pt-1 pb-2 mb-0 border-bottom">실시간 많이 본 상품</h4>
                                        <ul id="searchRanking" class="search-ranking list-group list-group-flush"
                                            style="margin-top: 6%;"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 mb-4" style="margin-top: 1%;">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <div class="row justify-content-center">
                                    <div class="col-md-6" style="border-right:1px solid lightgray">
                                        <div class="custom-box">
                                            <h2 class="h4 fw-bold text-center pt-1 pb-2 mb-0 border-bottom">재 가입율이 높은
                                                상품</h2>
                                            <ul id="searchRanking2" class="search-ranking list-group list-group-flush"
                                                style="margin-top: 6%;">
                                                <li class="ranking-item1"><span
                                                        class="badge bg-faded-primary fw-bold mb-lg-2"
                                                        style="font-size: medium">1. KB국민UP정기예금</span></li>
                                                <li class="ranking-item1"><span class="badge bg-light mb-lg-2"
                                                                                style="font-size: medium">2. KB맑은하늘적금</span>
                                                </li>
                                                <li class="ranking-item1"><span class="badge bg-light mb-lg-2"
                                                                                style="font-size: medium">3. nori체크카드</span>
                                                </li>
                                                <li class="ranking-item1"><span class="badge bg-light mb-lg-2"
                                                                                style="font-size: medium">4. 직장인든든 신용대출</span>
                                                </li>
                                                <li class="ranking-item1"><span class="badge bg-light"
                                                                                style="font-size: medium">5. 직장인우대적금</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="custom-box">
                                            <h2 class="h4 fw-bold text-center pt-1 pb-2 mb-0 border-bottom">판매량 순위</h2>
                                            <ul id="searchRanking3" class="search-ranking list-group list-group-flush"
                                                style="margin-top: 6%;">
                                                <li class="ranking-item1"><span
                                                        class="badge bg-faded-primary fw-bold mb-lg-2"
                                                        style="font-size: medium">1. KB맑은하늘적금</span></li>
                                                <li class="ranking-item1"><span class="badge bg-light mb-lg-2"
                                                                                style="font-size: medium">2. 직장인우대적금</span>
                                                </li>
                                                <li class="ranking-item1"><span class="badge bg-light mb-lg-2"
                                                                                style="font-size: medium">3. KB국민ONE통장</span>
                                                </li>
                                                <li class="ranking-item1"><span class="badge bg-light mb-lg-2"
                                                                                style="font-size: medium">4. KB국민UP정기예금</span>
                                                </li>
                                                <li class="ranking-item1"><span class="badge bg-light"
                                                                                style="font-size: medium">5. 직장인든든 신용대출</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--일자별 클릭수-->
                <div class="card mb-4 p-2 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex mb-3 pb-3 d-inline-flex align-items-center justify-content-between"
                             style="width: 100%">
                            <div class="h4 mb-0" style="padding-left: 0.6em">일자별 클릭수</div>
                            <div class="col-md-4 d-flex align-items-center">
                                <form class="form-group mb-0">
                                    <label for="datepicker" class="mx-1 align-items-center">
                                        <i class="fi-calendar text-warning align-middle opacity-70"
                                           style="font-size:1.5em;"></i>
                                    </label>
                                    <input class="datepicker form-control pb-1 pt-1" autocomplete='off' id="datepicker"
                                           type="text" name="date1">
                                    <button type="button" class="btn btn-sm btn-translucent-dark" id="inquryBtn">조회
                                    </button>
                                </form>
                            </div>
                        </div>
                        <!--사이트맵 표출-->
                        <div class="col-sm-6 col-md-4 offset-md-4">
                            <div class="card shadow-sm" style="background-color: #b1dafe63">
                                <div class="card-body">
                                    <h6 class="fw-normal text-center pt-1 mb-0"><strong>메인화면</strong></h6>
                                    <div class="pb-1 text-center">(K00000)</div>
                                    <div class="d-flex align-items-end justify-content-center">
                                        <div class="h2 mb-0 totalClk">0</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="card shadow-sm" style="background-color: #ffeaa063">
                                    <div class="card-body">
                                        <h6 class="fw-normal text-center pt-1 mb-0"><strong>요구불</strong></h6>
                                        <div class="pb-1 text-center">(K10100)</div>
                                        <div class="d-flex align-items-end justify-content-center">
                                            <div class="h2 mb-0 Clk101">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="card shadow-sm" style="background-color: #ffeaa063">
                                    <div class="card-body">
                                        <h6 class="fw-normal text-center pt-1 mb-0"><strong>정기예금</strong></h6>
                                        <div class="pb-1 text-center">(K10200)</div>
                                        <div class="d-flex align-items-end justify-content-center">
                                            <div class="h2 mb-0 Clk102">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="card shadow-sm" style="background-color: #ffeaa063">
                                    <div class="card-body">
                                        <h6 class="fw-normal text-center pt-1 mb-0"><strong>적금</strong></h6>
                                        <div class="pb-1 text-center">(K10300)</div>
                                        <div class="d-flex align-items-end justify-content-center">
                                            <div class="h2 mb-0 Clk103">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="card shadow-sm" style="background-color: #ffeaa063">
                                    <div class="card-body">
                                        <h6 class="h6 fw-normal text-center pt-1 mb-0"><strong>개인대출</strong></h6>
                                        <div class="pb-1 text-center">(K20100)</div>
                                        <div class="d-flex align-items-end justify-content-center">
                                            <div class="h2 mb-0 Clk201">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="card shadow-sm" style="background-color: #ffeaa063">
                                    <div class="card-body">
                                        <h6 class="fw-normal text-center pt-1 mb-0"><strong>사업자대출</strong></h6>
                                        <div class="pb-1 text-center">(K20200)</div>
                                        <div class="d-flex align-items-end justify-content-center">
                                            <div class="h2 mb-0 Clk202">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="card shadow-sm" style="background-color: #ffeaa063">
                                    <div class="card-body">
                                        <h6 class="fw-normal text-center pt-1 mb-0"><strong>KB카드</strong></h6>
                                        <div class="pb-1 text-center">(K30100)</div>
                                        <div class="d-flex align-items-end justify-content-center">
                                            <div class="h2 mb-0 Clk301">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--고객PIN입력 통계--%>
            <div id="customerPIN" style="display:none;">
                <div id="custProfile">
                    <!--one 종합통장-->
                    <div class="card mb-4 p-2 shadow-sm">
                        <div class="card-body">
                            <!-- Place info-->
                            <div class="row">
                                <div id="custPic" class="border-end d-flex px-0" style="width: 30%;">
                                    <div class="d-flex flex-column justify-content-center align-items-center"
                                         style="width: 100%;">
                                        <img src="img/real-estate/profile.png"
                                             style="height: 13em; border-radius: 0.5rem; object-fit: cover; border-radius: inherit;">
                                    </div>
                                </div>
                                <div id="custInfo" class="border-end px-4" style="width: 30%;">
                                    <h4 class="mx-1">#해시태그 '김국민'</h4>
                                    <ul class="nav nav-pills flex-column">
                                        <li class="nav-item"><a class="nav-link">#남자</a></li>
                                        <li class="nav-item"><a class="nav-link">#30대</a></li>
                                        <li class="nav-item"><a class="nav-link">#서울</a></li>
                                        <li class="nav-item"><a class="nav-link">#직장인</a></li>
                                        <li class="nav-item"><a class="nav-link">#100백만초과</a></li>
                                        <li class="nav-item"><a class="nav-link">#1~4등급</a></li>
                                    </ul>
                                </div>
                                <div id="pastRegister" class="px-4" style="width: 40%;">
                                    <h4 class="mx-1"> 최근 가입하신 상품</h4>
                                    <!-- Table with contextual rows -->
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>일자</th>
                                                <th>상품명</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr class="table-active">
                                                <th scope="row">23.12.01</th>
                                                <td>주택청약종합저축</td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">22.06.23</th>
                                                <td>직장인우대적금</td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">20.11.16</th>
                                                <td>직장인든든 신용대출 <span class="badge bg-primary" style="margin-left: 1em">hot</span>
                                                </td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">20.11.16</th>
                                                <td>주택담보대출</td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">20.01.03</th>
                                                <td>KB맑은하늘적금</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--순위-->
                <div class="card mb-4 p-2 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="btn-group" role="group" aria-label="Date Range Options">
                                <button type="button" class="btn btn-outline-secondary date-range-options"
                                        data-date-range="Today">오늘
                                </button>
                                <button type="button" class="btn btn-outline-secondary date-range-options"
                                        data-date-range="Last 30 Days">최근 일주일
                                </button>
                                <button type="button" class="btn btn-outline-secondary date-range-options"
                                        data-date-range="Last 1 Year">최근 한달
                                </button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-outline-primary col-6 text-right">전화 걸기</button>

                            </div>
                        </div>
                        <div class="row justify-content-between" style="margin-top:2%;">
                            <div class="card col-md-4 px-0 py-2 shadow-sm text-center" style="width:calc(98% /3);">
                                <div class="card-body px-4">
                                    <div class="custom-box mb-5">
                                        <h4 class="mx-1 mb-4">가장 많이 본 상품</h4>
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>순위</th>
                                                <th>상품명</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr class="table-active">
                                                <th scope="row">1</th>
                                                <td>직장인든든신용대출<span class="badge bg-primary"
                                                                   style="margin-left: 1em">hot</span></td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">2</th>
                                                <td>국민전세자금대출</td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">3</th>
                                                <td>새희망홀씨</td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">4</th>
                                                <td>국민ONE신용대출<span class="badge bg-success" style="margin-left: 1em;">new</span>
                                                </td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">5</th>
                                                <td>주택담보대출</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <button onclick="startTyping()" type="button"
                                            class="btn btn-outline-primary col-6 text-right">SMS 발송
                                    </button>
                                </div>
                            </div>
                            <div class="card col-md-4 px-0 py-2 shadow-sm text-center" style="width:calc(98% /3); margin-left: 1%;">
                                <div class="card-body px-4">
                                    <div class="custom-box mb-5">
                                        <h4 class="mx-1 mb-4">가입 확률이 높은 상품</h4>
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>순위</th>
                                                <th>상품명</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr class="table">
                                                <th scope="row">1</th>
                                                <td>국민NORI카드</td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">2</th>
                                                <td>국민전세자금대출</td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">3</th>
                                                <td>국민ONE신용대출 <span class="badge bg-success" style="margin-left: 1em">new</span>
                                                </td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">4</th>
                                                <td>직장인든든신용대출<span class="badge bg-primary"
                                                                   style="margin-left: 1em">hot</span></td>
                                            </tr>
                                            <tr class="table">
                                                <th scope="row">5</th>
                                                <td>KB맑은하늘적금</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <button onclick="startTyping2()" type="button"
                                            class="btn btn-outline-primary col-6 text-right">SMS 발송
                                    </button>
                                </div>
                            </div>
                            <!--마케팅문자-->
                            <div class="card col-md-4 px-0 py-2 shadow-sm text-center" style="width:calc(98% /3); margin-left: 1%;">
                                <div class="card-body px-4">
                                    <div class="custom-box">
                                        <h4 class="mx-1">AI 마케팅문자</h4>
                                        <div class="phone-box">
                                            <div class="phone-screen">
                                                <div class="collapse d-md-block custom-bg" id="typingContainer">
                                                    <span class="typed-text" id="typedText"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--통계차트-->
            </div>

            <%--카테고리별 상품 통계--%>
            <%--요구불 상품 통계--%>
            <div id="yogubul" style="display:none;">
                <%--one 종합통장--%>
                <div class="card mb-4 px-0 py-5 shadow-sm">
                    <div class="card-body px-sm-3">
                        <!-- Place info-->
                        <div class="d-flex align-items-start mb-3 pb-2 border-bottom">
                            <div class="ps-2 ms-1">
                                <h3 class="h2 mb-2"> KB ONE 종합통장</h3>
                                <ul class="list-unstyled d-flex flex-wrap fs-sm">
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>4.9 </b>(48)
                                    </li>
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-wallet mt-n1 me-1 align-middle opacity-70"></i>연 0.1%
                                    </li>
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-accounting mt-n1 me-1 align-middle opacity-70"></i>모두가 ONE하는 다양한
                                        수수료 혜택
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- 남녀가입자수차트-->
                        <div class="mb-3 pb-3 border-bottom">
                            <figure class="highcharts-figure">
                                <div id="container_yo1"></div>
                            </figure>
                        </div>
                        <!-- 지역별 차트-->
                        <div class="mb-3 pb-4 border-bottom">
                            <div class="" style="display: flex;">
                                <figure class="highcharts-figure">
                                    <div id="container_yo2"></div>
                                </figure>
                                <figure class="highcharts-figure">
                                    <div id="container_yo3"></div>
                                </figure>
                                <figure class="highcharts-figure">
                                    <div id="container_yo4"></div>
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>
                <%--직장인 종합통장--%>
                <div class="card mb-4 p-2 shadow-sm">
                    <div class="card-body">
                        <!-- Place info-->
                        <div class="d-flex align-items-start mb-3 pb-2 border-bottom">
                            <div class="ps-2 ms-1">
                                <h3 class="h2 mb-2"> 직장인우대종합통장</h3>
                                <ul class="list-unstyled d-flex flex-wrap fs-sm">
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>4.7 </b>(72)
                                    </li>
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-wallet mt-n1 me-1 align-middle opacity-70"></i>연 0.1%
                                    </li>
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-accounting mt-n1 me-1 align-middle opacity-70"></i>슬기로운 직장생활을 위한
                                        똑똑한 급여통장
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- 남녀가입자수차트-->
                        <div class="mb-3 pb-3 border-bottom">
                            <figure class="highcharts-figure">
                                <div id="container_em1"></div>
                            </figure>
                        </div>
                        <!-- 지역별 차트-->
                        <div class="mb-3 pb-4 border-bottom">
                            <div class="" style="display: flex;">
                                <figure class="highcharts-figure">
                                    <div id="container_em2"></div>
                                </figure>
                                <figure class="highcharts-figure">
                                    <div id="container_em3"></div>
                                </figure>
                                <figure class="highcharts-figure">
                                    <div id="container_em4"></div>
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>
                <%--KB 종합통장--%>
                <div class="card mb-4 p-2 shadow-sm">
                    <div class="card-body">
                        <!-- Place info-->
                        <div class="d-flex align-items-start mb-3 pb-2 border-bottom">
                            <div class="ps-2 ms-1">
                                <h3 class="h2 mb-2"> KB종합통장</h3>
                                <ul class="list-unstyled d-flex flex-wrap fs-sm">
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>4.2 </b>(23)
                                    </li>
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-wallet mt-n1 me-1 align-middle opacity-70"></i>연 0.1%
                                    </li>
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-accounting mt-n1 me-1 align-middle opacity-70"></i>입출금이 자유로운 대표상품
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- 남녀가입자수차트-->
                        <div class="mb-3 pb-3 border-bottom">
                            <figure class="highcharts-figure">
                                <div id="container_free1"></div>
                            </figure>
                        </div>
                        <!-- 지역별 차트-->
                        <div class="mb-3 pb-4 border-bottom">
                            <div class="" style="display: flex;">
                                <figure class="highcharts-figure">
                                    <div id="container_free2"></div>
                                </figure>
                                <figure class="highcharts-figure">
                                    <div id="container_free3"></div>
                                </figure>
                                <figure class="highcharts-figure">
                                    <div id="container_free4"></div>
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--정기예금 상품 통계--%>
            <div id="termDeposit" style="display:none;">
                <%--국민 UP정기예금--%>
                <div class="card mb-4 p-2 shadow-sm">
                    <div class="card-body">
                        <!-- Place info-->
                        <div class="d-flex align-items-start mb-3 pb-2 border-bottom">
                            <div class="ps-2 ms-1">
                                <h3 class="h2 mb-2"> KB국민UP정기예금</h3>
                                <ul class="list-unstyled d-flex flex-wrap fs-sm">
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>3.9 </b>(68)
                                    </li>
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-wallet mt-n1 me-1 align-middle opacity-70"></i>최고 연 2.62%
                                    </li>
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-accounting mt-n1 me-1 align-middle opacity-70"></i>월복리로 목돈 굴리는 예금
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- 남녀가입자수차트-->
                        <div class="mb-3 pb-3 border-bottom">
                            <figure class="highcharts-figure">
                                <div id="container_up1"></div>
                            </figure>
                        </div>
                        <!-- 지역별 차트-->
                        <div class="mb-3 pb-4 border-bottom">
                            <div class="" style="display: flex;">
                                <figure class="highcharts-figure">
                                    <div id="container_up2"></div>
                                </figure>
                                <figure class="highcharts-figure">
                                    <div id="container_up3"></div>
                                </figure>
                                <figure class="highcharts-figure">
                                    <div id="container_up4"></div>
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>
                <%--외화정기예금--%>
                <div class="card mb-4 p-2 shadow-sm">
                    <div class="card-body">
                        <!-- Place info-->
                        <div class="d-flex align-items-start mb-3 pb-2 border-bottom">
                            <div class="ps-2 ms-1">
                                <h3 class="h2 mb-2"> 외화정기예금</h3>
                                <ul class="list-unstyled d-flex flex-wrap fs-sm">
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>5.0 </b>(4)
                                    </li>
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-wallet mt-n1 me-1 align-middle opacity-70"></i>연 0.6%
                                    </li>
                                    <li class="me-2 mb-1 pe-1"><i
                                            class="fi-accounting mt-n1 me-1 align-middle opacity-70"></i>다양한 통화로 예치가능한
                                        외화예금
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- 남녀가입자수차트-->
                        <div class="mb-3 pb-3 border-bottom">
                            <figure class="highcharts-figure">
                                <div id="container_fx1"></div>
                            </figure>
                        </div>
                        <!-- 지역별 차트-->
                        <div class="mb-3 pb-4 border-bottom">
                            <div class="" style="display: flex;">
                                <figure class="highcharts-figure">
                                    <div id="container_fx2"></div>
                                </figure>
                                <figure class="highcharts-figure">
                                    <div id="container_fx3"></div>
                                </figure>
                                <figure class="highcharts-figure">
                                    <div id="container_fx4"></div>
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--태그별 상품 통계--%>
            <div id="Charts" style="display:none;">
                <%--                태그들--%>
                <div class="collapse d-md-block" id="account-nav">
                    <ul class="nav nav-pills flex-column flex-md-row pt-3 pt-md-0 pb-md-4 border-bottom-md">
                    </ul>
                </div>
                <%--                        수치들--%>
                <div class="row" style="margin-top: 3%;">
                    <!--총방문자-->
                    <div class="col-sm-6 col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <div class="card-body"><img class="d-block mx-auto mt-2 mb-4" src="img/pricing/icon-1.svg"
                                                        width="72" alt="Icon">
                                <h2 class="h5 fw-normal text-center py-1 mb-0">총 방문자</h2>
                                <div class="d-flex align-items-end justify-content-center mb-4">
                                    <div class="h1 mb-0 total">0</div>
                                    <div class="pb-2 ps-2">명</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--이자이익-->
                    <div class="col-sm-6 col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <div class="card-body"><img class="d-block mx-auto mt-2 mb-4" src="img/pricing/icon-2.svg"
                                                        width="72" alt="Icon">
                                <h2 class="h5 fw-normal text-center py-1 mb-0">총 이자이익</h2>
                                <div class="d-flex align-items-end justify-content-center mb-4">
                                    <div class="h1 mb-0 totalInterest">0</div>
                                    <div class="pb-2 ps-2">백만원</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--비이자이익-->
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <div class="card-body"><img class="d-block mx-auto mt-2 mb-4" src="img/pricing/icon-3.svg"
                                                        width="72" alt="Icon">
                                <h2 class="h5 fw-normal text-center py-1 mb-0">총 비이자이익</h2>
                                <div class="d-flex align-items-end justify-content-center mb-4">
                                    <div class="h1 mb-0 totalNotInterest">0</div>
                                    <div class="pb-2 ps-2">백만원</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!--체류시간-->
                    <div class="col-sm-6 col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <h2 class="h5 fw-normal text-center py-1 mb-0">평균 체류시간</h2>
                                <div class="d-flex align-items-end justify-content-center">
                                    <div class="h1 mb-0 stayMin">0</div>
                                    <div class="pb-2 ps-2">분</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--수신 소요시간-->
                    <div class="col-sm-6 col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <h2 class="h5 fw-normal text-center py-1 mb-0">수신상품 가입시 평균 소요시간</h2>
                                <div class="d-flex align-items-end justify-content-center">
                                    <div class="h1 mb-0 stayPrdtMin">0</div>
                                    <div class="pb-2 ps-2">분</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--여신 소요시간-->
                    <div class="col-sm-6 col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <h2 class="h5 fw-normal text-center py-1 mb-0">여신상품 가입시 평균 소요시간</h2>
                                <div class="d-flex align-items-end justify-content-center">
                                    <div class="h1 mb-0 stayLnMin">0</div>
                                    <div class="pb-2 ps-2">분</div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <%--                차트--%>
                <figure class="highcharts-figure" style="margin-top: 5%;">
                    <div id="container3"></div>
                </figure>
                <figure class="highcharts-figure" style="margin-top: 5%;">
                    <div id="container1"></div>
                </figure>
                <figure class="highcharts-figure" style="margin-top: 5%;">
                    <div id="container2"></div>
                </figure>
            </div>
        </div>
    </div>
</div>