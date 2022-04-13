<%@ page contentType="text/html; charset=UTF-8"%>
<% 

	int n = Integer.parseInt((request.getParameter("select")));
	
	String result = "";
	
	for (int i=1; i<=9; i++)
	{
		result += n + " x " + i  + " = " +(i*n) + "<br>"; 
		
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>
<div>
	<h2>사용자 선택 단 수 : <%=n %></h2>
	<h1> 구구단 시작</h1>
	<p><%=result %></p>
</div>
</body>
</html>