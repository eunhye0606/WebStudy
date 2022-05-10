/* ===========================
	Test02.java
	- ajax에 대응하는 컨트롤러
=========================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test02 extends HttpServlet
{
	// 클래스명에 마우스 올리고 첫번째 ㅎㅎ
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		// 서블릿 관련 코딩
		
		// 데이터 수신(AjaxTest.jsp 페이지로 부터 넘어온 데이터)
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int n2 = Integer.parseInt(request.getParameter("n2"));
		
		// 로직 처리(연산 처리)
		int result = n1 + n2;
		
		// 반환할 결과값 준지
		request.setAttribute("result", result);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test02Ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("AjaxTest02.jsp");
		//response.sendRedirect("AjaxTest02.jsp");
		
		dispatcher.forward(request, response);
	}

}
