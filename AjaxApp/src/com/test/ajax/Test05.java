/* ======================
	Test05.java
====================== */

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test05 extends HttpServlet
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
		
		// 완성형 한글 형태로 전송한 데이터 수신
		request.setCharacterEncoding("UTF-8");
		
		String search = request.getParameter("search");
		
		// 테스트
		//System.out.println(search);
		
		// DB 연결 및 액션 처리
		// ~~~~~~~ WHERE COLUMN LIKE 'search%'; 와 같은 쿼리문 수행
		//                           ---------- → 이걸로 시작하는 단어
		// 그에 따른 결과 수신
		
		// 위와 같이 조회한 결과를 가지고 자료구조(ArrayList)활용
		ArrayList<WordDTO> lists = new ArrayList<WordDTO>();
		
		if (search.equals("가"))
		{
			lists.add(new WordDTO("가다랑어"));
			lists.add(new WordDTO("가마"));
			lists.add(new WordDTO("가사"));
			lists.add(new WordDTO("가위"));
			lists.add(new WordDTO("가지"));
			lists.add(new WordDTO("가치"));
			lists.add(new WordDTO("가풍"));
			lists.add(new WordDTO("가훈"));
		}
		else if(search.equals("가방"))
		{
			lists.add(new WordDTO("가방 구매"));
			lists.add(new WordDTO("가방 나눔"));
			lists.add(new WordDTO("가방 손질"));
			lists.add(new WordDTO("가방 판매"));
			lists.add(new WordDTO("가방끈"));
		}
		else if(search.equals("가방끈"))
		{
			lists.add(new WordDTO("가방끈 매듭"));
			lists.add(new WordDTO("가방끈 손질"));
			lists.add(new WordDTO("가방끈 이음새"));
			lists.add(new WordDTO("가방끈 추천"));
			lists.add(new WordDTO("가방끈 파손"));
		}
		
		request.setAttribute("lists", lists);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test05Ok.jsp");
		dispatcher.forward(request, response);
	}

}
