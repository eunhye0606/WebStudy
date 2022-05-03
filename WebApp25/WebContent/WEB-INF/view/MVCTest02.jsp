<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVCTest02.jsp</title>
<link rel="stylesheet" href="<%=cp%>css/main.css" type="text/css" >
</head>
<body>
<div>
	<h1>MVC 관련 실습 3</h1>
	<hr />
</div>

<div>
	<!-- 1부터 100까지의 결과물을 가지고 클라이언트 만나기 -->
	
	<!-- 컨트롤러로부터 수신한 결과 -->
	<ul>
		<c:forEach var="i" items="${lists }">
			<li>${i }</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>