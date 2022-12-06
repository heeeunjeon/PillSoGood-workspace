<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<style>

    div {
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
    }

    /* content 영역 */
    #content>div { height : 100vh; float : left; }
    #content_1 { width : 20%; }
    #content_2 { width : 60%; height: auto!important;}
    #content_3 { width : 20%; }

    body { font-family: 'Noto Sans KR', sans-serif !important; }

    /* 영섭 작업 영역 시작 */

    /* 버튼 스타일 */
    #btnDelete, #btnUpdate {
        height: 30px;
        width: 60px;
    }

    /* 영섭 작업 영역 끝 */

    .form-control {
        margin-left: 0px;
        width: 95%;;
        margin: auto;
    }

    #content_2_2 p {
        margin-left: 35px;
        font-weight: bold;
        font-size: large;
    }

    .question_content {
        width: 95%;
        margin: auto;
        margin-bottom: 70px;
        background-color: #78c2ad36;
        padding: 10px;
        border-radius: 10px;
    }

    #answer_content {
        width: 90%;
        margin: auto;
        background-color: #78c2ad36;
        border-radius: 10px;
    }
    #answer_content th, #answer_content td { padding: 15px; color: black; }

    #answer_enroll {
        width: 90%;
        margin: auto;
    }

    #btnInsert {
        width: 60px;
        margin-top: 15px;
    }
	
	#answer_update {
		display: none;
		width: 90%;
		margin: auto;
		margin-top: 30px;
	}
	
	#update_btn button {
		width: 80px;
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
                    <p>1:1 문의</p>
                </div>
                <div id="content_2_2">

                    <!-- 영섭 작업 영역 시작 -->

                    <!-- 제목 부분 -->
                    <p>제목</p>
                    <div class="question_content">${ q.questionTitle }</div>
                    
                    <!-- 내용 부분 -->
                    <p>내용</p>
                    <div class="question_content">${ fn:replace(q.questionContent, newLine, "<br>") }</div>
                    
                    <c:if test="${ not empty q.questionImage }">
	                    <!-- 사진첨부 부분 -->
	                    <p>사진</p>
	                    <div class="question_content" style="background-color: transparent;">
	                        <img src="${ q.questionImage }" width="200px" height="200px">
	                    </div>
                    </c:if>
                    <br>
                    
                    
                    <c:if test="${ loginUser.memberNo eq q.memberNo }">
                    	<div align="center" id="update_btn">
	                        <button class="btn btn-warning" onclick="updateFormSubmit(1);">수정</button>
	                        <button class="btn btn-danger" onclick="updateFormSubmit(2);">삭제</button>
                   		</div>
                   	
	                   	<form id="updateForm" action="" method="post">
	                    	<input type="hidden" name="qno" value="${ q.questionNo }">
	                    	<input type="hidden" name="filePath" value="${ q.questionImage }">
	                    </form>
	                    
	                    <script>
	                    	function updateFormSubmit(num) {
	                    		
	                    		if(num == 1) {
	                    			$("#updateForm").attr("action", "updateForm.qu").submit();
	                    		} else {
	                    			
	                    			if(confirm("문의를 삭제하시겠습니까?\n삭제 후에는 복구할 수 없습니다.")) {
	                    				$("#updateForm").attr("action", "delete.qu").submit();
	                    			}
	                    		}
	                    	}
	                    </script>
                    </c:if>
                    <hr>
                    <br><br>


                    <div>
                    	<c:choose>
                    		<c:when test="${ not empty q.answer }">
		                        <!-- 댓글 부분 -->
		                        <div>
		                            <table id="answer_content">
		                                <thead>
		                                    <tr>
		                                        <th width="15%;">PillSoGood</th>
		                                        <td width="15%;">${ q.answerDate }</td>
		                                        <td width="70%;" style="text-align: right;">
		                                        	<c:if test="${ loginUser.memberId ne 'admin' }">
			                                            <button id="btnUpdate" type="button" class="btn btn-warning btn-sm">수정</button>
			                                            <button id="btnDelete" type="button" class="btn btn-danger btn-sm" onclick="deleteAnswer();">삭제</button>
		                                            </c:if>
		                                        </td>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr><td colspan="3">${ fn:replace(q.answer, newLine, "<br>") }</td></tr>
		                                </tbody>
		                            </table>
		                            
		                            <div id="answer_update">
		                                <textarea rows="8" class="form-control" placeholder="답변 내용 작성" style="resize: none;">${ q.answer }</textarea>
		                                <!-- 버튼 영역 -->
		                                <div align="right">
		                                    <button type="button" class="btn btn-primary btn-sm" style="margin-top: 15px;" onclick="updateAnswer();">수정</button>
		                                </div>
		                            </div>
		                        </div>
		                        <br>
		                        
		                        <script>
		                        	$(function() {
		                        		$("#btnUpdate").on("click", function() {
		                        			$("#answer_update").show();
		                        			$("#answer_update>textarea").select();
		                        		});
		                        	});
		                        	
		                        	function updateAnswer() {
		                        		
		                        		$.ajax({
		                        			url : "anupdate.ad",
		                        			data : {
		                        				questionNo: ${ q.questionNo },
		                        				answer: $("#answer_update>textarea").val()
		                        			},
		                        			success : function(result) {
		                        				
		                        				if(result == "success") {
		                        					alert("답변을 수정했습니다.");
		                        					location.reload();
		                        				}
		                        			},
		                        			error : function() {
		                        				console.log("1:1 문의 답변 수정용 ajax 통신 실패");
		                        			}
		                        		});
		                        	}
		                        	
		                        	function deleteAnswer() {
		                        		
		                        		if(confirm("답변을 삭제하시겠습니까?")) {
		                        			
		                        			$.ajax({
		                        				url : "andelete.ad",
		                        				data : { qno: ${ q.questionNo } },
		                        				success : function(result) {
		                        					
		                        					if(result == "success") {
		                        						alert("답변을 삭제했습니다.");
			                        					location.reload();
			                        				}
		                        				},
		                        				error : function() {
		                        					console.log("1:1 문의 답변 삭제용 ajax 통신 실패");
		                        				}
		                        			});
		                        		}
		                        	}
		                        </script>
		                        
                        	</c:when>
                        	<c:otherwise>
		                        <!-- 댓글 입력창 부분 -->
		                        <c:if test="${ loginUser.memberId eq 'admin' and empty q.answer }">
			                        <div id="answer_enroll">
		                                <textarea rows="8" class="form-control" placeholder="답변 내용 작성" style="resize: none;"></textarea>
		                                
		                                <!-- 버튼 영역 -->
		                                <div align="right">
		                                    <button id="btnInsert" type="button" class="btn btn-primary btn-sm" onclick="insertAnswer();">등록</button>
		                                </div>
			                        </div>
		                        </c:if>
		                        
		                        <script>
		                        	function insertAnswer() {
		                        		
		                        		$.ajax({
		                        			url : "aninsert.ad",
		                        			data : {
		                        				questionNo: ${ q.questionNo },
		                        				answer: $("#answer_enroll>textarea").val()
		                        			},
		                        			success : function(result) {
		                        				
												if(result == "success") {
													alert("답변을 작성했습니다.");
		                        					location.reload();
		                        				}
		                        			},
		                        			error : function() {
		                        				console.log("1:1 문의 답변 작성용 ajax 통신 실패");
		                        			}
		                        		});
		                        	}
		                        </script>
                        	</c:otherwise>
                        </c:choose>
                    </div>

                    <!-- 영섭 작업 영역 끝 -->

                </div>
                <div id="content_2_3"></div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>

</body>
</html>