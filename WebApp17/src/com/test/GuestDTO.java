/* ====================
	GuestDTO.java
	- Bean 생성
==================== */
package com.test;

public class GuestDTO
{
	private String userName, subject, content;
	
	//※ 여기에서 사용하는 변수명(속성명)의 앞 두 글자는 소문자로 작성할 것!
	//   check!
	//   form의 name 속성들도 앞 두 글자는 소문자 ! 
	//   → 게터 / 세터 자동만들 때 get (대문자) / set (대문자) 라서!
	//   
	//   와 같이 setter 가 속성명을 불러오는 과정에서
	//   인식이 어긋나는 경우가 발생할 수 있기 때문에 ! 
	//   액션태그와 게터세터만들 때 주의 ! 
	//   우리가 호출하는게 아니라 자동일때! 때문에!
	//   액션태그 호출 → 서블릿 컨테이너!
	//   룰 어긋나면 못불러줘 ! 
	
	// ※ 여기에서 사용하는 변수명(속성명)은
	//    HTML 의 form 태그에서 name 속성으로 지정하여 사용할 것.
	//    그래야 속성 데이터 수신 및 속성 매핑을
	//    액션 태그를 활용하여 자동으로 처리해 줄 수 있기 때문...
	
	// 일반적으로는 순서가 Bean만들고 View 만들기
	// GuestDTO.java → Guest.jsp 만듬.
	
	
	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getSubject()
	{
		return subject;
	}

	public void setSubject(String subject)
	{
		this.subject = subject;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}
	
	
	
}
