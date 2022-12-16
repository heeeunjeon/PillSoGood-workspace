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
        width: 98%;
        height: 1530px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 0px; }

    #content { height: 1150px; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 10%; float: left; }
    #content_2_2 { height: 80%; float: left; }
    #content_2_3 { height: 10%; float: left; }

    #header { height: 0px; }

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

    .innerContent { 
      display: flex;
      float: left;
      left: 1000px;
      position:relative;
      top: 5%;
      left: 5%;
      margin-top: 10px;
      margin-bottom: 10px;
      }

      .innerContent {
        padding: 40px;
        padding-top: 60px;
        border-radius: 15px;
        border-color: rgba(128, 126, 126, 0.541);
      }

      #title {
        width: 900px;
        box-sizing: border-box;
        margin-top: 10px;
        margin-bottom: 10px;
      }

      #hashtag{
        margin-top: 10px;
        margin-bottom: 10px;
      }

      #content{
        margin-top: 10px;
        margin-bottom: 10px;
      }

      th { 
        padding-left: 10px;
        padding-right: 20px;
      }

      #select {
        width: 200px;
      }

      .btnArea {
        padding-top: 80px;
        padding-bottom: 40px;
      }
      
     .logoArea>p {
     	 position:relative;
     	 margin-left:-270px;
     	 padding-top:-100px;

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
                    <p style="display: inline; font-size: 20px;">Magazine</p>
                </div>
              </div>

              <div id="content_2_2">
                <div class="innerContent" style="border: 2px solid;">
                  <form id="updateForm" method="post" action="update.mag" enctype="multipart/form-data">
                    <fieldset>
                      <table align="center">
                        <input type="hidden" name="magazineNo" value="${ mag.magazineNo }" >
                        <tr>
                            <th><label for="title">제목</label></th>
                            <td><input type="text" id="title" class="form-control" name="magazineTitle" value="${ mag.magazineTitle }" required></td>
                        </tr>
                        
                        <tr>
                          <th>카테고리</th>
                          <td><select class="form-select" id="select" name="categoryNo" >
                                 <option value="2" data-sub="라이프">라이프</option>
                                 <option value="3" data-sub="시즌">시즌</option>
                                 <option value="4" data-sub="이슈">이슈</option>
                          </select></td>
                        </tr>
							
                        <tr>
                          <th><label for="content">내용</label></th>
                          <td><textarea id="content" class="form-control h-25" rows="20" style="resize:none;" name="magazineContent" required>${ mag.magazineContent }</textarea></td>
                        </tr>

                        <tr>
                          <th><label for="reupfile">사진</label></th>
                          <td><input type="file" id="reupfile" class="form-control-file border" name="reupfile">
                          	  
                          	  <c:if test="${ not empty mag.magazineImgName }">
                              	<input type="hidden" name="${ mag.magazineImgName }">
                              </c:if>
                              
                          </td>
                        </tr>  

                        <tr>
                          <th><label for="hashtag">해시태그</label></th>
                          <td><input type="tag" id="hashtag" class="form-control" name="magazineHashtag" value="${ mag.magazineHashtag }">
                          
                          </td>
                        </tr>
                    </table>  
                    <div align="center" class="btnArea">
                          <button type="submit" class="btn btn-secondary">수정</button>
                          <button type="button" class="btn btn-light" onclick="javascript:history.go(-1);">취소</button>
                    </div>
                  </fieldset>
                </form>
              </div>

         </div>
            </div>
            <div id="content_2_3"></div>
            
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    
    <script>
    	var input = document.querySelector('input[name=magazineHashtag]')
    
    	new Tagify(input)
    </script>
    

    
</body>
</html>