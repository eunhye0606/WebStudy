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
	out.println("사용자 선택 년 : " + userYear + "<br>");
	out.println("월 " + userMonth+"<br>");
	
	if (userYear == null)
		selectYear = nowYear;
	else
		selectYear = Integer.parseInt(userYear);
	
	if (userMonth == null)
		selectMonth = nowMonth;
	else
		selectMonth = Integer.parseInt(userMonth);
	
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
	for(int j=1;j<=endDay;j++)
	{
		startWeek++;
		
		result +="<td>"+ j +"</td>";
		if(startWeek % 7 ==1)
		{
			result += "</tr><tr>";
		}
	}
	
	//뒷공백
	if(startWeek % 7 !=0)
	{
		result += "</tr>";
	}
	
	
	
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
	input {border:none;}
	table {width: 300px; height: 300px;}
</style>

<script type="text/javascript">
	
	// 이전
	function actionClick1(obj)
	{
		
		var attribute1 = document.getElementById("a1").getAttribute("href");
		var temp1 = attribute1.substr(27,31);
		var temp2 = temp1.substr(0,4);			//--2022
		var temp3 = attribute1.substr(38);		//--4
		temp3--;
		
		if (temp3 == 0)
		{
			temp2--;
			temp3 = 12;
		}
		
		var result = "SendAndReceive08_1.jsp?year"+temp2+"&&"+"month"+ temp3;
		alert("result        " + result);
		document.getElementById("a1").setAttribute("href",result);
		
		obj.submit();
		
		
	}
	
	// 이후
	function actionClick2()
	{
		var attribute1 = document.getElementById("a1").getAttribute("href");
		var temp1 = attribute1.substr(27,31);
		var temp2 = temp1.substr(0,4);			//--2022
		var temp3 = attribute1.substr(38);		//--4
		temp3++;
		
		if (temp3 == 13)
		{
			temp2++;
			temp3 = 1;
		}
		
		var result = "SendAndReceive08_1.jsp?year"+temp2+"&&"+"month"+ temp3;
		alert("result        " + result);
		document.getElementById("a1").setAttribute("href",result);
		
		obj.submit();
		
	}
	

</script>
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
	    http://localhost:8090/WebApp07/SendAndReceive08.jsp 로 한다.
    ○ SendAndReceive08.jsp
 -->
<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>

<div>
	<form action="SendAndReceive08_1.jsp"method="get">
		<a href="SendAndReceive08_1.jsp?year<%=selectYear %>&&month<%=selectMonth+1 %>"  id="a1" onclick="actionClick1(this.form)">◀</a>
		<input type="text" name="year" value="<%=selectYear%>">년
		<input type="text" name="month" value="<%=selectMonth%>">월
		<a href="SendAndReceive08_1.jsp?year<%=selectYear %>&&month<%=selectMonth-1 %>" id="a2" onclick="actionClick2(this.form)">▶</a>
	
	</form>
	
</div>

<div>
	<!-- 달력 -->
	<br><br>
	<%=result %>
</div>
</body>
</html>