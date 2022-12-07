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
<style>

    /* 여기는 내가 넣은 스타일 영역 */
    #loginFrom {
        box-sizing: border-box;
        width: 400px;
        height: 100px;
        margin-top: 40px;
        margin-bottom: 40px;
        color : rgb(40, 40, 40);

    }

    #loginText {
        font-size: 35px;
        color : rgb(40, 40, 40);
        font-weight: bold;
        padding-top: 20px;
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
                </div>
                <div id="content_2_2">
                    <div align="center" id="loginText">로그인</div>
                    <form action="login.me" method="post">
                        <table id="loginFrom" align="center">
                            <tr>
                                <th>아이디</th>
                                <td>
                                    <input class="form-control" type="text" placeholder="아이디를 입력" maxlength="20" id="memberId" name="memberId">
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td>
                                    <input type="password" class="form-control" placeholder="비밀번호를 입력" maxlength="20" id="memberPwd" name="memberPwd">
                                </td>
                            </tr>
                        </table>

                        <div align="center">
                            <button class="btn btn-secondary" style="width: 400px; height: 50px;">로그인</button>
                        </div>

                    </form>

                    <div align="center" style="padding: 40px;">
                        ID 찾기 &ensp; | &ensp;
                        	회원가입
                    </div>
                    <div align="center" style="padding: 50px;">소설 로그인 아이콘</div>
                    

                </div>
                <div id="content_2_3"></div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    
</body>
</html>