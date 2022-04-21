<%@ page contentType="text/html; charset=UTF-8"%>
<%
	response.setCharacterEncoding("UTF-8");
	
	//세션 제거 메소드는 2개나 있는데
	//쿠키 제거 메소드는 없삼.
	
	//그래서 !
	//비어있는 내용으로 기존의 쿠키를 덮어쓰기 하는 개념.
	//마치 오라클 default 같이!(default set null!)
	
	//같은 키를 가지는 쿠키 생성
	//------- 
	//check!
	Cookie killCookie = new Cookie("cookie_test",null);
	
	
	// 쿠키설정
	// 매개변수가 0이면 생성되고 바로 사라진다.
	killCookie.setMaxAge(0);
	
	
	//쿠키 추가 (덮어쓰기)
	response.addCookie(killCookie);
	//-- 처음 쿠키를 구성할 때에도 『addCookie()』로 처리하였기 때문에
	//   삭제할 때에도 『addCookie()』로 처리해야 안정적으로 삭제.
	//   즉, 내용이 포함된 쿠키를 심었다가...
	//   이번에는 내용이 비어있는 쿠키를 심는다는 개념.
	
	
	//※ 여기서 쿠키 삭제는 클라이언트 입장에서의 삭제이다.
	//   한 명의 클라이언트가 쿠키를 삭제했다고 해서
	//   다른 클라이언트들의 쿠키도 삭제되면 안되기 때문에
	//   이 쿠키의 정보는 로컬 PC 에서 컨트롤하게 된다.(브라우저가!)
	//   쿠키의 저장 장소는 서버 x 클라이언트의 로컬 PC
	
	//바람직하지 않다 . (옛날에 헤더에 쿠키정보 활용하는거.)
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestRemoveCookie.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
</head>
<body>

<div>
	<h1>쿠키 정보 삭제하기</h1>
	<hr />
</div>

<div>
	<h2>성공적으로 쿠키를 제거했습니다.</h2>
</div>

<br />
<div>
	<a href="TestSetCookie.jsp"><button type="button" class="btn">쿠키 정보 설정</button></a>
	<a href="TestGetCookie.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
</div>

</body>
</html>