<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	//PostTest01_ok.jsp
	//String title = request.getParameter("title");
	//String content = request.getParameter("content");
	//content = content.replace("<br>", "\n");
	
%>
${param.title }
<br />
${param.content }
<br />
<%-- <%=content %> --%>

