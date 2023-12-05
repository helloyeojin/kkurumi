<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



    <title>룰렛</title>
    <meta charset="UTF-8" />
    <style>
        .rouletter {
            position: relative;
            width: 400px;
            height: 400px;
        }
        .rouletter-bg {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 350px;
            height: 350px;
            border-radius: 350px;
            overflow: hidden;
        }
        .rouletter-wacu {
            width: 100%;
            height: 100%;
            background: #f5f5f2
            url("https://m.lifeplanet.co.kr:444/commons/slink/administrator/openInnovation/img/MO)%20360%ED%94%8C%EB%9E%98%EB%8B%9B_%EB%A3%B0%EB%A0%9B%ED%8C%90_476x476_201026.png")
            no-repeat;
            background-size: 100%;
            transform-origin: center;
            transition-timing-function: ease-in-out;
            transition: 2s;
        }
        .rouletter-arrow {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 1px;
            height: 1px;
            border-right: 10px solid transparent;
            border-left: 10px solid transparent;
            border-top: 40px solid red;
            border-bottom: 0px solid transparent;
        }
        .rouletter-btn {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 80px;
            height: 80px;
            border-radius: 80px;
            background: #fff;
            border-image: linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);
            border: 2px solid;
        }

        .hidden-input {
            display: none;
        }
    </style>

<div id="app">
    <!-- 룰렛을 위한 HTML 코드 -->
    <div class="rouletter">
        <div class="rouletter-bg">
            <div class="rouletter-wacu"></div>
        </div>
        <div class="rouletter-arrow"></div>
        <button class="rouletter-btn">start</button>
    </div>
</div>

<script>



    var rolLength = 6; // 해당 룰렛 콘텐츠 갯수
    var setNum; // 랜덤숫자 담을 변수
    var hiddenInput = document.createElement("input");
    hiddenInput.className = "hidden-input";

    //랜덤숫자부여
    const rRandom = () => {
        var min = Math.ceil(0);
        var max = Math.floor(rolLength - 1);
        return Math.floor(Math.random() * (max - min)) + min;
    };

    const rRotate = () => {
        var panel = document.querySelector(".rouletter-wacu");
        var btn = document.querySelector(".rouletter-btn");
        var deg = [];
        // 룰렛 각도 설정(rolLength = 6)
        for (var i = 1, len = rolLength; i <= len; i++) {
            deg.push((360 / len) * i);
        }

        // 랜덤 생성된 숫자를 히든 인풋에 넣기
        var num = 0;
        document.body.append(hiddenInput);
        setNum = hiddenInput.value = rRandom();

        // 애니설정
        var ani = setInterval(() => {
            num++;
            panel.style.transform = "rotate(" + 360 * num + "deg)";
            btn.disabled = true; //button,input
            btn.style.pointerEvents = "none"; //a 태그

            // 총 50에 다달했을때, 즉 마지막 바퀴를 돌고나서
            if (num === 50) {
                clearInterval(ani);
                panel.style.transform = `rotate(${deg[setNum]}deg)`;
            }
        }, 50);
    };

    // 정해진 alert띄우기, custom modal등
    const rLayerPopup = (num) => {
        switch (num) {
            case 1:
                alert("당첨!! 스타벅스 아메리카노");
                break;
            case 3:
                alert("당첨!! 햄버거 세트 교환권");
                break;
            case 5:
                alert("당첨!! CU 3,000원 상품권");
                break;
            default:
                alert("꽝! 다음기회에");
        }
    };

    // reset
    const rReset = (ele) => {
        setTimeout(() => {
            ele.disabled = false;
            ele.style.pointerEvents = "auto";
            rLayerPopup(setNum);
            hiddenInput.remove();
        }, 5500);
    };

    // 룰렛 이벤트 클릭 버튼
    document.addEventListener("click", function (e) {
        var target = e.target;
        if (target.tagName === "BUTTON") {
            rRotate();
            rReset(target);
        }
    });

    // roulette default
    document.getElementById("app").innerHTML = `
<div class="rouletter">
    <div class="rouletter-bg">
        <div class="rouletter-wacu"></div>
    </div>
    <div class="rouletter-arrow"></div>
    <button class="rouletter-btn">start</button>
</div>
`;
</script>
