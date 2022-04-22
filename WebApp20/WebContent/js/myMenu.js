/**
 * myMenu.js
 * 스타일에 대한 컨트롤.
 */

/*function myMenu1()
{
	
}


function myMenu1()
{
	
}*/

//분리 x 하나로 통합하는 것이 일반적임.
//매개변수로 상태값을 받아 컨트롤하는 것이 일반적임.


function myMenu(status)
{
	//alert("확인");
	
	var menu = document.getElementById("menuTable");
	
	if (status == 1)
	{
		//alert("1번 확인, 보이기");
		menu.style.display = "block";
							// 블럭단위로 랜더링해라.
		
	}
	else
	{
		//alert("2번 확인, 감추기");
		menu.style.display ="none";
		
	}
}

function myMenuFocus(num)
{
	var menu = document.getElementById("menuTable");
	//alert("확인");
	if (num == 1)
	{
		//alert("보이기 1");
		menu.style.display = "block";
		//body.style.background-color = pink;
	}
	else
	{
		//alert("감추기 2");
		menu.style.display = "none";
		
	}
		
}

function myMenuFocus1()
{
	//alert("확인이용.");
	var menu = document.getElementById("menuTable");
	menu.style.display = "block";
	/*if (num == 1)
	{
		menu.style.display = "block";
		alert("왜안돼.");
	}
	else
		menu.style.display = "none";*/
	
}


function myMenuFocus2()
{
	var menu = document.getElementById("menuTable");
	menu.style.display = "none";
}
