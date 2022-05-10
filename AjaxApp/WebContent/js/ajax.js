/**
 * ajax.js
 */



var ajax = null;

// AJAX 객체(XMLHttpRequest 객체) 생성 함수
function createAjax()
{
	/*
	 * 바람직하지 않은 구조.. 하지만 이렇게 쓰여진 코드가 훨씬 많다..
	 * 
	// ActiveXObject 를 지원하는 브라우저라면....
	if (window.ActiveXObject)							//-- IE 7 이전
	{
		return new ActiveXObject("Msxml2.XMLHTTP");
		// -- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		//    (ActiveXObject 객체 → XMLHttpRequest 객체의 대리 객체)    
	}
	else												//-- 그 외 브라우저
	{	
		if (window.XMLHttpRequest)						//-- XMLHttpRequest 지원 브라우저
		{
			return new XMlHttpRequest();
			//-- 이와 같은 방식으로 XMlHttpRequest 객체를 생성해서 반환해라.
		}
		else											//-- AJAX 를 지원하지 않는 브라우저
		{
			return null;
		}
	}
	*/
	
	
	if (window.XMLHttpRequest)		
	{
		return new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{
		//return new ActiveXObject("Msxml2.XMLHTTP");
		// 위아래 같은 코드
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	else
	{
		return null;
	}
	
}