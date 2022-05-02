<%@page import="com.test.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//MemberDTO dto = new MemberDTO();
	
	//List lists = new ArrayList();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" href="<%=cp%>css/main.css" type="text/css" >
</head>
<body>

<div>
	<h2>JSTL 코어(Core)를 활용한 회원 정보 입력</h2>
</div>

<div>
	<form action="MemberInsert.jsp">
	
		<!-- (이름, 전화번호, 주소) * 5명 분-->
		<!--  → submit 액션 처리 -->
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<!-- 이부분 jstl써서 하기 -->
					<!-- <input type="text" name="name1" />
					<input type="text" name="name2" />
					<input type="text" name="name3" />
					<input type="text" name="name4" />
					<input type="text" name="name5" /> -->
					
					
					<!-- 변수 i를 1로 초기화한다. -->
					<c:set var="i" value="1"></c:set>
					<c:forEach var="x" begin="1" end="5" step="1">
						<%-- <input type="text" name="name${x }"/> --%>
						
						
						<input type="text" name="name${i }"/>
						
						<!-- i를 증가 -->
						<c:set var="i" value="${i+1 }"></c:set>
						
					</c:forEach> 
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<!-- <input type="text" name="tel1" />
					<input type="text" name="tel2" />
					<input type="text" name="tel3" />
					<input type="text" name="tel4" />
					<input type="text" name="tel5" /> -->
					
					<!-- 이미 위에서 i는 6까지 증가했지만 재초기화 하는 과정 -->
					<c:set var ="i"	value="1"></c:set>
					
					<c:forEach var="x" begin="1" end="5" step="1">
						<%-- <input type="text" name="tel${x }"/> --%>
						
						
						<input type="text" name="tel${i }"/>
						<c:set var="i"	value="${i+1 }"></c:set>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<!-- <input type="text" name="addr1" />
					<input type="text" name="addr2" />
					<input type="text" name="addr3" />
					<input type="text" name="addr4" />
					<input type="text" name="addr5" /> -->
					<c:forEach var="x" begin="1" end="5" step="1">
						<input type="text" name="addr${x }"/>
					</c:forEach>
				</td>
			</tr>
			
		</table>
		<button type="submit">전송</button>
	</form>
</div>




</body>
</html>