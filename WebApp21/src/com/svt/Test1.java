/* ==============
	Test1.java
============== */

package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
{
	//클래스명에 마우스 올리고 첫번째 ㅎㅎ
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
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String name = "홍길동";
		String age = "19";
		
		response.setContentType("test/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		
		pw.println("<body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</body>");
		pw.println("</html>");
 	}
	
	
	
}

















