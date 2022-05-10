<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/Main.css" type="text/css" >
<style type="text/css">
	#result
	{
		display: inline-block;
		width: 250px;
		color: #F33;
	}
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	// 아이디 중복검사
	function check()
	{
		//alert("뭐야");
		//데이터 수집
		var id = document.getElementById("id").value;
		
		if(id=="")
		{
			document.getElementById("result").innerText = "아이디를 입력하세요.";
			return;
		}
		
		// URL
		var url = "test03.do?id=" + id;
		
		//AJAX 객체(→XMlHttpRequest 객체) 생성
		ajax = createAjax();
		
		//환경 설정(『open("메소드 방식", url, 비동기/동기)』)
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState==4 && ajax.status==200)
			{
				// 업무 처리(→ 외부로 추출)
				callBack();		
			}
		};
		
		ajax.send("");
		
		
	}
	
	// 아이디 중복 검사의 결과(1 or 0)를 통보받아
	// 사용자에게 메세지 출력 → span → result
	function callBack()
	{
		// 외부로 추출된 업무 처리 내용 구성(responseText / responseXML)
		var data = ajax.responseText;
		
		data = parseInt(data);
		
		if(data==0)
		{
			document.getElementById("result").innerText = "사용 가능한 아이디입니다.";
		}
		else
		{
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
		}
	}
	
	
	//주소 검색
	function search()
	{
		//초기화
		document.getElementById("addr1").value ="";
		document.getElementById("addr2").value ="";
		
		
		//alert("확인");
		
		//데이터 수집
		var addr = document.getElementById("addr").value;
		
		//URL 준비
		var url = "test04.do?addr=" + addr;
		
		//XMLHttpRequest 객체(→ AJAX 객체) 생성
		ajax = createAjax();		//-- ajax.js
		
		//설정
		ajax.open("GET",url,true);
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState==4 &&ajax.status==200)
			{
				// 수행 업무
				callBack2();
			}
		};
		ajax.send("");
	}
	
	// 추출된 수행 업무
	// → 우편번호 검색 결과를 통보받아서
	// 사용자에게 안내해 줄 수 있도록 처리
	function callBack2()
	{
		// XML 문서 전체의 참조 객체.(흔히 XML 문서 객체라고 한다.)
		// 문서로 받는다!
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트(루트 엘리먼트)	==> 한 엘리먼트안에 모든 요소가 담겨야 한다.
		// -- 현재는 『<list>』 엘리먼트
		var root = doc.documentElement;
		
		// 모든 『<item>』 엘리먼트 반환받기
		var itemList = root.getElementsByTagName("item");
		
		// select box 초기화
		document.getElementById("addrResult").innerHTML = "";
		
		// 검색 결과 확인
		if (itemList.length==0)
		{
			document.getElementById("addrResult").innerHTML
				= "<option>주소를 입력하세요.</option>";
		}
		else
		{
			document.getElementById("addrResult").innerHTML
				= "<option>주소를 선택하세요.</option>";
			
		}
		
		// 검색 결과가 존재할 경우... 반복문을 순환하며 각 데이터 가져오기
		for (var i=0; i<itemList.length; i++)   //-- 수신한 아이템의 갯수만큼 반복 순환
		{
			var zipcode = itemList[i].getElementsByTagName("zipcode")[0];
			console.log("얜뭐지" + zipcode);
			// [1]로 하면 undefined 뜬다.
			// 아예 없애면 [object HTMLCollection]가 뜬다
			//                     --------------- 인터페이스로 배열과 유사하다 그니까 걍 zipcode라는 태그를
			// 가져오려면 [0]을 해야하고 [1]이상부터는 없다 값이 배열이라 
			// 우리가 배열 [1, 2, 3]이 있으면
			//             -- 이거 가져올 때는 [0]으로 가져오니까
			
			var address = itemList[i].getElementsByTagName("address")[0];
			//console.log("닌 뭐야? : " + address);
			// ※ 태그가 가지는 텍스트는
			//    태그의 첫 번째 자식이고
			//    텍스트 노드의 값은
			//    nodeValue 로 가져온다.
			
			var zipcodeText = zipcode.firstChild.nodeValue;
			var addressText = address.firstChild.nodeValue;
			
			//select box 에 아이템 추가
			document.getElementById("addrResult").innerHTML
				+= "<option value='" + zipcodeText + "/" + addressText 
				+ "'>[" + zipcodeText + "] " + addressText + "</option>";
			
		}
		
	}
	
	
	
	function selectZipCode(sel)
	{
		//초기화
		//document.getElementById("addr1").value ="";
		//document.getElementById("addr2").value ="";
		
		// 테스트
		//alert("호출확인");
		
		//alert(sel.value);
		
		// 주소를 선택하세요가 아니라면
		// 근데 어차피 선택해요가 아니면 즉, 입력하세요면 change가 되지않아서 이 메소드는 발동하지 않는다.
		/*
		if(sel.value != "0")
		{
			//06253/서울특별시 강남구 강남대로 298 (역삼동, 푸르덴셜타워)
			document.getElementById("addr1").value = sel.value.split("/")[0];
			document.getElementById("addr2").value = sel.value.split("/")[1];
			document.getElementById("addr3").focus();
		}
		*/
		document.getElementById("addr1").value = sel.value.split("/")[0];
		document.getElementById("addr2").value = sel.value.split("/")[1];
		document.getElementById("addr3").focus();
	}
</script>
</head>
<body>

<div>
	<h1>회원 가입</h1>
	<p>우편번호 검색</p>
	<hr />
</div>


<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control" />
			<input type="button" value="중복검사" class="control" onclick="check()"/>
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td><input type="text" id="name" class="text"/></td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="addr" class="text" placeholder="동 입력"/>
			<input type="button" value="검색하기" class="control" onclick="search()">
			<br />
			<select id="addrResult" class="control" onchange="selectZipCode(this)">
				<option>주소를 입력하세요</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>주소 검색 결과</th>
		<td>
			<input type="text" id="addr1" readonly="readonly" style="width: 200px;">
			<br />
			<input type="text" id="addr2" readonly="readonly" style="width: 400px;">
			<br />
			<input type="text" id="addr3" placeholder="상세주소를 입력하세요" style="width: 400px;">
			<br />
		</td>
	</tr>
</table>


</body>
</html>