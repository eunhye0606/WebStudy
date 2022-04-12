<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true" %> --%>
<!-- 페이지를 렌더링하는데 필요한 버퍼(임시공간)을 줄이고,
autoFlush : 버퍼가 채워지면 밀어내고 다시 채우는 옵션을 flase로 설정 -->

<%-- <%@ page buffer="1kb" autoFlush="false" %> 일 경우 에러 발생 --%>
<%-- <%@ page buffer="10kb" autoFlush="false" %> 일 경우 정상 처리 --%>

<%-- <%@ page buffer="1kb" autoFlush="true" %> 일 경우 정상 처리 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
</head>
<body>

<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	<hr>
</div>

<div>
	<h2>반복문 구성</h2>
	
	<%
	for(int i=1; i<=1000; i++)
	{
	%>1234<%
	}
	%>
</div>

</body>
</html>