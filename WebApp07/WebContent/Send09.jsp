<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String result ="";

	for(int i=1; i<=9; i++)
	{
		//<option><a href="Receive09.jsp?select=1" value="1">1단</option>
		result += "<option><a href='Receive09.jsp?select="+i+ "'>"+i+"단</a></option>";
		
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
<script type="text/javascript">
	function test(obj)
	{
		obj.submit();
	}
</script>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 09
	   - a 태그(링크 태그)에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
	   - 이를 활용하여 구구단 리스트를 동적으로 구성하여
	     선택에 따른 결과 페이지를 출력해주는 형태의 페이지로 구현한다.
	   
	   - submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   
	   
	   
	   구구단 선택
	   
	   1단		→ (목록 구성)
	   2단
	    :
	   9단
	   
	   - 리스트의 특정 단을 클릭했을 때
	     구구단을 출력해주는 형태의 페이지(Receive09.jsp)로 구현한다.
	     
	   - 사용자 최초의 요청 주소는
	     http://localhost:8090/WebApp07/Send09.jsp
	   
	 ○ Send09.jsp
	    Receive09.jsp
 -->
<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div>
	<form action="Receive09.jsp" method="get">
		<select name="select" onchange="test(this.form)">
			<option>--구구단 선택--</option>
			<!-- <option>1단</a></option> -->
			
			<%=result %>
			
		</select>
	</form>
</div>

</body>
</html>