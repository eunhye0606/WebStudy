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
<title>GetTest02.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/Main.css" type="text/css" >
<style type="text/css">
	body
	{
		font-size: 10pt;
		font-family: 굴림;
	}
	#resultDiv
	{
		width: 180px;
		height: 180px;
		border: 2px solid #499bd7;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#loadBtn").click(function()
		{
			//alert("확인");
			var nickName = $("#nickName").val();
			var dkTK = "뿌뿌뿌";
			//alert(nickName);
			
			//$.get("GetTest02_ok.jsp",{nickName:nickName}, function(args)
			//$.get("GetTest02_ok.jsp",nickName, function(args) → 단일값은 같은 방법 처리 ?
			//$.get("GetTest02_ok.jsp",nickName:nickName, function(args) → {} 없이 키 : 값 처리 안됨.
			//$.get("GetTest02_ok.jsp",{nickName,dkTK}, function(args)
			$.get("GetTest02_ok.jsp",{nickName}, function(args)
			{
				// id 를 잘 읽자!
				$("#resultDiv").html(args);
			});
		});
			
		$("#clearBtn").click(function()
		{
			$("#resultDiv").empty();
		});
	});
</script>
</head>
<body>

<div>
	<h1>jQuery의 get() 활용 실습</h1>
	<hr />
</div>

<div>
	<input type="text" id="nickName" class="txt" />
	<br />
	<button id="loadBtn" class="btn" type="button">눌러보자</button>
	<button id="clearBtn" class="btn" type="button">지워보자</button>
</div>
<br />

<div id="resultDiv">
</div>

</body>
</html>