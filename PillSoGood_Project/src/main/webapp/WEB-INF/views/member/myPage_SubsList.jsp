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
        /*border : 1px solid #78C2AD;*/
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

    /* ----- 구독조회 style ----- */
    .subs_info {
        background-color: #78c2ad36;
        border-radius: 5px;
        height: 80px;
        font-size: small;
        padding: 10px;
    }
    .subs_info table th { text-align: right; }

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
                        <h4>정기구독 관리</h4>
                        <hr>

                        <div id="subs_list">

                            <div>
                                <b>정기구독 한 팩 서비스</b>&nbsp;&nbsp;<b style="color: #78C2AD;">1회차</b>
                                <b style="float: right; margin-left: 20px;">&gt;</b>
                                <b style="float: right;">스트레스로 인한 피로 개선엔 홍경천 <small>외 3종</small></b>
                                <br clear="both">
                            </div>
                            <br>
                            <div class="subs_info">
                                <table style="height: 100%;">
                                    <tr>
                                        <td width="40%">다음 결제 예정일</td>
                                        <th>2022.11.22</th>
                                    </tr>
                                    <tr>
                                        <td>결제 예정 금액</td>
                                        <th width="60%"><h7 style="color: #F3969A; margin-right: 10px;">10%</h7>76,500 원</th>
                                    </tr>
                                </table>
                            </div>
                            <br><hr>

                            <div>
                                <b>정기구독 한 팩 서비스</b>&nbsp;&nbsp;<b style="color: #78C2AD;">1회차</b>
                                <b style="float: right; margin-left: 20px;">&gt;</b>
                                <b style="float: right;">스트레스로 인한 피로 개선엔 홍경천 <small>외 3종</small></b>
                                <br clear="both">
                            </div>
                            <br>
                            <div class="subs_info">
                                <table style="height: 100%;">
                                    <tr>
                                        <td width="40%">다음 결제 예정일</td>
                                        <th>2022.11.22</th>
                                    </tr>
                                    <tr>
                                        <td>결제 예정 금액</td>
                                        <th width="60%"><h7 style="color: #F3969A; margin-right: 10px;">10%</h7>76,500 원</th>
                                    </tr>
                                </table>
                            </div>
                            
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