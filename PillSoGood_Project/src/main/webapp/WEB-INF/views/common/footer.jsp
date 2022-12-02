<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>
    <style>

        .footerContent td { 
            font-family: 'Noto Sans KR', sans-serif !important; 
            font-size: 0.8em;
        }

        .innerFooter {
            display: block;
            margin: 0 auto;
        }
        .footerContent { margin: auto; }
        

        /*
        .innerFooter {
            padding-bottom: 50px;
            padding-top: 20px;
        }
        */
        .footer {
            background-color: rgba(234, 235, 237, 0.961);
            position: relative;
			height : 100%;

        }
        
        .innerFooter {
            left: 50%;
        }

        /* img {        
            border: 1px solid;
            width: 150px;
            height: 40px;
            position: relative;

        } */

        /* 전체를 감싸는 wrap */
        .footerwrap {
        width: 100%;
        height: 270px;
        margin : auto;
        }


    </style>
</head>
<body>
    <div class="footerwrap">
    <div class="footer">
        <div class="innerFooter">
            <table class="footerContent">
                <tr>
                    <td style="padding-left: 90px;">
                        <!-- <img src="/WebContent/WEB-INF/resources/logo.PNG"> -->
                        <jsp:include page="logo.jsp" />
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 90px;">
                        나만을 위한 맞춤 영양제 구독 서비스 </td>
                    <td style="padding-left: 220px;">회사소개 | 1:1 문의 | FAQ</td>
                </tr>
                <td colspan="2"><br></td>
                <tr>
                    <td style="padding-left: 90px;">   (x)PillSoGood <br>
                        xxxxx xxxx xxxx 295 xxxx xxxx 12x <br>
                        xxxxx 220-88-43130 <br>
                        xxxxxxx : 2018-xxxx-1118 <br>
                        xxxxxxx xxxx : x 2015-0107028x <br>
                    </td>
                    <td style="padding-left: 220px;">
                        고객센터 ><br><br>
                        평일 오전 10:00 ~ 오후 17:00 내에 빠른 답변이 가능합니다. <br>
                        (점심시간 12:00~14:00)
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left: 100px;">
                        <br>
                        Copyright 2022 PillSoGood Allright reserved.
                    </td>
                </tr>

            </table>
        </div> 
    </div>
    </div>
</body>
</html>