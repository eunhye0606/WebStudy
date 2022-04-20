<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberScoreInsert.jsp
	
	//이전 페이지로(MemberScoreForm.jsp)부터 수신받은 데이터(uSid)
	
	request.setCharacterEncoding("UTF-8");

	//String name = request.getParameter("uName");
	String sid= request.getParameter("uSid");
	
	int korN = 0;
	int engN = 0;
	int matN = 0;
	
	
	String kor =request.getParameter("uKor");
	String eng =request.getParameter("uEng");
	String mat =request.getParameter("uMat");
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		
		korN = Integer.parseInt(kor);
		engN = Integer.parseInt(eng);
		matN = Integer.parseInt(mat);
		
		dao.connection();
		MemberScoreDTO temp = dao.searchSid(sid);
		
		MemberScoreDTO score = new MemberScoreDTO();
		
		score.setName(temp.getName());
		score.setSid(sid);
		score.setKor(korN);
		score.setEng(engN);
		score.setMat(matN);
		
		dao.add(score);
		
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