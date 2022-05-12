<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//System.out.println(title + "         " + content);
	response.setContentType("text/xml");
	
	//xml은 루트 태그 반드시 하나
	//xml ? 이거 앞에 주석달면안돼~
	
%><?xml version="1.0" encoding="UTF-8"?>
<data>
<%
for(int i=1;i<=2;i++)
{
%>
<item num="i">
	<title><%=title + i %></title>
	<content><%=content + i %></content>
</item>
<%
}
%>
</data>