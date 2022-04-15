<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Forward11.jsp
	// 포워드는 사용자가 모른다. 보여지는 화면은 Receive11.jsp
	
	// 포워드는 서블릿(왜? jsp 일 필요가 없어서! 스크립트 릿만 쓰기 때문!)
	
	// 이전 페이지(Send11.html)로부터 데이터(num1,calResult,num2) 수신
	
	
	//request 스코프는 수신받은 페이지까지만 유효-----------------
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	
	String calResult = request.getParameter("calResult");
	//------------------------------------------------------------
	
	int num1 = 0;
	int num2 = 0;
	
	String result ="";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if (calResult.equals("1"))	//더하기
			result = String.format("%d + %d = %d", num1,num2, (num1+num2));
		else if (calResult.equals("2"))  //빼기
			result = String.format("%d - %d = %d", num1, num2,(num1-num2));
		else if (calResult.equals("3")) // 곱하기
			result = String.format("%d * %d = %d ",num1,num2,(num1*num2));
		else if (calResult.equals("4"))
			result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	
	// 이거만 다음 페이지로 넘어감.
	request.setAttribute("resultStr", result);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 11</h1>
	<h3> - Forward11.jsp</h3>
	<hr>
</div>

<jsp:forward page="Receive11.jsp"></jsp:forward>
</body>
</html>