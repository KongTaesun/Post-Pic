package kr.co.bit.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	
	public Connection getConnection(){
		Connection conn = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "cham1";
			String password = "cham1";
			
			conn = DriverManager.getConnection(url,user,password);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return conn;
	}
	
}
