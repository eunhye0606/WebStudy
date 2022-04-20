<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberScoreDelete.jsp
	
	request.setCharacterEncoding("UTF-8");

	//String uSid = request.getParameter("sid");
	String uSid = request.getParameter("uSid");
	//out.print(uSid);
	
	MemberScoreDAO dao = new MemberScoreDAO();
	int temp = -999;
	
	try
	{
		dao.connection();
		
		//temp = dao.delete(uSid);
		dao.remove(uSid);
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("MemberScoreSelect.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Main.css" type="text/css" >
</head>
<body>
</body>
</html>