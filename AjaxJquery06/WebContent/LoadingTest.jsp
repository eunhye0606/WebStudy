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
<title>AjaxJquery06.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/Main.css" type="text/css" >

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("확인");
			
			var params = "name=" + $.trim($("#name").val())
						+"&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type:"POST"
				, url : "LoadingTest_ok.jsp"
				, data:params
				, success: function(args)
				{
					$("#result").html(args);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
					
				}
				, beforeSend:showRequest
				, err: function(e)
				{
					alert(e.responseText);
				}
			});
		
		});
		
		//check!
		//$(document).ajaxStart(기능,동작,행위).ajaxComplete(기능,동작,행위);
		// dom으로 부터 시작해서 ajax시작 ~ 완료 ~ 연결되는 형태로 구성
		//                                     -- 2. 콤마 아님 주의!
		// ajax가 시작되면 어떤 동작해라 ~ 끝나면 어떤 동작해라~
		// 1. 우리가 호출 x / js 엔진이 호출
		$(document).ajaxStart(function()
		{
			//ajax 요청 시작 시...
			
			$("#loading").show();
			// 이미지를 보여주고
			$("#result").hide();
			//result는 감추고
			
		}).ajaxComplete(function()
		{
			//ajax 요청 종료(완료) 시 ...
			
			$("#loading").hide();
			// 이미지를 감추고
			$("#result").show();
			//result는 보여주고
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
	};
</script>
</head>
<body>

<div>
	<h1>jQuery의 ajax() 활용 실습</h1>
	<p>로딩 이미지 적용</p>
	<hr />
</div>

<div>
	이름 <input type="text" id="name" class="txt" /><br /><br />
	내용 <input type="text" id="content" class="txt" /><br /><br />
	
	<input type="button" value="등록하기" id="sendBtn" class="btn"/>
	
	<!-- 
	놀라운 사실!
	처리 중인 프로그레스바를(3%진행중...) 사용자에게 안보여주는게
	더 빨리 처리되는데, 그걸 사용자에게 보여주는 경우가 많음.
	그걸 안보여주고 처리하는데 집중하면...
	ex. 아메리카노 주세요 / (샷뽑는 중...)
	샷뽑고 손놈한테가서 샷뽑았어요! 
	얼음 넣고 얼음넣었어요!
	홀더끼고 홀더꼈어요!
	하고 사용자에게 알려줌.
	→ 더 느려지는게 당연함. 그렇다면 이걸 왜 하는 것인가?
	페이지 요청했는데 아무 반응 없으면, 『사용자는 페이지를 탈출할 수있다. 혹은 새로고침..』
										----------------------------------------------------
	그러면 아아메 80%만들었는데 새로만들어야함 ㅠ 그게 더 낭비임..
	
	ajax → 백그라운드에서 일 처리. 지금 스텝이 뛰어가는지, 전달했는지, 오고 있는지를
	사용자가 확인 불가! 
	그러다 보니까 ajax처리 과정에서 대부분 페이지를 탈주하거나, f5하는 등 사용자 액션이 처리될 수 있음.
	『지금하는 짓 : 로딩이미지 보여주는 코드 짜는 법!』
	
	// -->
<div id="loading" style="display: none;">
	<img src="images/loading_01.gif" alt="loading" style="align-content: center;"/>
</div>
</div>
<br /><br />
<div id="result">
</div>

</body>
</html>