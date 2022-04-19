<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >

<script type="text/javascript">
	function memberSubmit()
	{
		//alert("함수 호출 확인");
		
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		//이거 하는 이유. 초기화하려고
		nameMsg.style.display = "none";
		if (uName.value =="")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			// 함수 끝내기.
			// submit 안해야 해서!
			return;
		}
		
		// form을 직접 지정하여 submit 액션 수행
		memberForm.submit();
	}
	
	function memberReset()
	{
		//alert("확인");
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display ="none";
		// form을 직접 지정하여 reset 액션 수행
		memberForm.reset();
		uName.focus();
		
		// 필요없다.
		//return;
	}
</script>

</head>
<body>
<div>
	<h1>회원 <span style="color:red; ">명단</span> 관리
	      및 <span style="color:red; ">입력</span> 페이지</h1>
	<hr />
</div>

<div><a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a></div>
<br />
<div>
	<form action="MemberInsert.jsp"method="post"id="memberForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td><input type="text" id="uName" name="uName" /></td>
				<td><span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="uTel" name="uTel" /></td>
				<td></td>
			</tr>
		</table>
		<br />
		<a href="javascript:memberSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
</html>