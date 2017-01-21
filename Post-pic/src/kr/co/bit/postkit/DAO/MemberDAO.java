package kr.co.bit.postkit.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import kr.co.bit.postkit.VO.MemberVO;
import kr.co.bit.util.ConnectionFactory;
import kr.co.bit.util.JDBCClose;


public class MemberDAO {

	public void insertAllMember(MemberVO member){
		int loc =1;
		Connection conn = null;
		PreparedStatement pstmt= null;
		try  {

			StringBuilder sql = new StringBuilder();

			sql.append("insert into T_MEMBER(ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR)");
			sql.append(" values(?,?,?,?,?,?,?,?,?,?,?) ");

			conn = new ConnectionFactory().getConnection();
			pstmt = conn.prepareStatement(sql.toString());       

			pstmt.setString(loc++, member.getId());
			pstmt.setString(loc++, member.getName());
			pstmt.setString(loc++, member.getPassword());
			pstmt.setString(loc++, member.getEmail_id());
			pstmt.setString(loc++, member.getEmail_domain());
			pstmt.setString(loc++, member.getTel1());
			pstmt.setString(loc++, member.getTel2());
			pstmt.setString(loc++, member.getTel3());
			pstmt.setString(loc++, member.getPost());
			pstmt.setString(loc++, member.getBasic_addr());
			pstmt.setString(loc++, member.getDetail_addr());

			pstmt.executeUpdate();  	

		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JDBCClose.close(conn, pstmt);
		}

	}
	public MemberVO mypage(MemberVO member){	

		MemberVO userVO = null;
		Connection conn = null;

		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR "); 
		sql.append(" from T_MEMBER " );	
		sql.append(" where id = ?");


		try {
			conn = new ConnectionFactory().getConnection();
			pstmt = conn.prepareStatement(sql.toString());                      
			pstmt.setString(1, member.getId());

			ResultSet rs = pstmt.executeQuery();


			if(rs.next()){
				userVO = new MemberVO();

				userVO.setId(rs.getString("ID"));
				userVO.setName(rs.getString("NAME"));
				userVO.setPassword(rs.getString("PASSWORD"));
				userVO.setEmail_id(rs.getString("EMAIL_ID"));
				userVO.setEmail_domain(rs.getString("EMAIL_DOMAIN"));
				userVO.setTel1(rs.getString("TEL1"));
				userVO.setTel2(rs.getString("TEL2"));
				userVO.setTel3(rs.getString("TEL3"));
				userVO.setPost(rs.getString("POST"));
				userVO.setBasic_addr(rs.getString("BASIC_ADDR"));
				userVO.setDetail_addr(rs.getString("DETAIL_ADDR"));  	
			}

		}catch(Exception e){	
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		return userVO;
	}
	public int mypageDAO(String id){
		//System.out.println("id : " + id);
		int chknum = 3;

		String sql = "SELECT count(ID) as cnt FROM t_member where id=?";


		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				)
		{

			pstmt.setString(1, id);  
			ResultSet rs = pstmt.executeQuery();

			//System.out.println(sql);

			rs.next();
			chknum = rs.getInt("cnt");


		}catch(Exception e){
			e.printStackTrace();
		}
		return chknum;
	}

	public void changeMember(MemberVO member){

		String tmpPass = member.getPassword();

		int loc = 1;
		try  {

			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt= null;

			StringBuilder sql = new StringBuilder();

			sql.append("update T_MEMBER set ");
			sql.append(" EMAIL_ID=?, EMAIL_DOMAIN=?, TEL1=?, TEL2=?, TEL3=?, POST=?, BASIC_ADDR=?, DETAIL_ADDR=? ");

			if(!tmpPass.equals("")){
				sql.append(" ,PASSWORD=? ");
			}
			sql.append(" where id = ? ");

			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql.toString());



			pstmt.setString(loc++, member.getEmail_id());
			pstmt.setString(loc++, member.getEmail_domain());
			pstmt.setString(loc++, member.getTel1());
			pstmt.setString(loc++, member.getTel2());
			pstmt.setString(loc++, member.getTel3());
			pstmt.setString(loc++, member.getPost());
			pstmt.setString(loc++, member.getBasic_addr());
			pstmt.setString(loc++, member.getDetail_addr());

			if(!tmpPass.equals("")){
				pstmt.setString(loc++, member.getPassword());
			}
			pstmt.setString(loc++, member.getId());

			pstmt.executeUpdate();

			//System.out.println(sql.toString());

			conn.commit();

		}catch(Exception e){
			e.printStackTrace();
		}finally {
		}

	}

	public void deleteMember(String id, String pw){


		String sql = " delete from t_member where id = ? and password = ? ";

		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
			int loc =  1;
			pstmt.setString(loc++, id);
			pstmt.setString(loc++, pw);

			pstmt.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}

	}


}



