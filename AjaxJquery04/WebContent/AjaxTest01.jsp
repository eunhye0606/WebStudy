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
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/Main.css" type="text/css" >
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("호");
			
			//data 구성
			var params = "name=" + $.trim($("#name").val())
						+ "&content=" + $.trim($("#content").val());
			
			
			
			//check
			//jQuery 의 ajax() 함수 사용(호출)
			/* 
			$.ajax(
			{
				type:"GET" 					//--POST, 함수이름에 의존적 x 속성값에 의존적
				, url:"AjaxTest01_ok.jsp"
				, data:params				//-- AjaxTest01_ok.jsp 에서 수신하게 되는 데이터
				, success:동작				//-- 데이터요청 및 전달이 성공했을 때 처리
				, beforeSend:반환값확인		//-- 요청 전 확인해야 할 항목 처리(true/false)를 반환하도록 구성
											//-- ex. true → submit()하는 등..
				,error:동작					//-- 처리 과정에서 문제가 발생했을 때
					
			});
			// */
			 
			$.ajax(
			{
				type:"POST" 					//--POST, 함수이름에 의존적 x 속성값에 의존적
				, url:"AjaxTest01_ok.jsp"
				, data:params					//-- AjaxTest01_ok.jsp 에서 수신하게 되는 데이터
				, success: function(data)
				{
					$("#resultDiv").html(data);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				}
				, beforeSend:showRequest		//--true / false			//check
				  //--       ----------- 속성값이기 때문에 동작이 아니고
				  //                     showRequest()라고 안쓴다!!! check!!!
				,error: function(e)
				{
					alert(e.responseText);
				}
					
			});
		});
	});
	
	function showRequest()
	{
		if (!$.trim($("#name").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			
			return false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
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
	<hr />
</div>

<div>
	이름<input type="text" id="name" class="txt">
	내용
	<textarea rows="3" cols="50" id="content"></textarea>
	<br /><br />
	<input type="button" id="sendBtn" value="보내기" class="btn">
</div>
<br /><br />
<div id="resultDiv"></div>
	

</body>
</html>