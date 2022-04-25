<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/style.css" type="text/css" >
<link rel="stylesheet" href="<%=cp %>/css/list.css" type="text/css" >
</head>
<body>

<%--
<div>
	<h1><%=cp %></h1>
</div>
 --%>

<div id="bbsList">

	<div id="bbsList_title">
		게 시 판(JDBC 연동 버전)
	</div>
	
	<div id="bbsList_header">
		
		<div id="leftHeader">
			<form action=""name="searchForm" method="post">
				<select name="searchKey" class="selectFiled">
					<option value="subject"></option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchValue" class="textFiled" value="" />
				<input type="button" value="검색" class="btn2"/>
			</form>
			
		</div><!-- #leftHeader" -->
		
		<div id="rightHeader">
			<input type="button" value="글올리기" class="btn2"/>
		</div><!-- #rightHeader -->
		
	</div><!-- #bbsList_header -->
	
	<div id="bbsList_list">
		<div id="title">
			<dl>
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="name">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl> 
		</div><!-- #title -->
		
		<div id="lists">
			<dl>
				<dd class="num">1</dd>
				<dd class="subject">안녕하세요</dd>
				<dd class="name">김정용</dd>
				<dd class="created">2022-04-25</dd>
				<dd class="hitCount">0</dd>
			</dl>
			
		</div><!-- #lists -->
		
		<div id="footer">
			<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 42</p>
		</div><!-- #footer -->
		
	</div><!-- #bbsList_list -->

</div><!-- #bbsList -->

</body>
</html>