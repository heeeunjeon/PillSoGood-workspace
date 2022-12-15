<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
    <title>Pill So Good</title>
    <style>
        div {
            /* border: 1px solid #78C2AD; */
            box-sizing: border-box;
        }

        /* 전체를 감싸는 wrap */
        .wrap {
            width: 100%;
            height: 3800px;
            margin: auto;
        }

        .wrap>div {
            width: 100%;
        }

        #content {
            height: 3800px;
            display: block;
        }

        #content1 {
            width: 100%;
        }

        #content1>#text {
            position: absolute;
            transform: translate(110%, 80%);
        }

        #content2 {
            width: 100%;
        }

        #content2_1 {
            width: 20%;
            float: left;
        }

        #content2_2 {
            width: 60%;
            float: left;
            color: rgb(40, 40, 40);
        }

        #content2_3 {
            width: 20%;
            float: left;
        }

        #content3 {
            width: 100%;
            background-color: rgba(120, 194, 173, 0.23);
            color: rgb(40, 40, 40);
        }

        #content3_1 {
            width: 10%;
            float: left;
        }

        #content3_2 {
            width: 80%;
            float: left;
            text-align: center;
        }

        #content3_2>table {
            margin-top: 50px;
            width: 100%;
        }

        #content3_2>table h5 {
            color: #40b695;
            font-weight: bold;
        }

        #content3_3 {
            width: 10%;
            float: left;
        }


        /* content 영역 */
        #content>div {
            height: 100%;
            float: left;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif !important;
        }

        #healthIcon {
            background-color: rgba(211, 211, 211, 0.273);
            border-radius: 25px;
            width: 80px;
            height: 80px;
        }

        #healthIcon>p {
            font-size: 30px;
            padding-top: 15px;
            padding-left: 25px;
            color: rgb(105, 104, 104);
        }

        #content2Table {
            display: inline-block;

        }

        #content2Table td {
            padding-left: 15px;
            height: 150px;
        }

        #scrollDiv {
            overflow-x: scroll;
            width: 1000px;
            scrollbar-width: none;

        }

        #scrollDiv::-webkit-scrollbar {
            display: none;
        }

        #content1>img {
            display: inline-block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* 슬라이드 효과 */
        .swiper-container {
            width: 1000px;
            height: 420px;
        }

        .swiper-slide {
            text-align: center;
            /* display:flex; */
            /* 내용을 중앙정렬 하기위해 flex 사용 */
            align-items: center;
            /* 위아래 기준 중앙정렬 */
            justify-content: center;
            /* 좌우 기준 중앙정렬 */
        }

        .swiper-slide>div {
            margin: auto;
            background-color: rgba(211, 211, 211, 0.273);
            border-radius: 50%;
            width: 200px;
            height: 200px;
            margin-top: 80px;
        }

        .swiper-slide img {
            max-width: 100%;
            /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
            /* 이 예제에서 필요해서 설정했습니다.
            상황에따라 다를 수 있습니다. */
        }

        .swiper-button-next {
            margin-right: 0px;
        }

        .swiper-button-prev {
            margin-left: 0px;
        }

        #cotent5_4Table td #el1{
            background-color: white;
            width: 300px;
            height: 280px;
            border-radius: 50% 20% / 10% 40%;
            margin-top: 50px;
            margin-left: 50px;
        }


    </style>

    <!-- dragscroll -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dragscroll/0.0.8/dragscroll.min.js" integrity="sha512-/ncZdOhQm5pgj5KHy720Ck7XF5RzYK6rtUsLNnGcitXrKT3wUYzTrPlOSG7SdL2kDzkuLEOFvrQRyllcZkeAlg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- <script src="dragScroll.js"></script> -->

    <!-- 알약 슬라이드에 필요함 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    
    <!-- 스크롤 애니매이션 -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

</head>

<body>

    <div class="wrap">
        	<div>
        		<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
        	</div>
            <div id="content">
            
                <div id="content1" style="height: 800px; position: relative;">
                    <div id="text" style="color: rgb(40, 40, 40);">
                        <div style="font-weight: lighter; font-size: 40px;">한 팩에 담는</div>
                        <div style="font-weight: bold; font-size: 40px; color :rgb(40, 40, 40);">
                            나만의 맞춤 영양제
                        </div>
                        <br>
                        <div style="font-weight : bold; font-size: 20px;">A healthier tomorrow than today.</div>
                        <div style="font-weight : bold;">나에게 맞는 영양제, 간편하게 확인하세요.</div>
                        <br><br>
                        <button class="btn btn-secondary"
                            style="font-size: 18px; font-weight:bold; width: 200px; height: 50px;" onclick="location.href='survey.po'">
                            건강 설문 시작하기
                        </button>
                    </div>
                    <img src="resources/images/main1.png">
                </div>


                <div id="content2" style="height: 400px;">
                    <div id="content2_1">&ensp;</div>
                    <div id="content2_2">
                        <table style="width: 1000px;">
                            <tr>
                                <td style="vertical-align: top; padding-bottom: 30px; padding-top: 90px;">
                                    <h4 style="color: rgb(40, 40, 40); font-weight:bold;">고민별 상품보기</h4>
                                </td>
                                <td style="vertical-align: top; padding-top: 90px;">
                                    <a href=""
                                        style="float: right; text-decoration: none; color: rgb(40, 40, 40); font-weight: bold;">
                                        더보기
                                        <i class="fa-solid fa-chevron-right"></i>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <div id="scrollDiv">
                            <table style="margin:auto;" id="content2Table">
                                <div style="width: 1100px;">
                                    <tr>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">피로/활력</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">간건강</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">장건강</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">위/소화</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">변비</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">눈건강</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">다이어트</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">마음건강</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">피부</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">항산화</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">모발/두피</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div id="healthIcon" onclick="location.href=''"
                                                style="text-decoration: none; cursor: pointer;">
                                                <p><i class="fa-solid fa-bolt"></i></p>
                                                <div style="text-align: center; padding-top: 10px;">유/소아</div>
                                            </div>
                                        </td>
                                    </tr>
                                </div>
                            </table>
                        </div>
                    </div>
                    <div id="content2_3">&ensp;</div>
                </div>


                <div id="content3" style="height:230px;">
                    <div id="content3_1">&ensp;</div>
                    <div id="content3_2">
                        <table style=" height: 100%; width: 80%;" align="center">
                            <tr>
                                <td style="width: 30%;">
                                    <h5>나에게 맞는 추천</h5>
                                </td>
                                <td></td>
                                <td style="width: 30%;">
                                    <h5>정기구독</h5>
                                </td>
                                <td></td>
                                <td style="width: 30%;">
                                    <h5>섭취관리</h5>
                                </td>
                            </tr>
                            <tr style="vertical-align: top;">
                                <td style="padding: 20px;">
                                    올바른 영양제 섭취를 위해 <br>
                                    개인별 필요 성분과 제품을 알려드려요
                                </td>
                                <td></td>
                                <td style="padding: 20px;">
                                    건강 관리에 빈틈이 생기지 않게 <br>
                                    알아서 보내드릴게요
                                </td>
                                <td></td>
                                <td style="padding: 20px;">
                                    30일 한팩으로, <br>
                                    간편하게 챙길 수 있어요
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="content3_3">&ensp;</div>
                </div>

                <div id="content4" style=" width:100%; height: 640px;">
                    <div id="content4_1" style="width: 10%; float: left;">&ensp;</div>
                    <div id="content4_2" style="width: 80%; float: left;">
                        <table style="width: 1000px;" align="center">
                            <tr>
                                <td style="width: 80%; vertical-align: top; padding-bottom: 30px; padding-top: 90px;" align="left">
                                    <h4 style="color: rgb(40, 40, 40); font-weight:bold;">Best Pick!</h4>
                                </td>
                                <td style="width: 20%; vertical-align: top; padding-top: 90px;">
                                    <a href=""
                                        style="float: right; text-decoration: none; color: rgb(40, 40, 40); font-weight: bold;">
                                        더보기
                                        <i class="fa-solid fa-chevron-right"></i>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        
                        <!-- 약 제품 슬라이드 -->
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div>
                                        <img src="resources/images/pill01.png">
                                    </div>
                                    <h5 style="padding-top: 30px;">약</h5>
                                    <p>12,000원</p>
                                </div>
                                <div class="swiper-slide">
                                    <div>
                                        <img src="resources/images/pill02.png">
                                    </div>
                                    <h5 style="padding-top: 30px;">약</h5>
                                    <p>12,000원</p>
                                </div>
                                <div class="swiper-slide">
                                    <div>
                                        <img src="resources/images/pill03.png">
                                    </div>
                                    <h5 style="padding-top: 30px;">약</h5>
                                    <p>12,000원</p>
                                </div>
                                <div class="swiper-slide">
                                    <div>
                                        <img src="resources/images/pill04.png">
                                    </div>
                                    <h5 style="padding-top: 30px;">약</h5>
                                    <p>12,000원</p>
                                </div>
                                <div class="swiper-slide">
                                    <div>
                                        <img src="resources/images/pill05.png">
                                    </div>
                                    <h5 style="padding-top: 30px;">약</h5>
                                    <p>12,000원</p>
                                </div>
                                <div class="swiper-slide">
                                    <div>
                                        <img src="resources/images/pill06.png">
                                    </div>
                                    <h5 style="padding-top: 30px;">약</h5>
                                    <p>12,000원</p>
                                </div>
                            </div>
                        
                            <!-- 페이징 -->
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    <div id="content4_3" style="width: 10%; float: left;">&ensp;</div>
                </div>

                <!-- 고객후기 -->
                <div id="content5" style="width: 100%; height:630px; float: left; display: block;">
                    <div id="content5_1" style="width: 10%; float: left;">&ensp;</div>
                    <div id="content5_2" style="width: 80%; float: left;">
                        <table style="width: 1000px;" align="center">
                            <tr>
                                <td style="width: 80%; vertical-align: top; padding-bottom: 30px; padding-top: 90px;" align="left">
                                    <h4 style="color: #F3969A; font-weight:bold; text-align: center;">
                                        PillSoGood과 함께하는 구독자 후기
                                    </h4>
                                </td>
                            </tr>
                        </table>
                    </div> <br>
                    <div id="content5_3" style="width: 10%; float: left;">&ensp;</div>
                    <div id="content5_4" style="width: 100%; float: left; background-color: #f3969b65; height: 384px;">
                        <div >
                            <table id="cotent5_4Table" align="center">
                                <tr>
                                    <td>
                                        <div id="el1" align="center">
                                            <div>
                                                <img src="" style="width: 100px; height: 100px; border-radius: 60px; margin: auto; margin-top: 20px;">
                                            </div>
                                            <h6 style="padding-top: 25px;">정기구독 10회차</h6>
                                            <p style="color: rgb(40, 40, 40); font-size: 20px; margin-top: 20px;">뭘 먹어야할지 헤메던 제게, <br> 딱 맞는 영양제를 찾아줬어요!</p>
                                        </div>
                                    </td>
                                    <td>
                                        <div id="el1" align="center">
                                            <div>
                                                <img src="" style="width: 100px; height: 100px; border-radius: 60px; margin: auto; margin-top: 20px;">
                                            </div>
                                            <h6 style="padding-top: 25px;">정기구독 7회차</h6>
                                            <p style="color: rgb(40, 40, 40); font-size: 20px; margin-top: 20px;"> 여러군데에서 찾기 귀찮았는데 <br> 한번에 사니 편리해요 </p>
                                        </div>
                                    </td>
                                    <td>
                                        <div id="el1" align="center">
                                            <div>
                                                <img src="" style="width: 100px; height: 100px; border-radius: 60px; margin: auto; margin-top: 20px;">
                                            </div>
                                            <h6 style="padding-top: 25px;">정기구독 13회차</h6>
                                            <p style="color: rgb(40, 40, 40); font-size: 20px; margin-top: 20px;"> 과다섭취를 걱정했는데 <br> 알맞게 구성해주니 좋아요 </p>
                                        </div>
                                    </td>
                                    <td>
                                        <div id="el1" align="center">
                                            <div>
                                                <img src="" style="width: 100px; height: 100px; border-radius: 60px; margin: auto; margin-top: 20px;">
                                            </div>
                                            <h6 style="padding-top: 25px;">정기구독 10회차</h6>
                                            <p style="color: rgb(40, 40, 40); font-size: 20px; margin-top: 20px;"> 이젠 챙겨먹는게 <br> 습관이 됐어요 </p>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 뉴스레터 -->
                <div id="content6" style="width: 100%; height:1000px; float: left;"">
                    <div id="content6_1" style="width: 10%; float: left;">&ensp;</div>
                    <div id="content6_2" style="width: 80%; float: left;">
                        <table style="width: 1000px;" align="center">
                            <tr>
                                <td style="width: 80%; vertical-align: top; padding-bottom: 30px; padding-top: 90px;" align="left">
                                    <h4 style="color: rgb(40, 40, 40); font-weight:bold;">뉴스레터</h4>
                                </td>
                                <td style="width: 20%; vertical-align: top; padding-top: 90px;">
                                    <a href=""
                                        style="float: right; text-decoration: none; color: rgb(40, 40, 40); font-weight: bold;">
                                        더보기
                                        <i class="fa-solid fa-chevron-right"></i>
                                    </a>
                                </td>
                            </tr>
                        </table>

                        <table style="width: 1000px;" align="center">
                                <tr>
                                    <td rowspan="6" style="width: 60%; vertical-align: top; padding-right: 30px; padding-top: 30px;" align="center" >
                                        <img src="" style="width:100%; height: 350px;">
                                        <p style="text-align: left; width: 100%;">
                                            <a href="" style="text-decoration: none; color:rgb(40, 40, 40);">
                                                <b style="padding-top: 20px; display: block; font-size: 20px;">속 쓰릴때 도움되는 영양제</b> 
                                            <br>
                                            하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가? 
                                            우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은 웅대한 관현악이며 미묘한
                                            </a>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; height: 200px; vertical-align: top; padding-top: 30px;">
                                        <img src="" style="width:100%; height: 200px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;">
                                        <a href="" style="text-decoration: none; color:rgb(40, 40, 40);"><b style="display: block; padding-top: 20px;">속 쓰릴때 도움되는 영양제</b></a>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="width: 100%; height: 200px; vertical-align: top; padding-top: 30px;">
                                        <img src="" style="width:100%; height: 200px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;">
                                        <a href="" style="text-decoration: none; color:rgb(40, 40, 40);"><b style="padding-top: 20px; display: block;">속 쓰릴때 도움되는 영양제</b></a>
                                    </td>
                                    
                                </tr>
                            
                            
                        </table>

                    </div>
                    <div id="content6_3" style="width: 10%; float: left;">&ensp;</div>
                </div>


      

             </div>
            </div>

            <script>
                var swiper = new Swiper('.swiper-container', {

                    slidesPerView: 3, // 동시에 보여줄 슬라이드 갯수
                    spaceBetween: 30, // 슬라이드간 간격
                    slidesPerGroup: 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

                    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                    // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
                    loopFillGroupWithBlank: true,

                    loop: true, // 무한 반복

                    spaceBetween: 0,
                    autoplayDisableOnInteraction: false,
                    autoplay: {
                        //시간 1000 이 1초
                        delay: 3000,
                        disableOnInteraction: false,
                    }
                });
            </script>

            
    <jsp:include page="/WEB-INF/views/common/footer.jsp" /> 

    <script>
        AOS.init();
    </script>


</body>

</html>