<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	request.setAttribute("result", "EL 테스트");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test3.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>

<div>
	<h1>EL 관련 실습</h1>
	<hr />
</div>

<div>
	<!-- action 속성 생략 → su1 과 su2 데이터를 전송하며 요청하는 페이지는 자기 자신 -->
	<form action="" method="post">
		정수1<input type="text" class="txt" name="su1" /><br />
		정수2<input type="text" class="txt" name="su2" /><br />
		<button type="submit" class="btn1">결과 확인</button>
	</form>
</div>

<div>
	<h2>폼 데이터 수신</h2>
	
	<!-- 폼의 데이터를 수신하는 방법 1 -->
	<h3><%=request.getParameter("su1") %></h3>
	
	<!-- 폼의 데이터를 수신하는 방법 2 -->
	<h3>${param.su1 }</h3>
	
	
	
</div>
<br /><br />
<div>
	<h2>폼의 데이터를 받아 연산 수행</h2>
	
	<!-- 폼의 데이터를 받아 연산을 수행하는 방법 1 -->
	<%
		String s1 = request.getParameter("su1");
		String s2 = request.getParameter("su2");
		
		int s = 0;
		
		if (s1 != null && s2 != null)
		{
			s = Integer.parseInt(s1) + Integer.parseInt(s2);
		}
	%>
	<h3>합s : <%=s %></h3>
	
	<!--  폼의 데이터를 받아 연산을 수행하는 방법 2 -->
	<h3>합param : ${param.su1 + param.su2 }</h3>
	<!-- → 파라미터 수신도 알아서 ... -->
	<!-- → 필요한 캐스팅도 알아서 자동으로 수행 -->
	<!-- → null 을 대하는 방식 check (유연~) -->
	<!-- submit을 수행하고나서는 el에서는 null이 아닌 빈 문자열로 받아감. -->
</div>
<br /><br />



<div>
	<h2>setAttribute() 로 넘긴 데이터 수신</h2>
	
	<!--  setAttribute() 로 넘긴 데이터를 수신하는 방법 1 -->
	<span>request<br></span>
	<h3><%=request.getAttribute("result") %></h3>
	
	<!--  setAttribute() 로 넘긴 데이터를 수신하는 방법 2 -->
	<sapn>param<br></sapn>
	<h3>${result }</h3>
</div>


























</body>
</html>