<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 작성</title>
<!-- daum 우편번호검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>

    div {
        /* border : 1px solid #78C2AD; */
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
    }

    /* content 영역 */
    #content>div { height : 100%; float : left; }
    #content_1 { width : 25%; }
    #content_2 { width : 50%; }
    #content_3 { width : 25%; }

    body { font-family: 'Noto Sans KR', sans-serif !important; }
	
	/* 주문서 작성 */
	#content_2_2>table {
		width: 100%;
		color: black;
	}
	#content_2_2>table>thead { border-bottom: solid lightgray; }
	
	/* 주문제품 정보 */
	#bill_product>tbody {  }
	#bill_product>tbody tr { height: 50px; }
	.ptitle { padding-left: 20px; }
	
	
	/* 배송지 정보 */
	#bill_delivery>tbody tr { height: 50px; }
	#bill_delivery .form-control {
		display: inline-block;
		width: 300px;
	}
	
	#address_btn {
		display:inline-block;
		vertical-align: top;
		margin-left: 11px;
		width: 150px;
	}
	#address1, #address2 { width: 465px!important; }
	
	/* 결제 안내 */
	#bill_price>tbody div {
		width: 50%;
		margin: auto;
		border: 1px solid #78C2AD;
		border-radius: 10px;
	}
	#price_info {
		width: 90%;
		margin: 15px;	
	}
	#price_info tr { height: 40px; }
	#price_info thead th, #price_info tbody th { text-align: right; }
	#price_info tbody>tr {
		border-top: 1px solid #78C2AD;
		font-size: 25px;
		height: 60px;
	}
	#price_info tfoot>tr { height: 100px;}
	#price_info tfoot div {
		width: 70%;
		background-color: #78c2ad36;
		border: none;
		border-radius: 10px;
		text-align: center;
		padding: 20px;
	}
	
	/* 결제 버튼 */
	#bill_btn { margin-top: 50px; }
	#bill_btn>button {
		width: 250px;
		height: 55px;
	}
	
	/* 카드정보 입력 모달 */
	.modal-body>table tr { height: 60px; }
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
                    <p>주문서 작성</p>
                </div>
                <div id="content_2_2">
                    <table id="bill_product">
                        <thead>
                            <tr height="50px">
                                <th align="left">주문 제품 정보</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr style="height: 10px!important;"></tr>
                            <tr>
                                <td rowspan="2" align="center" width="10%;"><img src="resources/images/pill01.png" width="100px" heigth="100px"></td>
                                <td width="60%;" class="ptitle">눈건강엔</td>
                                <td rowspan="2" width="10%;" align="right">1개</td>
                                <td rowspan="2" align="right" style="font-size: 23px;" width="20%;"><b>24,000원</b></td>
                            </tr>
                            <tr style="border-bottom: 1px solid lightgray;">
                                <td style="font-size: 20px;" class="ptitle"><b>루테인</b></td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="height: 100px;"></div>
                    <table id="bill_delivery">
                        <thead>
                            <tr height="50px">
                                <th align="left">배송지 정보</th>
                            </tr>
                        </thead>
                        <tbody>
	                        <tr style="height: 10px!important;"></tr>
	                        <tr>
	                            <td>이름</td>
	                        </tr>
	                        <tr>
	                            <td><input class="form-control" value="${ loginUser.memberName }" readonly></td>
	                        </tr>
	                        <tr>
	                            <td>전화번호</td>
	                        </tr>
	                        <tr>
	                            <td><input class="form-control" value="${ loginUser.phone }" readonly></td>
	                        </tr>
	                        <tr>
	                            <td>우편번호</td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <input type="text" class="form-control" name="addressZip" value="${ loginUser.addressZip }" id="address_zip" placeholder="우편번호">
	                                <input type="button" class="btn btn-primary" id="address_btn" onclick="getAddress();" value="우편번호 찾기">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>주소</td>
	                        </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" name="address1" value="${ loginUser.address1 }" id="address1" placeholder="도로명 주소"></td>
	                        </tr>
	                        <tr>
	                            <td>상세주소</td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <input type="text" class="form-control" name="address2" value="${ loginUser.address2 }" id="address2" placeholder="상세 주소 (선택)" style="display:inline-block;">
	                            </td>
	                        </tr>
                        </tbody>
                    </table>
                    
                    <script>
				        /* 우편번호 검색 API */
				        function getAddress() {
				            new daum.Postcode({
				                oncomplete: function(data) {
				                	
				                	// 지번을 선택해도 도로명으로만 표시
				                	var address = data.roadAddress;
				                	
				                	// 건물명이 있을 경우 추가
				                	if(data.buildingName != '') {
				                		address += ' (' + data.buildingName + ')';
				                	}
				                	
				                	// 우편번호
				                	$("#address_zip").val(data.zonecode).attr("readonly", true);
				                	// 선택한 주소
				                	$("#address1").val(address).attr("readonly", true);
				                	
				                	// 커서 포커스
				                	$("#address2").focus();
				    
				                }
				            }).open();
				        }
				    </script>
                    
                    <div style="height: 100px;"></div>
                    <table id="bill_price">
                        <thead>
                            <tr height="50px">
                                <th align="left">결제 예정 금액</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr style="height: 30px!important;"></tr>
                            <tr><td><div align="center">
                                <table id="price_info">
                                	<thead>
                                        <tr>
                                            <td>총 제품 금액</td>
                                            <th>24,000 원</th>
                                        </tr>
                                        <tr>
                                            <td>정기 구독 10% 할인</td>
                                            <th>4,800 원</th>
                                        </tr>
                                        <tr>
                                            <td>배송비</td>
                                            <th>0원</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<tr>
                                    		<td>최종 결제 금액</td>
                                    		<th>19,200 원</th>
                                    	</tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                        	<th colspan="2"><div>다음 결제 예정일&nbsp;&nbsp;&nbsp;2022.12.23</div></th>
                                        </tr>
                                    </tfoot>
                                </table>
	                            </div></td></tr>
                        </tbody>
                    </table>
                    
                    <div id="bill_btn" align="center">
                    	<c:choose>
                    		<c:when test="${ empty loginUser }">
                    			<!-- 정기결제 -->
                    			<button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#subscription">구독하기</button>
                    			
                    			<!-- 카드정보 입력폼 모달 -->
                    			<div class="modal" tabindex="-1" id="subscription">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">카드 정보 입력</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<form action="" method="post">
											<div class="modal-body">
												<table id="customer_uid">
													<tr>
														<th width="40%;">카드 번호</th>
														<td width="60%;"><input id="card_number" class="form-control" type="text" maxlength="19" placeholder="XXXX-XXXX-XXXX-XXXX (- 포함)" pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}"></td>
													</tr>
													<tr>
														<th>유효기간</th>
														<td><input id="expiry" class="form-control" type="text" maxlength="7" placeholder="YYYY-MM (- 포함)" pattern="[0-9]{4}-[0-9]{2}"></td>
													</tr>
													<tr>
														<th>생년월일</th>
														<td><input id="birth" class="form-control" type="text" maxlength="6" placeholder="YYMMDD" pattern="[0-9]{6}"></td>
													</tr>
													<tr>
														<th>비밀번호 앞 두자리</th>
														<td><input id="pwd_2digit" class="form-control" type="text" maxlength="2" placeholder="XX" pattern="[0-9]{2}"></td>
													</tr>
													<tr>
														<th colspan="2" style="color: red; font-size: small; height: 80px; text-align: center;">유효하지 않은 카드정보를 입력할 경우 결제가 거절될 수 있습니다.<br>결제 전 확인 부탁드립니다.</th>
													</tr>
												</table>
											
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
												<button type="button" class="btn btn-primary" onclick="subscription();">정기구독 결제하기</button>
											</div>
											</form>
										</div>
									</div>
								</div>
                    		</c:when>
                    		<c:otherwise>
                    			<!-- 일반결제 -->
                    			<button type="button" class="btn btn-primary btn-lg" onclick="regular();">결제하기</button>
                    		</c:otherwise>
                    	</c:choose>
                    </div>

                </div>
                <div id="content_2_3"></div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>

    <script>
    	function regular() {
    		
    		var orderNo = new Date().getTime() + (parseInt(Math.random() * 90000) + 10000);
    		
    		IMP.init("imp00813715"); // 가맹점 식별코드 초기화
    		
    		// IMP.request_pay(param, callback)
    		IMP.request_pay({ // param
    			pg: "nice", // PG사 코드값
    			pay_method: "card", // 결제방법
    			merchant_uid: orderNo, // 가맹점 주문번호 (중복X, 한 주문번호로 재결제 불가)
    			name: "상품명", // 결제창에 노출될 상품명 (16자 이내 권장), 0번째 인덱스 상품명 + 외 n개
    			amount: 100, // 결제할 금액
    			// buyer_name: "${ loginUser.memberName }", // 구매자 이름
    			// buyer_email: "${ loginUser.email }" // 구매자 이메일
    		}, rsp => { // callback
    			
    			if(rsp.success) { // 결제 성공
    				
    				// ORDERS 테이블에 추가
    				$.ajax({
    					url: "insert.or",
    					data: {
    						orderNo: rsp.merchant_uid,
    						orderDate: rsp.paid_at,
    						orderPrice: rsp.paid_amount,
    						orderReceipt: rsp.receipt_url
    					},
    					type: "post",
    					success: result => {
    						
    						// alert
    						// 주문완료 창으로 포워딩
    					},
    					error: () => {
    						
    						// error 페이지
    					}
    				});
    				
    			} else { // 결제 실패
    				
    				
    			}
    		});
    	}
    	
		function subscription() {
			
			// REST API token 발급
			$.ajax({
				url: "token.do",
				type: "post",
				success : result => {
					
					var token = result;
					var orderNo = new Date().getTime() + (parseInt(Math.random() * 90000) + 10000);
					
					// 빌링키 발급, 저장 동시에 첫 결제
					$.ajax({
						url: "billing.do",
						type: "post",
						data: {
			    			name: "상품명",
			    			amount: 100,
			    			token: token,
							card_number: $("#card_number").val(),
							expiry: $("#expiry").val(),
							birth: $("#birth").val(),
							pwd_2digit: $("#pwd_2digit").val(),
						},
						success : result => {
							
							console.log(result);
							console.log(result.response.paid_at)
							
							// 결제 예약
							$.ajax({
								url: "schedule.do",
								type: "post",
								data: {
									token: token,
									customer_uid: result.response.customer_uid,
									name: result.response.name,
									amount: result.response.amount,
									time: result.response.paid_at
								},
								success: result => {
									
									console.log(result);
								},
								error: () => {
									console.log("schdule ajax 통신 실패");
								}
								
							});
							
						},
						error : () => {
							console.log("billing ajax 통신 실패");
						}
					});
					
					// 빌링키 발급 및 저장 customer_uid
					/*
					$.ajax({
						url: "billing.do",
						type: "post",
						data: {
							token: token,
							card_number: $("#card_number").val(),
							expiry: $("#expiry").val(),
							birth: $("#birth").val(),
							pwd_2digit: $("#pwd_2digit").val()
						},
						success : result => {
							
							console.log(result);
						},
						error : () => {
							console.log("billing ajax 통신 실패");
						}
					});
					*/
					
				},
				error : () => {
					console.log("token ajax 통신 실패");
				}
			});
    	}
    </script>
    
</body>
</html>