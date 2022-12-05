<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<style>

    div {
        /* border : 1px solid #78C2AD; */
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

    #content_2_1>div { width: 100%; height: 100%; }
    #write>div { margin-top: 73px; margin-right: 5px; }

    #content_2_2>div { width: 100%; float: left; }
    #insertPro { height: 40%; }
    #proImg { height: 60%; }

    #insertPro>div { height: 100%; float: left; }
    #proThum, #proText { width: 50%; }

    #proThum_1 {
        width: 100%;
        height: 100%;
        padding: 20px 60px;
    }

    #proThum_2 {
        width: 100%;
        height: 100%;
        background-color: #e0e0e0;
        border-radius: 75px;
    }

    #proImgg { width: 100%; height: 100%; padding: 40px; }

    #proImgg_1 { width: 100%; height: 100%; }

    #proImgg_1>img {
        height: 100%;
        width: 100%;
        object-fit: contain;
        margin: auto;
    }

    #proText>div { width: 100%; float: left; }

    #proText_1 { height: 35%; }
    #proText_2 { height: 20%; }
    #proText_3 { height: 30%; }

    #proText_3>div { width: 100%; height: 100%; float: left; padding: 20px 0px; }

    #proText_1>div { width: 150px; height: 45px; margin-top: 80px; margin-left: 10px; }
    #proText_2>div { width: 200px; height: 45px; margin-top: 8px; margin-left: 10px; }
    #proPrice_2>div { width: 200px; height: 45px; margin-top: 15px; margin-left: 10px; }

    #proPrice {
        width: 100%;
        height: 100%;
        float: left;
        background-color: #f9f4f4;
        border-bottom: solid lightgrey; 
    }

    #proPrice_1, #proPrice_2 { height: 100%; width: 50%; float: left; }
    
    #proPrice_1>p, #proPrice_2>p {
        width: 100%;
        height: 100%;
        color: black;
        font-size: 30px;
        font-weight: bold;
        padding: 10px; 
    }

    #proPrice_2>p { margin-left: 80px; }

    #proImg { border-top: solid lightgrey; }

    #proImg_1 { width: 100%; height: 100%; padding: 40px; }

    #proImg_1_1 { width: 100%; height: 100%; }

    #proImg_1_1>img {
        height: 100%;
        width: 100%;
        object-fit: contain;
        margin: auto;
    }

    /* content 영역 */
    #content>div { height : 100%; float : left; }
    #content_1 { width : 25%; }
    #content_2 { width : 50%; }
    #content_3 { width : 25%; }

    body { font-family: 'Noto Sans KR', sans-serif !important; }

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
                    <div id="write">
                        <div align="right"><button type="button" class="btn btn-primary">등록</button></div>
                    </div>
                </div>
                <div id="content_2_2">
                    <div id="insertPro">
                        <div id="proThum">
                            <div id="proThum_1">
                                <div id="proThum_2">
                                    <div id="proImgg">
                                        <div id="proImgg_1"><img src="image/pill01.png"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="proText">
                            <div id="proText_1"><div><input type="text" class="form-control"></div></div>
                            <div id="proText_2"><div><input type="text" class="form-control"></div></div>
                            <div id="proText_3">
                                <div id="proText_3_1">
                                    <div id="proPrice">
                                        <div id="proPrice_1"><p>구매가</p></div>
                                        <div id="proPrice_2"><div><input type="text" class="form-control"></div></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="proImg">
                        <div id="proImg_1">
                            <div id="proImg_1_1"><img src="image/효능.png"></div>
                        </div>
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