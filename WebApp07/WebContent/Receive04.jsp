<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신(Send04.html → Receive04.jsp)
	request.setCharacterEncoding("UTF-8");

	// 스크립터는 id / jsp 의 파라미터 get은 name!!
	String userId = request.getParameter("id");
	String userPwd = request.getParameter("pwd");
	String userName = request.getParameter("name");
	String userTel = request.getParameter("tel");
	
	String userGender = request.getParameter("gender");
	String userCity = request.getParameter("city");
	
	String [] userSubjectArr = request.getParameterValues("subject");
	
	String subjectStr ="";
	
	if (userSubjectArr != null)
	{
		for (int i = 0; i < userSubjectArr.length; i++)
		{
			subjectStr += " [" + userSubjectArr[i].toString() + "]";
			                                       //toString() 하는 이유
		}
	}
	
	//※ 추후에는 수신된 데이터를 ... 쿼리문을 통해 DB에 입력하는
	//   처리 과정 등이 포함될 것임을 염두하며 작업을 진행할 수 있도록 하자.
	
	
%>
<%-- <%
	request.setCharacterEncoding("UTF-8");
	String genderStr ="";
	String cityStr ="";
	String [] subjectArr = new String [4];
	
	String idStr ="없음.";
	String nameStr ="없음.";
	String pwdStr ="없음.";
	String telStr ="없음.";
	
	try
	{
		idStr = request.getParameter("id");
		nameStr= request.getParameter("name");
		pwdStr= request.getParameter("pwd");
		telStr= request.getParameter("tel");
		genderStr= request.getParameter("gender");
		cityStr= request.getParameter("city");
		subjectArr= request.getParameterValues("subject");
			
		String result ="";
			
		for (int i = 0; i<subjectArr.length;i++)
		{
			result += subjectArr[i] + " ";
		}
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	
	
	
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>
<div>

	<h2>가입 승인 내역</h2>
	
	<p> 아이디   : <%= userName %></p>
	<p> 패스워드 : <%= userPwd %></p>
	<p> 이름     : <%= userName %></p>
	<p> 전화번호 : <%= userTel %></p>
	<hr>
	<p> 성별     : <%= userGender %></p>
	<p> 지역     : <%= userCity %></p>
	<p> 선택과목 : <%= subjectStr %></p>
	
	<%-- 아이디 : <%=idStr %><br>
	이름 : <%=nameStr %><br>
	패스워드 : <%=pwdStr %><br>
	전화번호 : <%=telStr %><br>
	성별 : <%= genderStr%><br>
	지역 : <%=cityStr %><br>
	수강과목 : <%=result %><br> --%>
</div>
</body>
</html>