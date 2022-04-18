package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	Connection conn;
	
	//생성자
	public ScoreDAO()
	{
		try
		{
			conn = DBConn.getConnection();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	//성적 입력 메소드
	public int add(ScoreDTO dto)
	{
		int result = 0;
		String sql = "INSERT INTO TBL_SCORE(SID,NAME,KOR,ENG,MAT) VALUES(SCORESEQ.NEXTVAL,?,?,?,?)";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,dto.getName());
			pstmt.setInt(2,dto.getKor());
			pstmt.setInt(3,dto.getEng());
			pstmt.setInt(4,dto.getMat());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//성적 조회 메소드
	public ArrayList<ScoreDTO> lists()
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		String sql = "SELECT SID,NAME,KOR,ENG,MAT,(KOR+ENG+MAT) AS TOT, ROUND((KOR+ENG+MAT)/3,1) AS AVG FROM TBL_SCORE";
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				ScoreDTO dto = new ScoreDTO();
				
				dto.setSid(rs.getString("SID"));
				dto.setName(rs.getString("NAME"));
				
				dto.setKor(rs.getInt("KOR"));
				dto.setEng(rs.getInt("ENG"));
				dto.setMat(rs.getInt("MAT"));
				dto.setTot(rs.getInt("TOT"));
				
				dto.setAvg(rs.getDouble("AVG"));
				
				result.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//인원수 조회 메소드
	public int count()
	{
		int result = 0;
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
			{
				result = rs.getInt("COUNT");
			}
			rs.close();
			pstmt.close();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	//데이터 베이스 연결 종료
	public void close()
	{
		try
		{
			DBConn.close();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}
