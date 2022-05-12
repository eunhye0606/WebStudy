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
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/Main.css" type="text/css" >
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#sendBtn").click(function()
		{
			
			
			/* 내가 한 내용 */
			//alert("확인");
			 
			var params = "title=" + $.trim($("#title").val()) + "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type:"POST"
				, url:"AjaxTest03_ok.jsp"
				, data:params
				, dataType:"xml"
				, success: function(data)
				{
					//console.log(data);
					
					var out="";
					
					$(data).find("item").each(function()
					//-----
					//이게 xml 최상위 태그(root tag)
					{
						//alert("니가문제니");
						var item = $(this);
						var num = item.attr("num");
						var title = item.find("title").text();
						var content = item.find("content").text();
						
						
						out += ">> id" + num;
						out += "<br> - title=" + title;
						out += "<br> - content=" + content;
						out += "<br>";
						
					});
					//$("#resultDiv").html("");
					//alert(out);
					$("#resultDiv").html(out); 
				}
				, beforeSend:check
				, error: function(e)
				{
					alert(e.responseText);
				}
			});
		});
		  
	});
	
	function check()
	{
		//if(!$.trim($("#title").val)=="")
		//if(!$.trim("#title").val()))
		if($.trim($("title").val()))
		{
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;
		}
		
		if($.trim($("content").val()))
		{
			alert("내용을 입력하세요");
			$("#content").focus();
			return false;
		}
		
		return true;
	}


</script>


</head>
<body>

<div>
	<h1>jQuery의 ajax() 활용 실습</h1>
	<p>xml control</p>
	<hr />
</div>

<div>
	제목<input type="text" id="title" class="txt">
	<br /><br />
	내용<input type="text" id="content" class="txt">

	<br /><br />

	<input type="button" id="sendBtn" value="등록하긔" class="btn">
</div>
<br /><br />
<div id="resultDiv">
<!-- >> id=1
- title=테스트
- content=반갑습니다.

>> id=2
- title=테스트
- content=반갑습니다. -->

</div>
	

</body>
</html>