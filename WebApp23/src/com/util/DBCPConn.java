/* =====================
	DBCPConn.java
===================== */

//서블릿 컨테이너가 일을 하는데 usb처럼 쓰는애가 context임.


package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
	private static Connection conn = null;
	
	public static Connection getConnection()
	{
		if (conn==null)
		{
			try
			{
				// ○ (1).이름과 객체를 바인딩
			// context구성하긔 
				//-- 컨텍스트(Context)를 얻어내는 가장 쉬운 방법은
				//   『javax.naming.InitialContext』클래스의
				//   인스턴스를 생성하는 것이다.
				//   → 『new InitialContext();』
				Context ctx = new InitialContext();
				//-- 게임팩얻어내는과정
				
				// ※ javax.naming.InittialContext 의 메소드
				//    - bind(String str, Object obj)
				//      : 서비스할 객체를 특정 이름으로 등록한다.
				//    - rebind(String str, Object obj)
				//      : 서비스할 객체를 특정 이름으로 다시 등록한다.
				//    - list(String str)
				//      : 특정 이름으로 서비스하는 객체 정보를 반환한다.
				//    - unbinding(String str)
				//      : 등록된 객체를 메모리에서 해제한다.
				//    - Object lookup(String str)
				//      : 서비스중인 객체 정보를 얻어온다.
				
				
				// 객체에 대한 정보는 web.xml(배치기술서)
				
				
				// 『web.xml』로 부터 환경 설정을 얻어오겠다는 코딩
				//-- 다른 형태로 변경 불가.
				//  object 형 반환이기 때문에 다운캐스팅!
				
				//채워진 usb가 아래 코드
				Context evt = (Context)ctx.lookup("java:/comp/env");
				
				//-- 닌텐도얻어내는과정
				
				
				// 여러 context들 중에서 web.xml에 name으로 설정한애를 데려와서
				
				//우리가 필요한거 DataSource의 getConnection
				DataSource ds = (DataSource)evt.lookup("jdbc/myOracle");
				//-- 슈퍼마리오를 얻어내는과정
				
				
				//설정값은 context.xml에
				
				//※!!!!
				//DBCPAction.jsp
				//DBCPConn.java
				//context.xml
				//web.xml
				//위 4개의 파일의 구조알기!
				
				//conn 연결
				conn = ds.getConnection();
				
				
				
				
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return conn;
	}
	
	public static void close()
	{
		if (conn != null)
		{
			try
			{
				if (!conn.isClosed())
				{
					conn.close();
				}
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		conn = null;
	}
	
}
