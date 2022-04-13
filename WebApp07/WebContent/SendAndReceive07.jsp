<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%

	//(1).현재 년도와 월 구하기
	//    현재 년도 +10년 / -10년을 selectbox의 옵션으로
	//    1월 ~ 12월을 옵션으로
	//년도는 자동으로 2022년, 월은 4월

	
	//(2). select 값 바뀌면
	//     년도 바뀜 -> 1월의 달력
	//     월까지 바뀜 -> 해당년도 해당월 달력
	
	
	
	
	//선택 연, 월 받아오기
	String yearStr = "";
	String monthStr = ""; 
	int y = 0;
	int m = 0;
	yearStr = request.getParameter("yearSelect");
	monthStr = request.getParameter("monthSelect");
	
	if (yearStr == null)
	{
		yearStr ="";	
	}
	else
		y = Integer.parseInt(yearStr);
	
	if (monthStr == null)
	{
		monthStr ="";	
	}
	else
		m = Integer.parseInt(monthStr);
		
		
	//※달력 그리기
	Calendar cal = Calendar.getInstance();
	
	String [] weekArr = {"월","화","수","목","금","토","일"};

	cal.set(y,m-1,1);
	
	
	//선택 달의 총 일수.
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	//시작 요일.
	//일 :1 / 월 :2 / 화:3 / 수 :4/ 목:5/ 금:6/ 토:7
	int weekDay = cal.get(Calendar.DAY_OF_WEEK);
	
	//만약 금요일 시작 → weekDay = 6
	int temp = 7 - weekDay;
	
	
	int tr = (endDay / (temp+weekDay))+1;
	
	String result = "<h1>"+ (m) +"월" +"</h1>";
	result +="<table border=\"3\" style=\"width=400px;height=400px;\">";

	result += "<tr>";
	for (int i=1; i<=temp;i++)
	{
		result += "<td> </td>";
	}
	
	for(int j=1;j<=endDay;j++)
	{
		
		result += "<td>"+j+ "  </td>";
		if((j + temp) % 7 == 0)
		{
			result +="</tr><tr>";
		}
		
		
	}
	result += "</tr>";
	result += "</table>";
	

%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">

<script type="text/javascript">	
	function changeAction(obj)
	{
		//alert("월 확인");
		obj.submit();
	}
	
	function test()
	{
		document.getElementById("")
	}


</script>





</head>
<body">
<!-- 
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 연도 구성은 현재의 연도를 기준으로 이전 10년, 이후 10년으로 구성한다.
	  	 (기본적으로 만년달력을 구성하는데 현재의 연, 월 은 달력 객체로부터 확인 할 수 있도록 한다.)
	   - 월 구성은 1월 부터 12월 까지로 구성한다.
	   
	     2012
	   	   :
	   [ 2022 ▼] 년 [ 4 ▼] 월
	       :
	     2032
	   
	   ------------------------
	   ------------------------
	   ------------------------
	   ------------------------
	   
	   - 연도 select 나 월 select 의 내용이 변화되면 
	     해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	   
	   - 사용자 최초 요청 주소는
	     http://localhost:8090/WebApp07/SendAndReceive07.jsp 로 한다.
	  
	 ○ SendAndReceive07.jsp
	   
 -->
<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>


<div>
	<form method="get">
		<select name="yearSelect" id="yearSelect">
			<%-- <%
			for(int v=2022;v<=2030;v++)
			{
			%>
				<option value ="<%v%>"><%v%></option>
			<%
			}
			%> --%>
			<option value="2022">2022</option>
			<option value="2023">2023</option>
			<option value="2024">2024</option>
			<option value="2025">2025</option>
			<option value="2026">2026</option>
		</select>
		년
		<select name="monthSelect" onchange="changeAction(this.form)">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>
		월
	</form>
</div>


<div>

	
</div>
	<%=result %>
<div>
	
</div>



</body>
</html>