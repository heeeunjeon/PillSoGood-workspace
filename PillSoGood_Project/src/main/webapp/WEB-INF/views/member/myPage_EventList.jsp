<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PillSoGood</title>

<style>

    div {
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        /* 전체 길이 개별 커스텀 */
        height: 1400px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    /* 내용 길이 개별 wrap - 350px */
    #content { height: 1050px; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 115px; }
    #content_2_2 { color: black; }

    #header { height: 130px; }

    #content_2_1>p {
        font-size: 35px;
        color: black;
        margin-top: 20px;
        margin-left: 30px;
    }

    /* content 영역 */
    #content>div { height : 100%; float : left; }
    #content_1 { width : 20%; }
    #content_2 { width : 60%; }
    #content_3 { width : 20%; }

    body { font-family: 'Noto Sans KR', sans-serif !important; }

    /* ----- 마이페이지 공통 style ----- */
    /* 영역 구분 */
    #content2_2>div { height: 100%; }
    #mypage_navi { width: 20%; padding: 10px; float: left; }
    #mypage_content { width: 80%; padding: 30px; float: left; }

    /* MYPAGE 사이드메뉴바 */
    #mypage_navi>div {
        border: 2px solid #78C2AD;
        border-radius: 5px;
        padding: 15px;
    }
    /* 사이드바의 각 메뉴들 */
    #mypage_navi a {
        text-decoration: none;
        color: black;
    }
    #mypage_navi a:hover { color: #78C2AD; }

    /* 모든 table 공통 너비 */
    #mypage_content table { width: 100% }
    
    /* mypage_content h4, input. select 태그들 글자색 */
    #mypage_content h4, #mypage_content input, #mypage_content select { color: black; }

    /* 부트스트랩 페이징 */
    .pagination { justify-content: center; }

    /* ----- 찜이벤트조회 style ----- */
    /* 각 이벤트 썸네일 */
    .likes {
        display: inline-block;
        width: 350px;
        height: 200px;
        margin: 15px;
    }
    /* 썸네일 하단 제품명 */
    .likes>b {
        display: block;
        margin: 15px 0px;
        font-size: large;
    }

    /* 개별 페이징 */
    .page-link {
        vertical-align: middle;
        text-align: center;
        height: 35px;
        width: 70px;
        margin: 20px 50px;
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
                <div id="content_2_1">
                    <p>MY PAGE</p>
                </div>
                <div id="content_2_2" style="padding-top:10px;">
                    
                    <div id="mypage_navi">
                        <div>
                            <p style="font-size: 20px;"><b style="font-size: 25px;">홍길동</b> 님</p>
                            <br>
                            <p><a href="myPage.or">주문 조회</a></p>
                            <p><a href="myPage.subs">정기구독 관리</a></p>
                            <p><a href="myPage.info">내 정보 관리</a></p>
                            <p><a href="myPage.poll">건강설문 관리</a></p>
                            <p><a href="myPage.prod">내 관심 제품</a></p>
                            <p><a href="myPage.re">내 후기 조회</a></p>
                            <p><a href="myPage.ev">찜한 이벤트</a></p>
                        </div>
                    </div>

                    <div id="mypage_content">
                        <h4>찜한 이벤트</h4>
                        <hr>

                        <div align="center">
                            <!-- a href 속성 : 이벤트 상세 -->
                            <div class="likes" align="center">
                                <a href=""><img src="../../pill2.png" width="90%" height="80%"></a>
                                <b>정기구독 이벤트!</b>
                            </div>
                            
                            <!-- 찜이벤트 갯수만큼 반복 (4개씩 페이징) -->
                            <div class="likes" align="center">
                                <a href=""><img src="../../pill2.png" width="90%" height="80%"></a>
                                <b>정기구독 이벤트!</b>
                            </div>

                            <div class="likes" align="center">
                                <a href=""><img src="../../pill2.png" width="90%" height="80%"></a>
                                <b>정기구독 이벤트!</b>
                            </div>

                            <div class="likes" align="center">
                                <a href=""><img src="../../pill2.png" width="90%" height="80%"></a>
                                <b>정기구독 이벤트!</b>
                            </div>
                        </div>
                        <br>

                        <div style="float: left;">
                            <ul class="pagination pagination-sm">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#">&laquo; prev</a>
                                </li>
                            </ul>
                        </div>
                        <div style="float: right;">
                            <ul class="pagination pagination-sm">
                                <li class="page-item">
                                    <a class="page-link" href="#">next &raquo;</a>
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>

            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    


</body>
</html>