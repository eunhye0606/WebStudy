<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//이전 페이지(MemberScoreSelect.jsp)로부터 데이터 수신(uSid)
	request.setCharacterEncoding("UTF-8");
	String uSid = request.getParameter("uSid");
	String uName = "";
	int uKor = 0;
	int uEng = 0;
	int uMat = 0;
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		//데이터베이스 연결
		dao.connection();
		
		//uSid로 name,kor,eng,mat 받아오기
		MemberScoreDTO score = dao.searchSid(uSid);
		uName = score.getName();
		uKor = score.getKor();
		uEng = score.getEng();
		uMat = score.getMat();
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreUpdateForm.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
<script type="text/javascript">
	function formSubmit()
	{
		//alert("확인");
		var form = document.getElementById("form");
		
		var uKor = document.getElementById("uKor");
		var uEng = document.getElementById("uEng");
		var uMat = document.getElementById("uMat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (uKor.value <=0 || uKor.value>100 || isNaN(uKor.value))
		{
			korMsg.style.display = "inline";
			uKor.focus();
			return;
		}
		else if (uEng.value <=0 || uEng.value>100 || isNaN(uEng.value))
		{
			engMsg.style.display = "inline";
			uEng.focus();
			return;
		}
		else if (uMat.value <=0 || uMat.value>100 || isNaN(uMat.value))
		{
			matMsg.style.display = "inline";
			uMat.focus();
			return;
		}
		form.submit();
		
	}
	function formReset()
	{
		//alert("취소확인");
		var form = document.getElementById("form");
		
		var uKor = document.getElementById("uKor");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		uKor.focus();
		form.reset();
		
	}
</script>
</head>
<body>
<div>
	<h1>회원 <span style="color:blue; ">성적</span>
	 관리 및 <span style="color:blue; ">수정</span> 페이지</h1>
	<hr />
</div>
<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
</div>
<br />
<div>
	<!-- 회원 성적 데이터 입력 폼 구성 -->
	<form action="MemberScoreUpdate.jsp?uSid=<%=uSid %>"  method="post" id="form">
		<table class='table'>
			<tr>
				<th>번호</th>
				<td><%=uSid %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=uName %></td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td><input type="text" name="uKor" id="uKor" value="<%=uKor %>"/></td>
				<td><span class="errMsg" id="korMsg">0~100 사이의 국어점수를 입력해야 합니다.</span></td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td><input type="text" name="uEng" id="uEng" value ="<%=uEng%>"/></td>
				<td><span class="errMsg" id="engMsg">0~100 사이의 영어점수를 입력해야 합니다.</span></td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td><input type="text" name="uMat" id="uMat" value ="<%=uMat%>"/></td>
				<td><span class="errMsg" id="matMsg">0~100 사이의 수학점수를 입력해야 합니다.</span></td>
			</tr>
		</table>
		<br />
		
		<a href="javascript:formSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:formReset()"><button type="button">취소하기</button></a>
		<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button></a>
		
		
	</form>
</div>
</body>
</html>