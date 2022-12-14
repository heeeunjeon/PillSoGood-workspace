<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    <style>
    
        
    div {

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

        #content { 
            overflow-y : hidden;
            height : auto;
        }
        #content_2>div { width: 100%; }
        #content_2_1 { height: 1%; float: left; }
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
        #content>div { height : 200vh; float : left; }
        #content_1 { width : 20%; }
        #content_2 { width : 60%; }
        #content_3 { width : 20%; }
    
        body { font-family: 'Noto Sans KR', sans-serif !important; }

        .btnArea {
            display: inline;
            margin-left: 88%;
        }

        .reviewDetail tr:nth-child(1) {
            font-weight: bold;
            font-size: 16px;
        }

        .reviewDetail tr:nth-child(3) {
            font-size: 14px;
        }

        .reviewDetail tr:nth-child(4) {
            font-size: 14px;
        }

        .reviewDetail img {
            padding-top: 30px;
            padding-bottom: 10px;
        }

        .pillCart {
            width: 290px;
            height: 200px;
            float: left;
            margin-right: 10px;
            border-radius: 15px;
        }

        .pillCart p {
            padding-bottom: 0;
            display: inline;
        }

        .pPic {
            margin-left: 65%;
            display: inline;
        }

        .pContent {
            margin-left: 7%;
            position: relative;
            top: 7%;
        }

        .pName {
            margin-left: 7%;
            position: relative;
            bottom: 66px;
        }

        .pCounts {
            margin-left: -108px;
            position: relative;
            bottom: 26px;
            color: rgb(104, 104, 104);
        }
        
        .pAmount {
            margin-left: -38px;
            position: relative;
            bottom: -11px;
        }

        .cartBtn {
            position: relative;
            margin-left: 15%;
            bottom: -20px;
            width: 200px;
            height: 40px;
            background-color: white;
            font-size: 12px;
            border-radius: 10px;
            border-color: white;
        }

        .moreBtn {
            position: relative;
            width: 140px;
            height: 35px;
            background-color: white;
            color: rgba(34, 34, 34, 0.779);
            font-size: 13px;
            border-radius: 10px;
            border-color: rgba(34, 34, 34, 0.208);
            margin-left: 40%;
        }

        .moreBtnArea {
            position: relative;
            bottom: -100px;
        }
        .replyName{
            display: inline;
            color: black;
        }
        .replyDate {
            display: inline;
            padding-left: 20px;
            font-size: 10px;
            color: rgb(152, 151, 151);
        }
       
        .replyArea {
            background-color: rgba(211, 211, 211, 0.359);
            padding: 20px;
        }

        #enrollBtn {
            position: relative;
            bottom: -80px;
            left: 1050px;
        }

        #listBtn {
            width: 140px;
            height: 35px;
            border-radius: 10px;
            margin-top: 100px;
            margin-left: 40%;
            font-size: 13px;
        }
        
        .replyContent {
        	color: black;
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
                    <div id="content_2_2" >

                        <div class="btnArea">
                            <button type="submit" class="btn btn-secondary">삭제</button>
                            <button type="reset" class="btn btn-light">수정</button>
                        </div>

                        <hr>

                        <!-- 리뷰 상세 본문 -->
                        <div class="reviewDetailArea">
                            <table class="reviewDetail">
                                <tr>
                                    <td>나중에 희원이한테 받을 결제 상품 목록</td>
                                </tr>
                                <tr>
                                    <td">
                                        <span style="color: #78C2AD;">
	                                       		<c:forEach var="j" begin="0" end="${ r.reviewGrade -1 }">
                                					<i class="fa-solid fa-star"></i>
                                				</c:forEach>
	                                     </span>                                     
                                    </td>
                                    <td>${r.reviewDate}</td>
                                </tr>
                                <tr>
                                    <td>
										<c:choose>
	                               			<c:when test="${ r.subsStatus eq 'N'}">
	                               				<td>${ r.memberName }&ensp;
	                               				<span style="color: #78C2AD;">일시결제</span>&ensp;</td>
	                               			</c:when>
	                               			<c:when test="${ r.subsStatus eq 'Y'}">
	                               				<td>${ r.memberName }&ensp;
	                               				<span style="color: #78C2AD;">정기결제</span>&ensp;</td>
	                               			</c:when>
	                               		</c:choose>
	                               </td>
                                </tr>
                                <tr>
                                    <td>${ r.reviewContent }</td>
                                </tr>
                                <tr>
                                    <td>
                                   		<c:forEach var="f" items="${r.flist}">
                                   			<img src="${ f.filePath }${ f.changeName }" width="200" height="200" >
                                   		</c:forEach>
                                   </td>
                                </tr>
                                <tr>
                                    <td>조회수&ensp;<span style="color: #78C2AD;">${ r.reviewCount}</span></td>
                                </tr>
                            </table>
                        </div>

                        <hr>
                        <div class="pillIngredi">
                            <p style="font-size: 13px;"><span style="color: #78C2AD;">${r.memberName}</span>님의 맞춤 영양성분</p>
							<%-- 샛별 장바구니, 희원 결제 마치면 붙이기
							<c:choose>
								<c:when test="${ r.plist <= 3 }">
									<c:forEach var="p" begin="0" end="${r.plist.size() - 1  라고 나중에 할 것}">
			                            <div class="pillCart" style="background-color: rgba(59, 59, 255, 0.084);">
			                                <span>
			                                    <p style="font-size:13px;" class="pContent">장 건강엔</p>
			                                    <img src="" style="width: 80px; height: 80px;" class="pPic">
			                                    <p style="font-size:16px;" class="pName">프리바이오틱스</p>
			                                    <p style="font-size:11px;" class="pCounts">30일분</p>
			                                    <p style="font-size:14px;" class="pAmount">22,000원</p>
			                                </span>
			                                <button class="cartBtn">장바구니 담기</button>
			                            </div>
		                            </c:forEach>
                            	</c:when>
                            	<c:when test="${ r.plist.size() - 1 > 3 }">
									<c:forEach var="p" begin="0" end="2">
			                            <div class="pillCart" style="background-color: rgba(59, 59, 255, 0.084);">
			                                <span>
			                                    <p style="font-size:13px;" class="pContent">장 건강엔</p>
			                                    <img src="" style="width: 80px; height: 80px;" class="pPic">
			                                    <p style="font-size:16px;" class="pName">프리바이오틱스</p>
			                                    <p style="font-size:11px;" class="pCounts">30일분</p>
			                                    <p style="font-size:14px;" class="pAmount">22,000원</p>
			                                </span>
			                                <button class="cartBtn">장바구니 담기</button>
			                            </div>
		                            </c:forEach>
		                            
		                            <div class="moreBtnArea" style="padding-bottom: 200px;">
			                            
			                            <button class="moreBtn" onclick="moreBtn();">더보기</button>
			                            
			                            <script>
			                            	$(function moreBtn() {
			                            		$(function() {
			                            			~~~~~~
			                            		})
			                            	})
			                            </script>
			                            
			                            <c:forEach var="p" begin="3" end="${r.plist.size() - 1}">
				                            <div class="morePillCart" style="background-color: rgba(59, 59, 255, 0.084);">
				                           		 
				                            </div>
			                            </c:forEach>
			                        </div>
			                        
		                            
                            	</c:when>
                            </c:choose>
                            --%>
                        </div>

                        <!-- 댓글 -->
                        <table id="replyArea" class="table" align="center">
			                <thead>
			                    <tr>
			                        <td colspan="2">댓글&nbsp;<span id="rcount" style="color: #78C2AD;">0</span>&nbsp;개</td>
			                        <td><span id="textCount">0</span>/<span id="rcount" style="color: #78C2AD;">200</span></td>
			                    </tr>
			                    <tr>
				                    <c:choose>
				                    	<c:when test="${ empty loginUser }">
				                    		<!-- 로그인 전 -->
				                    		<th colspan="2">
					                            <textarea class="form-control" name="replyContent" id="content" cols="55" rows="2" style="resize:none; width:100%;" readonly>로그인한 사용자만 이용가능한 서비스 입니다. 로그인 후 이용바랍니다.</textarea>
					                        </th>
					                        <th style="vertical-align:middle"><button class="btn btn-primary btn-lg" disabled>작성하기</button></th>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<!-- 로그인 후 -->
				                    		<th colspan="2">
					                            <textarea class="form-control" name="replyContent" id="textAreaCount" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
					                        </th>
					                        <th style="vertical-align:middle"><button class="btn btn-primary btn-lg" onclick="addReply();">작성하기</button></th>
				                    	</c:otherwise>
				                    </c:choose>
			                    </tr>
			                </thead>
			                <tbody>
			                </tbody>
			            </table>
                        
                        <div class="listBtnArea">
                            <a href="list.re"><button type="button" class="btn btn-outline-secondary" id="listBtn">목록</button></a>
                        </div>    
                    </div>
                    <div id="content_2_3"></div>
                </div>
                <div id="content_3"></div>
            </div>
            <jsp:include page="../common/footer.jsp" />
        </div>
        <script>
                      
	      $(function() {
	  		
	  		selectReviewReplyList();
	  		});
	      
	      function selectReviewReplyList() { // 해당 게시글에 있는 댓글리스트 조회용 ajax 요청
	  		
	  		$.ajax({
	  			url : "rlist.re",
	  			data : {rno:${ r.reviewNo }},
	  			success : function(result) { 
	  				
	  				// console.log(result);
	  				var resultStr = "";
	  				
	  				for(var i = 0; i < result.length; i++) {
	  					
	  					resultStr += "<tr>"
	  							  		+ "<td><p class='replyName'>" + result[i].memberName + "</p></td>"
	  							  		+ "<td class=''replyDate>" + result[i].replyDate + "</td>";
	  							  		
	  							  		if("${loginUser.memberId}" == result[i].memberId || "${loginUser.memberId}" == "admin1234") {
	  							  			
	  							  			resultStr += "<td>" 
	  							  							+ "<button class='btn btn-secondary button' type='submit' onclick='deleteReply(" + result[i].replyNo + ");'>"
		  							  						+ "삭제" + "</button>" 
		  							  				   + "</td>";
	  							  		}
	  							  			
	  					resultStr += "</tr>"
	  							  		+ "<tr>"
	  							  		+ "<td colspan='3'>" + "<p class='replyContent'>" + result[i].replyContent + "</p>" + "</td>"
	  							  		+ "</tr>";
	  				}
	  				
	  				$("#replyArea>tbody").html(resultStr);
	  				
	  				// 댓글 개수 출력
	  				$("#rcount").text(result.length);
	  			},
	  			error : function() {
	  				console.log("댓글리스트 조회용 ajax 통신 실패!");
	  			}
	  		});
	  	}
	      
	      // 댓글 작성 글자수 체크
	      $("#textAreaCount").keyup(function (e) {
	      	var textAreaContent = $(this).val();
	          
	      	// console.log(textAreaContent);
	          // 글자수 세기
	          $("#textCount").text(textAreaContent.length);
	         
	          // 글자수 제한
	          if (textAreaContent.length > 200) {
	          	// 200자 부터는 타이핑 되지 않도록
	              $(this).val($(this).val().substring(0, 200));
	          };
	      });
	      
	      function addReply() { // 댓글 작성 요청용 ajax
	  		
	   		// form 태그 내에서는 required 속성이 적용되지만,
	   		// form 태그 밖에서는 required 속서이 적용안됨.
	   		// => 댓글 내용이 있는지 검사 후 있다면 ajax 요청 보내기
	   		//	  (textarea 요소에 value 속성값 기준으로 공백 제거 후 길이가 0 이 아닌 경우)
	   		if($("#textAreaCount").val().trim().length != 0) {
	   			
	   			$.ajax({
	   				url : "rinsert.re",
	   				data : { // ajax 요청 또한 커맨드객체 방식 가능 (키값을 필드명이랑 맞춰준다)
	   					reviewNo:${r.reviewNo},
	   					memberNo:"${loginUser.memberNo}",
	   					replyContent:$("#textAreaCount").val()
	   				},
	   				success : function(result) {
	   					
	   					// "success" 또는 "fail" 문자열이 들어있음
	   					if(result == "success") {
	   						
	   						// 댓글 작성 성공 시 댓글 리스트를 불러올 것
	   						selectReviewReplyList();
	   						
	   						// 댓글 작성 창 초기화 효과
	   						$("#textAreaContent").val("");
	   					}
	   				},
	   				error : function() {
	   					console.log("댓글 작성용 ajax 통신 실패!");
	   				}
	   			});
	   		} else {
	   			
	   			alertify.alert("댓글 작성 실패", "댓글 작성 후 등록을 요청해주세요.");
	   		}
	   	}
	      
	      function deleteReply(replyNo) { // 댓글 삭제 요청용 ajax
		  		
			   		// form 태그 내에서는 required 속성이 적용되지만,
			   		// form 태그 밖에서는 required 속성이 적용안됨.
			   		// => 댓글 내용이 있는지 검사 후 있다면 ajax 요청 보내기
			   		//	  (textarea 요소에 value 속성값 기준으로 공백 제거 후 길이가 0 이 아닌 경우)
			   		
		   			$.ajax({
		   				url : "rdelete.re",
		   				data : {replyNo:replyNo},
		   				success : function(result) {
		   					
		   					// console.log(result)
		   					// "success" 또는 "fail" 문자열이 들어있음
		   					if(result == "success") {
		   						
		   						// 댓글 삭제 성공 시 댓글 리스트를 불러올 것
		   						selectReviewReplyList();
		   					}
		   				},
		   				error : function() {
		   					console.log("댓글 삭제용 ajax 통신 실패!");
		   				}
		   			});
		   		}
	     </script>
    </body>
    </html>