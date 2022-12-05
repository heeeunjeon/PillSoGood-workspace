<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 소개</title>
<style>

    div {
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: 1730px;
        margin : auto; /* 가운데로 좌, 우 자동 정렬*/
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 150px; }

    #content { height: 1300px;}
    #content_2>div { width: 100%;}
    #content_2_1 { height: 5%; float: left; }
    #content_2_2 { height: 85%; float: left; }
    #content_2_3 { height: 10%; float: left; }

    #header { height: 130px; }

    #content_2_1>div { height: 100%; float: left; }
    #blank, #write { width: 35%; }
    #search { width: 30%; }
    #write>div { width: 100%; }

    #write>div>button { margin-right: 15px;}
    
    #content_2_2>div { width: 100%; float: left; }

    #question { height: 10%; padding: 15px; }

    #question_1 { 
        width: 100%; 
        height: 100%; 
        background-color: rgb(189, 228, 217);
        border: 1px solid rgb(189, 228, 217);
        border-radius: 15px; 
    }


    #question_1>p {
        font-size: 25px;
        color: black;
        margin-top: 18px;
    }
   
    #productList { height: 90%; }
    #productList>div { width: 100%; float: left; }

    #allText { height: 5%; }
    #product { height: 95%; }

    #allText>div { height: 100%; float: left; }
    #allPro, #filter { width: 50%; }

    #filter>div { margin-left: 345px; }

    #allPro>p {
        font-size: 20px;
        color: black;
        margin-left: 15px;
        margin-top: 15px;
    }

    #product>div { 
        width: 33.3%; 
        height: 250px; 
        float: left;
        padding: 15px;
    }

    #product>div>div { 
        width: 100%;
        height: 100%;
        float: left; 
        border-radius: 15px;
    }

    #product>div>div>div { width: 100%; float: left; }

    #productT { height: 50%; }
    #productP { height: 20%; }

    #productT>div { height: 100%; float: left; }
    #productTT { width: 60%; }
    #productPP { width: 40%; }

    #productPP>img {
        height: 100%;
        width: 100%;
        object-fit: contain;
        margin: auto;
    }

    #productTT>div { width: 100%; height: 33.3%; float: left; }
    
    #productTT p { margin: 0px; margin-left: 20px; color: black; }
    #productTT_1>p { font-size: 15px; line-height: 55px; }
    #productTT_3>p { font-size: 15px; line-height: 45px; }
    #productTT_2>p {
        font-size: 20px;
        font-weight: bold;
        line-height: 50px;
    }


    #productP>p {
        font-size: 20px;
        font-weight: bold;
        color: black;
        margin-left: 20px;
        line-height: 40px;
    }

    #productW { height: 30%; padding: 10px; }

    #productW_1 { 
        width: 100%; 
        height: 100%;
        background-color: white;
        border-radius: 15px;
    }

    #productW_1>p {
        color: black;
        text-align: center;
        font-size: 18px;
        line-height: 43px;
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
        	<jsp:include page="../common/menubar.jsp" />
        </div>
        <div id="header"></div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2">
                <div id="content_2_1">
                    <div id="blank"></div>
                    <div id="search">
                        <div id="searchbar" class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="검색어를 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
                            <button class="btn btn-primary" type="button" id="button-addon2">검색</button>
                        </div>
                    </div>
                    <div id="write">
                        <div align="right"><button type="button" class="btn btn-primary">제품 등록</button></div>
                    </div>
                </div>
                <div id="content_2_2">
                    <div id="question">
                        <div id="question_1" style="cursor:pointer"><p align="center">내 건강점수는? <b>건강설문</b>으로 확인하기<i class="fa-solid fa-angle-right"></i></p></div>
                    </div>
                    <div id="productList">
                        <div id="allText">
                            <div id="allPro"><p>총 <span style="color:#78C2AD;">18</span>건</p></div>
                            <div id="filter">
                                <div class="form-group" style="width: 200px;">
                                    <select class="form-select" id="exampleSelect1">
                                      <option>이름순</option>
                                      <option>가격순</option>
                                      <option>리뷰순</option>
                                    </select>
                                  </div>
                            </div>
                        </div>
                        <div id="product">
                            <div id="product_1">
                                <div id="product_1_1" style="background-color: #fef7f8; cursor:pointer;">
                                    <div id="productT">
                                        <div id="productTT">
                                            <div id="productTT_1"><p>눈 건강엔</p></div> <!-- + 엔 붙이기(알아서 하기,,, 내가,,,) -->
                                            <div id="productTT_2"><p>루테인</p></div>
                                            <div id="productTT_3"><p>30일분</p></div>
                                        </div>
                                        <div id="productPP"><img src="image/pill01.png"></div>
                                    </div>
                                    <div id="productP">
                                        <p>24,000원</p>
                                    </div>
                                    <div id="productW">
                                        <div id="productW_1" style="cursor:pointer"><p><i class="fa-solid fa-cart-shopping"></i>&ensp;장바구니 담기</p></div>
                                    </div>
                                </div>
                            </div>
                            <div id="product_2">
                                <div id="product_2_1" style="background-color: #f9faf0;">
                                    <div id="productT">
                                        <div id="productTT">
                                            <div id="productTT_1"><p>눈 건강엔</p></div>
                                            <div id="productTT_2"><p>루테인</p></div>
                                            <div id="productTT_3"><p>30일분</p></div>
                                        </div>
                                        <div id="productPP"><img src="image/pill02.png"></div>
                                    </div>
                                    <div id="productP">
                                        <p>24,000원</p>
                                    </div>
                                    <div id="productW">
                                        <div id="productW_1"><p><i class="fa-solid fa-cart-shopping"></i>&ensp;장바구니 담기</p></div>
                                    </div>
                                </div>
                            </div>
                            <div id="product_3">
                                <div id="product_3_1" style="background-color: #faf4f1;">
                                    <div id="productT">
                                        <div id="productTT">
                                            <div id="productTT_1"><p>눈 건강엔</p></div>
                                            <div id="productTT_2"><p>루테인</p></div>
                                            <div id="productTT_3"><p>30일분</p></div>
                                        </div>
                                        <div id="productPP"><img src="image/pill03.png"></div>
                                    </div>
                                    <div id="productP">
                                        <p>24,000원</p>
                                    </div>
                                    <div id="productW">
                                        <div id="productW_1"><p><i class="fa-solid fa-cart-shopping"></i>&ensp;장바구니 담기</p></div>
                                    </div>
                                </div>
                            </div>
                            <div id="product_4">
                                <div id="product_4_1" style="background-color: #fef6ec;">
                                    <div id="productT">
                                        <div id="productTT">
                                            <div id="productTT_1"><p>눈 건강엔</p></div>
                                            <div id="productTT_2"><p>루테인</p></div>
                                            <div id="productTT_3"><p>30일분</p></div>
                                        </div>
                                        <div id="productPP"><img src="image/pill04.png"></div>
                                    </div>
                                    <div id="productP">
                                        <p>24,000원</p>
                                    </div>
                                    <div id="productW">
                                        <div id="productW_1"><p><i class="fa-solid fa-cart-shopping"></i>&ensp;장바구니 담기</p></div>
                                    </div>
                                </div>
                            </div>
                            <div id="product_5">
                                <div id="product_5_1" style="background-color: #edf7fd;">
                                    <div id="productT">
                                        <div id="productTT">
                                            <div id="productTT_1"><p>눈 건강엔</p></div>
                                            <div id="productTT_2"><p>루테인</p></div>
                                            <div id="productTT_3"><p>30일분</p></div>
                                        </div>
                                        <div id="productPP"><img src="image/pill08.png"></div>
                                    </div>
                                    <div id="productP">
                                        <p>24,000원</p>
                                    </div>
                                    <div id="productW">
                                        <div id="productW_1"><p><i class="fa-solid fa-cart-shopping"></i>&ensp;장바구니 담기</p></div>
                                    </div>
                                </div>
                            </div>
                            <div id="product_6">
                                <div id="product_6_1" style="background-color: #fef5f4;">
                                    <div id="productT">
                                        <div id="productTT">
                                            <div id="productTT_1"><p>눈 건강엔</p></div>
                                            <div id="productTT_2"><p>루테인</p></div>
                                            <div id="productTT_3"><p>30일분</p></div>
                                        </div>
                                        <div id="productPP"><img src="image/pill09.png"></div>
                                    </div>
                                    <div id="productP">
                                        <p>24,000원</p>
                                    </div>
                                    <div id="productW">
                                        <div id="productW_1"><p><i class="fa-solid fa-cart-shopping"></i>&ensp;장바구니 담기</p></div>
                                    </div>
                                </div>
                            </div>
                            <div id="product_7">
                                <div id="product_7_1" style="background-color: #fbf7fd;">
                                    <div id="productT">
                                        <div id="productTT">
                                            <div id="productTT_1"><p>눈 건강엔</p></div>
                                            <div id="productTT_2"><p>루테인</p></div>
                                            <div id="productTT_3"><p>30일분</p></div>
                                        </div>
                                        <div id="productPP"><img src="image/pill07.png"></div>
                                    </div>
                                    <div id="productP">
                                        <p>24,000원</p>
                                    </div>
                                    <div id="productW">
                                        <div id="productW_1"><p><i class="fa-solid fa-cart-shopping"></i>&ensp;장바구니 담기</p></div>
                                    </div>
                                </div>
                            </div>
                            <div id="product_8">
                                <div id="product_8_1" style="background-color: #e9f7f5;">
                                    <div id="productT">
                                        <div id="productTT">
                                            <div id="productTT_1"><p>눈 건강엔</p></div>
                                            <div id="productTT_2"><p>루테인</p></div>
                                            <div id="productTT_3"><p>30일분</p></div>
                                        </div>
                                        <div id="productPP"><img src="image/pill05.png"></div>
                                    </div>
                                    <div id="productP">
                                        <p>24,000원</p>
                                    </div>
                                    <div id="productW">
                                        <div id="productW_1"><p><i class="fa-solid fa-cart-shopping"></i>&ensp;장바구니 담기</p></div>
                                    </div>
                                </div>
                            </div>
                            <div id="product_9">
                                <div id="product_9_1" style="background-color: #e9f7f5;">
                                    <div id="productT">
                                        <div id="productTT">
                                            <div id="productTT_1"><p>눈 건강엔</p></div>
                                            <div id="productTT_2"><p>루테인</p></div>
                                            <div id="productTT_3"><p>30일분</p></div>
                                        </div>
                                        <div id="productPP"><img src="image/pill06.png"></div>
                                    </div>
                                    <div id="productP">
                                        <p>24,000원</p>
                                    </div>
                                    <div id="productW">
                                        <div id="productW_1"><p><i class="fa-solid fa-cart-shopping"></i>&ensp;장바구니 담기</p></div>
                                    </div>
                                </div>
                            </div>
                        </div>
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