<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage</title>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	
	<h1 style="font-weight:bold;">${ errorMsg }</h1>
	
	<jsp:include page="../common/footer.jsp" />
	
	
</body>
</html>