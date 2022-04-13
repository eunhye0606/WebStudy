<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 이전 페이지(SendAndReceive06.jsp → 자기 자신 페이지)로 부터 데이터 수신
	//  수신 데이터 (userInput)
	request.setCharacterEncoding("UTF-8");

	//처음에 null 상태에서 보여지겠끔하려면 
	// 처음에는 null 아님.
	String temp ="";
	
	temp = request.getParameter("userInput");
	
	if (temp == null)
		temp ="";
	
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
<link rel="stylesheet" type="text/css"href="css/Main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 06</h1>
	<hr>
</div>

<div>
	<!-- (1) -->
	<!-- <form action="Test999.jsp" method="post">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn" >테스트</button>
		<button type="reset" class="btn" >취소</button>
	</form> -->
	
	
	
	<!-- (2) action 속성을 빈값. -->
	<!-- <form action="" method="post">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn" >테스트</button>
		<button type="reset" class="btn" >취소</button>
	</form> -->
	
	
	<!-- (3) action 속성을 빈값. get방식으로 확인 input을 널값으로 전송하는 것을 확인 -->
	<!-- <form action="" method="get">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn" >테스트</button>
		<button type="reset" class="btn" >취소</button>
	</form> -->
	
	
	
	<!-- (4) action 속성이 없어도 submit대상은 자기자신. -->
	<!-- <form method="get">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn" >테스트</button>
		<button type="reset" class="btn" >취소</button>
	</form> -->
	
	<!-- (5) action 속성이 없어도 submit대상은 자기자신. method 속성 값 기본은 get방식-->
	<!-- <form>
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn" >테스트</button>
		<button type="reset" class="btn" >취소</button>
	</form> -->
	
	
	<!-- (6) action 속성이 없어도 submit대상은 자기자신. method 속성 값 post
	         눈에 보이는건 없지만 전송은 됨.-->
	<form method="post">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn" >테스트</button>
		<button type="reset" class="btn" >취소</button>
	</form>
	
	<!-- check!! -->
	<!-- ※ form 의 action 속성을 『action=""』과 같이 구성하거나
	        action 속성을 생략하여 『<form method="post">』와 같이 구성하게 되면
	        페이지 요청 및 데이터 전송에 대한 수신처 페이지는 자기 자신이 된다. -->
	
	
</div>


<div>
	<h2>수신된 데이터 확인</h2>
	<h3> → <%=temp %></h3>
</div>

</body>
</html>