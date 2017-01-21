package kr.co.bit.postkit.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.bit.postkit.VO.LoginVO;
import kr.co.bit.util.ConnectionFactory;



public class LoginDAO {
	
public LoginVO login(LoginVO loginVO) {
		
		LoginVO userVO = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, name, password, type ");
		sql.append("  from t_member ");
		sql.append(" where id = ? and password = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userVO = new LoginVO();
				userVO.setId(rs.getString("id"));
				userVO.setPassword(rs.getString("password"));
				userVO.setName(rs.getString("name"));
				userVO.setType(rs.getString("type"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return userVO;
	}
}
