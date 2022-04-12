<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// Send03.html 페이지로부터 데이터 수신
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	String result = "";
	
	try
	{
		
		int num1 = Integer.parseInt(num1Str);
		int num2 = Integer.parseInt(num2Str);
		
		if(op.equals("+"))
		{
			result = String.valueOf(num1 + num2);
		}
		else if(op.equals("-"))
		{
			result = String.valueOf(num1 - num2);
		}
		else if(op.equals("*"))
		{
			result = String.valueOf(num1 * num2);
		}
		else if(op.equals("+"))
		{
			//result = String.valueOf(num1 /num2);
			//result = String.valueOf(num1 / (double)num2);
			result = String.format("%.1f",(num1 / (double)num2));
		}
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
		
	}
	/* request.setCharacterEncoding("UTF-8");
	
	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");
	
	String temp = request.getParameter("selectGroup");
	
	int su1 = 0, su2 = 0;
	int result = 0;
	
	try
	{
		
		su1 = Integer.parseInt(su1Str);
		su2 = Integer.parseInt(su2Str);
		
		if (temp.equals("더하기"))
		{
			result = su1 +su2;
		}
		else if (temp.equals("빼기"))
		{
			 result = su1 -su2;
		}
		else if (temp.equals("곱하기"))
		{
			 result = su1 *su2;
		}
		else if (temp.equals("나누기"))
		{
			 result = su1/su2;
		}
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	} */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>
 <div>
 	<h1>데이터 송수신 실습 03</h1>
 	<hr>
 </div>

<div>
	<h1>입력하신 <%=num1Str %>와(과) <%=num2Str %>의 연산 결과는 <br>
	<%=result %> 입니다.<br><br>
	</h1>
</div>

</body>
</html>