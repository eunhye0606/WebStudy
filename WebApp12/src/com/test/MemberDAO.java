/* =================================================
	MemberDAO.java
	- 데이터베이스 액션 처리 전용 클래스
	  (TBL_MEMBER 테이블 전용 DAO)
================================================= */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	private Connection conn;
	
	// ★데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException 
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	
	
	// ★데이터 입력 담당 메소드
	// 『적용된 행의 수 반환』
	public int add(MemberDTO member) throws SQLException
	{
		int result = 0;
		String sql ="INSERT INTO TBL_MEMBER(SID,NAME,TEL)"
				+ " VALUES(MEMBERSEQ.NEXTVAL,?,?)";
		
		// 작업객체가 구멍난 sql를 가지고 있겠다.
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,member.getName());
		pstmt.setString(2,member.getTel());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}//end add(MemberDTO member)
	
	
	
	// ★회원 리스트 출력 담당 메소드 (TBL_MEMBER)
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID,NAME,TEL FROM TBL_MEMBER ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			MemberDTO member = new MemberDTO();
			
			member.setSid(rs.getString("SID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));
			
			result.add(member);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}//end lists()
	
	
	
	// ★전체 인원 수 확인 담당 메소드
	//   (조건이 있으면 매개변수가 있지만..)
	public int count() throws SQLException
	{
		int result =0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
		
	}//end count()
	
	
	
	// 데이터베이스 연결 종료(해제) 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}//end close()
	
	
	
	
	
	// ★회원 정보 조회
	public ArrayList<MemberDTO> select(String sid) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID,NAME,TEL FROM TBL_MEMBER WHERE SID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, sid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);
		}
				
		rs.close();
		pstmt.close();
		
		return result;
		
	}//end select(String sid)
	
	
	
	// ★회원 정보 수정 메소드 정의
	public int update(MemberDTO member) throws SQLException
	{
		int result = 0;
		String sql = "UPDATE TBL_MEMBER SET NAME=?, TEL=? WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,member.getName());
		pstmt.setString(2,member.getTel());
		pstmt.setString(3,member.getSid());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		return result;
			
	}//end update(MemberDTO member)
		
	
	
	// ★회원 정보 삭제 메소드
	public int delete(String sid)
	{
		int result = 0;
		string = sql
		
		return result;
	}
	
	// ★참조 확인 메소드 
	
	
	
	
	
	
	
	
	
}
