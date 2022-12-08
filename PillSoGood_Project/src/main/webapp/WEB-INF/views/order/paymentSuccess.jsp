<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<style>

    div {
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: 1080px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: 600px; color: black;}
    #content_2>div { width: 100%; }
    #content_2_1 { height: 115px; float: left; }
    #content_2_2 { height: 80%; float: left; }

    #header { height: 130px; }

    #content_2_1>p {
        font-size: 35px;
        color: black;
        margin-top: 20px;
        margin-left: 30px;
    }

    /* content 영역 */
    #content>div { height : 100%; float : left; }
    #content_1 { width : 25%; }
    #content_2 { width : 50%; }
    #content_3 { width : 25%; }

    body { font-family: 'Noto Sans KR', sans-serif !important; }

    /* 여기서부터는 내가 준 스타일 영역 */
    #checkicon {
        text-align: center;
        font-size: 80px;
        padding: 20px;
        color: #78C2AD;
    }

    #completeMsg { font-size: 35px; padding: 20px; font-weight:900; }

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
                    <p>결제 완료</p>
                </div>
                <div id="content_2_2">
                    <div id="checkicon">
                        <i class="fa-sharp fa-solid fa-circle-check" ></i>
                    </div>
                    <div align="center" id="completeMsg">
                        상품 결제가 <br> 
                        완료 되었습니다!
                    </div>
                    <div align="center" style="margin-top: 20px">
                        <button type="button" class="btn btn-outline-primary">주문내역조회</button>
                        <button type="button" class="btn btn-outline-secondary">메인으로</button>
                    </div>
                </div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    
</body>
</html>