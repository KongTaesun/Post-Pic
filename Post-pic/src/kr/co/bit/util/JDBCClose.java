package kr.co.bit.util;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class JDBCClose {

	public static void close(Connection conn, PreparedStatement pstmt){
		if(pstmt != null){
			try{
				pstmt.close();
			}catch (Exception e){
				e.printStackTrace();
			}	
		}
		
		if(conn != null){
			try{
				conn.close();
			}catch (Exception e){
				e.printStackTrace();
			}	
		}
		
		
	}
}

