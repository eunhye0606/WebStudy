<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberDelete.jsp
	
	//이전 페이지(MemberSelect.jsp)로부터 넘어온 데이터(sid) 수신
	
	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	
	MemberDAO dao = new MemberDAO();
	
	
	//참조중이면 삭제 불가능
	//① MemberSelect에서 삭제버튼 비활성화 하는 방법
	//② 여기서 삭제안될 때 다른 페이지로 넘기는 방법
	String strAdd = "";
	
	try
	{
		//데이터베이스 연결
		dao.connection();
		
		int num = dao.refCount(sid);
		
		if(num == 0)
		{
			dao.remove(sid);
			strAdd = "MemberSelect.jsp";
		}
		else
			strAdd ="MemberUnDelect.jsp";
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	response.sendRedirect(strAdd);
%>