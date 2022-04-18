<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.test.ScoreDAO"%>
<%@page import="com.test.ScoreDTO"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		ScoreDTO dto = new ScoreDTO();
		dto.setName(name);
		dto.setKor(kor);		
		dto.setEng(eng);		
		dto.setMat(mat);
		
		
		dao.add(dto);
		
		
	
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		dao.close();
	}
	
	response.sendRedirect("ScoreList.jsp");
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