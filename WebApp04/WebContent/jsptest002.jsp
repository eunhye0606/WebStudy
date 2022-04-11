<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿 영역 → JSP 에서 JAVA 코드를 기술하는(사용하는) 영역
	
	int a = 10, b = 5, c;
	c = a + b;
	
	// -- 스크립 릿 영역에서 수행된 자바 코드의 실행 결과는
	//    표현식에 의해 HTML 브라우저 영역에 출력된다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest002.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<!-- 표현식 -->
	<h2>합 : <%= a %> + <%= b %> = <%= c %></h2>
</div>

<%
	//스크립 릿 영역
	
	// ※ 『out』 은 내장 객체로서 출력 스트임이다.
	out.print("합 : " + a + " + " + b + " = " + c);
	out.println("합 : " + a + " + " + b + " = " + c);
	out.println();
	
	out.println("합 : " + a + " + " + b + " = " + c + "<br>");
	out.println("합 : " + a + " + " + b + " = " + c);
	
	
	out.print("<br><br>");
	out.println("사랑해용");
	out.println("사랑해용<br>");
	out.println("메롱");
	
	//print() == println() 개행 안됨.
	// 개행은 <br> 태그 ! 
	
	out.print("<br><br>");
	out.print("포맷팅 테스트<br>");
	String str = String.format("합 : %d + %d = %d",a, b, c);
	System.out.print("<br>");
	
	out.print(str);
	
	//out.print(<br>);
	//out.print(STR);
	
	
%>

</body>
</html>