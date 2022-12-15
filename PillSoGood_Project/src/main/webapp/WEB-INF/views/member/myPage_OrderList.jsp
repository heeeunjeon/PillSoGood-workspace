<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>PillSoGood</title>
<style>

    div {
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: 1750px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: 1400px; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 115px; }
    #content_2_2 { color: black; }

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

    /* ----- 주문조회 style ----- */
    /* 기간별 조회 button, input 들 */
    #search_date {
        height: 38px;
        width: 100%;
    }

    /* 기간 선택 button */
    #search_date button {
        margin: 0px 3px;
        box-sizing: border-box;
    }

    /* 날짜 선택 input */
    #search_date>input[type=date] {
        height: 100%;
        border: none;
        text-align: center;
        padding: 0px 5px;
        margin: 0px 10px;
    }

    /* button 들이 div 테두리를 밑으로 벗어나서 맞춤 */
    #search_date>button, #search_date>input[type=button] { vertical-align: top; }

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
                        <h4>주문 조회</h4>
                        <hr>
                        <div id="search_date" align="center">
                            <button type="button" class="btn btn-outline-primary">3개월</button>
                            <button type="button" class="btn btn-outline-dark">6개월</button>
                            <button type="button" class="btn btn-outline-dark">9개월</button>
                            <button type="button" class="btn btn-outline-dark">전체 3년</button>

                            <input type="date"> - 
                            <input type="date">   
                            
                            <input type="button" class="btn btn-primary" style="width: 90px; margin-left: 10px;" value="검색">
                        </div>
                        <hr>
                        <br>

                        <div id="order_list">
							
							<c:choose>
								<c:when test="${ empty olist }">
									<table>
										<tr height="100px">
											<th style="text-align: center;">주문내역이 없습니다.</th>
										</tr>
									</table>
								</c:when>
								<c:otherwise>
								
									<c:forEach var="o" items="${ olist }" varStatus="status">
			                            <table class="olist">
			                                <tr>
			                                    <td>
			                                    	<c:choose>
			                                    		<c:when test="${ o.orderStatus eq 'Y' }">
			                                    			<button class="btn btn-primary btn-sm" disabled>결제완료</button>
			                                    		</c:when>
			                                    		<c:when test="${ o.orderStatus eq 'C' }">
			                                    			<button class="btn btn-dark btn-sm" disabled>주문취소</button>
			                                    		</c:when>
			                                    		<c:otherwise>
			                                    			<button class="btn btn-dark btn-sm" disabled>미결제</button>
			                                    		</c:otherwise>
			                                    	</c:choose>
			                                        &nbsp;${ o.orderDate }
			                                    </td>
			                                    <th style="text-align: right;"><a href="">&gt;</a></th>
			                                </tr>
			                                <tr height="40px">
			                                    <th width="80%">
			                                    	<c:choose>
			                                    		<c:when test="${ o.subsStatus eq 'N' }">
			                                    			일반구매
			                                    		</c:when>
			                                    		<c:otherwise>
			                                    			정기구독 <b style="color: #78C2AD;">${ o.subsCount } 회차</b>
			                                    		</c:otherwise>
			                                    	</c:choose>
			                                    </th>
			                                    <th rowspan="2" style="text-align: right;">${ o.orderPrice }</th>
			                                </tr>
			                                <tr>
			                                    <td style="font-size: small;">${ o.productNames }</td>
			                                </tr>
			                            </table>
			                            <br><hr>
		                            </c:forEach>
		                            
								</c:otherwise>
							</c:choose>
                            
                        </div>
						
						<c:if test="${ not empty olist }">
	                        <div>
	                            <ul class="pagination pagination-sm">
	                            	<c:choose>
				                		<c:when test="${ pi.currentPage eq 1 }">
				                			<li class="page-item disabled">
			                                    <a class="page-link" href="#">&laquo;</a>
			                                </li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item">
			                                    <a class="page-link" href="myPage.or?cpage=${ pi.currentPage - 1 }">&laquo;</a>
			                                </li>
				                		</c:otherwise>
				                	</c:choose>
				                	
				                	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				                    	<c:choose>
				               				<c:when test="${ pi.currentPage eq p }">
				               					<li class="page-item active">
				                                    <a class="page-link" href="myPage.or?cpage=${ p }">${ p }</a>
				                                </li>
											</c:when>
				               				<c:otherwise>
				               					<li class="page-item">
				                                    <a class="page-link" href="myPage.or?cpage=${ p }">${ p }</a>
				                                </li>
				               				</c:otherwise>
				               			</c:choose>
				                    </c:forEach>
	                                
	                                <c:choose>
				                		<c:when test="${ pi.currentPage eq pi.maxPage }">
				                			<li class="page-item disabled">
			                                    <a class="page-link" href="#">&raquo;</a>
			                                </li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item">
			                                    <a class="page-link" href="myPage.or?cpage=${ pi.currentPage + 1 }">&raquo;</a>
			                                </li>
				                		</c:otherwise>
				                	</c:choose>
	                            </ul>
	                        </div>
                        </c:if>

                    </div>

                </div>

                <script>
                    $(function() {

                        $("#search_date button").on("click", function() {
                            $(this).attr("class", "btn btn-outline-primary");
                            $(this).siblings("button").attr("class", "btn btn-outline-dark");
                        });
                    });

                </script>
				
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>

</body>
</html>