<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 강의장에서 서로 테스트 ㅎ해보세요 ㅎ
	//접속자 수 처리
	int n = 0;

	String count = (String)application.getAttribute("count");
	//-- 확인 결과 null → count 속성 없다는 뜻.
	
	if(count != null)
	{
		n = Integer.parseInt(count);
	}
	n++;
	application.setAttribute("count", Integer.toString(n));
	
	// 실제 접속자 주소 처리(콘솔 창을 통해 확인)
	String realPath = application.getRealPath("/");
	// 접속자 ip 를 log에 꽝꽝꽝. 사설아이피는 보여줄수있는 환경 x 
	// 강의장 가면 재밌음.
	application.log("접속자 : "+ request.getRemoteAddr());
	
	//자기자신 :정보: 접속자 : 0:0:0:0:0:0:0:1
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestApplication.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>
<div>
	<h1>Application 을 활용한 접속자 수 체크</h1>
	<hr />
</div>

<div>
	<h2>총 접속자 : <%=n %></h2>
	<h2>웹 서버 실제 경로 : <%=realPath %></h2>
</div>
</body>
</html>