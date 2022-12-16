<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>내 후기 조회</title>

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
                        <h4>내 후기 조회</h4>
                        <hr>
						<c:forEach var="i" begin="0" end="${ myList.size()-1}">
							<table id="reviewT" align="center">
	                               <thead>
		                                <tr>
		                               		<td><input type="hidden" value="${ myList[i].reviewNo }"></td>
		                               		<td width="600px" style="font-size: 20px; padding-top: 20px;"><b>${ myList[i].reviewTitle }</b></td>
											<td><button type="submit" class="btn btn-secondary btn-delete" onclick="location.href='delete.re?rno=${ myList[i].reviewNo }'">삭제</button></td>
							        	</tr>
							        </thead>
							        <tbody class="reviewT">
		                                <tr>
		                                   <td>
		                                       <span style="color: #78C2AD;">
		                                       		<c:forEach var="j" begin="1" end="${ myList[i].reviewGrade}">
	                                					<i class="fa-solid fa-star"></i>
	                                				</c:forEach>
		                                       </span>
		                                   </td>
		                                   <td>${ myList[i].reviewDate }</td>
		                                </tr>
		                                <tr height="100px">
		                                    <td><P>${fn:substring(myList[i].reviewContent, 0, 20)}...</P></td>
		                                </tr>
		                                <tr>
		                                   <td>
		                                   		<c:forEach var="f" items="${myList[i].flist}">
		                                   			<img src="${ f.filePath }${ f.changeName }" width="70" height="70" >
		                                   		</c:forEach>
		                                   </td>
		                                </tr>
	                            </tbody>
	                            </table>
						</c:forEach>

                        <!-- 페이지 -->
                        <div id="noticePagination">
	                        <nav aria-label="Page navigation">
	                            <ul class="pagination  justify-content-center">
	                            	<c:choose>
				                		<c:when test="${ pi.currentPage eq 1 }">
				                			<li class="page-item disabled" ><a class="page-link">&lt;</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item"><a class="page-link" href="myPage.re?cpage=${ pi.currentPage - 1 }">&lt;</a></li>	
				                		</c:otherwise>
				                	</c:choose>

									<div style="width: 70%;"></div>
	            	                
				                    <c:choose>
				                		<c:when test="${ (pi.currentPage eq pi.maxPage) or (pi.maxPage eq 0) }">
				                			<li class="page-item disabled" ><a class="page-link">&gt;</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item"><a class="page-link" href="myPage.re?cpage=${ pi.currentPage + 1 }">&gt;</a></li>	
				                		</c:otherwise>
				                	</c:choose>
	                            </ul>
	                        </nav>
                    	</div>
                    </div>
                </div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    
    <script>
		
        // 내 리뷰 조회수 증가
        $(function() {
            $(".reviewT").click(function() {
                var rno = $(this).parent('table').children('thead').eq(0).children('tr').eq(0).children('td').eq(0).children('input').eq(0).val();
                // console.log(rno);
                // var rno = $(this).children("tbody").eq(0).children("tr").eq(0).children("input").eq(0).val();
                location.href = "detail.re?rno=" + rno;
            });
        });
        
        // 내 리뷰 삭제
        $(function() {
            $(".btn-delete").click(function() {
                
                var rno = $(this).parent('td').prev().prev('td').children('input').eq(0).val();
                // console.log(rno);
                location.href = "myDelete.re?rno=" + rno;
            });
        });
			
    </script>  	

</body>
</html>