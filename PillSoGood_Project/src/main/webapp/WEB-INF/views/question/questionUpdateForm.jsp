<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 수정</title>
<style>

    div {
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: 1400px;
        margin : auto; /* 가운데로 좌, 우 자동 정렬*/
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: 1050px;}
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

    /* content_2_2 영역 분배 */
    #content_2_2>div { width: 100%;}        

    #inquiryButton { text-align: center; }

    /* 요소들 스타일 */
    #inquiryButton button {
        height: 45px;
        width: 200px;
        margin: auto;
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

                    <form action="update.qu" method="post" enctype="multipart/form-data">
                        <!-- 영섭 작업 영역 시작 -->

                        <!-- 제목 부분 -->
                        <div id="inquiryTitle" class="inquiryClass">
                            <p class="contentText">제목</p>
                            <input type="text" class="form-control" name="questionTitle" value="${ q.questionTitle }" placeholder="문의 제목을 입력해주세요 (30자 이내)" required>
                        </div>
                        <br>
                        
                        <!-- 내용 부분 -->
                        <div id="inquiryContent" class="inquiryClass">
                            <p class="contentText">내용</p>
                            <textarea name="questionContent" cols="30" rows="15" class="form-control" value="${ questionContent }" placeholder="문의 내용을 입력해주세요 (1000자 이내)" style="resize: none;" required></textarea>
                        </div>
                        <br>
                        
                        <!-- 사진첨부 부분 -->
                        <div id="inquiryImage" class="inquiryClass">
                            <p class="inquiryText">사진첨부(선택)</p>
                            <input type="file" class="form-control" name="reupfile">
                            
                            <c:if test="${ not empty q.questionImage }">
                            	<img src="${ q.questionImage }">
                            	<input type="hidden" name="questionImage" value="${ q.questionImage }">
                            </c:if>
                        </div>
                        <br><br>

                        <!-- 등록 버튼 -->
                        <div id="inquiryButton">
                            <br><br>
                            <button type="submit" class="btn btn-primary">수정하기</button>
                        </div>

                        <!-- 영섭 작업 영역 끝 -->
                    </form>
                </div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>

</body>
</html>