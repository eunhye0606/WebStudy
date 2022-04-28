<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>


<div>
	<h1>서블릿에서 데이터 흐름</h1>
	<hr />
</div>

<div>
	<!-- ※여기서 주소는 web.xml에서 url-패턴이다. 
	       서블릿클래스가 서블릿(Test2.java)의 찐 주소이고
	       url 패턴은 짭 주소이다! 보여지는 주소! 그 주소랑 action form이랑 맞춰야한다! -->
	       
	       
	       
	<form action="<%=cp%>/test2" method="post">
		이름 <input type="text" name="name" class="txt" /> <br />
		나이 <input type="text" name="age" class="txt" /> <br />
		<button type="submit" class="btn">확인</button>
	</form>
</div>

</body>
</html>