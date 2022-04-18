<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// DB 연결
	Connection conn;
	conn = DBConn.getConnection();
	
	String temp ="";
	if (conn != null)
	{
		temp = "연동성공.";
	}
	
	// 이전 페이지로 넘겨 받은 데이터
	// name, kor, eng, mat
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	
	
	
	
	 
	
	// 쿼리문 준비
	String sql = String.format("INSERT INTO TBL_SCORE(SID,NAME,KOR,ENG,MAT) VALUES(SCORESEQ.NEXTVAL, '%s',%s,%s,%s)",name,kor,eng,mat);
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	
	
	// 쿼리문 실행
	int n = 0;
	n = stmt.executeUpdate(sql);
	
	// 리소스 반납
	stmt.close();
	DBConn.close();
	
	
	if (n < 1)
	{
		response.sendRedirect("Error.jsp");
	}
	else 
		response.sendRedirect("ScoreList.jsp"); 


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Main.css" type="text/css" >
</head>
<body>
<div>
	<h1><%=temp %></h1>
</div>
</body>
</html>