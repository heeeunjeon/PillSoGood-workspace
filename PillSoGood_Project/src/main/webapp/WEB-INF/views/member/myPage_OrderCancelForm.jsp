<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>MY PAGE 주문 취소</title>
<style>

    div {
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: inherit;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { display: flex; height: auto; }
    #content_2>div { width: 100%; }
    #content_2_1, #content_2_3 { height: 115px; }
    #content_2_2 { height: auto; color: black; }

    #header { height: 130px; }

    #content_2_1>p {
        font-size: 35px;
        color: black;
        margin-top: 20px;
        margin-left: 30px;
        font-weight: bold;
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

    /* ----- 주문취소 style ----- */
    /* 텍스트 테이블들 table 정렬 */
    #refund th { text-align: right; font-weight: bold; }
    #refund tr { height: 35px; }

    /* 취소 유의사항 div */
    #refund_note {
        width: 70%;
        height: 80px;
        background-color: rgba(209, 209, 209, 0.603);
        margin: auto;
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
                            <p style="font-size: 20px;"><b style="font-size: 25px;">${ loginUser.memberName }</b> 님</p>
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
                        <h4>주문 취소</h4>
                        <hr>
                        <div>
                            <b>취소제품 정보</b>
                            <p style="float: right;">
                            	<c:choose>
                            		<c:when test="${ st eq 'Y' }">
                            			정기구독
                            		</c:when>
                            		<c:otherwise>
                            			일반구매
                            		</c:otherwise>
                            	</c:choose>
                            </p>
                            <hr>
                            <c:forEach var="p" items="${ plist }">
                            	<table>
	                                <tr height="40px">
	                                    <th rowspan="2" width="80px">
	                                        <img src="${ p.productImgPath }" width="100%">
	                                    </th>
	                                    <td rowspan="2" width="20px"></td>
	                                    <td style="vertical-align: bottom; font-size: small;">${ p.productExplain } 엔</td>
	                                    <th rowspan="2" class="price" style="text-align: right;">
	                                    	<c:forEach var="c" items="${ clist }">
	                                    		<c:if test="${ p.productNo eq c.productNo }">
	                                    			<fmt:formatNumber value="${ c.cartAmount * p.productPrice }"/>
	                                    		</c:if>
	                                    	</c:forEach>
	                                    	 원
	                                    </th>
	                                </tr>
	                                <tr height="40px">
	                                    <td style="vertical-align: top;"><b>${ p.productName }</b> 30일분&nbsp;&nbsp;<b style="color: #78C2AD;">
	                                    	<c:forEach var="c" items="${ clist }">
	                                    		<c:if test="${ p.productNo eq c.productNo }">
		                                    		${ c.cartAmount }
		                                    	</c:if>
	                                    	</c:forEach>
	                                    </b> 개</td>
	                                </tr>
	                            </table>
	                            <br>
                            </c:forEach>
                        </div>
                        <br>
						
						<c:choose>
                       		<c:when test="${ st eq 'N' }">
		                        <div>
		                            <b>환불 정보</b>
		                            <hr>
		
		                            <table id="refund">
		                                <tr>
		                                    <td width="30%">환불 예정금액</td>
		                                    <th width="70%">${ o.orderPrice } 원</th>
		                                </tr>
		                            </table>
		                        </div>
		                        <br><br>
		
		                        <div id="refund_note">
		                            <div style="font-size: small; padding-left: 20px;">
		                                <br>
		                                - 부분 취소는 불가능합니다. <br>
		                                - 상품이 출고된 이후 취소가 불가한 점 양해 부탁드립니다.
		                                <br>
		                            </div>
		                        </div>
		                        <br><br>

		                        <div align="center">
		                        	<button type="button" class="btn btn-primary" style="width: 20%; height: 45px;" onclick="refund();">주문 취소</button>
		                        	<button type="button" class="btn btn-secondary" style="width: 20%; height: 45px;" onclick="history.back();">뒤로가기</button>
		                        </div>
							</c:when>
		                    <c:otherwise>
		                        <div id="refund_note">
		                            <div style="font-size: small; padding-left: 20px;">
		                                <br>
		                                - PG사 규정상 결제 예정 당일에는 해지가 불가합니다.<br>
		                                - 해지시 다음 결제 예정일부터 결제가 진행되지 않습니다.
		                                <br>
		                            </div>
		                        </div>
		                        <br><br>

		                        <div align="center">
		                        	<button type="button" class="btn btn-primary" style="width: 20%; height: 45px;" onclick="unsubscribe();">구독 해지</button>
		                        	<button type="button" class="btn btn-secondary" style="width: 20%; height: 45px;" onclick="history.back();">뒤로가기</button>
		                        </div>
		                    </c:otherwise>
                       	</c:choose>
                    </div>

                </div>
                <br clear="both">
                <div id="content_2_3"></div>

            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>

</body>
</html>