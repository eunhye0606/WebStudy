<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send10_re.jsp 또는 Send10_for.jsp)부터 데이터(userName, message) 수신
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	// getAttribute()는 object 반환이라서 String으로 다운캐스팅.
	String message = (String)request.getAttribute("message");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<h2>최종 수신 페이지(Receive10.jsp)</h2>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<p>내용 : <%=message %></p>
</div>

<div>
	<h3>
		관찰1<br>
		리다이렉트 결과 <br>
		1. 주소창은 Receive10.jsp<br>
		2. 이름, 내용 null
	</h3>
</div>

<div>
	<h3>
		관찰2<br>
		포워드 결과 <br>
		1. 주소창은 Send10_for.jsp<br>
		   그러나 클라이언트에게 보여지는 것은 Receive10.jsp 화면<br>
		2. 이름, 내용은 넘겨받은 것.<br>
	
	</h3>
</div>

</body>
</html>