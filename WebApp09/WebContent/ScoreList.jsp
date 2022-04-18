<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 리스트 select
	Connection conn = DBConn.getConnection();

	String temp = "";

	if (conn != null)
	{
		temp = "데이터베이스 연동 성공입니다.";
	}
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	
	// 쿼리문 준비
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE";
	
	// 쿼리문 실행
	ResultSet rs = stmt.executeQuery(sql);
	
	// 결과출력 변수
	String result = "";
	result = "<table border = '1'>";
	
	
	String [] temp1  ={"번호","이름","국어점수","영어점수","수학점수","총점","평균"};
	result +="<tr>";
	for(String str : temp1)
	{
		result += "<th>" + str +"</th>"; 
	}
	result +="</tr>";
	
	while(rs.next())
	{
		
		String sid = rs.getString("SID");
		String name = rs.getString("NAME");
		String kor = rs.getString("KOR");
		String eng = rs.getString("ENG");
		String mat = rs.getString("MAT");
		String tot = rs.getString("TOT");
		String avg = rs.getString("AVG");
		
		result += "<tr>";
		result += "<td>" + sid + "</td>";
		result += "<td>" + name + "</td>";
		result += "<td>" + kor + "</td>";
		result += "<td>" + eng + "</td>";
		result += "<td>" + mat + "</td>";
		result += "<td>" + tot + "</td>";
		result += "<td>" + avg + "</td>";
		result += "</tr>";
	}
	result += "</table>";
	
	//리소스 반납
	rs.close();
	stmt.close();
	// conn은 연결, dbconn은 열닫
	DBConn.close();
	
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Main.css" type="text/css" >
<style type="text/css">
	span {color:red; display: none;}
</style>
<script type="text/javascript">
	function formCheck()
	{
		var name = document.getElementById("name");
		var kor = document.getElementById("kor").value;
		var nKor = Number(kor);
		var eng = document.getElementById("eng").value;
		var nEng = Number(eng);
		var mat = document.getElementById("mat").value;
		var nMat = Number(mat);
		
		//에러 메세지 display : none;
		var errMS1 = document.getElementById("errMS1");
		var errMS2 = document.getElementById("errMS2");
		var errMS3 = document.getElementById("errMS3");
		var errMS4 = document.getElementById("errMS4");
		
		errMS1.style.display ="none";
		errMS2.style.display ="none";
		errMS3.style.display ="none";
		errMS4.style.display ="none";
		
		alert(name.value);
		alert(nKor);
		alert(nEng);
		alert(nMat);
		
		if (name.value == "")
		{
			errMS1.style.display = "inline";
			return false;
		}
		
		if (nKor<=0 || nKor>100)
		{
			errMS2.style.display = "inline";
			return false;
		}
		
		if (nEng<=0 || nEng>100)
		{
			errMS3.style.display = "inline";
			return false;
		}
		
		if (nMat<=0 || nMat>100)
		{
			errMS4.style.display = "inline";
			return false;
		}
		
		
		
		return false;
	}
</script>
</head>
<body>
<!-- 
	○ WebApp09
	
		- 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
		   총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
		- 리스트 출력 시, 번호 오름차순 정렬하여 출력할 수 있도록 한다.
		- 데이터베이스 연동하여 처리한다.
		  (TBL_SCORE, SCORESEQ 활용)
		- 즉, 성적 처리 프로그램을 데이터베이스 연동하여
		  JSP로 구성할 수 있도록 한다.
		  
		  데이터베이스 연결 및 데이터 처리
		  --------------------------------
		  성적 처리
		  이름(*)		[textbox] → 이름 입력 확인
		  국어점수		[textbox] → 0 ~ 100 사이의 정수가 확인되었는지 확인
		  영어점수		[textbox] → 0 ~ 100 사이의 정수가 확인되었는지 확인
		  수학점수		[textbox] → 0 ~ 100 사이의 정수가 확인되었는지 확인
		  
		  <성적 추가>			  → button
		  
		  번호  	이름	국어점수	영어점수	수학점수	총점	평균
		  1         ...

	○ WebApp09_scott.sql
	   ScoreList.jsp
	   ScoreInsert.jsp
	   com.util.DBConn.java
 -->
<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr />
</div>

<div>
	<!-- <form action="ScoreInsert.jsp" method="get" > -->
	<!-- form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()"> -->
	<form action="ScoreInsert.jsp" method="get" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td><input type="text" class="txt" name="name" id="name"> <span id="errMS1">이름 필수 입력 바람.</span></td>
				
			</tr>
			<tr>
				<th>국어점수</th>     
				<td><input type="text" class="txt" name="kor" id="kor"> <span id="errMS2">점수(0 ~ 100 입력가능.)</span></td>
			</tr>
			<tr>
				<th>영어점수</th>     
				<td><input type="text" class="txt" name="eng" id="eng"> <span id="errMS3">점수(0 ~ 100 입력가능.)</span></td>
			</tr>
			<tr>
				<th>수학점수</th>     
				<td><input type="text" class="txt" name="mat" id="mat"> <span id="errMS4">점수(0 ~ 100 입력가능.)</span></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button type="submit">성적 추가</button>
				</td>
			</tr>
			
			
		</table>
	</form>
</div>

<br /><br />


<div>
	<h1><%=temp %></h1>
</div>

<div>
	<!--  테이블 그리기 -->
	<%=result %>
</div>

</body>
</html>