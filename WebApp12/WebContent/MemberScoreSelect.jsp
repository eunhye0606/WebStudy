<%@page import="com.test.MemberDAO"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	MemberScoreDAO dao = new MemberScoreDAO();
	MemberDAO memberdao = new MemberDAO();

	StringBuffer str = new StringBuffer();
	
	
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		memberdao.connection();
		
		str.append("<h2>입력된 성적 수"+dao.count()+"개</h2>");
		str.append("<h2>입력된 회원 수"+memberdao.count()+"명</h2>");
		str.append("<span style='color:red; font-size:small;'>("+(memberdao.count() - dao.count())+"개의 성적 추가 입력 바람.)</span>");
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh'>번호</th>");
		str.append("<th class='nameTh'>이름</th>");
		str.append("<th>국어점수</th>");
		str.append("<th>영어점수</th>");
		str.append("<th>수학점수</th>");
		str.append("<th>총점</th>");
		str.append("<th>평균</th>");
		str.append("<th>석차</th>");
		str.append("<th>성적처리</th>");
		str.append("</tr>");
		
		for(MemberScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>"+score.getSid()+"</td>");
			str.append("<td>"+score.getName()+"</td>");
			str.append("<td class='txtScore'>"+score.getKor()+"</td>");
			str.append("<td class='txtScore'>"+score.getEng()+"</td>");
			str.append("<td class='txtScore'>"+score.getMat()+"</td>");
			str.append("<td class='txtScore'>"+score.getTot()+"</td>");
			str.append("<td class='txtScore'>"+score.getAvg()+"</td>");
			str.append("<td class='txtScore'>"+score.getRank()+"</td>");
			
			// 성적 처리 항목(입력, 수정, 삭제)
			/* str.append("			<td>");
			str.append("				<a href='MemberScoreInsertForm.jsp'><button class='btn01' type='button'>입력</button></a>");
			str.append("				<a href=''><button class='btn01' type='button'>수정</button></a>");
			str.append("				<a href=''><button class='btn01' type='button'>삭제</button></a>");
			str.append("			</td>");
			str.append("		</tr>"); */
			
			// 성적이 등록된지 아닌지
			if (score.getKor()==-1 && score.getEng()==-1 && score.getMat()==-1)
			{
				str.append("<td>");
				
				//str.append("<a href='MemberScoreInsertForm.jsp?uSid="+score.getSid()+"&uName="+score.getName()+"\'>");
				str.append("<a href='MemberScoreInsertForm.jsp?uSid="+score.getSid()+"'>");
				str.append("<button type='button' class='btn01'>");
				str.append("입력");
				str.append("</button>");
				str.append("</a>");
				
				
				str.append("<button type='button' class='btn02' disabled='disabled'>");
				str.append("수정");
				str.append("</button>");
				str.append("<button type='button' class='btn02' disabled='disabled'>");
				str.append("삭제");
				str.append("</button>");
				
				str.append("</td>");
				
			}
			else
			{
				str.append("<td>");
				
				str.append("<button type='button' class='btn02' disabled='disabled'>");
				str.append("입력");
				str.append("</button>");
				
				
				str.append("<a href='MemberScoreUpdateForm.jsp?uSid="+score.getSid()+"'>");
				str.append("<button type='button' class='btn01'>");
				str.append("수정");
				str.append("</button>");
				str.append("</a>");
				
				str.append("<a href='javascript:deleteCheck("+score.getSid()+",\""+score.getName()+"\")'>");
				str.append("<button type='button' class='btn01'>");
				str.append("삭제");
				str.append("</button>");
				str.append("</a>");
				
				
				str.append("</td>");
				
			}
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
			// 데이터베이스 연결 해제
			dao.close();
			memberdao.close();
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
<title>MemberScoreSelect.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
<script type="text/javascript">
	function deleteCheck(sid,name)
	{
		var res = confirm(sid+"번 "+name + "의 성적을 삭제하시겠습니까?");
		if (res)
		{
			window.location.href="MemberScoreDelete.jsp?uSid="+sid;
		}
	}
</script>
</head>
<body>
<div>
	<h1>회원 <span style="color:blue; ">성적</span>
	 관리 및 <span style="color:blue; ">출력</span> 페이지</h1>
	<hr />
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>

<!-- 번호 이름 국어점수 영어점수 수학점수 총점 평균 석차 성적 처리 -->
<!--               ...                                   입력 수정 삭제 -->
<div>
	<%=str %>
	<!-- <table class='table'>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>국어점수</th>
			<th>영어점수</th>
			<th>수학점수</th>
			<th>총점</th>
			<th>평균</th>
			<th>석차</th>
			<th>성적처리</th>
		</tr>
		<tr>
			<td>1</td>
			<td>자비스</td>
			<td>100</td>
			<td>90</td>
			<td>80</td>
			<td>270</td>
			<td>90</td>
			<td>1</td>
			<td>
				<button class='btn01' type='button'>입력</btton>
				<button class='btn01' type='button'>수정</btton>
				<button class='btn01' type='button'>삭제</btton>
			</td>
		</tr>
	</table> -->
</div>
</body>
</html>