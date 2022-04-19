/* =================================================
	MemberScoreDAO.java
	- 데이터베이스 액션 처리 전용 클래스
	  (TBL_MEMBERSCORE 테이블 전용 DAO)
================================================= */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberScoreDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// ♥데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}//end connection()
	
	// ♥데이터 입력 담당 메소드(성적 데이터 입력)
	public int add(MemberScoreDTO score) throws SQLException
	{
		int result = 0;
		String sql = "INSERT INTO TBL_MEMBERSCORE(SID,KOR,ENG,MAT)"
				+ " VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,score.getSid());
		pstmt.setInt(2,score.getKor());
		pstmt.setInt(3,score.getEng());
		pstmt.setInt(4,score.getMat());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}//end add(MemberScoreDTO score)
	
	
	// ♥성적 전체 리스트 출력 담당 메소드
	//   반환 자료형 : MemberScoreDTO 들을 담은 자료구조형
	public ArrayList<MemberScoreDTO> lists() throws SQLException
	{
		ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
		
		String sql = "SELECT SID,NAME,KOR,ENG,MAT"
				+ " ,(KOR+ENG+MAT) AS TOT"
				+ " ,((KOR+ENG+MAT)/3) AS AVG"
				+ " ,RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				+ " FROM VIEW_MEMBERSCORE"
				+ " ORDER BY SID";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			
			MemberScoreDTO score = new MemberScoreDTO();
			// dto에는 프로퍼티들이 초기값! 
			// 그래서 set해야한다.
			
			score.setSid(rs.getString("SID"));
			score.setName(rs.getString("NAME"));
			score.setKor(rs.getInt("KOR"));
			score.setEng(rs.getInt("ENG"));
			score.setMat(rs.getInt("MAT"));
			score.setTot(rs.getInt("TOT"));
			
			score.setAvg(rs.getDouble("AVG"));
			
			score.setRank(rs.getInt("RANK"));
			
			result.add(score);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}//end lists()
	
	
	
	// ♥데이터베이스 연결 종료(해제) 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}//end close()
	
	
	// ♥성적 삭제 메소드
	public int delete(String sid) throws SQLException
	{
		int result = 0;
		String sql = "DELETE FROM TBL_MEMBERSCORE WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,sid);
		
		result = pstmt.executeUpdate();
		
		
		return result;
	}
	
	//


}
