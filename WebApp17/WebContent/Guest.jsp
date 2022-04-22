<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<link rel="stylesheet" href="css/MyCss.css" type="text/css" >
<script type="text/javascript">
	function sendIt()
	{
		var f = document.myForm;
		f.submit();
	}
</script>
</head>
<body>
<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<h2>Guest.jsp</h2>
	<hr />
</div>


<div>
	<form action="Guest_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" class="txt" name="userName" />
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" class="txt" name="subject" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" cols="30" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn" style="width: 100%; height: 50px;">방명록 작성</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>