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
<!-- hashtag 소스 다운 -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<!-- hashtag 폴리필 (구버젼 브라우저 지원) -->
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />    
   
    <style>
    
        div {
            box-sizing : border-box;
        }
    
        /* 전체를 감싸는 wrap */
        .wrap {
        width: 100%;
        height: inherit;
        margin : auto;
        }

        .wrap>div { width : 100%; }

        #navigator2 { height: 0px; }

        #content { display: flex; height: auto; }
        #content_2>div { width: 100%; }
        #content_2_1, #content_2_3 { height: 115px; }
        #content_2_2 { height: auto; color: black; }

        #header { height: 0px; }
        #content_2_1>p {
            font-size: 35px;
            color: black;
            margin-top: 20px;
            margin-left: 30px;
        }
        /* content 영역 */
        #content>div { height : 100vh; float : left; }
        #content_1 { width : 20%; }
        #content_2 { width : 60%; height: auto !important;}
        #content_3 { width : 20%; }

        #content>div {
            height: auto;
            float: left;
        }

        body { font-family: 'Noto Sans KR', sans-serif !important; }
    
        .btnArea {
            margin-left: 88%;
            padding-bottom:20px;
        }

        .thumbnailPic {
            width: 1000px;
            height: 400px;
            /* position: relative; */
            padding-top: 30px;
            margin-left:6%;
            border:0.5px solid lightgrey;
        }

        .thumbnailArea {
            position: relative;
        }
        .thumbnailArea>p {
            font-size: 40px;
			text-align: center;
			margin-top: -6em;
            padding-bottom: 180px;
            width: 970px;
  			margin-left: 7.4%;
        }

        .thumbnailArea>.badge {
            position: absolute;
            margin-top: 12%;
            margin-left: -47%;
        }

        .magazineContent>p:first-child{
            margin-top: 50px;
            font-size: 20px;
        }

        .magazineContent>p:nth-child(2) {
            margin-left: 10%;
            margin-top: 90px;
            margin-bottom: 20px;
            
        }

        .magazineContentPic>img {
            width: 600px;
            height: 400px;
            margin-bottom: 100px;
            margin-top: 40px;
        }
        .magazineContentPic {
            margin-left: 25%;
        }

        hr {
            margin-top: 200px;
            position: relative;
        }

        .magazineContentSub>p:first-child {
            margin-top: 30px;
            font-size: 20px;
            text-align: center;
        }

        .magazineContentSub>p:nth-child(2) {
            margin-bottom: 20px;
        }

        .heartArea {
            margin-top: 250px;
            margin-left: 96%;
        }

        .hashtagArea>span {
            margin-left: 10px;
        }

        .pageContent {
            position: relative;
            display: block;
        }

        .pageContent>table {
            position: absolute;
            width: 100%;
            margin-top: 50px;
        }

        .pageContent>td:first-child {
            display: block;
        }

        .pageContent>table {

            height: 100px;
        }

        .pageContentTable td {
            padding: 10px;
        }

        .pageContentTable p {
            padding-left: 10px;
            margin-right: 15px;
            font-size: 13px;
        }

        .pageContentTable img {
            border: 1px solid;
            width: 40px;
            height: 40px;
        }

        .pageContentTable img:hover {
            cursor: pointer;
        }

        .pageContentTable a {
            margin-left: 10%;
            font-size: 13px;
            text-decoration: none;
            color: black;
        }

        .pageContentTable {
            border-top: 2px solid black;
            border-bottom: 2px solid black;
        }

        .listBtnArea {
            margin-top: 25%;
            margin-left: 45%;
        }

        .listBtn {
            width: 140px;
            height: 40px;
            font-size: 12px;
            background-color: rgba(255, 255, 255, 0);
            border-color: #F3969A;
            color: #F3969A;
            border-radius: 10px;
        }

        .listBtn:hover {
            cursor: pointer;
        }
        
        .logoArea>p{
			position: relative;
            left: -32%;
           
		}
		
		.likeControl{
			width:30px;
			height:30px;
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
                        <div class="logoArea">
                          <p style="display: inline; font-size: 20px;">PillSoGood Magazine</p>
                      </div>
                    </div>
                    <div id="content_2_2">
                        <!-- 삭세 수정 버튼 영역 -->
                        <c:if test="${ loginUser.memberId eq 'admin' }">
                        <div class="btnArea">
                            <button type="submit" class="btn btn-secondary" onclick="magazineFormSubmit(1);">삭제</button>
                            <button type="reset" class="btn btn-light" onclick="magazineFormSubmit(2);">수정</button>
                        </div>
                        </c:if>
                        
                        <form id="magazineForm" method="post">
                        	<input type="hidden" name="magazineNo" value="${ mag.magazineNo }">
                        	<input type="hidden" name="filePath" value="${ mag.magazineImgName }" >
                        </form>
                        
                        <script>
                        	function magazineFormSubmit(num) {

                        		if(num == 2) { 
                        			
                        			$("#magazineForm").attr("action", "updateForm.mag").submit();
                        		
                        		} else { 
                        			
                        			$("#magazineForm").attr("action", "delete.mag").submit();
                        		}
                        	}
                        </script>

                        <!-- 썸네일/기사 내용 영역 -->
                        <div class="thumbnailArea" style="padding-bottom:100px;">
                            <div class="thumbnailPic"></div>
                            <span class="badge bg-primary">${ mag.categoryNo }</span>
                            <p>${ mag.magazineTitle }</p>
                        </div>
                        
                            <div class="magazineContentPic">
                                <img src="${ mag.magazineImgName }">
                            </div>
                            <br>
                            <hr style="width: 100px; border-top : 2px solid black; margin-left : 45.5%;" >

							<div class="magazineContent">
                            	<p align="center">
                           			${ mag.magazineContent }
                           		</p>
                          	</div>

                            <div class="magazineContentSub">
 

                    <c:if test="${ not empty loginUser  }">
                    	<div align="right" class="likeArea">
                    		<c:choose>
		                    	<c:when test="${ loginUser.memberNo eq magL.memberNo  }"> 
		                    		<img src="resources/images/Like.png" width="30" class="likeControl" id="magazineLike" style="cursor: pointer;" >
			                        <img src="resources/images/Unlike.png" width="30" style="display:none" class="likeControl" id="magazineUnLike" style="cursor: pointer;">
			                        <span id="magazineLikeCount" name="magazineLikeCount"></span>
			                    </c:when>
			                    <c:otherwise>
			                    	<img src="resources/images/Unlike.png" width="30" alt="" class="likeControl" id="magazineUnLike" style="cursor: pointer;">
			                        <img src="resources/images/Like.png" width="30" class="likeControl" style="display:none" id="magazineLike" style="cursor: pointer;">
			                        <span id="magazineLikeCount" name="magazineLikeCount"></span>
			                    </c:otherwise>
		                    </c:choose>
                    	</div>
                    </c:if>

                    <div class="hashtagArea">
                        <span class="badge bg-light">${mag.magazineHashtag}</span>
                    </div>
                </div>
                        <div class="pageContent">
                            <table class="pageContentTable">
                                <tr>
                                <c:choose>
                                	<c:when test="${ empty prev }">
                                    <td>
                                        <a style="display: inline;">이전글이 없습니다.</a>
                                    </td>
                                    </c:when>
                                    <c:otherwise>
                                    <td>
                                        <p class="pageContentPre" style="display: inline;">이전글</p>
                                        <a style="display: inline;" href="detail.mag?magazineNo=${ prev.magazineNo }">${ prev.magazineTitle }</a>
                                    </td>
                                    </c:otherwise>
                                </c:choose>
                                </tr>
								<tr>
                                <c:choose>
                                	<c:when test="${ empty next }">
                                    <td>                                        
                                    	<a style="display: inline;">다음글이 없습니다.</a>
                                    </td>
                                    </c:when>
                                    <c:otherwise>
                                    <td>
                                        <p class="pageContentPre" style="display: inline;">다음글</p>
                                        <a style="display: inline;" href="detail.mag?magazineNo=${ next.magazineNo }">${ next.magazineTitle }</a>
                                    </td>
                                    </c:otherwise>
                                </c:choose>
                                </tr>
                                
                                
                            </table>
                        </div>

                        <div class="listBtnArea">
                            <button class="listBtn" onclick="list()">목록</button>
                        </div>

                        
                <script>
                    function list() {
                        
                        location.href = "list.mag";
                    }
                    
                    function selectLikeCount() {
                    	
                    	$.ajax({
                    		url : "likeCount.mag",
                    		data : {magazineNo : ${mag.magazineNo}},
                    		success : function(result) { // 좋아요개수
                    			
                    			$("#magazineLikeCount").text(result);
                    		},
                    		error : function() {
                    			console.log("실패");
                    		}
                    	});
                    }
                    
                    $(function() {
                    	selectLikeCount();
                    })
                </script>

				<!-- 좋아요 -->
			    <script>
		        	$(function() {
		            	$(".likeArea").on("click", ".likeControl", function() {
		                	
		            		if($("#magazineLike").css("display") == "none") {

		                    $.ajax({
		                        url: "insert.magL",
		                        data: {magazineNo : ${mag.magazineNo},
		                                memberNo : ${loginUser.memberNo}},
		                        success : function (result) {

		                        		console.log(result);
		                        		
		                            $("#magazineLike").show();
		                            $("#magazineUnLike").hide();

		                            $("#magazineLikeCount").html(result);
		                        },
		                        error : function() {

		                            console.log("ajax 통신 실패!");
		                        }
		                        
		                    });
		               
		            		} else {
		                    	$.ajax({
		                        
		                    	url: "delete.magL",
		                        data: {magazineNo : ${mag.magazineNo},
		                                memberNo : ${loginUser.memberNo}},
		                        success: function(result) {
		                        	
		                        		console.log(result);
		                        		
		                            $("#magazineLike").hide();
		                            $("magazineUnLike").show();

		                            $("#magazineLikeCount").html(result);
		                        },
		                        
		                        error : function() {

		                            console.log("ajax 통신 실패!");
		                        }
		                    });
		                }
		            });
		        });
		    </script>
                
                    	</div>
                    	<div id="content_2_3"></div>
                	</div>
                <div id="content_3"></div>
            </div>
           <jsp:include page="../common/footer.jsp" />
        </div>
        
    </body>
    </html>