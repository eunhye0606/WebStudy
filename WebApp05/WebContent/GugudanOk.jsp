<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지(Gugudan.jsp) 로 부터 데이터 수신 → dan
	/*
	String str = request.getParameter("dan");
	int dan = -1;
	String [] arr = new String [9];
	String result = ""; */
	String danStr = request.getParameter("dan");
	int n = 0;

	try
	{
		n = Integer.parseInt(danStr);
		/* dan = Integer.parseInt(str);
		for(int i = 0; i <= 8; i ++)
		{
			arr[i] = (i+1) + "x" + dan + "=" + ((i+1)*dan);
			result += arr[i] + "<br>";
		} */
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
		/* getServletContext().log("오류 : " + e.toString()); */
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GugudanOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습02</h1>
	<hr>
	<p> Gugudan.jsp ○ → GugudanOk.jsp ● 
</div>

<!-- html 주석문 -->
<%-- jsp 주석문 --%>

<!-- ↓ 수업풀이 1. -->
<%-- <%
	// 스크립트 릿 영역
	// 아깐 안 된 이유 → 표현식에서 for 문 불가.
	for(int i=1; i<=9; i++)
	{
		out.print(n + " * " +  i  + " = " + (n*i) + "<br>");
	}
%> --%>


	<!-- 내 풀이 -->
	<%-- 사용자가 입력한 단 : <%= str %> --%>
	
<!-- ↓ 수업풀이 2. -->

<%
	for(int i=1; i<=9; i++)
	{
%>
		<%=n %> * <%=i %> = <%=(n*i) %> <br>
<%
	}
%>

</body>
</html>