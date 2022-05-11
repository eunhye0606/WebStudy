<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	//String nickName = request.getParameter("nickName");
	//System.out.println(nickName);
	//String result ="";
	//result = nickName + "님 안녕하세요.\n 반갑습니다.";

%>
<%-- <%=result%> --%>
${param.nickName}님 안녕하세요.
<br />
반갑습니다~!
<br />
<%-- ${param.dkTK}입니다!! --%>