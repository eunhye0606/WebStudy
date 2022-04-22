<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>
<!-- 반복문 필요(다중 선택으로 넘어온 결과값을 출력하기 위한 처리 -->
<!-- 근데 난 DTO에 메소드 만듬 .. -->
<%
	String strResult = "";
	if(ob.getIdelType() != null)	//배열은 항상 null인지 확인하기!
	{
		for (String temp : ob.getIdelType())
		{
			strResult += temp + " ";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>
<div>
	<h1>데이터 출력</h1>
	<h2>Friend_ok.jsp</h2>
	<hr />
</div>
<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<td><%=ob.getName() %></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=ob.getAge() %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=ob.getGender() %></td>
		</tr>
		
		<tr>
			<th>이상형</th>
			<%-- <td><%=ob.idelPrint() %></td> --%>
			<td><%=strResult %></td>
		</tr>
	</table>
</div>

</body>
</html>