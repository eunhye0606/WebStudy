<%@page import="com.test.BoardDAO"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.util.MyUtil"%>
<%@page import="java.util.List" %>
<%@page import="java.sql.Connection"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function test()
	{
		alert("확인");
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<div>
	<h1><input type="button" value="버튼" onclick="test()"/></h1>
</div>
<body>
<%
			for(BoardDTO dto : dao.getLists(1, 68,"subject",""))
			{
%>
<dl>
			
	<dd class="num"><%=dto.getNum() %></dd>
	<dd class="subject">
	</dd>
	<dd class="name"><%=dto.getName() %></dd>
	<dd class="created"><%=dto.getCreated() %></dd>
	<dd class="hitCount"><%=dto.getHitCount() %></dd>
	
</dl>
<%

}
%>
</body>
</html>