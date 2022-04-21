<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// TestSession01_ok.jsp 페이지에서 되돌려 보내면서
	// session 의 userId 에 superman 을, userName 에 홍은혜를 담아서 보낸 상황
	String userId = (String)session.getAttribute("userId");			// "superman"
	String userName = (String)session.getAttribute("userName");		// "홍은혜"
	//-- 『session.getAttribute("userId");』는
	//    Object 타입을 반환하므로
	//    String 타입으로 변환하는 과정 필요
	
	//1. 이 페이지를 최초 요청 → session에 userId / userName X
	//2. 베트맨, 1234 		   → session에 userId / userName X
	//3. 슈퍼맨, 123456        → session에 userId / userName O	


	// 추가 ! 
	// 세션 시간 변경 ----------------------------------------------------------------
	// (로그아웃을 수행하지 않더라도 세션을 제거하는 방법)
	
	// ※ 세션 기본(default) 시간은 1800초
	session.setMaxInactiveInterval(10);
	//-- 세션이 유지되는 시간을 10초로 설정한 상태.
	//   이로 인해..
	//   로그인 후 10초 동안 아무 액션도 없는 상태에서...(허공 클릭 == 아무 액션 x)
	//   다시 페이지 새로고침을 수행하면 로그아웃 처리된 것을 확인 할 수 있다.
	
	
	
	// ----------------------------------------------------------------- 세션 시간 변경
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >
<style type="text/css">
	a {text-decoration: none;}
	.btnMenu
	{
		border: 1px solid gray;
		border-radius: 3px;
		font-size: 8pt;
		width: 60px;
		height: 20px;
	}
</style>
<script type="text/javascript">
	function sendIt()
	{
		//확인
		//alert("함수호출확인");
		
		
		//※ document.『name』으로 바로 가져오기 가능.
		var f = document.myForm;
		
		if (!f.userId.value)
		{
			alert("아이디를 입력해야 합니다.");
			f.userId.focus();
			return;
		}
		
		if (!f.userPwd.value)
		{
			alert("패스워드를 입력해야 합니다.");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
		
	}
</script>
</head>
<body>

<div>
	<h1>세션 처리 - 로그인</h1>
	<hr />
</div>

<div>
	<table>
		<tr>
			<td>
				<a href="">
					<button type="button"class="btnMenu btn01">게시판</button>
				</a> |
				
				
				<%
				if (userId==null)	//session X일 때,
				{
				%>
				<a href="">
					<button type="button" class="btnMenu btn02" disabled="disabled">일정관리</button>
				</a> |
				<a href="">
					<button type="button" class="btnMenu btn02" disabled="disabled">친구관리</button>
				</a>
				<%
				}
				else
				{
				%>
				<a href="Sce.jsp">
					<button type="button" class="btnMenu btn01">일정관리</button>
				</a> |
				<a href="Fri.jsp">
					<button type="button" class="btnMenu btn01">친구관리</button>
				</a>
				<%
				}
				%>
			</td>
		</tr>
	</table>
	<br /><br />
	
	<table>
		<tr>
			<td>
			
			
				<%
				if (userId==null)
				{
				%>
				<form action="TestSession01_ok.jsp" method="post" name="myForm">
					
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" class="txt" name="userId" style="width: 150px;"/></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="text" class="txt" name="userPwd" style="width: 150px;" /></td>
						</tr>
						<tr>
							<td colspan="2"> 
								<button type="button"class='btn' style="width: 100%;" onclick="sendIt()">로그인</button>
							</td>
						</tr>
					</table>
					
				</form>
				<%
				}
				else
				{
				%>
				<h2><%=userName %>(<%=userId %>)님! 환영합니다.</h2>
				<h2>이제, 일정관리와 친구관리 서비스를 이용할 수 있습니다.</h2>
				<p>
					<a href="Logout.jsp">
						<button type="button" class='btnMenu btn01'>로그아웃</button>
					</a>
				</p>
				<%
				}
				%>
			</td>
		</tr>
	</table>
</div>


</body>
</html>