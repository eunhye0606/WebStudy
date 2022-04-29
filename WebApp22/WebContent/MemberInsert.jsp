<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	//MemberInsert.jsp
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	
	// 5명분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
	
	
	
	// MemberList.jsp 를 요청할 수 있도록 안내
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert.jsp</title>
<link rel="stylesheet" href="<%=cp%>css/main.css" type="text/css" >
</head>
<body>

</body>
</html>