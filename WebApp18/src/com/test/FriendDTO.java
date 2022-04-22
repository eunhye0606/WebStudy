/* =========================
	FriendDTO.java
========================= */

package com.test;

public class FriendDTO
{
	private String name,gender;		//--이름, 성별
	private int age;				//--나이
	private String [] idelType;		//--이상형(다중 선택 가능 컨트롤이기 때문에)
	// -- 이상형은 여러 개의 데이터가 동시에 전달되므로
	//    (즉, 다중 선택이 가능하도록 구성하였기 때문에)
	//    배열로 처리한다.
	
	
	// getter / setter 구성
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public int getAge()
	{
		return age;
	}
	public void setAge(int age)
	{
		this.age = age;
	}
	public String[] getIdelType()
	{
		return idelType;
	}
	public void setIdelType(String[] idelType)
	{
		this.idelType = idelType;
	}
	
	// 이상형 출력 메소드
	public String idelPrint()
	{
		String result = "";
		
		if (getIdelType() != null)	//배열값 null인지 체크하긔~
		{
			for (String str : getIdelType())
			{
				result += "[" + str + "]";
			}
		}
		
		return result;
	}
	
	
	
}
