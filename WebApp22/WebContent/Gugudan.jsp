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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>css/main.css" type="text/css" >
</head>
<body>

<!-- 원하는 단을 입력받아 구구단을 출력하는 JSP 페이지를 구성한다.
     단, JSTL Core if 문과 forEach 구문을 활용한다. -->
     
<div>
	<h1>JSTL 코어(Core)를 활용한 구구단 출력</h1>
	<hr />
</div>


<div>
	<form action="">
		원하는 단 입력 <input type="text" name="dan" class="txt"> <br /><br />
		
		<button type="submit" class="btn">결과 확인</button>
	</form>
</div>

<div>
	<!-- 결과 처리 -->
	
	<!-- 수업풀이 -->
	<c:if test="${!empty param.dan }">
	<ul>
		<c:forEach var="su" begin="1" end="9" step="1">
			<li>
				${param.dan } * ${su } = ${param.dan * su}
			</li>
		</c:forEach>
	</ul>
	</c:if>
	
	
	<!-- 내가한거 -->
	<%-- <c:forEach var ="a" begin="1" end="9" step="1">
		<c:if test="${param.dan==a }">
			<c:forEach var ="x" begin="1" end="9" step="1"> 
				<h3>${param.dan*x }</h3><br />
			</c:forEach>	
		</c:if>
	</c:forEach> --%>
	
	
	<%-- <c:if test="${param.dan==1 }">
		<c:forEach var ="x" begin="1" end="9" step="1"> 
			<h1>${param.dan*x }</h1><br />
		</c:forEach>	
	</c:if>	
	<c:if test="${param.dan==2 }">
		<c:forEach var ="x" begin="1" end="9" step="1"> 
			<h1>${param.dan*x }</h1><br />
		</c:forEach>	
	</c:if>	
	<c:if test="${param.dan==3 }">
		<c:forEach var ="x" begin="1" end="9" step="1"> 
			<h1>${param.dan*x }</h1><br />
		</c:forEach>	
	</c:if>	
	<c:if test="${param.dan==4 }">
		<c:forEach var ="x" begin="1" end="9" step="1"> 
			<h1>${param.dan*x }</h1><br />
		</c:forEach>	
	</c:if>	
	<c:if test="${param.dan==5 }">
		<c:forEach var ="x" begin="1" end="9" step="1"> 
			<h1>${param.dan*x }</h1><br />
		</c:forEach>	
	</c:if>	
	<c:if test="${param.dan==6 }">
		<c:forEach var ="x" begin="1" end="9" step="1"> 
			<h1>${param.dan*x }</h1><br />
		</c:forEach>	
	</c:if>	
	<c:if test="${param.dan==7 }">
		<c:forEach var ="x" begin="1" end="9" step="1"> 
			<h1>${param.dan*x }</h1><br />
		</c:forEach>	
	</c:if>	
	<c:if test="${param.dan==8 }">
		<c:forEach var ="x" begin="1" end="9" step="1"> 
			<h1>${param.dan*x }</h1><br />
		</c:forEach>	
	</c:if>	
	<c:if test="${param.dan==9 }">
		<c:forEach var ="x" begin="1" end="9" step="1"> 
			<h1>${param.dan*x }</h1><br />
		</c:forEach>	
	</c:if>	 --%>
	
</div>


</body>
</html>