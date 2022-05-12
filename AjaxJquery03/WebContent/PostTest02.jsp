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
<title>PostTest02.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/Main.css" type="text/css" >
<style type="text/css">
	#resultDiv
	{
		width: 240px;
		height: 180px;
		border: 2px solid #499bd7;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("확인");
			
			$.post("PostTest02_ok.jsp"
					,{
				title : $("#title").val()
				, content : $("#content").val()
			}, function(data)
			{
				$("#resultDiv").html(data);
			});
			
			/* 
			var title = $("#title").val();
			var content = $("#content").val();
			
			//alert(title);
			
			
			//$.post("PostTest02_ok.jsp", {title:title,content:content})
			
			$.post("PostTest02_ok.jsp"
			, {
				title:title
				, content:content
			}, function(data)
			{
				$("#resultDiv").html(data);
			});
			 */
			
			
		});
	});
</script>
</head>
<body>
<!-- POST니까 한번에 url로 넘기는 것이 아니다 하나하나 바인딩 -->
<div>
	<h1>jQuery 의 post() 활용 실습</h1>
	<hr />
</div>

<div>
	제목 : <input type="text" id="title" class="txt">
	<br /><br />
	내용 : <input type="text" id="content" class="txt">
	<input type="button" id="sendBtn" value="보내기" class="btn">
</div>
<br /><br />
<div id="resultDiv"></div>
</body>
</html>