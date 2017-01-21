package kr.co.bit.postkit.util;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class JdbcClose {

	public static void close(Connection conn, PreparedStatement pstmt){
		
		if(pstmt != null){	
			try {
				pstmt.close();
					
			} catch (Exception e) {
				// TODO: handle exception
			}
			

		}

		if(conn != null){	
			try {
				conn.close();
					
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
	}
	
}
