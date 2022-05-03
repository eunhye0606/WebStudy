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
	//     ------ 여기 불린형으로 해서 컨트롤러한테 모델이 일 잘하면 ture 주는 형태도 가능! void도 가능!
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
		// 이부분! 내 음식 이런 그릇에 담으면 좋겠다 ~ 하는 명시임
		//MVC는 모델이랑 뷰가 직접적으로 만나지만 않으면된다!!!!
		//어느그릇에 담으면 좋겠다! 그거만 알려주는거!
		//컨트롤러한테 전달만해줘
		result = "WEB-INF/view/HelloReceive03.jsp";
		
		
		return result;
	}
}
