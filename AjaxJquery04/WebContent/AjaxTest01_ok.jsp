<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	//AjaxTest01_ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	content = content.replaceAll("\n", "<br>");
%>
<h1>방법1</h1> <hr />
이름 : <b><%=name %></b>
<br />
내용 : <br /> <b><%=content %></b> 
<br />
<h1>방법2</h1> <hr />
<!-- EL문법의 param은 복수개의 데이터를 받을 때만 인가?! -->
이름 : <b>${param.name }</b>
<br />
내용 : <b>${param.content }</b>
<!-- 내용 : <br /> -->
<%-- ${fn:replace(param.content),"\n" } --%>
<!-- EL로 replace하려면 pageContext로 setAttribute를 해서 \n, br을 변수에 담고 매개변수로 사용해야 한다. -->
