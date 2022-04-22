<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%-- <jsp:useBean id="ob" class="com.test.Calc" />
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob" />
<jsp:setProperty property="op" name="ob" /> --%>

<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>
<!-- ob안에 있는 Property를 찾아서
     넘겨받은 데이터의 name과 Property와 이름같은걸
     가지고 형변환할거 해서 set메소드 알아서 해. -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok3.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>
<div>
	<h1>세 번째 방법 처리 결과</h1>
	<hr />
</div>

<div>
	<!-- 결과 -->
	<h2><%=ob.result()%></h2>
</div>
</body>
</html>