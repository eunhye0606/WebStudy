<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Calendar cal = Calendar.getInstance();
	int selectYear = 0;
	int selectMonth = 0;
	
	//① 사용자 선택 전.
	// 현재 년도, 월
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	
	//② 사용자 선택.
	String userYear = request.getParameter("year");
	String userMonth = request.getParameter("month");
	//out.println("사용자 선택 년 : " + userYear + "<br>");
	//out.println("월 " + userMonth+"<br>");
	
	if (userYear != null)
		selectYear = Integer.parseInt(userYear);
		
	else
		selectYear = nowYear;
	
	if (userMonth != null)
		selectMonth = Integer.parseInt(userMonth);
	else
		selectMonth = nowMonth;
		
	if (selectMonth == 0)
	{
		selectMonth = 12;
		selectYear--;
	}
	else if(selectMonth == 13)
	{
		selectMonth = 1;
		selectYear++;
	}
	//out.println(selectYear);
	//out.println(selectMonth);
	
	// 캘린더 세팅
	cal.set(selectYear,selectMonth-1,1);
	
	// 달력 그리기(준비)
	//마지막 날 
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	//out.println("막날 "+ endDay);
	//시작 요일
	int startWeek = cal.get(Calendar.DAY_OF_WEEK);
	//out.println("시작 요일 "+ startWeek);
	
	String [] weekNames = {"일","월","화","수","목","금","토"};
	
	// 달력 그리기
	String result="";
	result ="<table border='1'>";
	
	// 요일
	result += "<tr>";
	for(int j=0;j<weekNames.length;j++)
	{
		result +="<td>"+weekNames[j]+"</td>";
	}
	result +="</tr>";
	
	
	//앞공백
	result +="<tr>";
	//out.println("<br>시작 요일11111111 "+ startWeek);
	for(int i=1;i<startWeek;i++)
	{
		result += "<td></td>";
	}
	//날짜
	for(int i=1; i<=endDay; i++)
	{
		startWeek++;						//-- 날짜가 하루씩 찍힐 때 마다 (구성이 이루어 질 때 마다) 요일도 함께 1씩 증가.
		
		result += "<td>" + i + "</td>";
		
		
		if(startWeek % 7 == 1)
			result +="</tr><tr>";
	}
	
	//뒷공백
	for (int i=0;i<=startWeek;i++,startWeek++)
	{
		if (startWeek%7==1)
		{
			break;
		}
		result += "<td></td>";
	}
	

	if (startWeek%7 !=1)
		result += "</tr>";
	
	
	result += "</table>";
	
	
	




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet"type="text/css"href="css/Main.css">
<style type="text/css">
	a {text-decoration: none;}
	input {border:none; width: 50px;}
	table {width: 300px; height: 300px;}
</style>

</head>
<body>
<!-- 
	○ 데이터 송수신 실습 08
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
	   
	   
	     ◀ 2022년 4월 ▶
	     --------------------------------
	     --------------------------------
	     --------------------------------
	     --------------------------------
	     --------------------------------
	     
	  - 『◀』 이나 『▶』 클릭 시
	    해당 년 월의 달력을 출력해주는 형태의 페이지로 구현한다.
	  
	  - 사용자 최초 요청 주소는
	    http://localhost:8090/WebApp08_2/SendAndReceive08.jsp 로 한다.
    ○ SendAndReceive08.jsp
 -->
<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>
	<!-- a 태그에 속성값으로 ▶ ◀를 구분하라. -->
	<a href="SendAndReceive08_1.jsp?year=<%=selectYear%>&&month=<%=selectMonth-1%>">◀</a>
	<input type="text" name="year" value="<%=selectYear%>">년
	<input type="text" name="month" value="<%=selectMonth%>" style="width: 30px;">월
	<a href="SendAndReceive08_1.jsp?year=<%=selectYear%>&&month=<%=selectMonth+1%>">▶</a>
<div>
	
</div>

<div>
	<!-- 달력 -->
	<br><br>
	<%=result %>
</div>
</body>
</html>