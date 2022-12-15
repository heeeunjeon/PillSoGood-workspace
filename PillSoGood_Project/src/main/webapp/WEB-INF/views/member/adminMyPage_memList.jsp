<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>ADMIN PAGE 회원 관리</title>
<style>

    div {
       /*  border : 1px solid #78C2AD; */
        box-sizing : border-box;
    }

    /* 전체를 감싸는 wrap */
    .wrap {
        width: 100%;
        /* 전체 길이 개별 커스텀 */
        height: 1400px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    /* 내용 길이 개별 wrap - 350px */
    #content { height: 1050px; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 115px; }
    #content_2_2 { color: black; }

    #header { height: 130px; }

    #content_2_1>p {
        font-size: 35px;
        color: black;
        margin-top: 20px;
        margin-left: 30px;
    }

    /* content 영역 */
    #content>div { height : 100%; float : left; }
    #content_1 { width : 20%; }
    #content_2 { width : 60%; }
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

    /* ----- 회원조회 style ----- */
    /* 검색창 정렬 */
    #admin_menu {
        height: 45px;
        position: relative;
    }
    #search_mem {
        float: right;
        width: 300px;
        position: absolute;
        right: 0;
        bottom: 0;
    }

    /* 검색창, 버튼 글씨 크기 */
    #search_mem>input, #search_mem>button { font-size: small; }

    /* 목록 테이블 */
    #member_list {
        margin-top: 30px;
        color: black;
        text-align: center;
    }
    #member_list>thead { background-color: #78c2ad36; }
    #member_list>tbody td { font-size: small; vertical-align: middle; }

    #member_list>tbody>tr:hover { cursor: pointer; }

</style>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- bootswatch minty -->
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- ajax jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- font-awesome -->
<script src="https://kit.fontawesome.com/6cda7ccd12.js" crossorigin="anonymous"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
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
                            <p>[ 회원 목록 ]</p>
                            <form class="input-group" id="search_mem">
                                <input type="text" class="form-control" name="" placeholder="아이디 / 이름 / 이메일 검색">
                                <button class="btn btn-primary" type="submit">검색</button>
                            </form>
                        </div>
                        
                        <table class="table table-hover" id="member_list" border="1">
                            <thead>
                                <tr>
                                    <th width="10%">No</th>
                                    <th width="15%">아이디</th>
                                    <th width="15%">이름</th>
                                    <th width="30%">이메일</th>
                                    <th width="20%">가입일자</th>
                                    <th width="10%">상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>user01</td>
                                    <td>홍길동</td>
                                    <td>user01@naver.com</td>
                                    <td>2021-12-15</td>
                                    <td>Y</td>
                                </tr>
                                
                                <!-- 10개씩 페이징 -->
                                <tr><td>2</td><td>user01</td><td>홍길동</td><td>user01@naver.com</td><td>2021-12-15</td><td>Y</td></tr>
                                <tr><td>3</td><td>user01</td><td>홍길동</td><td>user01@naver.com</td><td>2021-12-15</td><td>Y</td></tr>
                                <tr><td>4</td><td>user01</td><td>홍길동</td><td>user01@naver.com</td><td>2021-12-15</td><td>Y</td></tr>
                                <tr><td>5</td><td>user01</td><td>홍길동</td><td>user01@naver.com</td><td>2021-12-15</td><td>Y</td></tr>
                                <tr><td>6</td><td>user01</td><td>홍길동</td><td>user01@naver.com</td><td>2021-12-15</td><td>Y</td></tr>
                                <tr><td>7</td><td>user01</td><td>홍길동</td><td>user01@naver.com</td><td>2021-12-15</td><td>Y</td></tr>
                                <tr><td>8</td><td>user01</td><td>홍길동</td><td>user01@naver.com</td><td>2021-12-15</td><td>Y</td></tr>
                                <tr><td>9</td><td>user01</td><td>홍길동</td><td>user01@naver.com</td><td>2021-12-15</td><td>Y</td></tr>
                                <tr><td>10</td><td>user01</td><td>홍길동</td><td>user01@naver.com</td><td>2021-12-15</td><td>Y</td></tr>
                            </tbody>
                        </table>
                        <br>

                        <script>
                            $(function() {
                                $("#member_list>tbody>tr").click(function() {

                                    // 클릭시 상세조회로 이동
                                });
                            });
                        </script>

                        <div>
                            <ul class="pagination pagination-sm">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#">&laquo;</a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">4</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">5</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">&raquo;</a>
                                </li>
                            </ul>
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