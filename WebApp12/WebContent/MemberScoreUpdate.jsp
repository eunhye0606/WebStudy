<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberScoreUpdate.jsp
	//이전 페이지로(MemberScoreUpdateForm.jsp)부터 데이터 수신(uSid,kor,eng,mat)
	MemberScoreDAO dao = new MemberScoreDAO();
	request.setCharacterEncoding("UTF-8");
	String uSid = request.getParameter("uSid");
	
	String korStr = request.getParameter("uKor");
	String engStr = request.getParameter("uEng");
	String matStr = request.getParameter("uMat");
	
	int uKor = 0;
	int uEng = 0;
	int uMat = 0;

	try
	{
		uKor = Integer.parseInt(korStr);
		uEng = Integer.parseInt(engStr);
		uMat = Integer.parseInt(matStr);
		
		
		dao.connection();
		MemberScoreDTO score = new MemberScoreDTO();
		score.setKor(uKor);
		score.setEng(uEng);
		score.setMat(uMat);
		score.setSid(uSid);
		
		int temp = dao.modify(score);
		
	}
	catch (Exception e)
	{
		System.out.println();
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	response.sendRedirect("MemberScoreSelect.jsp");
%>
