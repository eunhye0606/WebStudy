<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberDelete.jsp
	
	//이전 페이지(MemberSelect.jsp)로부터 넘어온 데이터(sid) 수신
	
	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	
	MemberDAO dao = new MemberDAO();
	
	
	//참조중이면 삭제 불가능
	//① MemberSelect에서 삭제버튼 비활성화 하는 방법
	//② 여기서 삭제안될 때 다른 페이지로 넘기는 방법
	String strAddr = "";
	
	try
	{
		//데이터베이스 연결
		dao.connection();
		
		// 참조 레코드 수 확인
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER 테이블의 제거하고자 하는 데이터의
		//   SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이터 갯수 확인
		
		if(checkCount == 0)	// -- 제거 가능.
		{
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}
		else	// -- 제거 불가.
		{
			//strAdd ="MemberUnDelect.jsp";
			//dao.remove(sid);
			// -- TBL_MEMBERSCORE 테이블의 데이터가
			//    TBL_MEMBER 테이블의 SID 를 참조하고 있는 경우로
			//    삭제가 불가능한 상황
			// -- 제거하지 못하는 사유를 안내하는 페이지로 이동
			//    ---------------------------------------------
			//    + 리스트로 돌아가기 버튼
			
			strAddr = "Notice.jsp";
		}
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	//check
	response.sendRedirect(strAddr);
	
	//아래에 보여지는 페이지는 모두 삭제.
%>