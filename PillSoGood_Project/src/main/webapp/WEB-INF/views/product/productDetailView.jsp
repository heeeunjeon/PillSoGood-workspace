<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세</title>
<style>

    div {
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: 2930px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: 2550px; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 115px; float: left; }
    #content_2_2 { height: 2433px; float: left; }

    #content_2_2_1 { width: 100%; height: 920px; float: left; }


    #header { height: 130px; }

    #content_2_1>div { width: 100%; height: 100%; }
    #write>div { margin-top: 73px; margin-right: 5px; }

    

    #content_2_2_1>div { width: 100%; float: left; }
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

    #proText_1 { height: 15%; }
    #proText_2 { height: 20%; }
    #proText_3 { height: 65%; }

    #proText_1>p {
        width: 100%;
        height: 100%;
        color: black;
        font-size: 20px;
        font-weight: bold;
        margin-top: 20px;
        padding: 10px; 
    }

    #proText_2>p {
        width: 100%;
        height: 100%;
        color: black;
        font-size: 30px;
        font-weight: bold;
        border-bottom: solid lightgrey; 
        padding: 10px; 
    }

    #proText_3>div { width: 100%; height: 100%; float: left; padding: 20px 0px; }

    #proPrice {
        width: 100%;
        height: 80%;
        float: left;
        background-color: #f9f4f4;
    }

    #proPricee { width: 100%; height: 30%; border-bottom: 1px solid lightgrey; }

    #proPrice_1, #proPrice_2 { height: 100%; width: 50%; float: left; }
    
    #proPrice_1>p, #proPrice_2>p, #proPPP_3>p, #proPPP_4>p {
        width: 100%;
        height: 100%;
        color: black;
        font-size: 20px;
        font-weight: bold;
        padding: 10px; 
    }

    #proPrice_2>p { margin-left: 120px; }

    #proPPP_3>p, #proPPP_4>p { margin-top: -3px; }

    #proPPP_4>p { margin-left: 100px; font-size: 25px; }

    #proPP_1, #proPP_2 { height: 35%; }

    #btnss { width: 100%; height: 20%; float: left; margin-top: 10px; }
    #btnss>div { height: 100%; float: left; }

    #wish { width: 20%; }
    #btnss_1 { width: 80%; }

    #wish>img {
        height: 90%;
        width: 90%;
        object-fit: contain;
        margin: auto;
        margin-left: 18px;
    }

    #proPPP_1, #proPPP_2 { height: 100%; width: 50%; float: left; }

    #proPPPP_1>p {
        width: 100%;
        height: 100%;
        color: black;
        font-size: 18px;
        font-weight: bold;
        margin-left: 45px;
        margin-top: 15px;
    }

    #proPPP_1>p {
        width: 100%;
        height: 100%;
        color: black;
        font-size: 20px;
        font-weight: bold;
        padding: 10px; 
        margin-top: 5px;
    }

    #proPPPP_1, #proPPPP_2, #proPPP_3, #proPPP_4 { width: 50%; height: 100%; float: left; }

    #btns { width: 100%; height: 100%; float: left; margin-top: 10px; margin-left: -10px; }

    #btnss_1>div { margin-left: 20px; }

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
        <div id="navigator2">
            <jsp:include page="../common/menubar.jsp" />
        </div>
        <div id="header"></div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2">
                <div id="content_2_1">
                    <div id="write">
                        <div align="right">
                            <button type="button" class="btn btn-warning">수정</button>
                            <button type="button" class="btn btn-danger">삭제</button>
                        </div>
                    </div>
                </div>
                <div id="content_2_2">
                    <div id="content_2_2_1">
                        <div id="insertPro">
                            <div id="proThum">
                                <div id="proThum_1">
                                    <div id="proThum_2">
                                        <div id="proImgg">
                                            <div id="proImgg_1"><img src="${ p.productImgPath }"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="proText">
                                <div id="proText_1"><p>${ p.productExplain } 엔</p></div>
                                <div id="proText_2"><p>${ p.productName }&ensp;<span style="color: rgb(185, 184, 184);">30일분</span></p></div>
                                <div id="proText_3">
                                    <div id="proText_3_1">
                                        <div id="proPrice">
                                            <div id="proPricee">
                                                <div id="proPrice_1"><p>구매가</p></div>
                                                <div id="proPrice_2"><p>${ p.productPrice }원</p></div>
                                            </div>
                                            <div id="proPP_1">
                                                <div id="proPPP_1"><p>수량선택</p></div>
                                                <div id="proPPP_2">
                                                    <div id="proPPPP_1"><p>총 1개</p></div>
                                                    <div id="proPPPP_2">
                                                        <div id="btns">
                                                            <table>
                                                                <tr>
                                                                    <td><button type="button" class="btn btn-light" style="background-color:white; border: 1px solid #ced4da;" onclick="count('minus');">-</button></td>
                                                                    <td style="width: 36px;"><input class="form-control" id="result" value="1" style="width: 36px;" readonly></td>
                                                                    <td><button type="button" class="btn btn-light" style="background-color:white; border: 1px solid #ced4da;" onclick="count('plus');">+</button></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="proPP_2">
                                                <div id="proPPP_3"><p>총 금액</p></div>
                                                <div id="proPPP_4"><p>${ p.productPrice }원</p></div>
                                            </div>
                                        </div>
                                        <div id="btnss">
                                            <div id="wish">
                                                <img src="image/heart.png" alt="" class="likeControl" id="eventUnLike" style="cursor: pointer;">
                                                <img src="image/heart2.png" class="likeControl" style="display:none" id="eventLike" style="cursor: pointer;">
                                            </div>
                                            <div id="btnss_1">
                                                <div> <!-- 상단의 div 선이 나타나면 버튼이 밀려서 내려가지만 없을땐 가로 배치로 잘 보임 -->
                                                    <button type="button" class="btn btn-primary" style="width: 170.5px;">장바구니</button>&ensp;
                                                    <button type="button" class="btn btn-secondary" style="width: 170.5px;">바로구매</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="proImg">
                            <div id="proImg_1">
                                <div id="proImg_1_1"><img src="${ p.productDescription }"></div>
                            </div>
                        </div>
                    </div>
                  
                </div>
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
                if (num != 1) {
                    num = num - 1;
                }
            }

            // 결과 출력
            $("#result").val(num);
            
            // 영섭
			var price = ${ p.productPrice }; // price 라는 int
			// 결과를 표시할 element
 			$("#proPPP_4>p").html(num * price + "원");
        }
        
        $(function() {
            $("#wish").on("click",".likeControl",function() {
                if ($("#eventLike").css("display") == "none") {
                    $("#eventLike").show();
                    $("#eventUnLike").hide();
                } else {
                    $("#eventLike").hide();
                    $("#eventUnLike").show();
                }
            });
        });
    </script>
    
</body>
</html>