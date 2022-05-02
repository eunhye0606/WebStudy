<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	//MemberInsert.jsp
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	
	// 5명분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
	
	for(int i=1; i<=5; i++)
	{
		MemberDTO ob = new MemberDTO(
				request.getParameter("name" + i)
				,request.getParameter("tel" + i)
				,request.getParameter("addr"+ i));
		lists.add(ob);
		/* MemberDTO dto = new MemberDTO();
		
		dto.setName(request.getParameter("name"+i));
		dto.setTel(request.getParameter("tel"+i));
		dto.setAddr(request.getParameter("addr"+i));
		
		lists.add(dto); */
	}
	request.setAttribute("lists", lists);
	//response.sendRedirect("MemberList.jsp");
	
	// MemberList.jsp 를 요청할 수 있도록 안내
%>
<jsp:forward page="MemberList.jsp"></jsp:forward>
