<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 작성</title>
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
    #header { height: 130px; }


    #content { height: 1450px; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 115px; float: left; }
    #content_2_2 { height: 90%; float: left; }

    
    #content_2_1>p {
        font-size: 35px;
        color: black;
        margin-top: 40px;
        margin-left: 30px;
    }

    #content_2_2>div>table>thead tr { border-bottom: solid lightgray; }
    #content_2_2>div>table { color: black; }

    #content_2_2>div { width: 100%; height: auto; }
    #content_2_2>div>table { width: 60%; }
    
    #content_2_2>div>table>tbody table { width: 90%; font-weight: bold; }
    #content_2_2>div>table>tbody table tr { height: 30px; }
    #content_2_2>div>table>tbody table>tfoot table { width: 60%; }


    #choiceA>div { height: 100%; width: 90%; border-radius: 10px; } 



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
                    <p>주문서 작성</p>
                </div>
                <div id="content_2_2" align="center">
                    <div>
                        <table>
                            <thead>
                                <tr height="50px">
                                    <th align="left" colspan="4">주문 제품 정보</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td rowspan="2" align="center" width="150px"><div style="width: 80px; height: 80px;"><img src="image/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                    <td height="30px">눈건강엔</td>
                                    <td rowspan="2" width="100px" align="right">1개</td>
                                    <td rowspan="2" align="right" style="font-size: 23px;" width="150px"><b>24,000원</b></td>
                                </tr>
                                <tr style="border-bottom: 1px solid lightgray;">
                                    <td style="font-size: 20px;"><b>루테인</b></td>
                                </tr>
                                <tr>
                                    <td rowspan="2" align="center" width="150px"><div style="width: 80px; height: 80px;"><img src="image/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                    <td height="30px">눈건강엔</td>
                                    <td rowspan="2" width="100px" align="right">1개</td>
                                    <td rowspan="2" align="right" style="font-size: 23px;" width="150px"><b>24,000원</b></td>
                                </tr>
                                <tr style="border-bottom: 1px solid lightgray;">
                                    <td style="font-size: 20px;"><b>루테인</b></td>
                                </tr>
                                <tr>
                                    <td rowspan="2" align="center" width="150px"><div style="width: 80px; height: 80px;"><img src="image/pill01.png" style="width:100%; height: 100%; margin: auto; object-fit: contain;"></div></td>
                                    <td height="30px">눈건강엔</td>
                                    <td rowspan="2" width="100px" align="right">1개</td>
                                    <td rowspan="2" align="right" style="font-size: 23px;" width="150px"><b>24,000원</b></td>
                                </tr>
                                <tr style="border-bottom: 1px solid lightgray;">
                                    <td style="font-size: 20px;"><b>루테인</b></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="height: 100px;"></div>
                    <div>
                        <table>
                            <thead>
                                <tr height="50px">
                                    <th align="left">배송지 정보</th>
                                </tr>
                            </thead>
                            <tbody>
                                <table style="width: 40%;" >
                                    <tr>
                                        <td>이름</td>
                                    </tr>
                                    <tr>
                                        <td><input class="form-control"></td>
                                    </tr>
                                    <tr>
                                        <td>전화번호</td>
                                    </tr>
                                    <tr>
                                        <td><input class="form-control"></td>
                                    </tr>
                                    <tr>
                                        <td>우편번호</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <input type="text" class="form-control" name="zip" value="" id="sample6_postcode" maxlength="5" placeholder="우편번호" style="width:235px; display:inline-block;">
                                            <input type="button" name="address_search" class="btn btn-primary" style="display:inline-block;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>주소</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3"><input type="text" class="form-control" name="address1" value="" id="sample6_address" placeholder="주소"></td>
                                    </tr>
                                    <tr>
                                        <td>상세주소</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" class="form-control" name="address2" value="" id="sample6_detailAddress" placeholder="상세주소" style="display:inline-block;">
                                        </td>
                                    </tr>
                                </table>
                            </tbody>
                        </table>
                    </div>
                    <div style="height: 100px;"></div>
                    <div>
                        <table>
                            <thead>
                                <tr height="60px">
                                    <th align="left" colspan="4">결제 예정 금액</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div id="choiceA" style="padding: 15px;" align="center">
                                            <div style="border: 1px solid #78C2AD;" >
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <td>총 제품 금액</td>
                                                            <td align="right">24,000원</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>정기 구독 10% 할인</td>
                                                            <td align="right">4,800원</td>
                                                        </tr>
                                                        <tr>
                                                            <td>배송비</td>
                                                            <td align="right">0원</td>
                                                        </tr>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr style="border-top: 1px solid lightgray; font-size: 20px;">
                                                            <td>최종 결제 금액</td>
                                                            <td align="right">19,200원</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" height="80px">
                                                                <div align="center">
                                                                    <table style="background-color:rgb(210, 241, 232);" height="60px">
                                                                        <tr align="center">
                                                                            <th>다음 결제 예정일</th>
                                                                            <th>2022.12.23</th>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div><button type="button" class="btn btn-primary btn-lg" style="width: 200px;">결제하기</button></div>




                </div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>


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
    
</body>
</html>