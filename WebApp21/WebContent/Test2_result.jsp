<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	String result = (String)request.getAttribute("result");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2_result.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>

<div>
	<h1>최종 결과값 수신</h1>
	<hr />
</div>

<div>
	<%=result %>
</div>
<%-- 이름 <%=name %> <br />
나이 <%=age %> <br /> --%>

<%-- <%=request.getAttribute("result") %> --%>
</body>
</html>