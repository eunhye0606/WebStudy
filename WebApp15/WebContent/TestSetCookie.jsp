<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//쿠키 생성
	//쿠키 생성자는 매개변수가 있어야함.
	Cookie c = new Cookie("cookie_test","studyCookie");
	
	//쿠키 설정(만 한거임 쿠키 아직 안심음.)
	//쿠키는 n초있다가 사라짐. 매개변수(초)
	c.setMaxAge(3600);	// 쿠키 1시간 유지
	
	// 쿠키 추가(국히 심기)
	response.addCookie(c);
	
	// 심는다해서 클라이언트는 확인할 수 있는 게 없삼.
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSetCookie.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>

<div>
	<h1>쿠키 설정 및 추가</h1>
	<hr />
</div>

<div>
	<a href="TestGetCookie.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
	<a href="TestRemoveCookie.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
</div>


</body>
</html>