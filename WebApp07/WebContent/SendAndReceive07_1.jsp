<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//①자기 자신 페이지로부터 데이터 수신
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");

	
	
	// Calendar 객체 생성
	//java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal= Calendar.getInstance();
	
	
	//② 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2022
	int nowMonth = cal.get(Calendar.MONDAY)+1;		//-- 4
	
	//일까지 확인!
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 13
	
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	
	// 페이지에 대한 요청이 최초 요청이 아닐 경우
	// 즉, 사용자가 년도와 월을 선택했을 경우.
	// → 수신 받은 sYear / sMonth 로 달력의 년, 월 구성.
	//if(sYear.equals("") || sMonth.equals(""))
	if(sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth =Integer.parseInt(sMonth);
	}
	
	//테스트
	//out.print("<h1>selectYear : " + selectYear + "<h1>");
	//out.print("<h1>selectMonth : " + selectMonth + "<h1>"); 
	
	//확인한 날짜로 년도 select option 구성-------------------------------------------
	//<option value="2012">2012</option>
	//<option value="2013">2013</option>
	//<option value="2014">2014</option>
	//				:
	//<option value="2022" selected="selected">2022</option>
	//				:
	//<option value="2030">2030</option>
	//<option value="2031">2031</option>
	//<option value="2032">2032</option>
	
	String yOptions ="";
	for(int year=(selectYear-10);year<=(selectYear+10);year++)	//2012 ~ 2032
	{
		// 관찰1.
		// "" 안에 ''넣기
		//yOptions += "<option value='"+ year+ "'>" + year +"</option>";
		
		// 관찰2.
		//if (year==nowYear)
		//	yOptions +="<option value='"+ year+ "' selected='selected'>" + year +"</option>";
		//else
		//	yOptions += "<option value='"+ year+ "'>" + year +"</option>";
		
		// 상황1. 페이지 최초 요청 일 때   → sYear 는 null / 현재 년도와 옵션이 같을 때 → seleced(○)
		// 상황2. 페이지 최초 요청 아닐 때 → sYear 는 null 아님 / 선택된 년도와 옵션이 같을 때 → selected(○)
		// 상황3. 나머지 → selected(X)		
		
		/* if (sYear==null && year==nowYear)
		{
			yOptions +="<option value='"+ year+ "' selected='selected'>" + year +"</option>";
		}
		else if (sYear!=null && year==Integer.parseInt(sYear))
		{
			yOptions +="<option value='"+ year+ "' selected='selected'>" + year +"</option>";
		}
		else
			yOptions += "<option value='"+ year+ "'>" + year +"</option>"; */
		
			
		//테스트하기.
		if (year == selectYear)
		{
			yOptions +="<option value='"+ year+ "' selected='selected'>" + year +"</option>";
		}
		else
			yOptions += "<option value='"+ year+ "'>" + year +"</option>";
	}
	
	
	//-------------------------------------------확인한 날짜로 년도 select option 구성
	
	
	
	//확인한 날짜로 월 select option 구성-------------------------------------------
	//<option value ="1">1</option>
	//<option value ="2">2</option>
	//				:
	//<option value ="4" selected="selected">4</option>
	//              :
	//<option value ="12">12</option>
	
	
	
	String mOptions ="";
	for (int j=1; j<=12;j++)
	{
		if (j ==selectMonth)
		{
			mOptions += "<option value='"+   j+   "' selected='selected'>"   +j+    "</option>";
		}
		else
						 
			mOptions += "<option value ='"     +j+    "'>"      +j+     "</option>";
	}
	
	//-------------------------------------------확인한 날짜로 월 select option 구성
	
	
	// 달력 그리기 -----------------------------------------------------------------
	// 그려야 할 달력의 1일이 무슨 요일인지 확인 필요.
	// (만년달력)
	
	int [] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
	{
		//윤년
		months[1] = 29;
	}
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String [] weekNames = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	
	// 현재 년도 ~ 입력 받은 년도 이전 년도까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 -(selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 → 입력 받은 월의 이전 월까지의 날 수 추가.
	// ex) 입력 받은 월 : 5월 (4월까지 날 수 추가.)
	//              months[4]  months[3]     
	for (int i=0;i<selectMonth-1; i++)
	{
		nalsu += months[i];
	}
	
	// +1일 해주기. 5월1일부터 달력 시작이라.
	nalsu++; 
	
	// 요일 변수
	int week = nalsu%7;
	// 마지막 날짜 변수
	int lastDay = months[selectMonth-1];
	
	
	
	// 달력 그리기 
	String calStr ="";
	calStr += "<table border='1'>";
	
	
	// 요일 이름 발생
	calStr += "<tr>";
	for (int i=0;i<weekNames.length;i++)
	{
		if (i==0)										//--일요일
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
		else if (i==6)									//--토요일
			calStr += "<th style='color:blue;' >" + weekNames[i] + "</th>";
		else											//--평일
			calStr += "<th style='color:black;'>" + weekNames[i] + "</th>";		
		
	}
	calStr +="</tr>";
	
	// 빈 칸 공백 td 발생
	calStr +="<tr>";
	for(int i=1; i<=week; i++)
	{
		calStr += "<td></td>";
	}
	
	// 날짜 td 발생
	for(int i=1; i<=lastDay; i++)
	{
		week++;						//-- 날짜가 하루씩 찍힐 때 마다 (구성이 이루어 질 때 마다) 요일도 함께 1씩 증가.
		
		//calStr += "<td>" + i + "</td>";
		
		
		//오늘이 토요일/일요일/평일일 때,
		if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0) 	//--토요일인 오늘
		{
			calStr += "<td class='nowSat'>" + i + "</td>";
		}
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1) //-- 일요일인 오늘
		{
			calStr += "<td class='nowSun'>" + i + "</td>";
		}
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay) 			//-- 평일인 오늘
		{
			calStr += "<td class='now'>" + i + "</td>";
		}
		//최초요청 이후, 오늘을 모를 때
		else if(week%7==0)	//--토요일
		{
			calStr += "<td class='sat'>" + i + "</td>";
		}
		else if(week%7==1)	//--일요일
		{
			calStr += "<td class='sun'>" + i + "</td>";
		}
		else
			calStr += "<td>" + i + "</td>";
		
		
		
		
		
		if(week % 7 == 0)
			calStr +="</tr><tr>";
	}
	
	// 빈 칸 공백 td 발생
	for (int i=0;i<=week;i++,week++)
	{
		if (week%7==0)
		{
			break;
		}
		calStr += "<td></td>";
	}
	
	
	
	
	
	if (week%7 !=0)
		calStr += "</tr>";
	
	
	calStr += "</table>";
	// ----------------------------------------------------------------- 달력 그리기
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>

<style type="text/css">
	td {text-align: right;}
	td.now {background-color: pink; font-weight: bold;}
	td.sat {color: blue;}
	td.sun {color: red;}
	td.nowSat {background-color: pink; font-weight: bold; color: blue;}
	td.nowSun {background-color: pink; font-weight: bold; color: red;}
</style>
<script type="text/javascript">
	function formCalendar(obj)
	{
		// 유효성 검사가 필요한 경우 삽입할 수 있는 영역
		obj.submit();
	}
</script>






</head>
<body>
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
	     http://localhost:8090/WebApp07/SendAndReceive07_1.jsp 로 한다.
	  
	 ○ SendAndReceive07.jsp
	   
 -->
<div>
	<h1>데이터 송수신 실습 07</h1>
	<h2>- 수업 풀이</h2>
	<hr>
<!-- 
	ⓡ이전 페이지로부터 넘겨받은 년도		이전 페이지로부터 넘겨받은 월
	  2000									12
	②현재 년도								현재 월
	  2022									04
	======================================================================  
	  
	  그릴 달력의 설정 년도					그릴 달력의 설정 월
	  2000									12
	
	
 -->
</div>


<div>
	<!--  form 의 action 속성 값 생략 → 요청 페이지 / 데이터의 수신처는 자기 자신 -->
	<form>
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<!-- <option value="9999">9999</option>
			<option value="9999">9998</option> -->
			<%=yOptions %>
		</select>
		년
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<%=mOptions %>
		</select>
		월
	</form>
</div>
<br>
<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>



</body>
</html>