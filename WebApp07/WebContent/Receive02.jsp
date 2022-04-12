<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int tot= 0;
	double avg= 0;
	int kor= 0, eng =0, mat =0;
	
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		tot = kor + eng + mat;
		/* avg = round(tot/3.0,1); */
		/* String temp = String.format("%.1f",(tot/3.0)); */
		/* avg = Integer.parseInt(temp); */
		/* avg = Math.round((tot/3.0)/100.0); */
		avg =(tot/3.0);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>
<div>
	<h1>
	<span style="color: black;"><%=name %><span>님 성적 처리가 완료 되었습니다.
	회원님의 점수는<br>
	국어: <%=kor %>점, 영어 : <%=eng %>점, 수학 : <%=mat %>점 입니다.<br>
	총점은 <%=tot %>점, 평균은 <%=String.format("%.1f",avg) %> 입니다.
	</h1>
</div>

</body>
</html>