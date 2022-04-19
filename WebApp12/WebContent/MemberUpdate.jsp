<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberUpdate.jsp
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	String uSid = request.getParameter("uSid");
	
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		MemberDTO member = new MemberDTO();
		member.setName(uName);
		member.setTel(uTel);
		member.setSid(uSid);
		
		dao.modify(member);
		// 이후 반환 결과에 따른 분기 처리 가능!
	}
	catch(Exception e)
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
	// 클라이언트에 MemberSelect.jsp 페이지를 다시 요청할 수 있도록 다시 안내
	response.sendRedirect("MemberSelect.jsp");
	
// 이후에 보여지는 페이지 삭제
%>