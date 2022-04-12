<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//받아올거 
	//name, memo, checkGroup
	//단일  단일   다중
	
	// 이름 데이터 수신
	String nameStr = request.getParameter("name");
	
	// 메모 데이터 수신 check~!!!!
	String memoStr = request.getParameter("memo");
	memoStr = memoStr.replaceAll("\n", "<br>");
	//-- JDK 1.5 이후부터 『replaceAll()』 메소드 사용 가능
	//   『replaceAll()』을 통해 처리한 결과를 다시 memoStr 변수에 대입
	
	// 이상형 데이터 수신
	// ※ 같은 name 속성의 값을 가진 데이터 여러개를 받는 경우
	//    (즉, 다중 데이터로 수신하는 경우)
	//    이를 배열로 처리해야 한다. → 『getParameterValues()』
	String [] checkArr = request.getParameterValues("checkGroup");
	
	// ※ 배열 데이터를 수신하여 처리할 경우..
	//    수신된 데이터가 전혀 없는 경우는
	//    배열의 값 자체가 null 이 되어버리기 때문에
	//    null 에 대한 확인(검사) 과정이 필요하다. check!
	String check ="";
	
	if (checkArr != null)
	{
		
		for (String str : checkArr)
		{
			check += " [ " + str + " ] ";
		}
	}

	
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBoxOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습04</h1>
	<hr>
	<p> CheckBox.jsp ○ → CheckBoxOk.jsp ● 
</div>

<div>
	<h2>수신 데이터 확인</h2>
	
	<!-- <h3>이름 : 박삐삐</h3> -->
	<h3>이름 : <%=nameStr %></h3>
	
	<h3>메모</h3>
	<!-- <p>나는<br> 귀여워 <br> 짱!!!</p> -->
	<p><%=memoStr %></p>
	
	<!-- <h3>이상형 : [임시완] [남주혁] [강동원]</h3> -->
	<h3>이상형 : <%=check %></h3>
	
</div>

</body>
</html>