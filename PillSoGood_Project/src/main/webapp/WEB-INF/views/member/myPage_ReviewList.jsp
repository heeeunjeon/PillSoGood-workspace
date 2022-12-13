<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    div {
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        /* 전체 길이 개별 커스텀 */
        height: 1600px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    /* 내용 길이 개별 wrap - 350px */
    #content { height: 1250px; }
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

    /* ----- 후기조회 style ----- */
    /* 후기 내용 2줄까지만 보이도록 */
    .review_content {
        padding-left: 15px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
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
                        <h4>내 후기 조회</h4>
                        <hr>

                        <div>
                            <table>
                                <tr>
                                    <td rowspan="2" width="15%"><img src="../../pill2.png" width="100%;" style="padding: 15px 15px 15px 0px;"></td>
                                    <th width="70%" style="padding-left: 15px;">프로바이오틱스</th>
                                    <th width="15%">2022.11.22</th>
                                </tr>
                                <tr height="70px">
                                    <td class="review_content">
                                        먹기도 편하게 되어있고 이거 먹은 뒤로 간이 좀 건강해지는 느낌이 드네요 
                                        요새 피로감이 많았는데 그것도 많이 줄었어요
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr>

                        <div>
                            <table>
                                <tr>
                                    <td rowspan="2" width="15%"><img src="../../pill2.png" width="100%;" style="padding: 15px 15px 15px 0px;"></td>
                                    <th width="70%" style="padding-left: 15px;">프로바이오틱스</th>
                                    <th width="15%">2022.11.22</th>
                                </tr>
                                <tr height="70px">
                                    <td class="review_content">
                                        먹기도 편하게 되어있고 이거 먹은 뒤로 간이 좀 건강해지는 느낌이 드네요 
                                        요새 피로감이 많았는데 그것도 많이 줄었어요
                                        먹기도 편하게 되어있고 이거 먹은 뒤로 간이 좀 건강해지는 느낌이 드네요 
                                        요새 피로감이 많았는데 그것도 많이 줄었어요
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr>

                        <div>
                            <table>
                                <tr>
                                    <td rowspan="2" width="15%"><img src="../../pill2.png" width="100%;" style="padding: 15px 15px 15px 0px;"></td>
                                    <th width="70%" style="padding-left: 15px;">프로바이오틱스</th>
                                    <th width="15%">2022.11.22</th>
                                </tr>
                                <tr height="70px">
                                    <td class="review_content">
                                        먹기도 편하게 되어있고 이거 먹은 뒤로 간이 좀 건강해지는 느낌이 드네요 
                                        요새 피로감이 많았는데 그것도 많이 줄었어요
                                        먹기도 편하게 되어있고 이거 먹은 뒤로 간이 좀 건강해지는 느낌이 드네요 
                                        요새 피로감이 많았는데 그것도 많이 줄었어요
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr>

                        <div>
                            <table>
                                <tr>
                                    <td rowspan="2" width="15%"><img src="../../pill2.png" width="100%;" style="padding: 15px 15px 15px 0px;"></td>
                                    <th width="70%" style="padding-left: 15px;">프로바이오틱스</th>
                                    <th width="15%">2022.11.22</th>
                                </tr>
                                <tr height="70px">
                                    <td class="review_content">
                                        먹기도 편하게 되어있고 이거 먹은 뒤로 간이 좀 건강해지는 느낌이 드네요 
                                        요새 피로감이 많았는데 그것도 많이 줄었어요
                                        먹기도 편하게 되어있고 이거 먹은 뒤로 간이 좀 건강해지는 느낌이 드네요 
                                        요새 피로감이 많았는데 그것도 많이 줄었어요
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr>

                        <div>
                            <table>
                                <tr>
                                    <td rowspan="2" width="15%"><img src="../../pill2.png" width="100%;" style="padding: 15px 15px 15px 0px;"></td>
                                    <th width="70%" style="padding-left: 15px;">프로바이오틱스</th>
                                    <th width="15%">2022.11.22</th>
                                </tr>
                                <tr height="70px">
                                    <td class="review_content">
                                        먹기도 편하게 되어있고 이거 먹은 뒤로 간이 좀 건강해지는 느낌이 드네요 
                                        요새 피로감이 많았는데 그것도 많이 줄었어요
                                        먹기도 편하게 되어있고 이거 먹은 뒤로 간이 좀 건강해지는 느낌이 드네요 
                                        요새 피로감이 많았는데 그것도 많이 줄었어요
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr>


                        <div>
                            <ul class="pagination pagination-sm">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#">&laquo;</a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">4</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">5</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">&raquo;</a>
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