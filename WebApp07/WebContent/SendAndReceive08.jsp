<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
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
	function actionClick1()
	{
		
		alert("테스트");
		
		/* //alert("테스트");
		var attribute1 = document.getElementById("a1").getAttribute("href");
		//alert(attribute1);
		//--==>>SendAndReceive08.jsp?year2022&&month4
		//alert(attribute1.indexOf("year"));	//--21
		//alert(attribute1.indexOf("month")); //--31
		//alert(attribute1.indexOf("2022")); //--25
		//alert("2022".length); //--4 tq
		var temp1 = attribute1.substr(25,29);
		//alert(temp1);//--==>>2022&&month4
		var temp2 = temp1.substr(0,4);			//--2022
		alert(temp3);
		//--==>>2022&&month4
		var temp3 = attribute1.substr(36);		//--4
		//alert(temp2);
		//--==>>4
		
		alert(temp3);
		
		temp3--;
		
		if (temp3 == 0)
		{
			temp2--;
			temp3 = 12;
		}
		
		var result = "SendAndReceive08.jsp?year"+temp2+"&&"+"month"+ temp3;
		alert(result);
		//document.getElementById("a1").setAttribute("href",result);
		//alert(attribute1); */
		
		
		
				
				
				
		/* //alert("확인.");
		var selectYear = Number(document.getElementById("year").value);
		var selectMonth = Number(document.getElementById("month").value);
		//alert(selectYear);
		//alert(selectMonth);
		
		selectMonth --;
		
		if (selectMonth == 0)
		{
			selectYear--;
			selectMonth = 12;
		}
		
		
		
		
		document.getElementById("year").value = selectYear;
		document.getElementById("month").value = selectMonth;
		
		//obj.submit();
		 */
		
	}
	
	// 이후
	function actionClick2()
	{
		
		var attribute1 = document.getElementById("a1").getAttribute("href");
		var temp1 = attribute1.substr(25,29);
		var temp2 = temp1.substr(0,4);			//--2022
		alert(temp3);
		var temp3 = attribute1.substr(36);		//--4
		
		temp3++;
		
		if (temp3 == 13)
		{
			temp2++;
			temp3 = 1;
		}
		
		var result = "SendAndReceive08.jsp?year"+temp2+"&&"+"month"+ temp3;
		document.getElementById("a1").setAttribute("href",result);
		alert(attribute1);
		
		
		
		
		
		/* //alert("확인.");
		var selectYear = Number(document.getElementById("year").value);
		var selectMonth = Number(document.getElementById("month").value);
		//alert(selectYear);
		//alert(selectMonth);
		
		selectMonth ++;
		
		if (selectMonth == 13)
		{
			selectYear++;
			selectMonth = 1;
		}
		//alert(selectYear);
		//alert(selectMonth);
		
		document.getElementById("year").value = selectYear;
		document.getElementById("month").value = selectMonth;
		
		
		
		//obj.submit();
	} */
	
	function goForm(obj)
	{
		//alert("확인");
		//alert(document.getElementById("form1"));
		
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
	<form action="SendAndReceive08.jsp"method="get">
		<%-- <a href="SendAndReceive08.jsp?year<%=selectYear %>&&month<%=selectMonth-1 %>" id="a1">◀</a>
		<input type="text" name="year"><%=selectYear %>년</input>
		<input type="text" name="month"><%=selectMonth %>월</input>
		<a href="SendAndReceive08.jsp?year<%=selectYear %>&&month<%=selectMonth+1 %>" id="a2">▶</a> --%>
	
	</form>
	
	
	
	<!-- <form action="SendAndReceive08.jsp" method="get" id ="form1"> -->
		<!-- <a href="#" onclick="actionClick1()">◀</a> -->
		<%-- <a href="SendAndReceive08.jsp?year=<%=selectYear %>&month=4">◀</a>" --%>
			<%-- <span name="year" id="year"><%=selectYear %></span>년 --%>
			<%-- <input type="text" name="year" id="year" value="<%=selectYear %>" readonly="readonly" onclick="goForm(this.form)">년 --%>
			<!-- <input type="text" name="year" id="year" value="2022">년 -->
			
			
			
			<%-- <span name="month" id="month"><%=selectMonth %></span>월 --%>
			<%-- <input type="text" name="month" id="month" value="<%=selectMonth %>" readonly="readonly" onclick="goForm(this.form)">월 --%>
			<!-- <input type="text" name="month" id="month" value="4">월 -->
			
			<%-- <span name="month" id="month" onchange="goForm()" value="<%=selectMonth%>"><%=selectMonth%>년</span> --%>
		<!-- <a href="#" onclick="actionClick2()">▶</a> -->
	<!-- </form> -->
	
</div>

<div>
	<!-- 달력 -->
	<br><br>
<%-- 	<%=result %> --%>
</div>
</body>
</html>