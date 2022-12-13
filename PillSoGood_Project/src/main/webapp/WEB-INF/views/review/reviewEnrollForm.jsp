<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>

    div {
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
    #content_2_1 { height: 1%; float: left; }
    #content_2_2 { height: 80%; float: left; }
    #content_2_3 { height: 10%; float: left; }

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

    .innerContent { 
      display: flex;
      position:relative;
      top: 5%;
      left: 5%;
      margin-top: 10px;
      margin-bottom: 10px;
      }

      .innerContent {
        padding: 40px;
        padding-top: 60px;
        border-radius: 15px;
        border-color: rgba(128, 126, 126, 0.541);
      }

      #title {
        width: 900px;
        box-sizing: border-box;
        margin-top: 10px;
        margin-bottom: 10px;
      }

      #content{
        margin-top: 10px;
        margin-bottom: 10px;
      }

      #select {
        width: 200px;
      }

      .btnArea {
        padding-top: 60px;
        padding-bottom: 30px;
      }
      
      td>p {
        margin-bottom: 7px;
        padding-left: 13px;
      }
      
      i {
      	cursor: pointer;
      }

	  label {
	  	width: 100px;
	  }
	  
	  input, textarea {
	  	width:800px;
	  }
</style>

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
                <!-- 로고 영역 -->
                <div class="logoArea">
                      <jsp:include page="../common/logo.jsp" />
                    <p style="display: inline; font-size: 20px;">고객 후기</p>
                </div>
              </div>

              <div id="content_2_2">
                <div class="innerContent" style="border: 2px solid;">
                  <form id="enrollForm" method="post" action="insert.re" enctype="multipart/form-data">
                    <fieldset>
                      <table algin="center" class="reviewForm">

                            <tr>
                                <td colspan="2">
                                    <span style="font-size: 16px;"><b>나중구현) orders 한 건의 주문 목록 String 컬럼</b></span>
                                    <span style="font-size: 14px;">나중구현) 정기구독 한 팩 서비스</span>
                                </td>
                            </tr>

                            <tr>
                                <td><label for="title">제목</label></td>
                                <td><input type="text" class="form-control" name="reviewTitle" required></td>
                            </tr>
                            
                            <tr>
                                <td><label>별점</label></td>
                                <td id="starTd">
                                    <i class="fa-solid fa-star" id="1"></i>
                                    <i class="fa-solid fa-star" id="2"></i>
                                    <i class="fa-solid fa-star" id="3"></i>
                                    <i class="fa-solid fa-star" id="4"></i>
                                    <i class="fa-solid fa-star" id="5"></i>
                                	<input id="reviewGrade" type="hidden" name="reviewGrade">
                                </td>
                                
                                <script>
		
									$(function() {
										
										var reviewGrade1 = Number($("#1").attr('id'));
										var reviewGrade2 = Number($("#2").attr('id'));
										var reviewGrade3 = Number($("#3").attr('id'));
										var reviewGrade4 = Number($("#4").attr('id'));
										var reviewGrade5 = Number($("#5").attr('id'));
										
										$("#starTd>i").click(function() {
											// int reviewGrade 뽑기							
											str = $(this).attr('id'); // id="1", "2", ... -> str
											
											$("#reviewGrade").val(str); // input value 에 str 넣음(String 상태)
											var reviewGrade = Number($("#reviewGrade").val()); // String -> int
											
											// 시각화
											if(reviewGrade == 1) {
												$("#starTd>i").attr('style', 'color:#888888;');
												$("#1").attr('style', 'color:#78C2AD;');
											}
											else if (reviewGrade == 2) {
												$("#starTd>i").attr('style', 'color:#888888;');
												$("#1, #2").attr('style', 'color:#78C2AD;');
											}
											else if (reviewGrade == 3) {
												$("#starTd>i").attr('style', 'color:#888888;');
												$("#1, #2, #3").attr('style', 'color:#78C2AD;');
											}
											else if (reviewGrade == 4) {
												$("#starTd>i").attr('style', 'color:#888888;');
												$("#1, #2, #3, #4").attr('style', 'color:#78C2AD;');
											}
											else if (reviewGrade == 5) {
												$("#starTd>i").attr('style', 'color:#78C2AD;');
											}
										});
									});
								</script>
                            </tr>
                            
                            <tr>
                                <td><label for="content">내용</label></td>
                                <td><textarea class="form-control" style="resize:none;" name="reviewContent" required></textarea></td>
                            </tr>
							
                            <tr>
                                <td><label for="upfile">썸네일 사진</label></td>
                                <td><input type="file" id="upfile1" class="form-control-file border" name="upfile"></td>
                            </tr>
                            <tr>
                                <td><label for="upfile">사진</label></td>
                                <td><input type="file" id="upfile2" class="form-control-file border" name="upfile"></td>
                            </tr>  
                    </table>  
                    <div align="center" class="btnArea">
                    	<input type="hidden" name="memberNo" class="form-control" value="${ loginUser.memberNo }">
                        <button type="submit" class="btn btn-primary">등록</button>
                        <button type="reset" class="btn btn-light">취소</button>
                    </div>
                  </fieldset>
                </form>
              </div>

         </div>
            </div>
            <div id="content_2_3"></div>
            
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    
</body>
</html>