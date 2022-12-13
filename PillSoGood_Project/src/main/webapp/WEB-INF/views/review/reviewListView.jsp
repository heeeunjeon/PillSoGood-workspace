<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>

    div {
		/* border: 1px solid black; */
        box-sizing : border-box;
    }
    
    tr, td {
    	/* border: 1px solid black; */
    	
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: 1530px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: 1150px; }
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
    }

    /* content 영역 */
    #content>div { height : 100%; float : left; }
    #content_1 { width : 20%; }
    #content_2 { width : 60%; }
    #content_3 { width : 20%; }

    body { font-family: 'Noto Sans KR', sans-serif !important; }

    .bestReviewArea {
        /* background-color: rgba(211, 211, 211, 0.418); */
        width:900px;
        height: 330px;
        float:left;
        margin-left: 12.5%;
        padding-bottom: 100px;
        align-items: center;

    }

    .bestReview { 
        float:left; 
        width: 290px;
        border: 1px solid;
        padding-left: 20px;
        padding-right: 35px;
        justify-content: center;
        margin-left: 7px;
        cursor: pointer;
    }

    .bestReview>img { width: 230px; height: 150px; margin-left: 0; margin-top: 15px;}
    
    .reviewCountsArea {
        border: 1px solid;
        top: -500px;
    }
    
    #reviewT { border-bottom: 1px solid lightgray;}
    #reviewT th, #reviewT td { color: black; padding: 10px; }
    #reviewT:hover { cursor: pointer; }

    h4 { padding-bottom: 30px; }

    .bestReviewService { font-weight: bold; font-size: 14px; }
    .bestReviewContent, .bestReviewName { font-size: 12px;  }

    .page-item {
            float: left;
            padding: 0;
    }

    .paginationArea {
        position: relative;
        left: 35%;
        padding-top: 70px;
        padding-bottom: 100px;
    }

</style>
</head>
<body>
    <div class="wrap">
        <jsp:include page="../common/menubar.jsp" />
        <div id="navigator2"></div>
        <div id="header"></div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2">
                <div id="content_2_1">
                    <!-- 로고 영역 -->
                    <div class="logoArea">
                        <jsp:include page="../common/logo.jsp" />
                      <p style="display: inline; font-size: 20px;">고객후기</p>
                  </div>       
                </div>
                <div id="content_2_2">
                    <div>
	                    <div>
	                    <!-- 베스트 후기 영역 -->
	                    <h4>11월 BEST3 후기</h4>
	                        <div class="bestReviewArea" style="">
	                            <c:forEach var="b" items="${ bestList }">
	                            	<div class="bestReview">
		                                <img src="${ b.flist[0].filePath }${ b.flist[0].changeName }" width="300" height="300" >
		                                
		                                <c:forEach begin="1" end="${ b.reviewGrade }">
		                                	<i class="fa-solid fa-star" style="color: #78C2AD;"></i>
		                                </c:forEach>
		                                <input type="hidden" value="${ b.reviewNo }">
		                                <p class="bestReviewService">${ b.reviewTitle }</p>
		                                <p class="bestReviewContent">${fn:substring(b.reviewContent, 0, 15)}...</p>
		                                <p class="bestReviewName">${ fn:substring(b.memberName, 0, 1)}*${ fn:substring(b.memberName, 2, 1)}&emsp;${ b.reviewDate }</p>
		                            </div>
	                            </c:forEach>
	                        </div>
						</div>
					</div>
                        <!-- 베스트 리뷰와 일반 리뷰 사이 간격 -->
                        <div style="margin-bottom: 350px;" align="right"></div>
                    	<div>
                    		<table>
                    			<tr>
                    				<td width="900px;">총 <span style="color: #78C2AD;">${list.size()}</span>건</td>
                    				<td width="100px;"><button id="orderByNew" class="btn btn-primary" >최신순</button></td>
                    				<td width="100px;"><button id="orderByHot" class="btn btn-primary" >인기순</button></td>
                    			</tr>
                    		</table>
                    	</div>	
	            		
	                    <!-- 일반 리뷰 -->
						<c:forEach var="i" begin="0" end="${ list.size()-1 }">
							<table id="reviewT" class="reviewT" align="center">
	                               <tbody>
	                               <tr>
	                               		<input type="hidden" value="${ list[i].reviewNo }">
	                               		<td width="600px" style="font-size: 20px; padding-top: 20px;"><b>${ list[i].reviewTitle }</b></td>
							            	<%-- 본인 로그인 경우에는 삭제수정 버튼, 관리자 로그인 경우에는 삭제 버튼 --%>
							            	<c:choose>
								            	<c:when test="${ not empty loginUser }">
									            	<c:choose>
										            	<c:when test="${ loginUser.getMemberId() eq list[i].memberId}">
										            		<td><button class="btn btn-secondary">삭제</button>
					                                   		<button class="btn btn-light">수정</button></td>
										            	</c:when>
										            	<c:when test="${ loginUser.getMemberId() eq 'admin1234'}">
										            		<td><button class="btn btn-secondary">삭제</button></td>
										            	</c:when>
										            </c:choose>
									            </c:when>
									            <c:otherwise></c:otherwise>
							            	</c:choose>
							        </tr>
	                               <tr>
	                                   <td>
	                                       <span style="color: #78C2AD;">
	                                       		<c:forEach var="j" begin="0" end="${ list[i].reviewGrade -1 }">
                                					<i class="fa-solid fa-star"></i>
                                				</c:forEach>
	                                       </span>
	                                   </td>
	                                   <td>${ list[i].reviewDate }</td>
	                               </tr>
	                               <tr>
	                               		<c:choose>
	                               			<c:when test="${ list[i].subsStatus eq 'N'}">
	                               				<td>list[i].ORDERS테이블에서 주문건에 있는 제품들 String 하나로 길게 변수해서 가져오기&ensp;
	                               				${ list[i].memberName }&ensp;
	                               				<span style="color: #78C2AD;">일시결제</span>&ensp;</td>
	                               			</c:when>
	                               			<c:when test="${ list[i].subsStatus eq 'Y'}">
	                               				<td>list[i].ORDERS테이블에서 주문건에 있는 제품들 String 하나로 길게 변수해서 가져오기&ensp;
	                               				${ list[i].memberName }&ensp;
	                               				<span style="color: #78C2AD;">정기결제</span>&ensp;</td>
	                               			</c:when>
	                               		</c:choose>
	                               </tr>
	                               <tr height="100px">
	                                    <td>${ list[i].reviewContent }</td>
	                               </tr>
	                               <tr>
	                                   <td>
	                                   		<c:forEach var="f" items="${list[i].flist}">
	                                   			<img src="${ f.filePath }${ f.changeName }" width="100" height="100" >
	                                   		</c:forEach>
	                                   </td>
	                               </tr>
	                               <tr>
	                               		<td><i class="fa-regular fa-comment"></i>
	                                   		&ensp;<span style="color: #78C2AD;">${ list[i].replyCount }</span></td>
	                               </tr>
	                           </tbody>
	                           </table>
						</c:forEach>
						<div align="right">
							<%-- 
	           					클릭 시 모달로 결제완료건이 드랍박스로 나오고 거기서 후기작성하기 누르면 후기 작성 폼으로 연결
	           					지금은 미구현 희원이한테서 결제 완성되면 받기
	           				--%>
	           				<a href="enrollForm.re"><button class="btn btn-primary" >작성하기</button></a>
						</div>
						<br>
	                    <!-- 페이지 -->
                        <div id="noticePagination">
	                        <nav aria-label="Page navigation">
	                            <ul class="pagination  justify-content-center">
	                            
	                            	<c:choose>
				                		<c:when test="${ pi.currentPage eq 1 }">
				                			<li class="page-item disabled" ><a class="page-link">&lt;</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item"><a class="page-link" href="list.re?cpage=${ pi.currentPage - 1 }&order=${ order }">&lt;</a></li>	
				                		</c:otherwise>
				                	</c:choose>
				                	
	            	                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    				
	                    				<c:choose>
	                    					<c:when test="${ p eq pi.currentPage }">
	                    						<li class="page-item disabled"><a class="page-link"  href="list.re?cpage=${ p }&order=${ order }">${ p }</a></li>
	                    					</c:when>
	                    				
		                    				<c:otherwise>
		                    					<li class="page-item"><a class="page-link" href="list.re?cpage=${ p }&order=${ order }">${ p }</a></li>
		                    				</c:otherwise>
	                   					</c:choose>
				                    </c:forEach>
				                    <c:choose>
				                		<c:when test="${ (pi.currentPage eq pi.maxPage) or (pi.maxPage eq 0) }">
				                			<li class="page-item disabled" ><a class="page-link">&gt;</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item"><a class="page-link" href="list.re?cpage=${ pi.currentPage + 1 }&order=${ order }">&gt;</a></li>	
				                		</c:otherwise>
				                	</c:choose>
	                            </ul>
	                        </nav>
                    	</div>
	                  </div>
                      <div id="content_2_3"></div>
                </div>
                <div id="content_3"></div>
            </div>
            <div id="footer">
            </div>
		</div>
		<script>
			// 베스트 리뷰 조회수 증가
			$(function() {
           		$(".bestReview").click(function() {
           			
           			var rno = $(this).children("input").eq(0).val();
           			location.href = "detail.re?rno=" + rno;
           		});
           	});
			// 일반 리뷰 조회수 증가
			$(function() {
           		$(".reviewT").click(function() {
           			
           			var rno = $(this).children("tbody").eq(0).children("tr").eq(0).children("input").eq(0).val();
           			// var rnoId = $(this).children("tbody").eq(0).children("tr").eq(0).children("td").eq(0).children("input").eq(0).attr('id');
           			// console.log(rnoId);
           			location.href = "detail.re?rno=" + rno;
           		});
           	});	
		</script>
</body>
</html>