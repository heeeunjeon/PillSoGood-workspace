<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>FAQ</title>
 <style>

        /* [샛별] 파일 받으면 이 부분 지우기 */
        div {
            
            box-sizing : border-box;
        }

        /* 전체를 감싸는 wrap */
        .wrap {
			height: 1580px;
            width: 98%;
            margin : auto; /* 가운데로 좌, 우 자동 정렬*/
        }

        .wrap>div { width : 100%; }

        #navigator2 { height: 150px; }

		#content_2>div { 
			width: 100%;
			display: block;
		}
        #content_2_1 { height: 75px; }
        #content_2_2 { 
			height: auto;
			display: flex;
		}

		/* 제목 본문 영역 */
		#content_2_2>div {
			width: 100%;
		}
		#contentTitle {
			height: 180px;
		}
		#contentTable {
			height: 85%;
		}

        #header { 
            height: 230px;
        }

        #header>div { height: 100%; float: left; }

        #header_1 { width: 70%; }

        #header_1>p {
            box-sizing: border-box;
            font-size: 45px;
            font-weight: bold;
            margin-top: 130px;
            margin-left: 150px;
            color: white;
        }

        #header_2 { width: 30%; }

        #header_2>img {
            height: 60%;
            margin-left: 150px;
            margin-top: 70px;
        }

        /* content 영역 */
        #content>div { height : 100%; float : left; }
        #content_1 { width : 25%; height:100vh!important;}
        #content_2 { width : 50%; }
        #content_3 { width : 25%; height:100vh!important;}

		/* 영섭 작업 영역 시작 */

		table {
			width: 100%;
			height: 100%;	  
		}

		tbody {
			width: 100%;
			height: 100%;     
		}

		.upperHr, #contentTitle {
			border-top: 2px solid lightgrey;
		}

		.upperHr:hover {
			cursor: pointer;
			background-color: rgb(240, 240, 240);
		}

		.category {
			width: 15%;
			text-align: center;
		}

		.question {
			width: 80%;
		}

		.button {
			width: 5%;
		}

		.question>p, i {
			font-size: 20px;
			color: black;
			font-weight: bold;
			margin: 15px;
		}

		.category>button {
			width: 110px;
			font-size: 18px;
		}

		.answer {
			height: 0px;
		}

		.answer>p {
			font-size: 17px;
			color: black;
			margin: 25px;
			display : none;
			box-sizing : border-box;
			line-height: 35px;
			padding-left: 70px;
		}

		#contentTitle>p {
			padding-left: 30px;
			font-size: 80px;
			color: black;
		}

		/* 영섭 작업 영역 끝 */
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
                <div id="content_2_1"><p>FAQ</p></div>
                <div id="content_2_2">

					<!-- 영섭 작업 영역 시작-->
			
					<div id="contentTable">
						<table align="center" class="list-area">
							<tbody style="border-top: 2px solid black">
								<tr class="upperHr">
									<td class="category"><button type="button" class="btn btn-primary disabled">서비스</button></td> <!-- 카테고리 -->
									<td class="question"><p>PillSoGood 서비스 이용방법에 대해 알려주세요.</p></td> <!-- 질문 -->																
									<td class="button"> <!-- 답변 보이게 하는 버튼 -->
										<i class="fa-solid fa-chevron-down"></i>
									</td>
								</tr>
								<tr>                                        
									<td class="answer" colspan="3"> <!-- 답변 -->
										<p> 
											PillSoGood은 개인 맞춤 건강기능식품 구독 서비스입니다.<br>
											전문가가 설계한 건강설문을 통해 개인 맞춤 영양성분을 추천받고, 매달 배송 받아보세요.<br>
											<br>
											1. PillSoGood 웹사이트에서 회원가입을 해주세요.<br>
											2. 설문을 통해 건강 상태를 확인하고, 내 몸에 필요한 영양성분을 추천받으세요. <br>
											3. 30일마다 건강기능식품을 배송받으세요.<br>
											4. PillSoGood 섭취 관리를 통해 매일 건강한 습관을 만들어보세요.<br>  
										</p>
									</td> 
								</tr>
								<tr class="upperHr">
									<td class="category"><button type="button" class="btn btn-primary disabled">제품</button></td>
									<td class="question"><p>PillSoGood 제품을 장기간 먹어도 괜찮을까요?</p></td>
									<td class="button">
										<i class="fa-solid fa-chevron-down"></i>
									</td>
								</tr>
								<tr>                                        
									<td class="answer" colspan="3">
										<p> 
											건강기능식품(PillSoGood)은 치료의 목적이 아닌 건강을 유지하는데 도움을 주는 식품입니다. <br>
											따라서, 3개월 이상 꾸준히 드시는것이 좋으나, 만약 장기간 드시면서 평소와 다른 증상(소화불량, 두통, 어지러움증 등)이 나타날 경우, 건강기능식품(PillSoGood)의 섭취를 중단하시고 전문의와 상의하시는 것이 좋습니다.<br>  
										</p>
									</td>
								</tr>
								<tr class="upperHr">
									<td class="category"><button type="button" class="btn btn-primary disabled">회원관리</button></td>
									<td class="question"><p>아이디/비밀번호를 잊어버렸어요.</p></td>
									<td class="button">
										<i class="fa-solid fa-chevron-down"></i>
									</td>
								</tr>
								<tr>                                        
									<td class="answer" colspan="3">
										<p> 
											일반회원가입으로 진행한 경우, 'PillSoGood 웹사이트 > 로그인 > 아이디 찾기/비밀번호 찾기'를 통해 찾으실 수 있습니다.<br>
											SNS 간편가입을 진행한 경우, 가입하신 SNS를 통해 찾으셔야 합니다.<br> 
										</p>
									</td>
								</tr>
								<tr class="upperHr">
									<td class="category"><button type="button" class="btn btn-primary disabled">결제</button></td>
									<td class="question"><p>정기결제 내역을 확인하고 싶어요.</p></td>
									<td class="button">
										<i class="fa-solid fa-chevron-down"></i>
									</td>
								</tr>
								<tr>                                        
									<td class="answer" colspan="3">
										<p> 
											'PillSoGood 웹사이트 > 마이페이지 > 주문조회'를 통해 결제 내역을 확인하실 수 있습니다.<br>
										</p>
									</td>
								</tr>
								<tr class="upperHr">
									<td class="category"><button type="button" class="btn btn-primary disabled">배송</button></td>
									<td class="question"><p>첫 구매했습니다. 배송은 얼마나 걸리나요?</p></td>
									<td class="button">
										<i class="fa-solid fa-chevron-down"></i>
									</td>
								</tr>
								<tr>                                        
									<td class="answer" colspan="3">
										<p> 
											평일 오후 12시 이전 결제 건은 당일, 12시 이후 결제 건은 다음날(주말, 공휴일 제외) 발송됩니다.<br>
											평균 1~3일 이내(영업일 기준) 배송되나, 제주 및 도서 산간지역은 1~2일 정도 더 소요될 수 있습니다.<br>
										</p>
									</td>
								</tr>
								<tr class="upperHr">
									<td class="category"><button type="button" class="btn btn-primary disabled">주문</button></td>
									<td class="question"><p>주문을 했는데 취소하고 싶어요.</p></td>
									<td class="button">
										<i class="fa-solid fa-chevron-down"></i>
									</td>
								</tr>
								<tr>                                        
									<td class="answer" colspan="3">
										<p> 
											'결제 완료' 시에만 주문 취소가 가능합니다.<br>
											'PillSoGood 웹사이트 > 마이페이지 > 주문조회'에서 주문을 취소해주세요.<br>
											주문이 정상적으로 취소되면 결제 수단에 따라 3~5일 정도의 환불 기간이 소요됩니다. <br>
										</p>
									</td>
								</tr>
								<tr class="upperHr">
									<td class="category"><button type="button" class="btn btn-primary disabled">서비스</button></td>
									<td class="question"><p>구독 중에도 건강 설문을 할 수 있나요?</p></td>
									<td class="button">
										<i class="fa-solid fa-chevron-down"></i>
									</td>
								</tr>
								<tr>                                        
									<td class="answer" colspan="3">
										<p> 
											구독 중에도 'PillSoGood 웹사이트에서 건강 설문을 진행하실 수 있습니다.<br>
											<br>
											다만, 건강기능 식품은 최소 3개월 이상 꾸준히 섭취해야 변화를 체감할 수 있기 때문에
											건강 설문을 통해 새로운 영양 성분을 추천받길 원하신다면,<br>
											3개월에서 6개월 이상 꾸준하게 섭취한 후 진행하시는 것을 추천해 드립니다.<br>
										</p>
									</td>
								</tr>
								<tr class="upperHr">
									<td class="category"><button type="button" class="btn btn-primary disabled">제품</button></td>
									<td class="question"><p>과다 섭취하면 안 되는 건강기능식품이 있는지 궁금해요.</p></td>
									<td class="button">
										<i class="fa-solid fa-chevron-down"></i>
									</td>
								</tr>
								<tr>                                        
									<td class="answer" colspan="3">
										<p> 
											모든 건강기능식품은 과다 섭취하지 않는 것이 좋습니다.<br>
											<br>
											특히, 질환이 있는 분이라면 반드시 주치의와 상의하신 후 드시는 것을 권장 드리며,<br>
											만약 드시면서 소화불량이나 메스꺼움, 두통 등의 증상이 지속된다면 섭취를 중단하시는 것이 좋습니다.<br>
											<br>
 											우리 몸은 건강기능식품을 과다 섭취하더라도 체내에서 필요하지 않은 여분의 양은 소변을 통해서 배출되는 것이 일반적입니다.<br>
											<br>
											그러나 지용성 비타민 및 일부 영양성분의 경우 체내에 쌓여 과잉증 및 질환을 유발할 수 있으며,
											이를 해독하는 장기인 간에 무리를 줄 수 있으므로 과다 섭취는 지양해야 합니다.<br>
										</p>
									</td>
								</tr>
								<tr class="upperHr">
									<td class="category"><button type="button" class="btn btn-primary disabled">배송</button></td>
									<td class="question"><p>해외 배송도 가능한가요?</p></td>
									<td class="button">
										<i class="fa-solid fa-chevron-down"></i>
									</td>
								</tr>
								<tr>                                        
									<td class="answer" colspan="3">
										<p> 
											현재 PillSoGood은 국내 배송만 가능합니다.<br>
											추후 해외 배송이 지원되면 공지드리겠습니다. <br>
										</p>
									</td>
								</tr>
								<tr class="upperHr">
									<td class="category"><button type="button" class="btn btn-primary disabled">서비스</button></td>
									<td class="question"><p>건강 설문은 꼭 해야하나요?</p></td>
									<td class="button">
										<i class="fa-solid fa-chevron-down"></i>
									</td>
								</tr>
								<tr>                                        
									<td class="answer" colspan="3">
										<p> 
											PillSoGood은 의사, 약사, 영양학 박사 등으로 구성된 자문단과 건강설문을 설계했습니다.<br>
											건강설문을 진행하면 더욱 정확한 건강 체크와 영양성분 추천이 가능하며, 구체적인 영양 상담이 가능합니다.<br>
										</p>
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
					
					<!-- 질문 클릭시 아코디언 함수 -->
					<script>
						$(function() {
							$(".upperHr").click(function() {

								let $answer = $(this).next().children().children();

								if($answer.css("display") == "none") {

									$(this).nextAll("tr").children(".answer").children("p").slideUp(100);
									$(this).prevAll("tr").children(".answer").children("p").slideUp(100);
									$answer.slideDown(100);

								} else {
									$answer.slideUp(100);
								}
							});
						});
					</script>
					<!-- 영섭 작업 영역 끝 -->
                </div>
				<div style="height: 150px"></div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>