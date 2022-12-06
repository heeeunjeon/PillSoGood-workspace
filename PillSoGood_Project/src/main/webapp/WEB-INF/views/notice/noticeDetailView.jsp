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
        
        box-sizing : border-box;
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

    #noticeModify {
        margin-right : 20px;
    }

    #noticeContent {

        width : 100%;
        height : 695px;
        resize : none;
        border : none;
    }
    
    #noticePrevNextTable:hover {
    
    	cursor : pointer;
    	
    }
    
    #noticeContent:focus {
    	outline : none;
    }
    
    textarea:focus {
    	outline: none;
    	box-shadow:none;
	}
	
	#content_2_1>p {
        font-size: 35px;
        color: black;
        margin-top: 20px;
        margin-left: 30px;
        font-weight: bold;
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
                    <p>공지사항
                            <button style="float:right;" class="btn btn-primary btn-danger" onclick="postFormSubmit(2);" >삭제</button>
                            <button style="float:right;" class="btn btn-primary btn-warning" onclick="postFormSubmit(1);" id="noticeModify">수정</button>
                    </p>
                <form id="postForm" action="" method="post">
	            	
	            	<input type="hidden" name="nno" value="${ n.noticeNo }">
                    
	            </form>
	            
	            <script>
	            	function postFormSubmit(num) {
	            		
	            		if(num == 1) { // 수정하기 버튼 클릭 시 num == 1 : updateForm.bo
	            			
	            			$("#postForm").attr("action", "updateForm.no").submit();
	            		
	            		} else { // 삭제하기 버튼 클릭 시 num == 2 : delete.bo
	            			
	            			$("#postForm").attr("action", "delete.no").submit();
	            			
	            		}
	            		
	            	}
	            </script>
                    
                </div>
                <div id="content_2_2">
                    
                    

                    <br clear="both"/>

                    <div>
                         <table class="table">
                            <tbody>
                                <tr align="center">
                                    <td>${ n.noticeNo }</td>
                                    <td width="70%">${ n.noticeTitle }</td>
                                    <td align="right">${ n.noticeDate }</td>
                                </tr>
                            </tbody>
                         </table>
                    </div>

                    <div>
                        <textarea name="" id="noticeContent" class="form-control" readonly>${ n.noticeContent}</textarea>

                        <br>
                        <table class="table table-hover" id="noticePrevNextTable">
                            <tbody>
                            <c:choose>
                            	<c:when test="${ n.nextNo ne 9999 }">
                            		<tr align="center">
	                                    <td>${ n.nextNo }</td>
	                                    <td>${ n.nextTitle }</td>
	                                    <td align="right">${ n.nextDate }</td>
	                                </tr>
                            	</c:when>
                            </c:choose>
                            <c:choose>
                            	<c:when test="${ n.prevNo ne 9999 }">
                            		<tr align="center">
                                    <td>${ n.prevNo }</td>
                                    <td>${ n.prevTitle }</td>
                                    <td align="right">${ n.prevDate }</td>
                                </tr>
                            	</c:when>
                            </c:choose>    
                                
                            </tbody>
                         </table>
                         
                         
                     <script>
						$(function() {
							
							$("#noticePrevNextTable>tbody>tr").click(function() {
								
								
								location.href='detail.no?nno='+ $(this).children().eq(0).text();
								
							});
							
						});
					</script>
                    </div>

                </div>
                <div id="content_2_3">
                    <div class="col text-center" style="height:100%;">
                        <button class="btn btn-primary btn-lg" onclick="location.href='/PillSoGood/list.no'"> 목록으로 </button>
                    </div>
                </div>
            </div>

            <div id="content_3"></div>
        </div>
		

        <jsp:include page="../common/footer.jsp" />

	
        
    </div>
    

</body>
</html>