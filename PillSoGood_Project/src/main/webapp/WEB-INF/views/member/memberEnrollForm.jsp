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

    div {
        /* border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 98%;
        height: 1530px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: 1150px; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 10%; float: left; }
    #content_2_2 { height: 90%; float: left; }
    /* #content_2_3 { height: 10%; float: left; } */

    #header { height: 130px; }

    #content_2_1>p {
        font-size: 35px;
        color: rgb(0, 0, 0);
        margin-top: 20px;
        margin-left: 30px;
        text-align : center;
        font-weight: bold;
    }

    /* content 영역 */
    #content>div { height : 100%; float : left; }
    #content_1 { width : 20%; }
    #content_2 { width : 60%; }
    #content_3 { width : 20%; }

    body { font-family: 'Noto Sans KR', sans-serif !important; }

    /* 여기부터는 내가 준 스타일 영역 */
    #memberEnrollFrom {
        box-sizing: border-box;
        height: 700px;
        width: 400px;
        margin-top: 50px;
    }

</style>

<!-- 카카오 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
                    <p>회원가입</p>
                </div>
                <div id="content_2_2">
                    <form action="insert.me" method="post" id="enrollForm">
                        <table id="memberEnrollForm" align="center" >
                            <tr>
                                <th align="left" colspan="3">아이디</th>
                            </tr>
                            <tr style="display: inline-block;">
                                <td colspan="3">
                                    <input class="form-control" type="text" placeholder="아이디를 입력" maxlength="20" style="width: 300px;" required name="memberId" id="memberId">
                                </td>
                                <td>
                                    <button class="btn btn-secondary" style="width:100px" name="idCheck" id="idCheckbtn">중복확인</button>

                                </td>
							<tr>
								 <td>
                                	<div id="checkResult" style="font-size:0.8em; display:none;"></div>
                                </td>
                                    
							</tr>
                            </tr>
                            <tr>
                                <th colspan="3">비밀번호</th>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <input type="password" class="form-control" placeholder="비밀번호를 입력" maxlength="20" style="width:400px" required name="memberPwd" id="memberPwd">
                                </td>
                            </tr>
                            <tr>
                                <th colspan="3">비밀번호 재확인</th>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <input type="password" class="form-control" placeholder="동일한 비밀번호를 재입력" style="width: 400px;" name="checkPwd" id="checkPwd">
                                 	<div id="checkResult2" style="font-size:0.8em; display:none;"></div>	
                                </td>
                            </tr>
                            <tr>
                                <th colspan="3">이름</th>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <input type="text" class="form-control" placeholder="이름 입력" style="width: 400px;" required name="memberName" id="memberName">
                                </td>
                            </tr>
                            <tr>
                                <th colspan="3">휴대폰번호</th>
                            </tr>
                            <tr>
                                <td colspan="3"> 
                                    <input type="tel" class="form-control" placeholder="휴대폰 번호 '-' 없이 입력" maxlength="11" style="width: 400px;" required name="phone" id="phone">
                                </td>
                            </tr>
                            <tr>
                                <th colspan="3">이메일</th>
                            </tr>
                            <tr style="display: inline-block;">
                                <td>
                                    <input type="text" class="form-control" placeholder="이메일 입력" style="width: 190px;" required name="email" id="email">
                                </td>
                                <td width="10px">@</td>
                                <td>
                                    <select class="form-select" style="width: 190px;">
                                        <option value="naver.com">naver.com</option>
                                        <option value="google.com">google.com</option>
                                        <option value="kakao.com">kakao.com</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>주소</th>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" name="addressZip" id="address_zip" placeholder="우편번호" style="display:inline-block; width: 67.5%;">
	                                <input type="button" class="btn btn-secondary" id="address_btn" onclick="getAddress();" value="우편번호 찾기" style="display:inline-block; vertical-align: top;">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" name="address1" id="address1" placeholder="도로명 주소">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" name="address2" id="address2" placeholder="상세 주소 (선택)" >
                                </td>
                            </tr>
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

                        <div align="center" style="padding: 20px;">
                            <button class="btn btn-secondary" id="enrollbtn" type="submit" disabled>가입완료</button>
                        </div>
                    </form>

                    
                </div>
                <div id="content_2_3"></div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    
   <script>
   	$(function() {
   		
   		// 아이디를 입력받는 input 요소 객체를 변수에 담아두기 => keyup 이벤트 걸기
   		var $idInput = $("#enrollForm input[name=memberId]");
   		
   		
   		
   		$idInput.keyup(function() {
   			
   			$("#idCheckbtn").on("click", function() {
   			
   			// 우선 최소 5글자 이상으로 아이디값이 입력되어 있을 때만 ajax 요청
   			// => 쿼리문의 갯수가 한정되어있을 수 있기 때문
   			if($idInput.val().length >= 5) {
   				
   				// ajax 를 요청하여 중복체크
   				$.ajax({
   					url : "idCheck.me",
   					data : {checkId : $idInput.val()},
   					success : function(result) {
   						
   						// console.log(result);
   						
   						if(result == "NNNNN") { // 사용 불가능
   							
   							// 빨간색 메세지 출력
   							$("#checkResult").show();
   							$("#checkResult").css("color", "red").text("사용할 수 없는 아이디입니다.");
   							
   							// 버튼 비활성화
   							$("#enrollForm button[type=submit]").attr("disabled", true);
   							
   						} else { // 사용 가능
   							
   							// 초록색 메세지 출력
   							$("#checkResult").show();
   							$("#checkResult").css("color", "green").text("사용하실 수 있는 아이디입니다.");
   							
   							// 버튼 활성화
   							$("#enrollForm button[type=submit]").attr("disabled", false);
   						}
   					},
   					error : function() {
   						console.log("아이디 중복 체크용 ajax 통신 실패!");
   					}
   				});
   			} else { // 5글자 미만일 때 => 버튼 비활성화, 메세지 내용 숨기기
   				
   				$("#checkResult").hide();
   				$("#enrollForm button[type=submit]").attr("disabled", true);
   				}
   			
   			});
   		});
   	});
   </script>

</body>
</html>