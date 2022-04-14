<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send10.jsp)로 부터 데이터(userName) 수신
	// ①
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	
	// 이 페이지에서 수행한 작업 추가
	// ②
	request.setAttribute("message","안녕하소");
	//-- request 객체의 key(message)의 값 안에
	//   『"안녕하소"』를 value 로 넣는 작업 수행 (적재)
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_for.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<h2>포워드</h2>
</div>


<div>
	<!-- <p>이름 : 자비스</p> -->
	<p>이름 : <%=userName %></p>
</div>

	<!-- ※ 포워드 -->
	<!-- ③ -->
	<!-- 『jsp:』 jsp에서만 (html에서는 지원x) 지원하는 액션태그 -->
	<jsp:forward page="Receive10.jsp"></jsp:forward>
	
	




</body>
</html>