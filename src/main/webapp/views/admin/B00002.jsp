<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    $(document).ready(function() {

        fn_chartStart();
        fn_productChartsStart();

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
            $('#Charts').show();

            upcount('.total', getRandomNum(1000,3000,0));
            upcount('.totalInterest', getRandomNum(100,400,0));
            upcount('.totalNotInterest', getRandomNum(25,200,0));
            upcount1('.stayMin', getRandomNum(5, 20, 1), 1);
            upcount1('.stayPrdtMin', getRandomNum(4,7,1), 1);
            upcount1('.stayLnMin', getRandomNum(18,28,1), 1);

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
                    stack: 'Europe'
                }, {
                    name: '적금',
                    data: [290, 240, 130, 220],
                    stack: 'Europe'
                }, {
                    name: '정기예금',
                    data: [320, 300, 315, 280],
                    stack: 'Europe'
                }, {
                    name: '개인대출',
                    data: [310, 290, 270, 190],
                    stack: 'North America'
                }, {
                    name: '사업자대출',
                    data: [120, 150, 180, 290],
                    stack: 'North America'
                }, {
                    name: 'KB카드',
                    data: [77, 72, 80, 80],
                    stack: 'North America'
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
                    ]
                }, {
                    name: '여성',
                    data: [
                        1.3, 4.2, 15.6, 33.7, 28.8,
                        13.7, 2.1
                    ]
                }]
            });

        })
    };
    function fn_productChartsStart() {
        //요구불 클릭시
        $('#yogubulBtn').click(() => {
            $('#Charts').hide();
            $('#termDeposit').hide();
            $('#yogubul').show();

            Highcharts.chart('container_yo1', {

                title: {
                    text: 'KB ONE 종합통장 월별 가입자 수 추이',
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
                    data: [43, 48, 65, 112, 26, 42,
                        19, 65, 55, 61, 54]
                }, {
                    name: '여성',
                    data: [24, 37, 29, 98, 32, 30,
                        38, 68, 72, 42, 67]
                }, {
                    name: '합계',
                    data: [67, 85, 104, 210, 58, 72,
                        57, 133, 127, 103, 111]
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
                                fontSize: '1.2em',
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
                                y: 55.02
                            },
                            {
                                name: '강원',
                                y: 26.71
                            },
                            {
                                name: '충청',
                                y: 1.09
                            },
                            {
                                name: '경상',
                                y: 8.5
                            },
                            {
                                name: '전라',
                                y: 6.5
                            },
                            {
                                name: '제주',
                                y: 1.68
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
                                fontSize: '1.2em',
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
                                y: 10.02
                            },
                            {
                                name: '20~55백만',
                                y: 36.71
                            },
                            {
                                name: '55~100백만',
                                y: 32.09
                            },
                            {
                                name: '100백만 이상',
                                y: 21.20
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
                                fontSize: '1.2em',
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
                                y: 42.02
                            },
                            {
                                name: '개인사업자',
                                y: 45.71
                            },
                            {
                                name: '학생',
                                y: 5.09
                            },
                            {
                                name: '무직',
                                y: 0.5
                            },
                            {
                                name: '주부',
                                y: 6.68
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
                        36, 65, 66, 61, 54]
                }, {
                    name: '여성',
                    data: [34, 45, 29, 30, 32, 30,
                        38, 68, 66, 65, 59]
                }, {
                    name: '합계',
                    data: [65, 87, 53, 75, 87, 72,
                        74, 133, 132, 126, 113]
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
                                fontSize: '1.2em',
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
                                y: 53.02
                            },
                            {
                                name: '강원',
                                y: 8.5
                            },
                            {
                                name: '충청',
                                y: 9.09
                            },
                            {
                                name: '경상',
                                y: 23.71
                            },
                            {
                                name: '전라',
                                y: 6.5
                            },
                            {
                                name: '제주',
                                y: 1.68
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
                                fontSize: '1.2em',
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
                                y: 10.02
                            },
                            {
                                name: '20~55백만',
                                y: 45.71
                            },
                            {
                                name: '55~100백만',
                                y: 40.09
                            },
                            {
                                name: '100백만 이상',
                                y: 4.20
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
                                fontSize: '1.2em',
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
                                y: 78.02
                            },
                            {
                                name: '개인사업자',
                                y: 10.71
                            },
                            {
                                name: '학생',
                                y: 5.09
                            },
                            {
                                name: '무직',
                                y: 0.5
                            },
                            {
                                name: '주부',
                                y: 5.68
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
                        19, 37, 35, 40, 28]
                }, {
                    name: '여성',
                    data: [24, 37, 29, 41, 32, 30,
                        38, 32, 32, 27, 35]
                }, {
                    name: '합계',
                    data: [67, 85, 104, 85, 76, 72,
                        57, 69, 67, 67, 63]
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
                                fontSize: '1.2em',
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
                                y: 45.02
                            },
                            {
                                name: '강원',
                                y: 21.71
                            },
                            {
                                name: '충청',
                                y: 6.09
                            },
                            {
                                name: '경상',
                                y: 13.5
                            },
                            {
                                name: '전라',
                                y: 11.5
                            },
                            {
                                name: '제주',
                                y: 1.68
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
                                fontSize: '1.2em',
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
                                y: 23.02
                            },
                            {
                                name: '20~55백만',
                                y: 26.71
                            },
                            {
                                name: '55~100백만',
                                y: 27.09
                            },
                            {
                                name: '100백만 이상',
                                y: 26.20
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
                                fontSize: '1.2em',
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
                                y: 30.02
                            },
                            {
                                name: '개인사업자',
                                y: 27.71
                            },
                            {
                                name: '학생',
                                y: 17.09
                            },
                            {
                                name: '무직',
                                y: 10.5
                            },
                            {
                                name: '주부',
                                y: 16.68
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
                        19, 65, 55, 61, 54]
                }, {
                    name: '여성',
                    data: [24, 37, 29, 33, 32, 30,
                        38, 68, 72, 42, 67]
                }, {
                    name: '합계',
                    data: [67, 85, 94, 96, 58, 72,
                        57, 133, 127, 103, 111]
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
                                fontSize: '1.2em',
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
                                y: 55.02
                            },
                            {
                                name: '강원',
                                y: 26.71
                            },
                            {
                                name: '충청',
                                y: 1.09
                            },
                            {
                                name: '경상',
                                y: 8.5
                            },
                            {
                                name: '전라',
                                y: 6.5
                            },
                            {
                                name: '제주',
                                y: 1.68
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
                                fontSize: '1.2em',
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
                                y: 32.02
                            },
                            {
                                name: '20~55백만',
                                y: 36.71
                            },
                            {
                                name: '55~100백만',
                                y: 21.09
                            },
                            {
                                name: '100백만 이상',
                                y: 10.20
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
                                fontSize: '1.2em',
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
                                y: 32.02
                            },
                            {
                                name: '개인사업자',
                                y: 25.71
                            },
                            {
                                name: '학생',
                                y: 5.09
                            },
                            {
                                name: '무직',
                                y: 10.5
                            },
                            {
                                name: '주부',
                                y: 26.68
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
                        36, 65, 66, 61, 54]
                }, {
                    name: '여성',
                    data: [34, 45, 29, 30, 32, 30,
                        38, 68, 66, 65, 59]
                }, {
                    name: '합계',
                    data: [65, 87, 53, 75, 87, 72,
                        74, 133, 132, 126, 113]
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
                                fontSize: '1.2em',
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
                                y: 63.02
                            },
                            {
                                name: '강원',
                                y: 8.5
                            },
                            {
                                name: '충청',
                                y: 9.09
                            },
                            {
                                name: '경상',
                                y: 13.71
                            },
                            {
                                name: '전라',
                                y: 6.5
                            },
                            {
                                name: '제주',
                                y: 1.68
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
                                fontSize: '1.2em',
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
                                y: 3.02
                            },
                            {
                                name: '20~55백만',
                                y: 25.71
                            },
                            {
                                name: '55~100백만',
                                y: 47.09
                            },
                            {
                                name: '100백만 이상',
                                y: 24.20
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
                                fontSize: '1.2em',
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
                                y: 28.02
                            },
                            {
                                name: '개인사업자',
                                y: 63.71
                            },
                            {
                                name: '학생',
                                y: 5.09
                            },
                            {
                                name: '무직',
                                y: 0.5
                            },
                            {
                                name: '주부',
                                y: 2.68
                            }
                        ]
                    }
                ]
            });



        })
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
                $counter1.innerHTML = now.toLocaleString(undefined, { minimumFractionDigits: decimalPlaces1, maximumFractionDigits: decimalPlaces1 });

                if (now >= max1) {
                    clearInterval(handle);
                }

                now += step;
            }, 10);
        }
    }
    //체크박스 태그들
    function tags() {
        $("#account-nav ul").empty();
        if($('#ageTotal').is(":checked")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">전체 연령</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#age10").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#age10").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#age20").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#age20").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#age30").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#age30").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#age40").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#age40").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#age50").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#age50").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#age60").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#age60").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }

        if ($("#genderTotal").prop("selected")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#genderTotal").val() +'</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#genderMen").prop("selected")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#genderMen").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#genderWomen").prop("selected")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#genderWomen").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }

        if($('#districtTotal').is(":checked")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">전체 지역</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#seoul").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#seoul").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#kangwon").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#kangwon").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#kyungsang").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#kyungsang").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#jeonra").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#jeonra").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#choongchung").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#choongchung").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#jeju").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#jeju").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }

        if($('#payTotal').is(":checked")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">전체 소득범위</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#2000").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#2000").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#5500").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#5500").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#10000").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#10000").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#100000").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#100000").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }

        if($('#jobTotal').is(":checked")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">전체 직업</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#employee").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#employee").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#soho").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#soho").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#unemployed").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#unemployed").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#student").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#student").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#householder").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#householder").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }

        if($('#csoreTotal').is(":checked")) {
            var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">전체 신용등급</a></li>';
            $("#account-nav ul").append(newLi);
        } else {
            if ($("#4").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#4").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#6").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#6").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#10").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#8").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
            if ($("#12").is(":checked")) {
                var newLi = '<li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link">' + $("#10").val() +'</a></li>';
                $("#account-nav ul").append(newLi);
            }
        }
    }
    //랜덤숫자 만들기 함수
    function getRandomNum(min, max, decimalPlaces) {
        const randomNumber = Math.random() * (max - min) + min;
        return randomNumber.toFixed(decimalPlaces);
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
                    <button class="btn-close" type="button" data-bs-dismiss="offcanvas" data-bs-target="#filters-sidebar"></button>
                </div>
                <!-- Search form-->
                <div class="offcanvas-header d-block border-bottom pt-0 pt-lg-4 px-lg-0">
                    <form class="form-group mb-lg-2 rounded-pill">
                        <div class="input-group"><span class="input-group-text text-muted"><i class="fi-search"></i></span>
                            <input class="form-control" type="text" placeholder="고객PIN 입력">
                        </div>
                        <button class="btn btn-primary rounded-pill d-lg-inline-block d-none" type="button">검색</button>
                        <button class="btn btn-icon btn-primary rounded-circle flex-shrink-0 d-lg-none d-inline-flex" type="button"><i class="fi-search mt-n2"></i></button>
                    </form>
                </div>
                <!-- Nav tabs-->
                <div class="offcanvas-header d-block border-bottom py-lg-4 py-3 px-lg-0">
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
                                <div class="col" id="yogubulBtn"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto pt-1"><img src="/img/real-estate/coli.png" style="width:1.5em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">요구불</h3></a></div>
                                <div class="col"  id="termDepositBtn"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="/img/real-estate/bibi.png" style="width:1.4em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">정기예금</h3></a></div>
                                <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="/img/real-estate/ageo.png" style="width:1.8em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">적금</h3></a></div>
                                <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="/img/real-estate/kiki.png" style="width:1.9em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">개인대출</h3></a></div>
                                <div class="col"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center">
                                    <div class="icon-box-media bg-faded-warning text-warning rounded-circle mb-3 mx-auto"><img src="/img/real-estate/lamu.png" style="width:2em"></div>
                                    <h3 class="icon-box-title fs-base mb-0">사업자대출</h3></a></div>
                                <div class="col">
                                    <div class="dropdown h-100"><a class="icon-box card card-body h-100 border-0 shadow-sm card-hover text-center" data-bs-toggle="dropdown">
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
                                <button class="btn btn-outline-primary rounded-pill" type="button" id="chartsBtn"><i class="fi-rotate-right me-2"></i>분석 시작하기</button>
                            </div>
                            <div class="pb-4 mb-2">
                                <h3 class="h6">연령</h3>

                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
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
                                    <option id="genderTotal" value="전체성별" selected>전체</option>
                                    <option id="genderMen" value="#남자" >남</option>
                                    <option id="genderWomen" value="#여자">여</option>
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
                                        <input class="form-check-input" type="checkbox" id="jeju"  value="#제주">
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
                                        <input class="form-check-input" type="checkbox" id="2000"  value="#연소득 20백만이하">
                                        <label class="form-check-label fs-sm" for="2000">20백만 이하</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="5500"  value="#연소득 20백만 ~ 55백만">
                                        <label class="form-check-label fs-sm" for="5500">20백만 ~ 55백만</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="10000"  value="#연소득 55백만 ~ 100백만">
                                        <label class="form-check-label fs-sm" for="10000">55백만 ~ 100백만</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="100000"  value="#연소득 100백만 초과">
                                        <label class="form-check-label fs-sm" for="100000">100백만 초과</label>
                                    </div>
                                </div>
                            </div>

                            <div class="pb-4 mb-2">
                                <h3 class="h6">직업</h3>
                                <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="jobTotal" >
                                        <label class="form-check-label fs-sm" for="jobTotal">직업 전체</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="employee"  value="#직장인">
                                        <label class="form-check-label fs-sm" for="employee">직장인</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="soho"  value="#개인사업자">
                                        <label class="form-check-label fs-sm" for="soho">개인사업자</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="unemployed"  value="#무직">
                                        <label class="form-check-label fs-sm" for="unemployed">무직</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="student"  value="#학생">
                                        <label class="form-check-label fs-sm" for="student">학생</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="householder"  value="#주부">
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
                                        <input class="form-check-input" type="checkbox" id="4"  value="#신용 1~4등급">
                                        <label class="form-check-label fs-sm" for="4">1 ~ 4등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="6"  value="#신용 5~6등급">
                                        <label class="form-check-label fs-sm" for="6">5 ~ 6등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="10"  value="#신용 7~10등급">
                                        <label class="form-check-label fs-sm" for="10">7 ~ 10등급</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="12"  value="#신용 10등급이상">
                                        <label class="form-check-label fs-sm" for="12">10등급 이상</label>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </aside>

        <div id="mainArticle" class="col-lg-8 col-xl-9 position-relative overflow-hidden pb-5 pt-4 px-3 px-xl-4 px-xxl-5">
        <%--고객PIN입력 통계--%>
            <div id="customerPIN" style="display:none;">

            </div>

        <%--카테고리별 상품 통계--%>
            <%--요구불 상품 통계--%>
            <div id="yogubul"  style="display:none;">
                <%--one 종합통장--%>
                <div class="card mb-4 p-2 shadow-sm">
                    <div class="card-body">
                        <!-- Place info-->
                        <div class="d-flex align-items-start mb-3 pb-2 border-bottom">
                            <div class="ps-2 ms-1">
                                <h3 class="h2 mb-2"> KB ONE 종합통장</h3>
                                <ul class="list-unstyled d-flex flex-wrap fs-sm">
                                    <li class="me-2 mb-1 pe-1"><i class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>4.9 </b>(48)</li>
                                    <li class="me-2 mb-1 pe-1"><i class="fi-wallet mt-n1 me-1 align-middle opacity-70"></i>연 0.1%</li>
                                    <li class="me-2 mb-1 pe-1"><i class="fi-accounting mt-n1 me-1 align-middle opacity-70"></i>모두가 ONE하는 다양한 수수료 혜택</li>
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
                                    <li class="me-2 mb-1 pe-1"><i class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>4.7 </b>(72)</li>
                                    <li class="me-2 mb-1 pe-1"><i class="fi-wallet mt-n1 me-1 align-middle opacity-70"></i>연 0.1%</li>
                                    <li class="me-2 mb-1 pe-1"><i class="fi-accounting mt-n1 me-1 align-middle opacity-70"></i>슬기로운 직장생활을 위한 똑똑한 급여통장</li>
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
                                    <li class="me-2 mb-1 pe-1"><i class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>4.2 </b>(23)</li>
                                    <li class="me-2 mb-1 pe-1"><i class="fi-wallet mt-n1 me-1 align-middle opacity-70"></i>연 0.1%</li>
                                    <li class="me-2 mb-1 pe-1"><i class="fi-accounting mt-n1 me-1 align-middle opacity-70"></i>입출금이 자유로운 대표상품</li>
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
            <div id="termDeposit"  style="display:none;">
                <%--국민 UP정기예금--%>
                <div class="card mb-4 p-2 shadow-sm">
                    <div class="card-body">
                        <!-- Place info-->
                        <div class="d-flex align-items-start mb-3 pb-2 border-bottom">
                            <div class="ps-2 ms-1">
                                <h3 class="h2 mb-2"> KB국민UP정기예금</h3>
                                <ul class="list-unstyled d-flex flex-wrap fs-sm">
                                    <li class="me-2 mb-1 pe-1"><i class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>3.9 </b>(68)</li>
                                    <li class="me-2 mb-1 pe-1"><i class="fi-wallet mt-n1 me-1 align-middle opacity-70"></i>최고 연 2.62%</li>
                                    <li class="me-2 mb-1 pe-1"><i class="fi-accounting mt-n1 me-1 align-middle opacity-70"></i>월복리로 목돈 굴리는 예금</li>
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
                                    <li class="me-2 mb-1 pe-1"><i class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>5.0 </b>(4)</li>
                                    <li class="me-2 mb-1 pe-1"><i class="fi-wallet mt-n1 me-1 align-middle opacity-70"></i>연 0.6%</li>
                                    <li class="me-2 mb-1 pe-1"><i class="fi-accounting mt-n1 me-1 align-middle opacity-70"></i>다양한 통화로 예치가능한 외화예금</li>
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
            <div id="Charts"  style="display:none;">
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
                            <div class="card-body"><img class="d-block mx-auto mt-2 mb-4" src="img/pricing/icon-1.svg" width="72" alt="Icon">
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
                            <div class="card-body"><img class="d-block mx-auto mt-2 mb-4" src="img/pricing/icon-2.svg" width="72" alt="Icon">
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
                            <div class="card-body"><img class="d-block mx-auto mt-2 mb-4" src="img/pricing/icon-3.svg" width="72" alt="Icon">
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
                    <div id="container1"></div>
                </figure>
                <figure class="highcharts-figure" style="margin-top: 5%;">
                    <div id="container2"></div>
                </figure>
            </div>
        </div>
    </div>
</div>