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
<title>AjaxTest02.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/Main.css" type="text/css" >
<style type="text/css">
	.short
	{
		width: 50px;
		text-align: right;
	}
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">
	function sum()
	{
		//alert("확인");
		
		// 데이터 수집
		var n1 = document.getElementById("num1").value;
		var n2 = document.getElementById("num2").value;
		
		//URL 구성
		var url = "test02.do?n1=" + n1 +"&n2=" + n2;
		
		//XMLHttpRequest 객체 생성 (→ AJAX 객체)
		ajax = createAjax();		//--ajax.js
		
		
		// 실행 x 환경 설정 // 그래서 먼저 설정해도 됨.
		// 『GET』 : 데이터 전송 및 페이지 요청 방식(POST 사용 가능. POST 사용 시, 헤더 추가 필요)
		// 『url』 : AJAX 요청 페이지(데이터 수신 및 응답 페이지)
		// 『true』: boolean → true(비동기), false(동기). 동기는 사용 안함.
		//                      ------------ 약관동의같은 느낌.
		ajax.open("GET", url, true);
		//-- 실제 서버와의 연결이 아니고 일종의 환경 설정 부분으로 이해하는 것이 좋다.
		//   (실제 서버 연결은 나중에...)
		
		//AJAX는 버튼을 눌렀다고 동작하는 것이 아니라
		//서버와 통신에서 서버가 응답할 수 있는 상태가 되면 동작하는 것!
		
		// ajax 객체(XMlHttpRequest 객체)의 readyState 속성은
		// 서버와의 소통관계에서 자기가 알아서 단계별로 변화된다.(0~4) 순차적으로 증가한다.
		// 순차적으로 변화할 때 마다 『readyStatechange』 이벤트가 발생한다.
		ajax.onreadystatechange = function()			//-- 우리가 call 하는게 아니라 ajax가 알아서 호출(콜백한다. 라고 표현)
		{
			// 매번 기능하는 것이 아니라 4단계가 되면 실행한다.
			// 그 중에서....(0 부터 4까지의 상태 중에서...)
			// 요청했던 서버로부터 응답이 완료된 시점이기 때문에
			// 4 인경우 ... 수행해야 할 업무를 진행한다.
			if (ajax.readyState == 4)
			{
				// 서버로부터 응답이 완료되었다 하더라도
				// 그 과정에서 데이터가 올바른 것인지 에러 메세지를 받은 것인지
				// 알 수 없기 때문에 서버로부터 응답 받은 코드를 확인한 후
				// 업무를 진행할 수 있도록 처리(구성)한다.
				if (ajax.status == 200)
				{
					// 업무 진행(상태가 만족되면 알아서 함수가 호출됨.)
					//-- 업무 코드를 외부로 추출
					callBack();
				}
			}
		};
		
		// 실제 ajax가 업무 실행하게 하는 것
		// GET방식에서 빈 문자열이라도 넘기는 것이 에러 줄일 수 있다.
		// 실제 서버에서 AJAX 요청을 한다.(즉, 이 부분이 진짜 연결 작업이다.)
		// GET 방식으로 데이터를 전송하는 경우... 인자값이""
		// POST 방식으로 데이터를 전송하는 경우... 인자값에 데이터를 넣는다.
		// 현재는 GET 방식의 요청이다. (비워두는 것은 하지말자.)
		ajax.send("");
		
		
	}
	
	// 추출된 업무 코드
	//-- AJAX 요청이 완료된 후 호출되는 최종 업무 처리 함수
	function callBack()
	{
		// 여기서는 두 가지 방법 중 하나로 데이터를 가져온다.
		
		// 1. 서버에서 응답한 데이터가 텍스트일 경우
		var data = ajax.responseText;
		
		// 2. 서버에서 응답한 데이터가 XML일 경우(다량의 데이터)
		// var data = ajax.responseXML;
		
		// 받아온 데이터를 업무에 적용한다.
		//console.log(data);
		document.getElementById("result").value = data;
	}
</script>
</head>
<body>

<div>
	<h1>AJAX 기본 실습</h1>
	<hr>
</div>

<input type="text" id="num1" class="short" />
+
<input type="text" id="num2" class="short" />
<input type="button" value=" = " onclick="sum()">
<input type="text" id="result" class="short">

<br /><br />

<h2>같은 페이지에 있는 기타 다른 요소들</h2>

<input type="text">
<br />

<input type="checkbox" name="check" value="check1" />체크1
<input type="checkbox" name="check" value="check2" />체크2
<br />

<input type="radio" name="rdo" value="rdo1" />라디오1
<input type="radio" name="rdo" value="rdo2" />라디오2
<br /><br />

<select>
	<option value="1">선택1</option>
	<option value="2">선택2</option>
	<option value="3">선택3</option>
	<option value="4">선택4</option>
	<option value="5">선택5</option>
</select>
</body>
</html>