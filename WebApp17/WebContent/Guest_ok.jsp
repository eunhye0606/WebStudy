<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("content");
	content = content.replace("\n","<br>");
%>
<!-- 스코프없으면 기본값 페이지 -->
<jsp:useBean id="guest" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="userName" name="guest"/>
<jsp:setProperty property="subject" name="guest"/>
<jsp:setProperty property="content" name="guest" value="<%=content %>"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" href="css/MyCss.css" type="text/css" >
</head>
<body>
<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<h2>Guest_ok.jsp</h2>
	<hr />
</div>

<!-- 작성해서 넘긴 내용 확인 -->
<!-- 이름, 제목, 내용 -->

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<!-- 방법 2 개  -->
			<%-- <td><jsp:getProperty property="userName" name="guest"/></td> --%>
			<td><%=guest.getUserName() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><jsp:getProperty property="subject" name="guest" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<%-- <td><jsp:getProperty property="content" name="guest"/></td> --%>
			<td><%=guest.getContent().replaceAll("\n", "<br>") %></td>
		</tr>
	</table>
</div>
</body>
</html>