<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PillSoGood</title>

<style>

    #noticeEnrollArea{ 

        border: 1px solid gray;
        border-radius: 10px;
        width: 800px;
        margin : auto;
        margin-top : 50px;

    }
    #noticeEnrollForm th {
        text-align: center;
    }

    #noticeEnrollForm {
        margin : 20px;

        
    }

    #noticeEnrollForm td>*  {
        width : 690px;
        box-sizing: border-box;
        border-radius:5px
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
                 <p>
                     <img src="resources/images/Logo.PNG" width="200px" alt=""> 공지사항
                 </p>    
             </div>
             <div id="content_2_2">
                 
                 <form action="insert.no" method="post">

                     <div id="noticeEnrollArea">
                         <table class="table" align="center" id="noticeEnrollForm">
                             <tr>
                                 <th>제목</th>
                                 <td><input type="text" name="noticeTitle" placeholder="제목을 입력하세요"></td>
                             </tr>
                             <tr>
                                 <th>내용</th>
                                 <td><textarea name="noticeContent" id="" cols="40" rows="20" style="resize:none;" placeholder="내용을 입력하세요"></textarea></td>
                             </tr>
                         </table>

                         <br><br>

                         <div align="center" style="margin-bottom : 50px;">
                             <button class="btn btn-primary" type="submit">등록</button>
                             <button class="btn btn-light" type="reset">취소</button>
                         </div>

                     </div>
                     
                 </form>



             </div>

             <div id="content_2_3"></div>
         </div>

         <div id="content_3"></div>
     </div>


     <jsp:include page="../common/footer.jsp" />

        
    </div>


</body>
</html>