<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event 상세보기</title>
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

    #content { height: auto; display:flex; }
    #content_2>div { width: 100%; color: black; }
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
    #content>div {  float : left;  }
    #content_1 { width : 20%; }
    #content_2 { width : 60%; }
    #content_3 { width : 20%; }

    body { font-family: 'Noto Sans KR', sans-serif !important;  }
	
	  #eventContentArea {

        border : none;
    }

    .replyWriters {
        
        font-size: 1.5em;

    }
    
    .replyContents {

        font-size: 1em;
    }

    .EventTitleArea {
        font-size : 25px;
        
    }

    .table { 
        color: black;
        
    }

    #content {
        display: flex;
        height : auto;
        
    }
    .wrap {
        height : inherit;
    }
    #content_2_1, #content_2_3 { height : 114px;}
    #content_2_2 { height : auto; }
    
    #content>div { height : 100vh;}
    #content_2 {
        height : auto!important;
    }

    #reply_reply textarea {
        resize:none; 
        outline:none; 
        border:none; 
        margin-top: 20px;
        margin-bottom: 20px;
        margin-left: 20px;
        margin-right: 20px;
        width: 80%; 
        height: 100px;
        float: right;

    }
    
    #replyTable {
    	width:100%;
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
                    	<%-- <c:if test="${ loginUser.memberId eq 'admin' }"> --%>
                        	<button style="float:right; margin-right: 20px;" class="btn btn-primary btn-danger" onclick="location.href='delete.ev?eno=${ e.evtNo }&evtImgName=${ e.evtImgName }'">삭제</button>
                        	<button style="float:right; margin-right: 5px;" class="btn btn-primary btn-warning">수정</button>
                    	<%-- </c:if> --%>
                    </p>
                    
                </div>
                <div id="content_2_2">
                    
                    <br clear="both"/>

                    <div>
                         <table class="table" style="color:black">
                            <tbody>
                                <tr>
                                    <td class="EventTitleArea">${ e.evtTitle }</td>
                                    <td align="right">
                                        <span class="eventStart">${ e.evtStart }</span> ~
                                        <span class="eventDewDate">${ e.evtDew }</span>
                                    </td>
                                </tr>
                            </tbody>
                         </table>
                    </div>

                    <div align="right" id="like_con">
                        <img src="resources/images/Unlike.png" width="25" alt="" class="likeControl" id="eventUnLike">
                        <img src="resources/images/Like.png" width="25" class="likeControl" style="display:none" id="eventLike" >
                        <span id="evnetLikeCount">${ e.evtLikeCount }</span>
                    </div>

                    <script>
                        $(function() {

                            $("#like_con").on("click",".likeControl",function(){

                                if ($("#eventLike").css("display") == "none") { 
                                    $("#eventLike").show();
                                    $("#eventUnLike").hide();
                                } else {
                                    
                                    $("#eventLike").hide();
                                    $("#eventUnLike").show();
                                }
                            });

                        });
                    </script>

                    <br clear="both">

                    <div align="center">
						<c:choose>
							<c:when test="${ empty e.evtImgName }">
								첨부파일이 없습니다.
							</c:when>
							<c:otherwise>
								<img src="${ e.evtImgName }" width="500" alt="">
							</c:otherwise>
						</c:choose>
                        

                    </div>

                    <div align="center" style="width: 100%; height:auto; text-align: left; padding-bottom: 50px; padding-top: 50px;">
                         ${ e.evtContent }
                    </div>

                    <hr>

					
                    <div align="center">
                        <table>
                        	<c:choose>
                        		
                        		<c:when test="${ empty loginUser }"> 
                        			<td>
		                                <textarea class="form-control" name="" id="replyContentArea" cols="80" rows="5" style="resize:none; border-radius:5px;" readonly>로그인한 사용자만 이용 가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
		                            </td>
		                            <td>
		                                <button style="display:inline-block; margin-left: 10px;" class="btn btn-primary align-middle" disabled>댓글등록</button>
		                            </td>
                         		</c:when> 
                        		
                        		<c:otherwise>
		                            <td>
		                                <textarea class="form-control" name="" id="replyContentArea" cols="80" rows="5" style="resize:none; border-radius:5px;"></textarea>
		                            </td>
		                            <td>
		                                <button style="display:inline-block; margin-left: 10px;" class="btn btn-primary align-middle" onclick="">댓글등록</button>
		                            </td>
                            	</c:otherwise>
                            </c:choose>
                        </table>
                    </div>
                    
                    <hr>



                    <div id="replyArea" align="center">
                  
                    </div>





                    <script>
                 		var parentNo = 0;
                        $(function() {
                        	selectReplyList();
                        	
                        });
                        
                        function selectReplyList() { // 해당 게시글의 댓글 리스트 조회용 ajax 
                        	
                        	$.ajax({
                        		url : "rlist.ev",
                        		data : {eno: ${ e.evtNo }},
                        		success : function(result) {
                        			
                        			var resultStr = "";
                      
                        			
                        			
                        			for(var i = 0; i < result.length; i++) {
                        				if ( result[i].parentReply == 0) { // 부모 댓글이 없다면 대댓글이 안보이는 테이블
	                        				resultStr += "<table class='comm comm1' id='replyTable'>"
		                          							+ "<input type='hidden' value="+ result[i].replyNo +">"
		    	                                        	  + "<tr>"
				                        				              + "<td class='replyWriters' width='80%' style='padding-left: 60px; padding-top:20px;'>"
				                                        			  + result[i].memberId
				                                        			  +	"</td>"
				                                        			  + "<td class='replyCreateDates' colspan='2' width='20%' style='padding-top: 20px; padding-left: 30px;'>"
				                                        			  + result[i].replyDate
				                                        		      + "</td>"
				                                    		   + "</tr>"
				                                    		   + "<tr style='border-bottom : 1px solid lightgray;'>"
				                                    		          + "<td class='replyContents' style='padding: 30px; padding-left: 60px;'>"
					                                    			  + result[i].replyContent
					                                    	          + "</td>"
					                                				  + "<td>"
					                                   				  + "<button style='width:65px; margin-left: 30px;' class='btn btn-primary btn-danger'>삭제</button>"
					                                				  + "</td>"
					                            			  + "</tr>"
					                                      + "</table>"
    	                                          
    	                                           } else if ( result[i].parentReply != 0 && ${ not empty loginUser } ) { // 부모댓글이 있고, 로그인한 유저라면 대댓글 달 수 있음
    	                                        	   resultStr += "<table class='comm' id='replyTable'>"
	                            							+ "<input type='hidden' value="+result[i].replyNo +">"
		                        							+ "<tr>"
			                        				              + "<td class='replyWriters' width='80%' style='padding-left: 60px; padding-top:20px;'>"
			                                        			  + result[i].memberId
			                                        			  +	"</td>"
			                                        			  + "<td class='replyCreateDates' colspan='2' width='20%' style='padding-top: 20px; padding-left: 30px;'>"
			                                        			  + result[i].replyDate
			                                        		      + "</td>"
		                                        		  	 + "</tr>"
		                                        		  	 + "<tr style='border-bottom : 1px solid lightgray;'>"
		                                        		          + "<td class='replyContents' style='padding: 30px; padding-left: 60px;'>"
		    	                                    			  + result[i].replyContent
		    	                                    	          + "</td>"
		    	                                				  + "<td>"
		    	                                   					+"<button style='width:65px; margin-left: 30px;' class='btn btn-primary btn-danger'>삭제</button>"
		    	                                				  + "</td>"
		    	                            			  	+ "</tr>"
		    	                            			  	+ "<tr class='nested_reply_container' style='display:none; background-color: #78c2ad36;'>"                                   
		    	                                				  + "<td align='center' id='reply_reply' width='80%'>"
		    	                                    			  + "<textarea class='form-control' name='' placeholder='대댓글남기기' class='txtArea nested_reply' maxlength='500'></textarea>"
		    	                                				  + "</td>"
		    	                                                  + "<td width='20%'>"
		    	                                                  + "<input type='button' value='등록' class='btn btn-primary' onclick='' style='float:left; margin-top: 20px; margin-bottom: 20px;'>"
		    	                                                  + "</td>"
		    	                                          	+ "</tr>"
		    	                                        + "</table>" 
    	                                          }   
   
                        			}
									
                        			$("#replyArea").html(resultStr);

                        		},
                        		error : function() {
                        			console.log("댓글리스트 조회용 ajax 통신 실패!");
                        		}
                        		
                        	});
                        }
                        
                        
                        // 대댓글 나오는 스트립트
                        $(function() {
                            $("#replyArea").on("click", ".comm", function(e){
                            	
                                parentNo=$(e.currentTarget).children().first().val(); //댓글 넘버 
                                console.log(parentNo);
                                console.log(e.currentTarget);
                                $(e.target).parent().siblings('.nested_reply_container').toggle();
                                
                            });

                        });
                        
                    </script>


                </div>
                <div id="content_2_3"></div>
            </div>

            <div id="content_3"></div>
        </div>

        
        
    </div>

    <div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    
</body>
</html>