/* =====================
	WordDTO.java
===================== */
package com.test.ajax;

public class WordDTO
{
	// 주요 속성 구성
	private String word;

	// 기본 생성자 추가
	public WordDTO()
	{
		// 이걸 왜하는 것 ?
		this("");
	}
	
	// 사용자 정의 생성자 구성
	public WordDTO(String word)
	{
		this.word = word;
	}
	
	
	public String getWord()
	{
		return word;
	}

	public void setWord(String word)
	{
		this.word = word;
	}
	
	
}
