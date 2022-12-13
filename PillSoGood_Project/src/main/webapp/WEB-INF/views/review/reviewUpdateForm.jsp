<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        padding-top: 60px;
        padding-bottom: 30px;
      }
      

      td>p {
        margin-bottom: 7px;
        padding-left: 13px;
      }

</style>

</head>
<body>

    <div class="wrap">
      <jsp:include page="/views/common/menubar.jsp" />
        <div id="navigator2"></div>
        <div id="header"></div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2">
              <div id="content_2_1">
                <!-- 로고 영역 -->
                <div class="logoArea">
                      <jsp:include page="/views/common/logo.jsp" />
                    <p style="display: inline; font-size: 20px;">제품후기</p>
                </div>
              </div>

              <div id="content_2_2">
                <div class="innerContent" style="border: 2px solid;">
                  <form id="updateForm" method="post" action="" enctype="multipart/form-data">
                    <fieldset>
                      <table algin="center" class="reviewForm">

                            <tr>
                                <td>
                                    <img src="" style="width: 100px; height:100px;">
                                </td>
                                <td>
                                    <p style="font-size: 16px;"><b>제품</b></p>
                                    <p style="font-size: 14px;">정기구독 한 팩 서비스</p>
                                    <p style="font-size: 11px; color: lightgray;">30일분</p>
                                </td>
                            </tr>

                            <tr>
                                <th><label for="title">제목</label></th>
                                <td><input type="text" id="title" class="form-control" name="magazineTitle" placeholder="내용을 입력해주세요" required></td>
                            </tr>
                            
                            <tr>
                                <th>별점</th>
                                <td>
                                    <i class="fa-regular fa-comment"></i>
                                    <i class="fa-regular fa-comment"></i>
                                    <i class="fa-regular fa-comment"></i>
                                    <i class="fa-regular fa-comment"></i>
                                    <i class="fa-regular fa-comment"></i>
                                </td>
                            </tr>

                            <tr>
                                <th><label for="content">내용</label></th>
                                <td><textarea id="content" class="form-control h-25" rows="20" style="resize:none;" name="magazineContent" required></textarea></td>
                            </tr>

                            <tr>
                                <th><label for="upfile">사진</label></th>
                                <td><input type="file" id="upfile" class="form-control-file border" name="upfile"></td>
                            </tr>  
                    </table>  
                    <div align="center" class="btnArea">
                          <button type="submit" class="btn btn-secondary">수정</button>
                          <button type="reset" class="btn btn-light">취소</button>
                    </div>
                  </fieldset>
                </form>
              </div>

         </div>
            </div>
            <div id="content_2_3"></div>
            
            <div id="content_3"></div>
        </div>
        <jsp:include page="/views/common/footer.jsp" />
    </div>
    
</body>
</html>