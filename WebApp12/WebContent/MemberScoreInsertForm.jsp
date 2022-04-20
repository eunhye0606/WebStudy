<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uSid = request.getParameter("uSid");
	
	//수업 풀이
	String uName="";
	// name 을 조회하기 위해 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신한 uSid 를 활용하여 uName 얻어내기
		MemberScoreDTO score = dao.searchSid(uSid);
		
		uName= score.getName();
		
	}
	catch (Exception e)
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
	
	
	//String uName = "";
	//MemberScoreDAO dao = new MemberScoreDAO();
	/* try
	{
		//MemberScoreDTO score = dao.searchSid(uSid);
		//uName = score.getName();
		//System.out.println("안효섭이름"+uName);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	} */
	//String uName= request.getParameter("uName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreInsertForm.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
<script type="text/javascript">
	function formSubmit()
	{
		//alert("확인");
		var form = document.getElementById("form");
		var uKor = document.getElementById("uKor");
		var korMsg = document.getElementById("korMsg");
		
		var uEng = document.getElementById("uEng");
		var engMsg = document.getElementById("engMsg");
		
		var uMat = document.getElementById("uMat");
		var matMsg = document.getElementById("matMsg");
		
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		//alert(uKor);
		
		
		//if (uKor.value ==""|| isNaN(kor.value) || Number(kor.value<0) || Number(kor.value)>100)
		if (uKor.value<=0 || uKor.value>100 || isNaN(uKor.value))
		{
			korMsg.style.display = "inline";
			uKor.focus();
			return;
		}
		else if (uEng.value<=0 || uEng.value>100 || isNaN(uEng.value))
		{
			engMsg.style.display = "inline";
			uEng.focus();
			return;
		}
		else if (uMat.value<=0 || uMat.value>100 || isNaN(uMat.value))
		{
			matMsg.style.display = "inline";
			uMat.focus();
			return;
		}
		/* else
			form.submit(); */
		
		form.submit();
		
		
	}
	
	function formReset()
	{
		//alert("확인");
		var form = document.getElementById("form");
		var uKor = document.getElementById("uKor");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		uKor.focus();
		
		var form = document.getElementById("form");
		
		form.reset();
	}
</script>
</head>
<body>
<div>
	<h1>회원 <span style="color:blue; ">성적</span>
	 관리 및 <span style="color:red; ">입력</span> 페이지</h1>
	<hr />
</div>
<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
</div>
<br />
<div>
	<!-- 회원 성적 데이터 입력 폼 구성 -->
	<form action="MemberScoreInsert.jsp"  method="post" id="form">
		<input type="hidden" name="uSid" value=<%=uSid %>>
		<table class='table'>
			<tr>
				<th>번호</th>
				<%-- <td><input type='text' name='uSid' readonly="readonly" value ="<%=uSid %>"></td> --%>
				<td><%=uSid %></td>
			</tr>
			<tr>
				<th>이름</th>
				<%-- <td><input type='text' name='uName' readonly="readonly" value ="<%=uName %>"></td> --%>
				<td><%=uName %></td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td><input type="text" name="uKor" id="uKor"/></td>
				<td><span class="errMsg" id="korMsg">0~100 사이의 국어점수를 입력해야 합니다.</span></td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td><input type="text" name="uEng" id="uEng"/></td>
				<td><span class="errMsg" id="engMsg">0~100 사이의 영어점수를 입력해야 합니다.</span></td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td><input type="text" name="uMat" id="uMat"/></td>
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