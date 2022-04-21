<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(TestSession01.jsp)부터 데이터(uName,uTel) 수신
	request.setCharacterEncoding("UTF-8");
	
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	// check
	// 01에서 받은건 여기까지가 스코프니까
	// session 활용해서 03으로 넘기기
	session.setAttribute("uName", uName);
	session.setAttribute("uTel", uTel);
	
	
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
<style type="text/css">
	.btn01 {width: 100%;}
</style>
<script type="text/javascript">
	function formCheck()
	{
		//alert("확인");
		var f = document.getElementById("form");
		
		var uId = document.getElementById("uId");
		var idMsg = document.getElementById("idMsg");
		var uPwd = document.getElementById("uPwd");
		var pwdMsg = document.getElementById("pwdMsg");
		
		idMsg.style.display = "none";
		pwdMsg.style.display = "none";
		
		//alert(uName.value);
		
		if(uId.value=="")
		{
			idMsg.style.display = "inline";
			uId.focus();
			return;
		}
		
		if (uPwd.value=="")
		{
			pwdMsg.style.display = "inline";
			uPwd.focus();
			return;
		}
		
		f.submit();
		
	}
</script>
</head>
<body>
 <div>
 	<h1>Session 실습 중</h1>
 	<h2>TestSession02.jsp</h2>
 	<hr />
 </div>
 <div>
<div>
	<form action="TestSession03.jsp" method="post" id="form">
		<table class="table">
			<tr>
 				<th colspan="3" style="background-color: #B2CCFF; font-weight: bold;">아이디와 패스워드 입력 란</th>
 			</tr>
 			<tr>
 				<th>아이디</th>
 				<td>
 					<input type="text" id="uId" name="uId">
 				</td>
 				<td>
 					<span class="errMsg" id="idMsg">아이디를 입력하세요</span>
 				</td>
 			</tr>
 			<tr>
 				<td>패스워드</td>
 				<td><input type="text" id="uPwd" name="uPwd" /></td>
 				<td>
 					<span class="errMsg" id="pwdMsg">패스워드를 입력하세요</span>
 				</td>
 			</tr>
 			<tr>
 				<td colspan="3">
 					<button type= "button"class="btn01" onclick="formCheck()">입력하기</button>
 				</td>
 				
 			</tr>
 		</table>
	</form>
</div>
</body>
</html>