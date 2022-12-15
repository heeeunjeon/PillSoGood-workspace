<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>AboutUs</title>

    <style>

        /* [샛별] 파일 받으면 이 부분 지우기 */
        div {
            /* border : 1px solid rgb(120, 194, 173); */
            box-sizing : border-box;
        }

        /* 전체를 감싸는 wrap */
        .wrap {
            width: 98%;
            height: auto;
            margin : auto; /* 가운데로 좌, 우 자동 정렬*/
        }

        p {
            margin: 30px;
        }

        .wrap>div { width : 100%; }

        #navigator2 { height: 150px; }
        
        #content { height: auto; display:flex; }
        #content_2>div { width: 100%; }
        #content_2_1 { height: 150px; }
        #content_2_2 { height: 6650px; }
/* 
        #header { 
            height: 230px;
        } */

        #header>div { height: 100%; float: left; }

        #header_1 { width: 70%; }

        #header_1>p {
            box-sizing: border-box;
            font-size: 45px;
            font-weight: bold;
            margin-top: 130px;
            margin-left: 150px;
            color: white;
        }

        #header_2 { width: 30%; }

        #header_2>img {
            height: 60%;
            margin-left: 150px;
            margin-top: 70px;
        }


        /* content 영역 */
        #content>div { height : 100%; float : left; }
        #content_1 { width : 15%; }
        #content_2 { width : 70%; }
        #content_3 { width : 15%; }

        /* content_2_2 영역 */
        #content_2_2>div { 
            width: 100%;
            /* border: 1px solid black; */
        }
        #main_1 { height: 32%; }
        #main_2 { height: 50%; }
        #main_3 { height: 18%; }

        /* main_1 영역 */
        #main_1>div { 
            /* border: 1px solid red; */
            text-align: center;
            display: table;
            table-layout: fixed;
        }
        #main_1_1 { 
            height: 5%;
            width: 40%;
            margin: auto;
            /* color: white; */ 
        }  
        #main_1_2 { 
            height: 45%;
            width: 100%;
            background-size: cover;
        }
        #main_1_3 { 
            height: 20%;
            width: 100%;
         }
        #main_1_4 { 
            height: 20%;
            width: 100%;
        }
        #main_1_5 { 
            height: 10%;
            width: 100%;
        }

        /* main_2 영역 */
        #main_2>div { 
            width: 100%;
            /* border: 1px solid orange; */
        }
        #main_2_1 { height: 20%; }  
        #main_2_2 { height: 60%; }
        #main_2_3 { height: 20%; }

        /* main_2_1 영역 */
        #main_2_1>div { 
            width: 100%;
            /* border: 1px solid yellow; */
        }
        #main_2_1_1 { 
            height: 30%;
            font-size: 60px;
        }  
        #main_2_1_2 { 
            height: 70%;
            font-size: 40px;
            background-size: cover;
        }

        /* main_2_2 영역 */
        #main_2_2>div { 
            width: 100%;
            /* border: 1px solid green; */
        }
        .main_2_2_total { height: 25%; }

        /* main_2_2_total 영역 */
        .main_2_2_total>div {
            width: 100%;
        }
        .main_2_2_1 {
            height: 22%;
        }
        .main_2_2_1 {
            padding: 30px 0px 0px 0px;
            font-size: 53px;
            font-weight: bold; 
        }
        .left>p {
            font-size: 50px;
            font-weight: bold;
        }
        .main_2_2_2 {
            height: 78%;
        }
        .right_2>p {
            font-size: 32px;
            font-weight: bold;
        }
        .right_3>p {
            font-size: 21px;
        }

        /* main_2_2_2 영역 */
        .main_2_2_2>div { 
            height: 100%;
            /* border: 1px solid blue; */
            float: left;
        }
        .left { 
            width: 45%;
            background-size:100%;
        }
        .right { width: 55%; }

        /* right 영역 */
        .right>div { 
            width: 100%;
            /* border: 1px solid navy; */
        }
        .right_1 { height: 30%; }
        .right_2 { height: 20%; }
        .right_3 { height: 50%; }

        /* main_2_3 영역 */
        #main_2_3>div {
            width: 100%;
        }
        #main_2_3_1 {
            height: 35%;
            font-size: 65px;
        }
        #main_2_3_1>p {
            margin-top: 100px;
        }

        #main_2_3_2 {
            height: 65%;
        }

        /* main_2_3_total 영역 */
        #main_2_3_2>div { 
            height: 100%;
            /* border: 1px solid violet; */
            float: left;
        }

        .main_2_3_out {
            width: 33%;
            padding: 20px;
        }

        .main_2_3_out>div {
            width: 100%;
            height: 100%;
            padding: 20px;
        }

        .main_2_3_in { 
            text-align: center;
            background-color: rgb(243, 150, 154, 0.13);
            border-radius: 30px;
        }
       
        /* main_2_3_total 영역 */
        .main_2_3_in>div { 
            width: 100%;
            /* border: 1px solid red; */
        }
        .main_2_3_1 { height: 10%; }
        .main_2_3_2 { height: 35%; }
        .main_2_3_3 { height: 15%; }
        .main_2_3_4 { height: 40%; }

        .picto {
            height: 100%;
            width: 35%;
            margin: auto;
            background-size: cover;
        }
        .main_2_3_3>p {
            font-size: 26px;
            font-weight: bold;
            margin: 0px;
        }
        .main_2_3_4>p {
            font-size: 17px;
            margin: 0px;
        }

        /* main_3 영역 */
        #main_3>div { 
            width: 100%;
            /* border: 1px solid orange; */
        }
        #main_3_1 { height: 40%; }  
        #main_3_2 { height: 60%;}
        
        #main_3_2>div {
            width: 100%;
        }
        
        #main_3_2_1 { 
            height: 60%;
            display: table;
            table-layout: fixed;
        }
        #main_3_2_2 { height: 40%; }

        #main_3>div>div>p {
            text-align: center;
        }
        #main_3_2_1>p {
            font-size: 45px;
            display: table-cell;
            vertical-align: bottom;
        }
        #main_3_2_2>p {
            font-size: 20px;
        }

        /* main_1 링크 스타일 */
        #main_1_1>p {
            font-size: 20px;
            font-weight: bolder;
            display: table-cell;
            vertical-align: middle;  
        }

        /* main_1 텍스트 스타일1 */
        #main_1_2>p {
            height: 60%;
            font-size: 60px;
            font-weight: bolder;
            display: table-cell;
            /* vertical-align: middle; */
        }

        /* main_1 텍스트 스타일2 */
        #main_1_3>p {
            font-size: 50px;
            font-weight: bolder;
            text-align: left;
        }

        /* main_1 텍스트 스타일3 */
        #main_1_4>p {
            font-size: 22px;
            text-align: left;
            padding-left: 550px;
        }

        /* main_2_2_2 영역 스타일 */
        .main_2_2_2>div {
            display: inline;
            float: left;
            height: 100%;
        }

</style>

</head>
<body>



	<div class="wrap">
        <div id="navigator2">
            <jsp:include page="../common/menubar.jsp" />
        </div>
        <div id="header"></div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2">
                <div id="content_2_2">

                    <!-- 영섭 작업 영역 시작-->

                    <!-- 배경있는 영역 1 -->
                    <div id="main_1">
                        <div id="main_1_1">
                            <p href="">About Us</p>
                        </div>
                        <div id="main_1_2" style="background-image: url(resources/images/back_1.jpg);">
                            <p><br><br><br>
                                오직 한 사람을 위한 맞춤 건강기능식<br>
                                나만의 건강 한 조각, PillSoGood</p>
                        </div>
                        <div id="main_1_3">
                            <p align="left">모두가 좋다고 하는 영양제,<br>
                                과연 나에게도 진짜 필요한 걸까요?</p>
                        </div>
                        <div id="main_1_4">
                            <p align="left">우리는 생활 환경, 식습관, 건강 상태에 따라 각자 다른 건강<br>
                                관리가 필요합니다.<br>
                                PillSoGood은 고객 한 분, 한 분에 맞춘 건강기능식품이<br>
                                필요하다는 생각으로부터 출발했습니다.</p>
                        </div>
                        <div id="main_1_5"></div> <!-- 여백 -->
                    </div>

                    <!-- 배경없는 영역 -->
                    <div id="main_2">

                        <div id="main_2_1">
                            <div id="main_2_1_1">
                                <p align="center">|</p>
                            </div>
                            <div id="main_2_1_2" style="background-image: url(resources/images/back_3_1.jpg);">
                                <p align="center"><br><br><br>마지막 한 조각으로 완성되는 퍼즐처럼,<br>
                                    개인의 건강도 나에게 꼭 맞는<br>
                                    한 조각이 필요합니다.</p>
                            </div>
                        </div>

                        <!-- PillSoGood추천부분 -->
                        <div id="main_2_2">
                            <div class="main_2_2_total">
                                <div class="main_2_2_1">
                                    <p>PillSoGood은</p>
                                </div>
                                <div class="main_2_2_2">
                                    <div class="left" style="background-image: url(images/sub_1.jpg);">
                                        <p>분석합니다</p>
                                    </div>
                                    <div class="right">
                                        <div class="right_1"></div> <!-- 여백 -->
                                        <div class="right_2">
                                            <p>건강설문</p>
                                        </div>
                                        <div class="right_3">
                                            <p>건강과 영양을 제일 잘 아는 의사, 약사, 영양학 박사로 구성된<br>
                                                마이퍼즐 건강 자문단과 함께 최적화된 맞춤 설계를 완성했습니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="main_2_2_total">
                                <div class="main_2_2_1">
                                    <p>PillSoGood은</p>
                                </div>
                                <div class="main_2_2_2">
                                    <div class="left" style="background-image: url(resources/images/sub_2.jpg);">
                                        <p>분석합니다</p>

                                    </div>
                                    <div class="right">
                                        <div class="right_1"></div> <!-- 여백 -->
                                        <div class="right_2">
                                            <p>1:1 전문가 상담</p>
                                        </div>
                                        <div class="right_3">
                                            <p>전문가와의 대화를 통해<br>
                                                개개인의 건강 상태를 한 번 더 꼼꼼하게 확인합니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="main_2_2_total">
                                <div class="main_2_2_1">
                                    <p>PillSoGood은</p>
                                </div>
                                <div class="main_2_2_2">
                                    <div class="left" style="background-image: url(resources/images/sub_3.jpg);">
                                        <p>추천합니다</p>
                                    </div>
                                    <div class="right">
                                        <div class="right_1"></div> <!-- 여백 -->
                                        <div class="right_2">
                                            <p>최적의 조합</p>
                                        </div>
                                        <div class="right_3">
                                            <p>마이퍼즐만의 맞춤 분석을 통해 <br>
                                                개개인에게 꼭 필요한 영양성분만을 조합하여 추천합니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="main_2_2_total">
                                <div class="main_2_2_1">
                                    <p>PillSoGood은</p>
                                </div>
                                <div class="main_2_2_2">
                                    <div class="left" style="background-image: url(resources/images/sub_4.jpg);">
                                        <p>추천합니다</p>
                                    </div>
                                    <div class="right">
                                        <div class="right_1"></div> <!-- 여백 -->
                                        <div class="right_2">
                                            <p>최고의 품질</p>
                                        </div>
                                        <div class="right_3">
                                            <p>건강기능식품 유통전문기업 뉴트리원의 오랜 경험에서 비롯된<br>
                                                전문적인 노하우로, 엄선된 원료 선별부터 엄격한 품질관리를<br>
                                                통해 생산하고, 검증된 제품만을 제공합니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- PillSoGood관리부분 -->
                        <div id="main_2_3">
                            <div id="main_2_3_1">
                                <p align="center">PillSoGood은 관리합니다</p>
                            </div>

                            <!-- PillSoGood관리 세부부분 -->
                            <div id="main_2_3_2">
                                <div class="main_2_3_out">
                                    <div class="main_2_3_in" id="main_2_3_total_1">
                                        <div class="main_2_3_1"></div> <!-- 여백 -->
                                        <div class="main_2_3_2">
                                            <div class="picto" style="background-image: url(resources/images/picto_1.png);"></div>
                                        </div> <!-- 아이콘 -->
                                        <div class="main_2_3_3">
                                            <p>한 팩 포장</p>
                                        </div>
                                        <div class="main_2_3_4">
                                            <p>언제 어디서든 잊지 않고 꾸준히 섭취할<br>
                                                수 있도록, 주문하신 제품들을 소분하여<br>
                                                한 팩에 담아드립니다.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="main_2_3_out">
                                    <div class="main_2_3_in" id="main_2_3_total_2">
                                        <div class="main_2_3_1"></div> <!-- 여백 -->
                                        <div class="main_2_3_2">
                                            <div class="picto" style="background-image: url(resources/images/picto_2.png);"></div>
                                        </div> <!-- 아이콘 -->
                                        <div class="main_2_3_3">
                                            <p>섭취 관리</p>
                                        </div>
                                        <div class="main_2_3_4">
                                            <p>잊지 않고 건강을 챙길 수 있도록,<br>
                                                섭취 알람과 섭취 기록 리워드를 통한<br>
                                                체계적인 관리로 건강한 습관 형성을<br>
                                                도와드립니다.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="main_2_3_out">
                                    <div class="main_2_3_in" id="main_2_3_total_3">
                                        <div class="main_2_3_1"></div> <!-- 여백 -->
                                        <div class="main_2_3_2">
                                            <div class="picto" style="background-image: url(resources/images/picto_3.png);"></div>
                                        </div> <!-- 아이콘 -->
                                        <div class="main_2_3_3">
                                            <p>정기 배송</p>
                                        </div>
                                        <div class="main_2_3_4">
                                            <p>30일마다 매월 알아서 제품을<br>
                                                보내드리기에 번거롭게 재주문 할<br>
                                                필요가 없습니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 배경있는 영역 2 -->
                    <div id="main_3">
                        <div id="main_3_1"></div> <!-- 여백 -->
                        <div id="main_3_2" style="background-image: url(resources/images/back_2.jpg);">
                            <div id="main_3_2_1"> 
                                <p>이제 PillSoGood이 당신의 건강 한 조각을<br>
                                    빈틈없이 채워드릴게요.</p>
                            </div>
                            <div id="main_3_2_2"> 
                                <p>※ PillSoGood은 개인 맞춤형 건강기능식품 추천・판매 규제 샌드박스에<br>
                                    승인된 사업자인 KH정보교육원㈜와의 파트너십을 통해<br>
                                    소분 판매가 가능합니다.</p>
                            </div>
                        </div>
                        
                    </div>                
                </div>
                <!-- 영섭 작업 영역 끝 -->

            </div>
            <div id="content_3" style="height : 100px;"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>


</body>
</html>