<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	// -- 데이터 입력 액션 처리 페이지
	
	request.setCharacterEncoding("UTF-8");
	//-- 한글 데이터가 깨지지 않도록 인코딩 설정
	
	// 위 코드를 수행한 후 데이터 수신
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	
	try
	{
		dao = new MemberDAO();
		
		// MemberDTO 구성
		MemberDTO member = new MemberDTO();
		member.setName(userName);
		member.setTel(userTel);
		
		// dao 의 add() 메소드 호출 → insert 쿼리문 수행
		dao.add(member);
		
		// 필요하다면 add() 메소드의 리턴값을 받아
		// insert 액션의 정상 처리여부 확인 후 추가 코드 구성 가능
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// URL 주소가 적혀있는(기록되어 있는) 쪽지를 사용자에게 전달
	// (이 주소를 요청해서 찾아가도록 하세요.)
	response.sendRedirect("MemberList.jsp");
	
	// 아래 보여주는 페이지 모두 삭제.
%>
