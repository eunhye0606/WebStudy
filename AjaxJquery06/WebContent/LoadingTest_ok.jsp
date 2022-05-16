<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//LoadingTest_ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	try
	{
	
		// 의도적으로 처리 시간 지연 → ajax 처리 과정에서 의도적으로 지연시키는 경우가 있다.
		// DB 연동하면 이짓거리 안해도 어차피 시간이 걸린다 ~ 
		Thread.sleep(5000);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
	
%>
이름 : <%=name%> <br />
내용 : <%=content%>
