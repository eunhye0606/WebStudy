/* ==============================
	HelloReceive03Model.java
============================== */

package com.test.logic;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive03Model
{
	// View 페이지 반환                                                             시스템에서 지원하지 않는 인코딩일 수 있어서 예외발생.
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		// 데이터 수신
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		// 추가적인 업무 처리 삽입
		lastName = "[ " + lastName + " ]";
		
		
		/*if (이름이 맘에 안듬)
		{
			result = "에러페이지";
		}
		else
			result = "정상페이지";*/
		
		
		// 데이터 전달
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		
		// 상황에 따른 뷰 선택(지정) 가능
		result = "WEB-INF/view/HelloReceive03.jsp";
		
		
		return result;
	}
}
