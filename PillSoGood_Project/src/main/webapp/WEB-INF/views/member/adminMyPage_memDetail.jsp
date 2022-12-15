<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>ADMIN PAGE 회원 상세조회</title>
<style>

    div {
       /*  border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 100%;
        /* 전체 길이 개별 커스텀 */
        height: auto;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    /* 내용 길이 개별 wrap - 350px */
    #content { height: auto; display:flex; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 10%; }
    #content_2_2 { height:90%; color: black; }

    #header { height: 130px; }

    #content_2_1>p {
        font-size: 35px;
        color: black;
        margin-top: 20px;
        margin-left: 15px;
    }

    /* content 영역 */
    #content>div { height : 100%; float : left; }
    #content_1 { width : 20%; }
    #content_2 { width : 60%; padding-bottom: 200px;}
    #content_3 { width : 20%; }

    body { font-family: 'Noto Sans KR', sans-serif !important; }

    /* ----- 마이페이지 공통 style ----- */
    /* 영역 구분 */
    #content2_2>div { height: 100%; }
    #mypage_navi { width: 20%; padding: 10px; float: left; }
    #mypage_content { width: 80%; padding: 30px; float: left; }

    /* MYPAGE 사이드메뉴바 */
    #mypage_navi>div {
        border: 2px solid #78C2AD;
        border-radius: 5px;
        padding: 15px;
    }
    /* 사이드바의 각 메뉴들 */
    #mypage_navi a {
        text-decoration: none;
        color: black;
    }
    #mypage_navi a:hover { color: #78C2AD; }

    /* 모든 table 공통 너비 */
    #mypage_content table { width: 100% }
    
    /* mypage_content h4, input. select 태그들 글자색 */
    #mypage_content h4, #mypage_content input, #mypage_content select { color: black; }

    /* 부트스트랩 페이징 */
    .pagination { justify-content: center; }

    /* ----- 관리자 공통 style ----- */
    /* 드롭다운 관련 */
    #mypage_navi .nav-link {
        padding: 0px 30px 16px 0px;
    }
    .dropdown-item:hover, .dropdown-item:focus {
        background-color: #78C2AD !important;
        color: white !important;
    }

    /* content 안에 소메뉴 */
    #admin_menu>p {
        font-size: large;
        font-weight: bold;
    }

     /* ----- 회원상세 style ----- */
    /* 목록 테이블 */
    #member_info { margin-top: 20px; }
    #member_info>tbody>tr { height: 50px; }

    /* 처리 버튼 */
    #process_btn>button {
        width: 110px;
        height: 40px;
        margin: 0px 5px;
    }
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
                    <p>ADMIN PAGE</p>
                </div>
                <div id="content_2_2" style="padding-top:10px;">
                    
                    <div id="mypage_navi">
                        <div>
                            <p style="font-size: 20px;"><b style="font-size: 25px;">관리자</b> 님</p>
                            <br>
                            <ul class="nav nav-pills">
                                <li class="nav-item"><a href="" class="nav-link">회원 관리</a></li>
                                <li class="nav-item"><a href="" class="nav-link">제품 관리</a></li>
                                <li class="nav-item"><a href="" class="nav-link">주문 관리</a></li>
                                <li class="nav-item"><a href="" class="nav-link">문의 관리</a></li>
                                <li class="nav-item"><a href="" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button">통계 관리</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">매출 통계</a>
                                        <a class="dropdown-item" href="#">제품 통계</a>
                                        <a class="dropdown-item" href="#">성별/연령 통계</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div id="mypage_content">
                        <h4>회원 관리</h4>
                        <hr>

                        <div id="admin_menu">
                            <p>[ 회원 정보 ]</p>
                        </div>
                        
                        <table id="member_info">
                            <tr>
                                <th width="25%">회원번호</th>
                                <td width="75%">${ m.memberNo }</td>
                            </tr>

                            <tr>
                                <th>아이디</th>
                                <td>${ m.memberId }</td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${ m.memberName }</td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td>${ m.phone }</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>${ m.email }</td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>${ m.gender }</td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td>${ m.addressZip }</td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>${ m.address1 }</td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>${ m.address2 }</td>
                            </tr>
                            <tr>
                                <th>출생연도</th>
                                <td>${ m.memberBirthYear }</td>
                            </tr>
                            <tr>
                                <th>키</th>
                                <td>${ m.height } cm</td>
                            </tr>
                            <tr>
                                <th>몸무게</th>
                                <td>${ m.weight } kg</td>
                            </tr>
                            <tr>
                                <th>가입일</th>
                                <td>${ m.memberEnrollDate }</td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <c:choose>
                                	<c:when test="${ m.memberStatus.equals('Y') }">
                                		<td>가입</td>
                                	</c:when>
                                	<c:otherwise>
                                		<td>탈퇴</td>
                                	</c:otherwise>
                                
                                </c:choose>
                            </tr>

                        </table>
                        <br><br>

                        <div id="process_btn" align="center">
                            <button type="button" class="btn btn-warning">정보수정</button>
                            <button type="button" class="btn btn-danger">탈퇴처리</button>
                        </div>

                    </div>

                </div>

            </div>
            <div id="content_3"></div>
        </div>
        
    </div>

    <div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    
</body>
</html>