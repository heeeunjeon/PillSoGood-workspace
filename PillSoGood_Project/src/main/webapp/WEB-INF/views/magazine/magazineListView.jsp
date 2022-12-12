<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- hashtag 소스 다운 -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<!-- hashtag 폴리필 (구버젼 브라우저 지원) -->
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />    
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer {
        color : white;
        width : 1000px;
        height : 1000px;
        margin : auto;
        margin-top : 50px;
    }

    .list-area {
        width : 760px;
        margin : auto;
    }

    .thumbnail {
        border : 1px solid white;
        width : 220px;
        display : inline-block;
        margin : 14px;
    }

    .thumbnail:hover {
        cursor : pointer;
        opacity : 0.7;
    }

    div {
             /* border : 1px solid #78C2AD;  */
            box-sizing : border-box;
        }
    
        /* 전체를 감싸는 wrap */
        .wrap {
            width: 98%;
            height: inherit;
            margin : auto;
        }
    
        .wrap>div { width : 100%; }
    
        #navigator2 { height: 0px; }
    
        #content { height: 1150px; }
        #content_2>div { width: 100%; }
        #content_2_1 { height: 13%; float: left; }
        #content_2_2 { height: 77%; float: left; }
        #content_2_3 { height: 10%; float: left; }
    
        #header { height: 90px; }
    
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

        .magazineSelect { padding-top: 20px; display: inline; }

        #magazineSelectOpt { height: 35px; font-size: 12px; width: 140px; }

        .magazineListArea { position: relative; margin-left: 817px; }

        .magazineListNew { text-decoration: none; color: black; font-size: 13px; }
        .magazineListPop { text-decoration: none; color:rgb(167, 167, 167); font-size: 13px; }

        .thumbnailAll{
        margin-top: 20px;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        align-items: center;

        }

        .thumbnail {
            width: 30%;
            margin-bottom: 10px; 
            text-align: center;
        }

        #hashtag {
            font-size: 14px;
            pointer-events: none;
        }

        .title {
            display:block;
            font-size: 1.2em;
            padding-top: 10px;
            padding-bottom: 10px;
            text-decoration: none;
            color: black;
        }

        img:hover {
            cursor: pointer;
        }

        .title:hover {
            cursor: pointer;
        }

        .thumbnail { 
            display: block; 
            margin: 0px auto; 
        }

        .thumbnail>img { margin: 0px auto; } 
       
        .likeArea {
            padding-bottom: 100px;
            position: relative;
            right: 35%;
        }

        .hashtagArea { width: 300px; }

        .thumbnail>img {
            width: 250px;
            height: 180px;
        }

        i { font-size: 12px; }
       
        .page-item {
            float: left;
            padding: 0;
        }

		#pagingArea {
			position: relative;
            left: 50%;
		}

		.logoArea>p{
			position: relative;
            left: -32%;
           
		}
		
		#enrollFormBtn{
			position: relative;
            left: -27%;
		}

		#magazineSelectOpt {
			position: relative;
            left: 55%;
			margin-bottom: 10px;
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
               
                <!-- 로고 영역 -->
                <div id="content_2_1">
            

                    <div class="logoArea" style="padding-bottom:20px;">
                        <p style="display: inline; font-size: 20px;">Magazine</p>
                        	<img src="/webapp/resources/logo.PNG" alt="">
                            <!-- 관리자로 로그인 했을 때 보이는 등록 버튼 -->
                    	<c:if test="${ loginUser.memberId eq 'admin' }" >
                        <div style="width:965px" align="right">
                            <button class="btn btn-primary btn-primary" id="enrollFormBtn" onclick="location.href='enrollForm.mag'">등록</button>
                        </div>
                     	</c:if>
                    </div>

                <!-- 카테고리 영역 -->    
                    <table style="display: block;">
                        <tr>
                            <td>
                                <div class="magazineSelect">
                                    <select class="form-select" id="magazineSelectOpt" name="categoryName" ${ m.categoryName }>
                                        <option>전체</option>
                                        <option>라이프</option>
                                        <option>시즌</option>
                                        <option>이슈</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="magazineListArea">
                                    <a class="magazineListNew">최신순</a>
                                    <a class="magazineListPop"> | 인기순</a>
                                </div>
                            </td>
                        </tr>
                    </table>

                </div>
              
                <!-- 실제 작업할 영역 -->
                <div id="content_2_2">

                    <!-- 매거진 썸네일/제목/하트/해시태그 영역 -->
                    <div class="wrap">
                        <div class="thumbnailAll" style="padding: 10px;">
                          <c:forEach var="mag" items="${ list }" varStatus="i">
                            <c:choose>
                                  <c:when test="${ !empty list }">   		
         	                    	<div class="thumbnail" align="center">
         		                    	<input type="hidden" name="magazineNo" class="magazineNo" value="${ mag.magazineNo }">
         			                        <img src="${ mag.magazineImgName }" width="250px" height="200px">
                                            <p name="magazineTitle">
                                                ${ mag.magazineTitle }
                                            </p>
                                            <div class="hashtagArea">
                                                <span class="badge bg-light" id="hashtag_${ i.count }"></span>
                                            	<script>
                                            		var hashtagStr = "${ mag.magazineHashtag }";
                                            		
                                            		var hashtagArr = hashtagStr.split(",");
                                            		
                                            		hashtagStr = "";
                                            		for(var i = 0; i < hashtagArr.length; i++) {
                                            			hashtagStr += "#" + hashtagArr[i] + " ";
                                            		}
                                            		
                                            		document.getElementById("hashtag_${ i.count }").innerText = hashtagStr;
                                            	</script>
                                            </div>
                                            <div class="likeArea">
                                                <i class="fa-regular fa-comment">&nbsp;1</i>
                                            </div>
                                    </div>
                                 </c:when>
                                <c:otherwise>
                                		<h3>등록된 게시글이 없습니다.</h3>
                                </c:otherwise>
                             </c:choose>
                           </c:forEach>
                        </div>

                      <!-- 페이지 -->
 			 <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                			<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="list.mag?cpage=${ pi.currentPage - 1 }">&raquo;</a></li>
                		</c:otherwise>
                	</c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="list.mag?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.mag?cpage=${ pi.currentPage + 1 }">&raquo;</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
                    
     </div>
                                  
                <div id="content_2_3">
              
                </div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>

    
	
</body>

<!-- this = 글번호 -->    
<script>

    $(function() {
        $(".thumbnail").click(function() {      
        	
        	var magazinNo = $(this).children().eq(0).val();
        	
            location.href = "detail.mag?magazineNo=" + magazinNo;
        });
    });

</script>

    <script>

        let myStr = "value"

        myStr = myStr.replace(/\/!/g, "");

        console.log(myStr);
        
    </script>

</html>