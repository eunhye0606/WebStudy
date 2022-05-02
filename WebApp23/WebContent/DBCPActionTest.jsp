<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBCPConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBCPConn.getConnection();
	
	String result ="";
	
	if(conn != null)
	{
		result = "데이터베이스 연결 성공";
	}
	else
	{
		result = "데이터베이스 연결 실패 ㅜㅜ";
	}
	DBCPConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCPActionTest</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>
<!-- jsp와 관련한 부분은 이클립스가 자동으로 !-- 주석 만들어줘도 %--로 바꾸거라 -->

<div>
	<h1>DBCP를 활용한 데이터베이스 접속 실습</h1>
	<hr />
</div>

<div>
	<!-- 결과 확인 -->
	<h2><%=result %></h2>
</div>
</body>
</html>