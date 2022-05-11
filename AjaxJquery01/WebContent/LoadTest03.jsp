<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoadTest03.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/Main.css" type="text/css" >
<style type="text/css">
	.txtNum
	{
		width: 100px;
		text-align: right; 
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	//$(document).ready();
	$(function()
	{
		//alert("확인");
		$("#sendButton").click(function()
		{
			//alert("확인");
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			//alert(oper);
			//var url = "LoadTest03_ok.jsp?su1=" + su1 + "&su2=" + su2 + "&oper=" + oper;
			var url = "loadtest03.do?su1=" + su1 + "&su2=" + su2 + "&oper=" + oper;
			
			//alert(url);
			$("#result").load(url);
			//load()는 responseText라고 생각하면됨.
			
			
			
			
			
		});
	});
</script>
</head>
<body>

<div>
	<h1>jQuery 의 load() 활용 실습</h1>
	<hr />
</div>

<div>
	<input type="text" id="su1" class="txt" />
	<select name="oper" id="oper" class="oper">
		<option value="add">덧셈</option>
		<option value="sub">뺄셈</option>
		<option value="mul">곱셈</option>
		<option value="div">나눗셈</option>
	</select>
	
	<input type="text" id="su2" class="txt txtNum">
	
	<input type="button" value=" = " id="sendButton" class="btn">
</div>

<div id="result">
</div>
<br />


<div>
	<input type="radio" name="rdo1" />rd1
	<input type="radio" name="rdo2" />rd2
</div>

<div>
	<input type="checkbox" name="chk" />chk1
	<input type="checkbox" name="chk" />chk2
</div>

<div>
	<input type="text" />
</div>

</body>
</html>