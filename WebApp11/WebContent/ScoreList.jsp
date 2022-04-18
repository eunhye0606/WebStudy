<%@page import="java.util.ArrayList"%>
<%@page import="com.test.ScoreDAO"%>
<%@page import="com.test.ScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	ScoreDAO dao = null;
	StringBuffer str = new StringBuffer();

	try
	{
		dao = new ScoreDAO();
		str.append("<span> 총 인원 수:"+ dao.count()+ "명</span>");
		
		str.append("<table border='1'>");
		
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th></tr>");
		for (ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" +score.getSid() + "</td>");
			str.append("<td>" +score.getName() + "</td>");
			str.append("<td>" +score.getKor() + "</td>");
			str.append("<td>" +score.getEng() + "</td>");
			str.append("<td>" +score.getMat() + "</td>");
			str.append("<td>" +score.getTot() + "</td>");
			str.append("<td>" +score.getAvg() + "</td>");
			
			str.append("</tr>");
		}
		
		
		
		str.append("</table>");
		
		
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
<title>Insert title here</title>
<link rel="stylesheet" href="css/Main.css" type="text/css" >
<style type="text/css">
	table {width: 500px;}
	.errMsg {color:red; font-size: small;display: none;}
</style>
<script type="text/javascript">
	function formChek()
	{
		//alert("확인");
		var name = document.getElementById("name");
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (name.value =="")
		{
			nameMsg.style.display = "inline";
			return false;
		}
		
		if (Number(kor.value)<=0 || Number(kor>100))
		{
			korMsg.style.display = "inline";
			return false;
		}
		
		if (Number(eng.value)<=0 || Number(eng>100))
		{
			engMsg.style.display = "inline";
			return false;
		}
		
		if (Number(mat.value)<=0 || Number(mat>100))
		{
			matMsg.style.display = "inline";
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
<div>
	<h1>점수 입력 프로그램</h1>
	<hr />
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formChek()">
		<table>
			<tr>
				<th>이름</th>
				<th>국어점수</th>
				<td>영어점수</td>
				<th>수학점수</th>
			</tr>
			<tr>
				<td>
					<input type="text" id="name" class="txt" name="name" />
					<span class="errMsg"id="nameMsg">이름을 입력하세요.</span>
				</td>
				<td>
					<input type="text" id="kor" class="txt" name="kor" />
					<span class="errMsg"id="korMsg">국어점수를 입력하세요.</span>
				</td>
				<td>
					<input type="text" id="eng" class="txt" name="eng" />
					<span class="errMsg"id="engMsg">영어점수를 입력하세요.</span>
				</td>
				<td>
					<input type="text" id="mat" class="txt" name="mat" />
					<span class="errMsg"id="matMsg">수학점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center";><input type="submit" value="성적 입력"/></td>
			</tr>
		</table>
	</form>
</div>

<div>
	<%=str.toString() %>
</div>
</body>
</html>