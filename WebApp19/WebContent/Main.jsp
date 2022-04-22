<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
<style type="text/css">
	* {font-size: 9pt;}
</style>
</head>
<body style="font-size: 9px;">

<div>
	<table style="wdith: 400px" border="1">
		<tr>
			<td colspan="2">
			<!-- Top -->
			<jsp:include page="Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr style="height: 300px;">
			<td style="width:100px;">
			<!-- Left -->
			<jsp:include page="Left.jsp"></jsp:include>
			</td>
			<td>
				Main(메인 화면)
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- Botoom -->
			<jsp:include page="Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</div>


</body>
</html>