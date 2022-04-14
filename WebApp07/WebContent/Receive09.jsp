<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String userSelect = request.getParameter("select");
	//out.println(userSelect);
	userSelect = userSelect.substring(0,1);
	//out.println(userSelect);
	
	String gugudan ="";
	int dan = Integer.parseInt(userSelect);
	for(int i=1; i<=9; i++)
	{
		gugudan += dan + "x" + i + "=" + (dan*i) + "</br>";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 09</h1>
	<h2>-Receive09.jsp</h2>
	<hr>
</div>

<div>
	<h3><%=gugudan %></h3>
</div>
</body>
</html>