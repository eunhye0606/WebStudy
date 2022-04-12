<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지로부터 전송된 데이터 수신
	
	 request.setCharacterEncoding("UTF-8");

	// 데이터 수신
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	int n1 =0;
	int n2 =0;
	
	// 테이블 안에서 1씩 증가시켜 나갈 변수 선언 및 초기화
	int n =0;
	try
	{
		n1 = Integer.parseInt(s1);
		n2 = Integer.parseInt(s2);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	/*
	String user1 = request.getParameter("su1");
	String user2 = request.getParameter("su2");
	
	int su1 = 0;
	int su2 = 0;
	try
	{
		su1 = Integer.parseInt(user1);
		su2 = Integer.parseInt(user2);
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
<title>TableOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습05</h1>
	<hr>
	<p> Table.jsp ○ → TableOk.jsp ● 
</div>

<div>
	<table border =3>
		<%
		for(int i=0; i<n2; i++)
		{
		%>
			<tr>
				<%
				for(int j=0; j<n1; j++)
				{
				%>
					<td style="width: 40px;height: 40px;"><%=++n %></td>
				<%
				}
				%>
		
			</tr>
		<%
		}
		%>
		
		<%-- <%
		   for(int i=1; i<=su2;i++)
		   {
		 %>
		  		<tr>
		  			<%
		  			   for(int j=1; j<=su1;j++)
		  			   {
		  			%>
		  					<td></td>
		  			<%
		  			   }
		  			%>
		  		</tr>
		  		
		 <%
		   }
		 %> --%>
	</table>
</div>

</body>
</html>