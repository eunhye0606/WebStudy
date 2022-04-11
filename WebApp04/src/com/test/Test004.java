/* ==================
	Test004.java
	- Servlet 실습
==================== */

// 현재 ... 자바의 기본 클래스 Test004
// 이를 Servlet 으로 구성하는 방법
// 그냥 자바 클래스를 서블릿으로 만들거야!

// GenericServlet 을 상속받은 클래스로 설계 → Selvlet

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//import javax.servlet.Servlet;

//public class Test004 implements Servlet
// → Servlet 인터페이스 상속은 할게 너무 많아지니까..

// 상속받으면서 Test004는 서블릿이됨.
// GenericServlet 는 추상 클래스임.
//public abstract class Test004 extends GenericServlet

// 마우스 오른쪽 → Source → override ~~ a붙은거 추상

public class Test004 extends GenericServlet
{
	// 객체직렬화 때문에 노란경고줄
	// 마우스 오른쪽 add 시리얼 하면 ↓ 생기고 사라짐.
	private static final long serialVersionUID = 1L;

	// GenericServlet 의 추상메소드 재정의!! 
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
	{
		// 요청에 대한 응답 방법
		response.setContentType("text/html; charset=UTF-8");
		
		try
		{
			// 출력 스트림 구성
			PrintWriter out = response.getWriter();
			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("Test004.java");
			out.print("</title>");
			out.print("</head>");
			
			out.print("<body>");
			
			out.print("<div>");
			out.print("<h1>");
			out.print("서블릿 관련 실습");
			out.print("<hr>");
			out.print("</h1>");
			out.print("</div>");
			
			out.print("<div>");
			out.print("<h2>");
			out.print("GenericServlet 클래스를 이용한 서블릿 테스트");
			out.print("</h2>");
			out.print("</div>");
			
			
			out.print("</body>");
			out.print("</html>");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}

}
