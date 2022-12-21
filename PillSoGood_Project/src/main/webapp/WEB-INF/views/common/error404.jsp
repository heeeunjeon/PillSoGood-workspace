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
        width: 100%;
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

</style>

</head>
<body>

    <div class="wrap">
        
        <div id="navigator2">
            <jsp:include page="menubar.jsp" />
        </div>
        <div id="header"></div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2">
                <div id="content_2_1"></div>
                <div id="content_2_2">

                    <div align="center">
                        <img src="resources/images/error404.png" width="100%" alt="">
                    </div>

                    
                </div>
                <div id="content_2_3">
                    <div class="col text-center" style="height:100%;">
                        <button class="btn btn-primary btn-lg" onclick="location.href='/'"> 메인으로 돌아가기 </button>
                    </div>
                </div>
            </div>

            <div id="content_3"></div>
        </div>


        <jsp:include page="footer.jsp" />

        
    </div>

</body>
</html>