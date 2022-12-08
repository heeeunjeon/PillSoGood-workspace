<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        height: 1530px;
        margin : auto;
    }

    .wrap>div { width : 100%; }

    #navigator2 { height: 100px; }

    #content { height: 1000px; }
    #content_2>div { width: 100%; }
    #content_2_1 { height: 10%; float: left; }
    #content_2_2 { height: 80%; float: left; }
    #content_2_3 { height: 10%; float: left; }

    #header { height: 130px; }

    #content_2_1>p {
        font-size: 35px;
        color: black;
        margin-top: 20px;
        margin-left: 30px;
        text-align : center;
        font-weight: bold;
    }

    /* content 영역 */
    #content>div { height : 100%; float : left; }
    #content_1 { width : 20%; }
    #content_2 { width : 60%; color: }
    #content_3 { width : 20%; }

    body { font-family: 'Noto Sans KR', sans-serif !important; }

    /* 여기부터는 내가 준 스타일 영역 */
    #search_id_main_text {
        font-size: 35px;
        color : rgb(40, 40, 40);
        font-weight: bold;
        padding: 20px;
        text-align: center;
    }

    #search_id_text {
        color : rgb(40, 40, 40);
        display: inline-block;
        padding-top: 30px;
        padding-bottom: 30px;
        width: 100%;
        text-align: center
    }

    #searchId {
        padding: 50px;
        box-sizing : border-box;
        width: 100%;
        display: inline-block;
    }

    #searchId table {
        height: 100px;
        color : rgb(40, 40, 40);
        
    }
    





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
      <jsp:include page="../common/menubar.jsp" />
        <div id="navigator2"></div>
        <div id="header"></div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2">
                <div id="content_2_1">
                    <p></p>
                </div>
                <div id="content_2_2">
                    <div id="search_id_main_text">아이디 찾기</div>
                    <div id="search_id_text">
			                        회원가입때 등록하신 <br>
			                        이름과 이메일을 입력해주세요.
                    </div>
                    
                    <form action="findId.me" method="post">
                        <div id="searchId" >
                            <table align="center">
                                <tr>
                                    <th width="80px">이름</th>
                                    <td>
                                        <input class="form-control" type="text" placeholder="이름 입력" maxlength="10" size="30" id="memberName" name="memberName">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                        <input type="password" class="form-control" placeholder="이메일 입력" maxlength="20" id="email" name="email">
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div></div>

                        <div align="center">
                            <button class="btn btn-secondary" style="width: 400px; height: 50px;" id="findIdbtn">다음</button>
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
		function findId_click() {
			
			$("#findIdbtn").on("click", function() {
				
				var memberName = $('#memberName').val()
				var email = $('#email').val()
				
				$.ajax({
					url : "",
					type : "POST",
					data:{"memberName":memberName, "email":email},
					success:function(data) {
						if(data == 0) {
							$('#successId').text("입력하신 정보를 확인해주세요.");
							$('#memberName').val('');
							$('#email').val('');
						} else {
							$('#successId').text(data);
							$('#memberName').val('');
							$('#email').val('');
						}
					},
					
					error:function() {
						alert("아이디 찾기 실패");
					}
				});
			};
			
		};
	</script>
    
</body>
</html>