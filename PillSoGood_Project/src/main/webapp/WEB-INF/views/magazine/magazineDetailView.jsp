<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        #content_2 { width : 60%; height: auto !important;}
        #content_3 { width : 20%; }

        body { font-family: 'Noto Sans KR', sans-serif !important; }
    
        .btnArea {
            margin-left: 88%;
        }

        .thumbnailPic {
            width: 1000px;
            height: 400px;
            /* position: relative; */
            padding-top: 30px;
            margin-left:6%;
        }

        .thumbnailArea {
            position: relative;
        }
        .thumbnailArea>p {
            font-size: 40px;
            position: absolute;
            margin-top: -20%;
            margin-left: 35%;
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

        .heartArea>i {
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
            margin-left: 15px;
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
            margin-left: 40%;
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
                            <jsp:include page="../common/logo.jsp" />
                          <p style="display: inline; font-size: 20px;">Magazine</p>
                      </div>
                    </div>
                    <div id="content_2_2">
                        <!-- 삭세 수정 버튼 영역 -->
                        <div class="btnArea">
                            <button type="submit" class="btn btn-secondary">삭제</button>
                            <button type="reset" class="btn btn-light">수정</button>
                        </div>

                        <!-- 썸네일/기사 내용 영역 -->
                        <div class="thumbnailArea">
                            <img src="" class="thumbnailPic">
                            <span class="badge bg-primary">${ mag.categoryName }</span>
                            <p align="center">${ mag.magazineTitle }</p>
                        </div>
                        
                        <div class="magazineContent">
                            <p align="center">
                           		${ mag.magazineContent }
                            </p>
                            <div class="magazineContentPic">
                                <img src="${ mag.magazineImgName }">
                            </div>
                            <br>
                            <hr style="width: 100px; border-top : 2px solid black; margin-left : 45%;" >

                            <div class="magazineContentSub">
 
                                 <div class="heartArea">
                                    <i class="fa-regular fa-heart">&ensp;1</i>
                                </div>

                                <div class="hashtagArea">
                                    <span class="badge bg-light">${mag.magazineHashtag}</span>
                                    </div>
                            </div>
                        </div>

                        <div class="pageContent">
                            <table class="pageContentTable">
                                <tr>
                                    <td>
                                        <p class="pageContentPre" style="display: inline;">이전글</p>
                                        <img scr="" style="display: inline;">
                                        <a style="display: inline;" href="#">스트레스와 관련된 녹차의 '이 성분</a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <p class="pageContentNext" style="display: inline;">다음글</p>
                                        <img scr="" style="display: inline;">
                                        <a style="display: inline;" href="#">나 가을 타나 봐~</a>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="listBtnArea">
                            <button class="listBtn">더보기</button>
                        </div>
                    </div>
                    <div id="content_2_3"></div>
                </div>
                <div id="content_3"></div>
            </div>
           <jsp:include page="../common/footer.jsp" />
        </div>
        
    </body>
    </html>