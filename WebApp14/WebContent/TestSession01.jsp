<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
<style type="text/css">
	.btn01 {width: 100%;}
</style>
<script type="text/javascript">
	function formCheck()
	{
		//alert("확인");
		
		// getElementById() 말고 다른 방법!
		// 앞에서 배운건 name속성으로 쓰는법!
		/* var f = document.forms[0];
		alert(f);
		alert(f.elements[0]); */
		
		
		
		var f = document.getElementById("form");
		
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		var uTel = document.getElementById("uTel");
		var telMsg = document.getElementById("telMsg");
		
		nameMsg.style.display = "none";
		telMsg.style.display = "none";
		
		//alert(uName.value);
		
		if(uName.value=="")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return;
		}
		
		if (uTel.value=="")
		{
			telMsg.style.display = "inline";
			uTel.focus();
			return;
		}
		
		f.submit();
		
	}
</script>
</head>
<body>
<!-- 
	○ TestSession01.jsp 에서 TestSession02.jsp 로
	   이름과 전화번호를 입력받아 전송
	   
	   TestSession02.jsp 에서 TestSession03.jsp 로
	   아이디와 패스워드를 입력받고
	   앞에서 전달받은 이름과 전화번호를 함께 전송
	   
	   TestSession03.jsp 에서 전달받은 이름, 전화번호, 아이디, 패스워드 출력
	   
	   01 →→→→→→→→→→ 02 →→→→→→→→→→ 03
	   이름, 전화			   아이디,패스워드		   이름,전화,아이디, 패스워드
	   입력 				   입력					   출력
	   
	   				-getParameter				- getAttibute
	   
	   
	   ※ 즉, 01 에서 02 로 넘겨받을 땐 getParameter
	      02 에서 03 으로 넘겨받을 땐 getParameter 와 getAttribute 로 세션 활용
	      01 에서 03 으로 넘겨줄 수 없기 때문에 세션 (session) 활용
	   
	   ※ session 외에 input 태그 hidden 속성을 이용한 정보 전달 가능.
 -->
 <div>
 	<h1>Session 실습 중</h1>
 	<h2>TestSession01.jsp</h2>
 	<hr />
 </div>
 <div>
 	<form action="TestSession02.jsp" method="post" id="form">
 		<table class="table">
 			<tr>
 				<th colspan="3" style="background-color: #B2CCFF; font-weight: bold;">이름과 전화번호 입력 란</th>
 			</tr>
 			<tr>
 				<th>이름</th>
 				<td>
 					<input type="text" id="uName" name="uName">
 				</td>
 				<td>
 					<span class="errMsg" id="nameMsg">이름을 입력하세요</span>
 				</td>
 			</tr>
 			<tr>
 				<th>전화번호</th>
 				<td>
 					<input type="text" id="uTel" name="uTel" />
 				</td>
 				<td><span class="errMsg" id="telMsg">전화번호를 입력하세요</span></td>
 			</tr>
 			<tr>
 				<td colspan="3">
 					<!-- <input type="button" value="입력" class="btn01" onclick="formCheck()"> -->
 					<!-- <button class="btn01" onclick="formCheck()">입력하기</button> -->
 					<button type= "button"class="btn01" onclick="formCheck()">입력하기</button>
 				</td>
 			</tr>
 		</table>
 	</form>
 </div>
</body>
</html>