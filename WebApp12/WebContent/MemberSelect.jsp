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
		
		for(MemberDTO member : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" +member.getSid() + "</td>");
			str.append("<td>" +member.getName() + "</td>");
			str.append("<td>" +member.getTel() + "</td>");
			str.append("<td><a href='MemberUpdateForm.jsp?uSid="+member.getSid()+"'>");
			str.append("<button class='btn01' type='button'>수정</button></a>");
			
			//memberDelete(1,'고길동')
			
			//※ 자바스크립트에서 사용할 수 있는 
			//   따옴표의 종류 : ①""   ②''   ③\"\"
			//   일반적으로 따옴표가 두 번 중첩되어 사용하게 되면
			//   ①과 ②를 사용하면 된다.
			//   하지만, 따옴표가 세 번 중첩되어 사용될 경우
			//   ③ escape 를 사용해야 한다.
			
			
			// 문자열인데 따옴표 없이 넘기면 문제발생!
			str.append(" <a href='javascript:memberDelete("+member.getSid()+",\""+member.getName()+"\")'>");
			str.append("<button class='btn01' type='button'>삭제</button></a></td>");
			
			//str.append("<td><a href='MemberUpdateForm.jsp'><button class='btn01' type='button' onclick(link("+member.getName()+","+member.getTel() +"))>수정</button></a> <a href=''><button class='btn01' type='button'>삭제</button></a></td>");
			/* str.append("<td><a href='MemberUpdateForm.jsp?uName="+member.getName()+"&uTel="+member.getTel()+"+&uSid="+member.getSid()+"><button class='btn01' type='button'))>수정</button></a> <a href=''><button class='btn01' type='button'>삭제</button></a></td>"); */
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
<script type="text/javascript">
	function memberDelete(sid,name)
	{
		//alert("확인");
		
		//alert("번호 : " + sid + ", 이름 : " + name);
		
		// true or false
		// confirm() 
		var res = confirm("번호 : " + sid + ", 이름 : " + name + "\n 이 회원의 정보를 정말 삭제하시겠습니까?");
		
		// 확인
		//alert(res);
		// -- confirm() 함수를 통해 호출되는 창은
		//    true(확인) 또는 false(취소)를 반환하게 된다.
		
		if (res)
			window.location.href='MemberDelete.jsp?sid=' + sid;
	
	}
</script>
</head>
<body>
<div>
	<h1>회원 <span style="color:red; ">명단</span> 관리 및 출력 페이지</h1>
	<hr />
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
	<a href="MemberInsertForm.jsp"><button type="button">신규 회원 등록</button></a>
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