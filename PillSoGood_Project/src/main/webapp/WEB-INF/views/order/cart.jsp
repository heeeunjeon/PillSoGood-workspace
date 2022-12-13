<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>

    div {
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: auto;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: auto; display: flex; }
    #content_2>div { width: 100%; float: left; }
    #content_2_1 { height: 115px; float: left; }
    #content_2_2 { height: auto; float: left; }

    #header { height: 130px; }

    #content_2_1>p {
        font-size: 35px;
        color: black;
        margin-top: 20px;
        margin-left: 30px;
    }

    #content_2_2>div>table>thead tr { border-bottom: solid lightgray; }
    #content_2_2>div>table { color: black; width: 90%; }

    #content_2_2>div { width: 100%; height: auto; }

    #choice>div { height: 140px; width: 50%; float: left; padding: 15px; }
    #choiceA>div, #choiceB>div { height: 100%; width: 100%; border-radius: 10px; } 

    #textC { height: 40px; }
    #textC_1>p {
        color: black;
        font-weight: bold;
        text-align: left;
        padding-left: 20px;
        padding-top: 8px;
    }

    #textC_2>p {
        color: black;
        font-weight: bold;
        text-align:right;
        padding-right: 20px;
        padding-top: 8px;
    }

    #textC>div { width: 50%; float: left; }

    #textCV>p {
        color: black;
        text-align: left;
        padding-left: 20px;
        padding-top: 5px;
        font-size: 15px;
    }

    #btnss>div { width: 50%; float: left; }


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
        <div id="navigator2">
        	<jsp:include page="../common/menubar.jsp" />
        </div>
        <div id="header"></div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2">
                <div id="content_2_1">
                    <p>장바구니</p>
                </div>
                <div id="content_2_2" align="center">
                    <div>
                        <table>
                            <thead>
                                <tr height="50px">
                                    <th width="25px" align="center"><input class="form-check-input" type="checkbox"></th>
                                    <th colspan="3" align="left" >전체선택</th>
                                    <th width="100px" align="center"><button type="button" class="btn btn-outline-danger btn-sm">선택삭제</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td rowspan="2" align="center"><input class="form-check-input" type="checkbox"></td>
                                    <td rowspan="2" align="center" width="150px"><div style="width: 80px; height: 80px;"><img src="../../../resources/images/" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                    <td height="30px">눈건강엔</td>
                                    <td rowspan="2" width="150px">
                                        <table align="center">
                                            <tr>
                                                <td><button type="button" class="btn btn-light" style="background-color:white; border: 1px solid #ced4da;" onclick="count('minus');">-</button></td>
                                                <td style="width: 36px;"><input class="form-control" id="result" value="1" style="width: 36px;" readonly></td>
                                                <td><button type="button" class="btn btn-light" style="background-color:white; border: 1px solid #ced4da;" onclick="count('plus');">+</button></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td rowspan="2" align="center" style="font-size: 23px;"><b>24,000원</b></td>
                                </tr>
                                <tr style="border-bottom: 1px solid lightgray;">
                                    <td style="font-size: 20px;"><b>루테인</b></td>
                                </tr>
                           
                            </tbody>
                        </table>
                    </div>
                    <div id="btns" style="margin-top: 10px;">
                        <button type="button" class="btn btn-outline-primary btn-lg" onclick="location.href='list.pr'">+ 제품 추가</button>
                    </div>
                    <div style="height: 200px;"></div>
                    <div>
                        <table>
                            <tr height="40px">
                                <td colspan="2">결제 예상 금액</td>
                            </tr>
                            <tr style="border-top: solid lightgray;" height="50px">
                                <td style="font-size: 20px;" width="740px"><b>총 제품 금액</b></td>
                                <td style="font-size: 20px;"><b>24,000원</b></td>
                            </tr>
                        </table>
                    </div>
                    <div id="choice">
                        <div id="choiceA">
                            <div style="border: 1px solid #78C2AD;">
                                <div id="textC">
                                    <div id="textC_1"><p>정기구독시</p></div>
                                    <div id="textC_2"><p>19,200원</p></div>
                                </div>
                                <div id="textCV">
                                    <p>
                                        + 정기구독 10% 할인 <br>
                                        + 배송비 무료
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div id="choiceB">
                            <div style="border: 1px solid #F3969A;">
                                <div id="textC">
                                    <div id="textC_1"><p>단품구매시</p></div>
                                    <div id="textC_2"><p>27,000원</p></div>
                                </div>
                                <div id="textCV">
                                    <p>
                                        + 배송비 3000원
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="btnss">
                        <div><button type="button" class="btn btn-primary btn-lg">정기결제</button></div>
                        <div><button type="button" class="btn btn-outline-secondary btn-lg">단품결제</button></div>
                    </div>
                </div>
                <div style="height: 150px;"></div>
            </div>
            
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>

    <script>
        function count(type)  {
            // 결과를 표시할 element
            const resultElement = document.getElementById("result");
            
            // 현재 화면에 표시된 값
            let number = $(resultElement).val();
            var num = parseInt(number);

            if(type == "plus") {
                if (num < 9) {
                    num = num + 1;
                }
            } else if(type == "minus")  {
                if (num != 0) {
                    num = num - 1;
                }
            }

            // 결과 출력
            $("#result").val(num);
        }
    </script>
    
</body>
</html>