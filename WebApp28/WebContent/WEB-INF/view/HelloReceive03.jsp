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
<title>HelloReceive03.jsp</title>
<link rel="stylesheet" href="<%=cp%>css/main.css" type="text/css" >
</head>
<body>
<div>
	<h1>결과 수신 페이지</h1>
	<h2>HelloReceive01.jsp</h2>
	<hr />
</div>

<div>
	<ul>
		<!-- param으로 넘긴건 param 으로 셋어트리뷰트는 그냥 -->
		<li><b>First Name : ${firstName }</b></li>
		<li><b>Last Name : ${lastName } </b></li>
	</ul>
</div>
</body>
</html>