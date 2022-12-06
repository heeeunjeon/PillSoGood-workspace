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
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: 1830px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: 1450px; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 230px; float: left; }
    #content_2_2 { height: auto; float: left; }

    #header { height: 130px; }

    #content_2_1>div { width: 100%; height: 100%; background-color: rgba(120, 194, 173, 0.25);}

    #content_2_1_1>div { width: 100%; height: 100%; }

    #content_2_1_1>div>p {
        width: 100%;
        height: 100%;
        color: black;
        font-size: 30px;
        padding-top: 40px;
        padding-left: 80px;
    }

    #content_2_2>div { width: 100%; }
    #icons { height: 200px; }
    #icons>div {  height: 100%; float: left; min-width: 500px;  }


    #icon_1>div { width: 100%; }
    #iconn { height: 40%; }
    #picto { height: 60%; }

    #iconn>div { height: 100%; float: left; }
    .btnn { width: 100px; }
    .textt { width: 200px; }

    .btnn>div { margin-left: 30px; margin-top: 25px; }

    .btnn>div>button:hover { cursor: default; background-color: white; color: #FFCE67; }

    .textt>p {
        color: #FFCE67;
        font-size: 20px;
        font-weight: bold;
        margin-top: 30px;
    }

    #picto>div { height: 100%; width: 100%; }

    #circle { 
        width: 60px; 
        height: 60px; 
        border-radius: 50%; 
        background-color: #FFCE67;
        margin-left: 0px;
        margin-top: 20px;
    }

    #icon2_circle { 
        width: 60px; 
        height: 60px; 
        border-radius: 50%; 
        background-color: #FF7852;
        margin-left: 0px;
        margin-top: 20px;
    }
    
    #pictoT { width: 60px; height: 35px;}
    #icon2_pictoT { width: 60px; height: 35px;}

    #circle>img {
        height: 100%;
        width: 100%;
        object-fit: contain;
        margin: auto;
        padding: 8px;
    }
    #icon2_circle>img {
        height: 100%;
        width: 100%;
        object-fit: contain;
        margin: auto;
        padding: 8px;
    }

    #pictoT>p {
        color: black;
        font-size: 15px;
        font-weight: bold;
        margin-top: 10px;
        text-align: center;
        width: 100%;
        height: 100%;
    }

    #icon2_pictoT>p {
        color: black;
        font-size: 15px;
        font-weight: bold;
        margin-top: 10px;
        text-align: center;
        width: 100%;
        height: 100%;
    }

    #content_2_2>div>table { width: 60%; }
    #content_2_2>div table { color: black; }


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
            <jsp:include page="../common/menubar.jsp" />
        </div>
        <div id="header"></div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2">
                <div id="content_2_1">
                    <div id="content_2_1_1">
                        <div>
                            <p>
                                <b>한영섭님의<br>건강설문 결과</b><br>
                                <span style="font-size: 15px;">20대&ensp;남성&ensp;180cm&ensp;70kg&emsp;|&emsp;BMI 30</span> 
                            </p>
                        </div>
                    </div>
                </div>
                <div id="content_2_2">
                    <div id="icons">
                        <div id="icon_1">
                            <div id="iconn">
                                <div class="btnn"><div><button type="button" class="btn btn-outline-warning">추천</button></div></div>
                                <div class="textt"><p>관리가 필요해요.</p></div>
                            </div>
                            <div id="picto">
                                <div>
                                    <div class="container-fluid">
                                        <div class="d-flex"> <!-- 반복 돌렸을 때 옆으로 배치되게 바꾸기 -->
                                            <div style="margin-right : 10px;">
                                                <div id="circle"><img src="resources/images/liver.png"></div>
                                                <div id="pictoT"><p>간</p></div>
                                            </div>
                                  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div id="icon_2" >
                            <div id="iconn">
                                <div id="icon2_btn" class="btnn"><div><button type="button" class="btn btn-outline-danger">권장</button></div></div>
                                <div id="icon2_text" class="textt" ><p style="color : #FF7852;">관심을 가져주세요.</p></div>
                            </div>

                            <div id="picto">
                                <div>
                                    <div class="container-fluid">
                                        <div class="d-flex"> <!-- 반복 돌렸을 때 옆으로 배치되게 바꾸기 -->
                                            <div  style="margin-right : 10px;">
                                                <div id="icon2_circle"><img src="resources/images/eye.png"></div>
                                                <div id="icon2_pictoT"><p>눈</p></div>
                                            </div>
                                            <div  style="margin-right : 10px;">
                                                <div id="icon2_circle"><img src="resources/images/bone.png"></div>
                                                <div id="icon2_pictoT"><p>뼈</p></div>
                                            </div>

                                            <div  style="margin-right : 10px;">
                                                <div id="icon2_circle"><img src="resources/images/blood-pressure.png"></div>
                                                <div id="icon2_pictoT"><p>혈압</p></div>
                                            </div>
                                            <div  style="margin-right : 10px;">
                                                <div id="icon2_circle"><img src="resources/images/brain.png"></div>
                                                <div id="icon2_pictoT"><p>두뇌</p></div>
                                            </div>
                                            <div  style="margin-right : 10px;">
                                                <div id="icon2_circle"><img src="resources/images/blood-vessel.png"></div>
                                                <div id="icon2_pictoT"><p>혈관</p></div>
                                            </div>
                                            <div  style="margin-right : 10px;">
                                                <div id="icon2_circle"><img src="resources/images/intestine.png"></div>
                                                <div id="icon2_pictoT"><p>장</p></div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="height: 100px;"></div>
                    <div align="center">
                        <div id="tuijian" style="border: 2px solid #78C2AD; width: 70%; border-radius: 10px;">
                            <table>
                                <thead>
                                    <tr height="80px" style="font-size: 30px;">
                                        <td colspan="4">한영섭님만을 위한 추천 영양제입니다.</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            나에게 꼭 필요한 영양성분을 장바구니에 담아 정기구독 혜택을 확인해보세요.
                                        </td>
                                    </tr>
                                    <tr style="border-bottom: solid lightgray;" height="50px">
                                        <th width="25px" align="center"><input class="form-check-input" type="checkbox"></th>
                                        <td colspan="3"><b>전체선택</b></td>
                                    </tr>
                                </thead>
                                <tbody> <!-- 반복문 돌려서 값 뽑기 -->
                                    <tr>
                                        <td rowspan="2" align="center"><input class="form-check-input" type="checkbox"></td>
                                        <td rowspan="2" align="center" width="100px"><div style="width: 80px; height: 80px;"><img src="resources/images/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                        <td height="30px">눈건강엔</td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgray;">
                                        <td style="font-size: 20px;"><b>루테인</b></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2" align="center"><input class="form-check-input" type="checkbox"></td>
                                        <td rowspan="2" align="center" width="100px"><div style="width: 80px; height: 80px;"><img src="resources/images/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                        <td height="30px">눈건강엔</td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgray;">
                                        <td style="font-size: 20px;"><b>루테인</b></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2" align="center"><input class="form-check-input" type="checkbox"></td>
                                        <td rowspan="2" align="center" width="100px"><div style="width: 80px; height: 80px;"><img src="resources/images/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                        <td height="30px">눈건강엔</td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgray;">
                                        <td style="font-size: 20px;"><b>루테인</b></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2" align="center"><input class="form-check-input" type="checkbox"></td>
                                        <td rowspan="2" align="center" width="100px"><div style="width: 80px; height: 80px;"><img src="resources/images/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                        <td height="30px">눈건강엔</td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgray;">
                                        <td style="font-size: 20px;"><b>루테인</b></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2" align="center"><input class="form-check-input" type="checkbox"></td>
                                        <td rowspan="2" align="center" width="100px"><div style="width: 80px; height: 80px;"><img src="resources/images/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                        <td height="30px">눈건강엔</td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgray;">
                                        <td style="font-size: 20px;"><b>루테인</b></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2" align="center"><input class="form-check-input" type="checkbox"></td>
                                        <td rowspan="2" align="center" width="100px"><div style="width: 80px; height: 80px;"><img src="resources/images/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                        <td height="30px">눈건강엔</td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgray;">
                                        <td style="font-size: 20px;"><b>루테인</b></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2" align="center"><input class="form-check-input" type="checkbox"></td>
                                        <td rowspan="2" align="center" width="100px"><div style="width: 80px; height: 80px;"><img src="resources/images/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                        <td height="30px">눈건강엔</td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgray;">
                                        <td style="font-size: 20px;"><b>루테인</b></td>
                                    </tr>

                                    <tr>
                                        <td rowspan="2" align="center"><input class="form-check-input" type="checkbox"></td>
                                        <td rowspan="2" align="center" width="100px"><div style="width: 80px; height: 80px;"><img src="resources/images/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                        <td height="30px">눈건강엔</td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgray;">
                                        <td style="font-size: 20px;"><b>루테인</b></td>
                                    </tr>
                                    
                                </tbody>
                                <tfoot>
                                    <tr height="70px">
                                        <td align="center" colspan="4">
                                            <button type="button" class="btn btn-primary" style="width: 170.5px;">장바구니</button>&ensp;
                                            <button type="button" class="btn btn-secondary" style="width: 170.5px;">바로구매</button>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    

</body>
</html>