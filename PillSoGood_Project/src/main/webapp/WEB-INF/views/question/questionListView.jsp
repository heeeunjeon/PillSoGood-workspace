<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의내역</title>
<style>

    div {
        border : 1px solid rgb(120, 194, 173);
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: 1500px;
        margin : auto; /* 가운데로 좌, 우 자동 정렬*/
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: 1150px;}
    #content_2>div { width: 100%; }
    #content_2_1 { height: 115px; }
    #content_2_2 { color: black; }

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

    /* 영섭 작업 영역 시작 */
    #insertInquiry {
        text-align: center;
        height: 100px;
    }

    #insertInquiry>button {
        height: 45px;
        width: 300px;
        margin-bottom: 30px;
    }

    /* 영섭 작업 영역 끝 */

    /* 부트스트랩 페이징 */
    .pagination { justify-content: center; }

    #question_list {
        width: 100%;
    }
    #question_list th, #question_list td {
        text-align: center;
        color: black;
        padding: 15px;
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
                    <p>1:1 문의</p>
                </div>
                <div id="content_2_2">

                    <!-- 영섭 작업 영역 시작 -->

                    <!-- 문의사항 등록 버튼 -->
                    <div id="insertInquiry">
                        <button type="button" class="btn btn-primary">문의사항 등록하기</button>
                    </div>

                    <!-- 문의 전체 조회 for문 부분 -->
                    <div>
                        <table id="question_list" class="table table-hover">
                            <thead>
                                <tr>
                                    <th width="10%;"></th>
                                    <th width="70%;">제목</th>
                                    <th width="20%;">등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <!-- 답변대기 / 답변완료로 색깔 바뀌어야 함 -->
                                    <td><button type="button" class="btn btn-dark btn-sm disabled">답변대기</button></td> 
                                    <td>문의제목</td>
                                    <td>문의날짜</td>
                                </tr>
                                <tr>
                                    <td><button type="button" class="btn btn-dark btn-sm disabled">답변대기</button></td> 
                                    <td>문의제목</td>
                                    <td>문의날짜</td>
                                </tr>
                                <tr>
                                    <td><button type="button" class="btn btn-dark btn-sm disabled">답변대기</button></td> 
                                    <td>문의제목</td>
                                    <td>문의날짜</td>
                                </tr>
                                <tr>
                                    <td><button type="button" class="btn btn-dark btn-sm disabled">답변대기</button></td> 
                                    <td>문의제목</td>
                                    <td>문의날짜</td>
                                </tr>
                                <tr>
                                    <td><button type="button" class="btn btn-primary btn-sm disabled">답변대기</button></td> 
                                    <td>문의제목</td>
                                    <td>문의날짜</td>
                                </tr>
                                <tr>
                                    <td><button type="button" class="btn btn-primary btn-sm disabled">답변대기</button></td> 
                                    <td>문의제목</td>
                                    <td>문의날짜</td>
                                </tr>
                                <tr>
                                    <td><button type="button" class="btn btn-primary btn-sm disabled">답변대기</button></td> 
                                    <td>문의제목</td>
                                    <td>문의날짜</td>
                                </tr>
                                <tr>
                                    <td><button type="button" class="btn btn-primary btn-sm disabled">답변대기</button></td> 
                                    <td>문의제목</td>
                                    <td>문의날짜</td>
                                </tr>
                                <tr>
                                    <td><button type="button" class="btn btn-primary btn-sm disabled">답변대기</button></td> 
                                    <td>문의제목</td>
                                    <td>문의날짜</td>
                                </tr>
                                <tr>
                                    <td><button type="button" class="btn btn-primary btn-sm disabled">답변대기</button></td> 
                                    <td>문의제목</td>
                                    <td>문의날짜</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br><br>

                    <!-- 페이징 -->
                    <div>
                        <ul class="pagination pagination-sm">
                            <li class="page-item disabled">
                                <a class="page-link" href="#">&laquo;</a>
                            </li>
                            <li class="page-item active">
                                <a class="page-link" href="#">1</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">3</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">4</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">5</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">&raquo;</a>
                            </li>
                        </ul>
                    </div>
                    <!-- 영섭 작업 영역 끝 -->

                </div>
                <div id="content_2_3"></div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>

</body>
</html>