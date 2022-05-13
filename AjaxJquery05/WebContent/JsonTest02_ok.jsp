<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//[{"num":"1", "name":"임소민", "content":"안녕하세요"}
	// ,{"num":"2", "name":"임소민", "content":"안녕하세요"}
	// ,{"num":"3", "name":"임소민", "content":"안녕하세요"}
	// ,{"num":"4", "name":"임소민", "content":"안녕하세요"}
	// ,{"num":"5", "name":"임소민", "content":"안녕하세요"}]
	
			
	// JSON 데이터(배열)	
	// [{"이름1":"값1", "이름2":"값2"},{"이름1":"값1", "이름2":"값2"},..]
	// 기본적으로는 『문자열을 기반한 구성』
			
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result ="";
	//"{\"num\":1, \"name\":\""+name+"\", \"content\":\""+content+  "\"}"
	StringBuffer sb = new StringBuffer();
	sb.append("[");
	sb.append("{\"num\":1, \"name\":\""+name+"1\", \"content\":\""+content+  "1\"}");		//"{\"num\":1, \"name\":"  +name+  ", \"content\":"  +content+   "}"
	for(int i=2; i<=5; i++)
	{
		//",{\"num\":"+i+", \"name\":\""+name+"\", \"content\":\""+content+  "\"}"
		sb.append(",{\"num\":"+i+", \"name\":\""+name+i+"\", \"content\":\""+content+i+  "\"}");		//",{\"num\":   "+i+", \"name\":    "+name+"   , \"content\":  "+content+"}"
	}
	sb.append("]");
	
	// 마지막번째 콤마 제거방법
	//result = result.substring(0, result.length()-1);
	
	
	result = sb.toString();
	out.println(result);
%>
