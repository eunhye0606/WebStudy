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
<title>GetTest01.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/Main.css" type="text/css" >
<style type="text/css">
	.txtNum
	{
		width: 100px;
		text-align: right; 
	}
	#result
	{
		color: red;
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	// ※ 『$.get(url, data, callBack)』
	//     --- jQuery 객체
	//     jQuery 객체.get()임. (선택자.get() 아님.)
	//    : 매개변수로 전달받은 URL 을 사용하여 서버에 대한 GET 요청을 전송한다.
	
	//    cf. ajax.open("GET", url, async)
	$(function()
	{
		$("#sendButton").click(function()
		{
			//테스트
			//alert("확인");
			
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			// check!
			//$.get("GetTest01_ok.jsp",{이름:값, 이름:값,...},);
			//$.get("GetTest01_ok.jsp",{su1:su1, su2:su2, oper:oper}, 기능 );
			$.get("GetTest01_ok.jsp"
				,{
					su1:su1
					, su2:su2
					, oper:oper
				}, function(args)
			{
				$("#result").html(args);
			});
			//$.get("GetTest01_ok.jsp",{su1:su1, su2:su2, oper:oper}, function(args){$("#result").html(args);});
			
			//$.get("요청url",{su1:su1, su2:su2, oper:oper}, function(넘겨받은 값){$(선택자).html(넘겨받은 값);});
			
		});
	});

</script>
</head>
<body>

<div>
	<h1>jQuery 의 get() 활용 실습</h1>
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