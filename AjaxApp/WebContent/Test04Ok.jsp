<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	// check~!!!
	response.setContentType("text/xml");
	//--AJAX 개체에 데이터를 돌려줄 때
	//  브라우저가 이 데이터를 XML로 인식해야 하기 때문에
	//  MIME 타입을 XML로 선언한다.
	
	// ※ (수신해서 처리해야 하는 )데이터가 한 개 이상일 경우...
	//    XML 이나 JSON 과 같이 구조화시킬 수 있는 데이터의 형태로 전달하는 것이
	//    처리 과정에서 용이하다.
	//    우편번호에 대한 검색 결과는 당연히 다량의 데이터를 전송해야 하기 때문에
	//    텍스트가 아닌 XML 형태로 반환하려고 하는 것이다.
	
	//<?xml ~~ 는 앞에 뭐가 있으면 안돼서 싹다 붙혀써야 뭐없는걸로 앎.
			// 꼬리물기!!!!!!!!!!!!!!
			
			
			
	// 여기는 jsp 이지만 우리가 위에서 text/xml 하면서 서블릿컨테이너에게 
	// 이건 클라이언트에게 xml로 읽어줘 ~ 
	// jsp 주석은 클라이언트에게 전달하지 않는다.
	// --------- 서블릿컨테이너에게 안보인다.
	
	//jsp도 서블릿으로 변환됨. 
	
	
%><?xml version="1.0" encoding="UTF-8"?>
<list>
	<c:forEach var="item" items="${lists }">
	<item>
		<zipcode>${item.zipCode }</zipcode>
		<address>${item.address }</address>
	</item>
	</c:forEach>
</list>