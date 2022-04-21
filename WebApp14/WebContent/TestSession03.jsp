<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(TestSession02.jsp)부터 데이터(uId, uPwd) 수신
	request.setCharacterEncoding("UTF-8");

	String uId = request.getParameter("uId");
	String uPwd = request.getParameter("uPwd");
	
	// 01의 데이터는 session에 !
	String uName = (String)session.getAttribute("uName");
	String uTel = (String)session.getAttribute("uTel");
	
	//세션 비우기
	session.removeAttribute("uName");
	session.removeAttribute("uTel");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>
<div>
 	<h1>Session 실습 중</h1>
 	<h2>TestSession03.jsp</h2>
 	<hr />
</div>

<div>
	<table class="table">
		<tr>
			<th>아이디</th>
			<td><%=uId %></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><%=uPwd %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=uName %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=uTel %></td>
		</tr>
	</table>
</div>

</body>
</html>