<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>
<div>
	<h1>JSP 액션 태그 실습</h1>
</div>

<div>
	<!-- ① 첫 번째 방법 -->
	<!-- <form action="Calc_ok1.jsp" method="post" name="myform"> -->
	<!-- ② 두 번째 방법 -->
	<!-- <form action="Calc_ok2.jsp" method="post" name="myform"> -->
	<!-- ③ 세 번째 방법 -->
	<form action="Calc_ok3.jsp" method="post" name="myform">
		<table class="table">
			<tr>
				<th>첫 번째 정수</th>
				<td>
					<input class="txt" type="text" name="su1"/>
				</td>
			</tr>
			<tr>
				<th>연산자</th>
				<td>
					<select name="op">
						<option value="+">더하기</option>
						<option value="-">빼기</option>
						<option value="*">곱하기</option>
						<option value="/">나누기</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>두 번째 정수</th>
				<td>
					<input class="txt" type="text" name="su2"/>
				</td>
			</tr>
				
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" style="width: 100%;"> = </button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>