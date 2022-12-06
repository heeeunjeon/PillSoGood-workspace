<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
<style>

    div {
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: auto;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: auto; display: flex; color: black; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 10%; float: left; }
    #content_2_2 { height: 80%; float: left; }
    #content_2_3 { height: 10%; float: left; }

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


    .eventTable * {
        border : none;
    }
    .eventStatus {
        margin-left : 15px;
    }

    .eventContent {
        font-size: 0.9em;
    }

    .eventDate {
        font-size : 0.8em;
    }

    .eventLike {
        font-size : 0.8em;
    }

	#eventList {
        color: black;
    }
    
    #eventList td {
        padding-left: 30px;
    }

    #noticePagination {
        padding: 20px;
        height: 200px;
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
                    <p>이벤트
                    	<!-- 관리자일 경우에만 보여지는 등록 버튼 -->
                    	<%-- <c:if test="${ loginUser.memberId eq 'admin') }" > --%>
                    	
                        	<button style="float:right; margin-right: 20px; margin-top: 10px;" class="btn btn-primary btn-primary">등록</button>
                        
                        <%-- </c:if> --%>
                    </p>
                </div>
                <div id="content_2_2">

                    <!-- 
                        한 테이블 내에 존재하면 나중에 실제 구현 때 링크걸기 힘들어서 테이블 별로 쪼갰음 
                        eventStatus 클래스들에 임의로 primary light 클래스 부여 해놨는데 실제 구현 때는
                        DEWDATE 컬럼하고 현재 날짜 비교해서 자스로 addClass, removeClass 해주면 될거임
                    -->
                    
                    
                    <table class="table eventTable" style="cursor:pointer; margin-top: 30px;" id="eventList" >
                        <thead></thead>
                        <tbody>
                        	<c:forEach var="e" items="${ list }">
                        		<tr style="border-top : 1px solid lightgray;" onclick="location.href='detail.ev?eno=${ e.evtNo }'">
	                                <td class="eventTitle" style="padding-top: 20px;">
	                                    ${ e.evtTitle }
	                                    <span class="btn btn-primary btn-sm eventStatus">진행 중</span>
	                                </td>
	                                <td rowspan="4" style="padding-top: 20px;">
	                                    <img src="resources/images/Logo.PNG" width="250" alt="">
	                                </td>
                            	</tr>
	                            <tr>
	                                <td class="eventContent">${ e.evtContent }</td>
	                            </tr>
	                            <tr>
	                                <td class="eventDate">${ e.evtStart } - ${ e.evtDew }</td>
	                            </tr>
	                            <tr style="border-bottom : 1px solid lightgray;">
	                                <td class="eventLike" style="padding-bottom: 20px;">
	                                    <img src="resources/images/Like.png" width="15" alt="">
	                                    <span id="countLike">${ e.evtLikeCount }</span>
	                                </td>
	                            </tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>
                
               
                
                
				<div id="content_2_3">
             		<!-- 페이지네이션 -->
                    <div id="noticePagination">
                    	<ul class="pagination  justify-content-center">
	                    	<c:choose> 
	                    		<c:when test="${ pi.currentPage eq 1 }">
	                    			<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<li class="page-item"><a class="page-link" href="list.ev?cpage=${ pi.currentPage - 1 }">1</a></li>
	                    		</c:otherwise>
	                    	</c:choose>
	                    	
	                    	<c:forEach var="e" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    		<li class="page-item"><a class="page-link" href="list.ev?cpage=${ e }">${ e }</a></li>
	                    	</c:forEach>
	                    	
	                    	<c:choose>
	                    		<c:when test="${pi.currentPage eq pi.maxPage }">
	                    			<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<li class="page-item"><a class="page-link" href="list.ev?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
	                    		</c:otherwise>
	                    	</c:choose>
                        </ul>

                    </div>
                </div>
                
                
            </div>

            <div id="content_3"></div>
        </div>


        <jsp:include page="../common/footer.jsp" />

        
    </div>
    
</body>
</html>