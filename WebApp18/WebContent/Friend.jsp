<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
<script type="text/javascript">
	function sendIt()
	{
		var f = document.myForm;
		
		var name = document.getElementById("name");
		var nameMsg = document.getElementById("nameMsg");
		
		var age = document.getElementById("age");
		var ageMsg = document.getElementById("ageMsg");
		
		var male = document.getElementById("male");
		var female = document.getElementById("female");
		var genderMsg = document.getElementById("genderMsg");
		
		nameMsg.style.display ="none";
		ageMsg.style.display ="none";
		genderMsg.style.display ="none";
		
		//alert(name.value);
		//alert(age.value);
		//alert(male.checked);
		//alert(female.checked);
		
		
		//!f.name.value
		if(name.value=="")
		{
			nameMsg.style.display="inline";
			name.focus();
			return;
		}
		else if (age.value=="")
		{
			ageMsg.style.display="inline";
			age.focus();
			return;
		}
		else if (!male.checked && !female.checked)
		{
			genderMsg.style.display ="inline";
			male.focus();
			return;
		}
		
		f.submit();
	}
</script>
</head>
<body>
<div>
	<h1>데이터 입력</h1>
	<h2>Friend.jsp</h2>
	<hr />
</div>
<!-- com.test.FriendDTO.java -->
<!-- Friend_ok.jsp -->
<div>
	<form action="Friend_ok.jsp" method="get" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input style="width: 100%;"type="text" class="txt" name="name" id="name"/>
				</td>
				<td>
					<span class="errMsg" id="nameMsg"> 이름을 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input style="width: 100%;" type="text" class="txt" name="age" id="age"/>
				</td>
				<td>
					<span class="errMsg" id="ageMsg"> 나이을 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" id="male" name="gender" value="남자" />
						남자
					</label>
					<label>
						<input type="radio" id="female" name="gender" value="여자" />
						여자
					</label>
				</td>
				<td>
					<span class="errMsg" id="genderMsg"> 성별을 선택하세요.</span>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label>
						<input type="checkbox" name="idelType" id="t1" value="카리나"/>
						카리나
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t2" value="수지"/>
						수지
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t3" value="김지수"/>
						김지수
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t4" value="유재석"/>
						유재석
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t5" value="남주혁"/>
						남주혁
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t6" value="박보검"/>
						박보검
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button class="btn" type="button" onclick="sendIt()"style="width: 100%; font-size: 16pt;">등록</button></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>