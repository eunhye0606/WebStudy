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
<style type="text/css">
	#result
	{
		display: inline-block;
		width: 250px;
		color: #F33;
	}
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">
	function check()
	{
		//alert("뭐야");
		//데이터 수집
		var id = document.getElementById("id").value;
		
		if(id=="")
		{
			document.getElementById("result").innerText = "아이디를 입력하세요.";
			return;
		}
		
		// URL
		var url = "test03.do?id=" + id;
		
		//AJAX 객체(→XMlHttpRequest 객체) 생성
		ajax = createAjax();
		
		//환경 설정(『open("메소드 방식", url, 비동기/동기)』)
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState==4 && ajax.status==200)
			{
				// 업무 처리(→ 외부로 추출)
				callback();		
			}
		};
		
		ajax.send("");
		
		
	}
	
	// 아이디 중복 검사의 결과(1 or 0)를 통보받아
	// 사용자에게 메세지 출력 → span → result
	function callback()
	{
		// 외부로 추출된 업무 처리 내용 구성(responseText / responseXML)
		var data = ajax.responseText;
		
		data = parseInt(data);
		
		if(data==0)
		{
			document.getElementById("result").innerText = "사용 가능한 아이디입니다.";
		}
		else
		{
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
		}
	}
</script>
</head>
<body>

<div>
	<h1>회원 가입</h1>
	<p>- Test03send.java</p>
	<p>- AjaxTest03.jsp</p>
	<p>- ajax.js</p>
	<p>- main.css</p>
	<p>- Test03.java</p>
	<p>- Test03Ok.jsp</p>
	<p>- web.xml</p>
	<p>※ url : test03send.do / test03.do</p>
	<p>※ 자료구조 활용</p>
</div>
<br />
<br />
<br />
<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control" />
			<input type="button" value="중복검사" class="control" onclick="check()"/>
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td><input type="text" id="name" class="text"/></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" id="addr" class="text"/></td>
	</tr>
</table>


</body>
</html>