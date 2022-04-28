<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 게시물 수정 액션 요청 시 넘어온 데이터 수신
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	
	// 삭제 액션 요청 처리 과정에서 추가한 코드
	String statusStr = request.getParameter("status");
	int status = Integer.parseInt(statusStr);
	
	
	
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	BoardDTO dto = dao.getReadData(num);
	
	
	
	//이메일 null값 처리
	String emailStr ="";
	if(dto.getEmail()!= null)
		emailStr =dto.getEmail();
	
	
	DBConn.close();
	
	if (dto==null)
		response.sendRedirect("List.jsp");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">

<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript">
	function sendIt()
	{
		//alert("확인");
		f = document.myForm;
		
		// 제목 입력 확인
		str = f.subject.value;
		str = str.trim();	
		
		//※ javascript 에는 trim() 이 존재하지 않음.
		//   외부에서 참조한 util.js 에 만들어 두었음.
		//   안녕 과  『    안녕     』다른거라 같게 만둠.
		
		//테스트
		//alert("|" + str + "|");
		
		//----------------------제목 입력 확인
		if(!str)
		{
			alert("\n제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		//제목 입력 확인----------------------
		
		
		//----------------------이름 입력 확인
		str = f.name.value;
		str = str.trim();
		if(!str)
		{
			alert("\n이름을 입력하세요");
			f.name.focus();
			return;
		}
		//이름 입력 확인---------------------- 
		
		//----------------------이메일 검사 
		// 이메일 없는 사람도 있기 때문에 입력 확인은 안할 것이다.
		// 그러나 이메일을 입력하면 이메일 포멧에 맞게 입력해야 하기 때문에
		// 필수 입력 항목이 아니므로 선택적인 입력이 가능하지만
		// 입력을 한 상황이면, 이메일 형식에 맞게 입력했는지
		// 확인하는 처리
		
		
		//이메일 검사-----------------------
		if(f.email.value) // 이메일을 입력한 상황이라면..
		{
			if(!isValidEmail(f.email.value))
			{
				alert("\n정상적인 이메일 형식을 입력하세요.");
				f.email.focus();
				return;
			}
		}
		//-----------------------이메일 검사
		
		
		// 내용 입력 확인 -------------------------------
		str = f.content.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n내용을 입력하세요.");
			f.content.focus();
			return;
		}
		//---------------------------------내용 입력 확인
		
		// 패스워드 입력 확인 --------------------------
		// 필수 입력 항목 기재 여부 확인 및 공백 처리
		str = f.pwd.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n패스워드를 입력하세요.");
			f.pwd.focus();
			return;
		}
		//---------------------------- 패스워드 입력 확인
		
		// 패스워드 일치여부 확인 -----------------------
		// 게시물 작성 시 설정한 패스워드와
		// 게시물을 수정하는 과정에서 입력한 패스워드가
		//서로 일치하는지를 확인하여 액션 처리 수행 여부 판단
		var pwdSource = f.pwdSource.value;
		if (str != pwdSource)
		{
			alert("\n패스워드가 맞지 않습니다.");
			f.pwdSource.focus();
			return;
		}
		 
		
		// ----------------------- 패스워드 일치여부 확인
		
		
		
		f.action = "<%=cp%>/Updated_ok.jsp";
		f.submit();
		
	}
	
	function removeIt()
	{
		f = document.myForm;
		// 패스워드 입력 확인 --------------------------
		// 필수 입력 항목 기재 여부 확인 및 공백 처리
		str = f.pwd.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n패스워드를 입력하세요.");
			f.pwd.focus();
			return;
		}
		//---------------------------- 패스워드 입력 확인
		
		// 패스워드 일치여부 확인 -----------------------
		// 게시물 작성 시 설정한 패스워드와
		// 게시물을 수정하는 과정에서 입력한 패스워드가
		//서로 일치하는지를 확인하여 액션 처리 수행 여부 판단
		var pwdSource = f.pwdSource.value;
		if (str != pwdSource)
		{
			alert("\n패스워드가 맞지 않습니다.");
			f.pwdSource.focus();
			return;
		}
		 
		
		// ----------------------- 패스워드 일치여부 확인
		
		
		
		f.action = "<%=cp%>/Deleted_ok.jsp";
		f.submit();
	}

</script>
		


</head>
<body>

<div id="bbs">

	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	
	<form action="" method="post" name="myForm">
	
		<div id="bbsCreated">
		
			<div class=".bbsCreated_bottomLine">
				<dl>
					<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
					<dd>
					
						<%
						if(status ==1)
						{
						%>
							<input type="text" name="subject" size="64" maxlength="100" class="boxTF" 
							value="<%=dto.getSubject() %>"/>
						<%
						}
						else		// status == 2 → 삭제 요청
						{
						%>
							<input type="text" name="subject" size="64" maxlength="100" class="boxTF" 
							value="<%=dto.getSubject() %>" disabled="disabled"/>
						<%
						}
						%>
						
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작 성 자</dt>
					<dd>
						<%
						if (status ==1)
						{
						%>
							<input type="text" name="name" size="35" maxlength="20" class="boxTF"
							value="<%=dto.getName() %>"/>
						<%
						}
						else
						{
						%>
							<input type="text" name="name" size="35" maxlength="20" class="boxTF"
							value="<%=dto.getName() %>" disabled="disabled"/>
						<%
						}
						%>
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>이 메 일</dt>
					<dd>
					
						<%
						if(status==1)
						{
						%>
							<input type="email" name="email" size="35" maxlength="50" class="boxTF" 
							value="<%=emailStr %>"/>
						<%
						}
						else
						{
						%>
							<input type="email" name="email" size="35" maxlength="50" class="boxTF" 
							value="<%=emailStr%>"disabled="disabled"/>
						<%
						}
						%>
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
			
			<div id="bbsCreated_content">
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
						<%
						if (status==1)
						{
						%>
							<!-- textarea는 공백이 그대로 공백출력되니까 계층구조지만 태그랑 붙혀서 써라. -->
							<textarea name="content" class="boxTA" cols="63" rows="12"><%=dto.getContent() %></textarea>
						<%
						}
						else
						{
						%>
							<textarea name="content" class="boxTA" cols="63" rows="12" disabled="disabled"><%=dto.getContent() %></textarea>
						<%
						}
						%>
					</dd>
				</dl>
			</div><!-- close #bbsCreated_content -->
			
			<div class="bbsCreated_noLine">
				<dl>
					<dt>패스워드</dt>
					<dd>
						<input type="hidden" name="pwdSource" value="<%=dto.getPwd()%>"/>
						<input type="password" name="pwd" size="35" maxlength="10" class="boxTF"/>
						&nbsp;<span style="color: red;">(게시물 수정 및 삭제 시 필요)</span>
					</dd>
				</dl>
			</div><!-- close .bbsCreated_noLine-->
			
			<div id="bbsCreated_footer">
				<!-- Update_ok.jsp 페이지 요청 과정에서 추가로 필요한 데이터 -->
				<input type="hidden" name="num"	value="<%=dto.getNum()%>"/>
				<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
			
			
			
				<%
				if (status==1)
				{
				%>
					<input type="button" value="수정하기" class="btn2" onclick="sendIt()">
					<input type="reset" value="다시입력" class="btn2"
					onclick="document.myForm.subject.focus();">
					<input type="button" value="작성취소" class="btn2"
					onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'" >
				<%
				}
				else
				{
				%>
					<input type="button" value="삭제하기" class="btn2" onclick="removeIt()">
					<input type="button" value="삭제취소" class="btn2"
					onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'" >
					<%-- onclick="javascript:location.replace('<%=cp %>/List.jsp?pageNum=<%=pageNum %>')" > --%>
				<%
				}
				%>
			</div><!-- close #bbsCreated_footer -->
			
		</div><!-- close #bbsCreated -->
	
	</form>

</div><!-- close #bbs -->

</body>
</html>