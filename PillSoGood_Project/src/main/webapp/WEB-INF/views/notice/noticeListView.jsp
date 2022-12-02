<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    div {
        /*border : 1px solid #78C2AD;*/
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

</style>

<style>

    #noticeTable>tbody * {
        height: 70px;
        vertical-align: middle;
    }

    #noticePagination {

        padding-top : 50px;
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
                    <p>공지사항
                        <button style="float:right;" class="btn btn-primary btn-primary btn-lg">등록</button>
                    </p>
                </div>
                <div id="content_2_2">

                    


                    <table class="table table-hover" id="noticeTable">
                        
                        <tbody>
                            <tr align="center">
                                <td>10</td>
                                <td>글제목</td>
                                <td align="right">2022-10-10</td>
                            </tr>
                            <tr align="center">
                                <td>9</td>
                                <td>글제목</td>
                                <td align="right">2022-10-10</td>
                            </tr>
                            <tr align="center">
                                <td>8</td>
                                <td>글제목</td>
                                <td align="right">2022-10-10</td>
                            </tr>
                            <tr align="center">
                                <td>7</td>
                                <td>글제목</td>
                                <td align="right">2022-10-10</td>
                            </tr>
                            <tr align="center">
                                <td>6</td>
                                <td>글제목</td>
                                <td align="right">2022-10-10</td>
                            </tr>
                            <tr align="center">
                                <td>5</td>
                                <td>글제목</td>
                                <td align="right">2022-10-10</td>
                            </tr>
                            <tr align="center">
                                <td>4</td>
                                <td>글제목</td>
                                <td align="right">2022-10-10</td>
                            </tr>
                            <tr align="center">
                                <td>3</td>
                                <td>글제목</td>
                                <td align="right">2022-10-10</td>
                            </tr>
                            <tr align="center">
                                <td>2</td>
                                <td>글제목</td>
                                <td align="right">2022-10-10</td>
                            </tr>
                            <tr align="center">
                                <td>1</td>
                                <td align="center">글제목글제목글제목글제목글제목글제목글제목글제목글제목글제목</td>
                                <td align="right">2022-10-10</td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- 페이지네이션 -->
                    <div id="noticePagination">
                        <nav aria-label="Page navigation">
                            <ul class="pagination  justify-content-center">
                            <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                            </ul>
                        </nav>
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