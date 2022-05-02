<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" href="<%=cp%>css/main.css" type="text/css" >
</head>
<body>
<div>
	<h1>JSTL 코어(Core) 문제 해결</h1>
	<h2>회원 명단 출력</h2>
	<hr />
</div>



<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		<c:forEach var="dto" items="${lists }">
		<tr>
			<td style="text-align: center;">${dto.name }</td>
			<td style="text-align: center;">${dto.tel }</td>
			<td style="text-align: center;">${dto.addr }</td>
		</tr>
		</c:forEach>
	</table>

	<!-- 5명의 이름, 전화번호, 주소 출력 -->
	<%-- <c:forEach var="dto" items="${lists }">
		<h1>이름 : ${dto.name }</h1><br>
		<h1>전번 : ${dto.tel }</h1><br>
		<h1>주소 : ${dto.addr }</h1><br>
	</c:forEach> --%>
</div>
</body>
</html>