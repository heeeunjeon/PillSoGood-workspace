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
                                    <input type="text" class="form-control" id="sample6_postcode" maxlength="5" placeholder="우편번호" style="width:200px; display:inline-block;" name="addressZip">
                                    <input type="button" class="btn btn-light" name="address_search" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" placeholder="주소" id="sample6_address" name="address1">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" placeholder="상세주소" id="sample6_detailAddress" name="address2">
                                </td>
                            </tr>
                        </table>
                        
                        <script>
                            /* 우편번호 검색 API */
                            function sample6_execDaumPostcode() {
                                new daum.Postcode({
                                    oncomplete: function(data) {
                                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                        
                                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                        var addr = ''; // 주소 변수
                                        var extraAddr = ''; // 참고항목 변수
                        
                                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                            addr = data.roadAddress;
                                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                            addr = data.jibunAddress;
                                        }
                        
                                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                        if(data.userSelectedType === 'R'){
                                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                                extraAddr += data.bname;
                                            }
                                            // 건물명이 있고, 공동주택일 경우 추가한다.
                                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                            }
                                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                            if(extraAddr !== ''){
                                                extraAddr = ' (' + extraAddr + ')';
                                            }
                                            // 조합된 참고항목을 해당 필드에 넣는다.
                                            document.getElementById("sample6_extraAddress").value = extraAddr;
                                        
                                        } else {
                                            document.getElementById("sample6_extraAddress").value = '';
                                        }
                        
                                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                        document.getElementById('sample6_postcode').value = data.zonecode;
                                        document.getElementById("sample6_address").value = addr;
                                        // 커서를 상세주소 필드로 이동한다.
                                        document.getElementById("sample6_detailAddress").focus();
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