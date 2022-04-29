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
<title>Test3.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>

<div>
	<h1>EL 관련 실습</h1>
	<hr />
</div>

<div>
	<form action="" method="post">
		정수1<input type="text" class="txt" name="su1" /><br />
		정수2<input type="text" class="txt" name="su2" /><br />
		<button type="submit" class="btn1">결과 확인</button>
	</form>
</div>


</body>
</html>