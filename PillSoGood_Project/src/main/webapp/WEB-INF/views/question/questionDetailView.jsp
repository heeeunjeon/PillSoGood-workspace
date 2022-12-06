<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
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
    #content_2 { width : 60%; height: auto!important;}
    #content_3 { width : 20%; }

    body { font-family: 'Noto Sans KR', sans-serif !important; }

    /* 영섭 작업 영역 시작 */

    /* 버튼 스타일 */
    #btnDelete, #btnUpdate {
        height: 30px;
        width: 60px;
    }

    /* 영섭 작업 영역 끝 */

    .form-control {
        margin-left: 0px;
        width: 95%;;
        margin: auto;
    }

    #content_2_2 p {
        margin-left: 30px;
        font-weight: bold;
        font-size: large;
    }

    .question_content {
        width: 95%;
        margin: auto;
        margin-bottom: 70px;
    }

    #answer_content {
        width: 90%;
        margin: auto;
        background-color: #78c2ad36;
    }
    #answer_content th, #answer_content td { padding: 15px; color: black; }

    #answer_enroll {
        width: 90%;
        margin: auto;
    }

    #btnInsert {
        width: 60px;
        margin-top: 15px;
        margin-right: 29px;
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

                    <!-- 제목 부분 -->
                    <p>제목</p>
                    <div class="question_content">제목</div>
                    
                    <!-- 내용 부분 -->
                    <p>내용</p>
                    <div class="question_content">
                        내용
                        내용
                    </div>
                    
                    <!-- 사진첨부 부분 -->
                    <p>사진</p>
                    <div class="question_content">
                        <img id="image" src="pill2.png" alt="" width="200px" height="200px">
                    </div>
                   
                    <hr>
                    <br><br>


                    <div>
                        <!-- 댓글 부분 -->
                        <div>
                            <table id="answer_content">
                                <thead>
                                    <tr>
                                        <th width="15%;">PillSoGood</th>
                                        <td width="15%;">2022-11-22</td>
                                        <td width="70%;" style="text-align: right;">
                                            <button id="btnUpdate" type="button" class="btn btn-warning btn-sm">수정</button>
                                            <button id="btnDelete" type="button" class="btn btn-danger btn-sm">삭제</button>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="3">
                                            답변입니다<br>
                                            sadfkasdjlfkajsd
                                            kdjsaflsadkjfskldjflksabr<br>
                                            ㅁ낭럼나이ㅓㄹㄴㅁㅇ
                                            
                                        </td>
                                    </tr>

                                </tbody>

                            </table>
                        </div>
                        <br>

                        <!-- 댓글 입력창 부분 -->
                        <div id="answer_enroll">

                            <form action="" method="post">
                                <textarea name="" rows="10" class="form-control" placeholder="답변 내용 작성" style="resize: none;"></textarea>
                                
                                <!-- 버튼 영역 -->
                                <div align="right">
                                    <button id="btnInsert" type="submit" class="btn btn-primary btn-sm">등록</button>
                                </div>
                            </form>
                        </div>
                            

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