<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.test.MemberDAO"%>
<%@ page import="com.test.MemberDTO"%>
<%
	MemberDAO dao = null;
	//MemberDAO dao = new MemberDAO();
	//이거도 가능.
	//(왜냐하면, 저번에는 생성자 안에서 데이터베이스 연결해서!)
	
	StringBuffer str = new StringBuffer();
	
	try
	{
		dao = new MemberDAO();
		dao.connection();
		
		str.append("<table class='table'><tr><th style='width:50px;'>번호</th><th style='width:100px;'>이름</th><th style='width:150px;'>전화번호</th><th style='width:200px;'>회원관리</th></tr><br><br>");
		
		for(MemberDTO dto : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" +dto.getSid() + "</td>");
			str.append("<td>" +dto.getName() + "</td>");
			str.append("<td>" +dto.getTel() + "</td>");
			str.append("<td><a href=''><button class='btn01' type='button'>수정</button></a> <a href=''><button class='btn01' type='button'>삭제</button></a></td>");
			str.append("</tr>");
		}
		
				
		str.append("</table>");
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		dao.close();
	}
	
	
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberSelect.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>
<div>
	<h1>회원 <span style="color:red; ">명단</span> 관리 및 출력 페이지</h1>
	<hr />
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
	<a href=""><button type="button">신규 회원 등록</button></a>
</div>

<div>
	<!-- 리스트 출력 -->
	<%=str %>
	<!-- <table class="table">
		<tr>
			<th style="width:50px;">번호</th>
			<th style="width:100px;">이름</th>
			<th style="width:150px;">전화번호</th>
			<th style="width:200px;">회원관리</th>
		</tr>
		<br><br>
		<tr>
			<td>1</td>
			<td>희동이</td>
			<td>010-1111-1111</td>
			<td style="text-align: center;">
				<a href=""><button class="btn01" type="button">수정</button></a>
				<a href=""><button class="btn01" type="button">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>도우너</td>
			<td>010-2222-2222</td>
			<td style="text-align: center;">
				<a href=""><button class="btn01" type="button">수정</button></a>
				<a href=""><button class="btn01" type="button">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>마이콜</td>
			<td>010-3333-3333</td>
			<td style="text-align: center;">
				<a href=""><button class="btn01" type="button">수정</button></a>
				<a href=""><button class="btn01" type="button">삭제</button></a>
			</td>
		</tr>
			
	</table> -->
</div>

















</body>
</html>