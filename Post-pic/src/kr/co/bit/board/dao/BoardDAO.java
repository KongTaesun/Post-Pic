package kr.co.bit.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.board.vo.BoardCommentVO;
import kr.co.bit.board.BoardFileVO;
import kr.co.bit.board.BoardVO;
import kr.co.bit.util.ConnectionFactory;
import kr.co.bit.util.JDBCClose;

/**
 * 
 * 게시판(t_board)의 입력, 검색, 수정, 삭제기능을 하는 기능 클래스
 * 
 *
 */

public class BoardDAO {
	
	/**
	 * 전체 게시물 조회
	 * @return 조회된 전체 게시물
	 * 
	 */
	
	public List<BoardVO> selectAllBoard(){
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		// 전체게시물을 저장하는 BoardVO 배열 생성
		List<BoardVO> list = new ArrayList<>();
		
	 	String sql = "select no, title, writer ";
	 		   sql += " , to_char(reg_date,'yyyy-mm-dd') as reg_date ";
	 		   sql += " from t_board ";
	 		   sql += " order by no desc ";
	 		   
	 	try{
	 		conn = new ConnectionFactory().getConnection();
		 	pstmt = conn.prepareStatement(sql);
		 	ResultSet rs = pstmt.executeQuery();
		 	
		 	
		 	while(rs.next()){
		 		int no = rs.getInt("no");
		 		String title = rs.getString("title");
		 		String writer = rs.getString("writer");
		 		String regDate = rs.getString("reg_date");
		 		
		 		
		 		// 번호, 제목, 작성자, 작성일을 가지는 Vo클래스 객체의 배열
		 		BoardVO board = new BoardVO();
		 		board.setNo(no);
		 		board.setTitle(title);
		 		board.setWriter(writer);
		 		board.setReg_date(regDate);
		 		
		 		list.add(board);
		 		
		 	}
		 	
	 	}catch(Exception e){
	 		e.printStackTrace();
	 	}finally{
	 		JDBCClose.close(conn,pstmt);
	 	}
	 	
	 	return list;
	 	
	}
	
	
	
	public List<BoardVO> selectTypeBoard(String types, String q){
		
		String subquery = null;

		if(types.equals("all")){
			subquery = " where b.types in ('gi', 'tr', 'sp') ";
		}else{
			subquery = " where b.types in ('" + types + "')";
		}
		
		if(!q.equals("")){
		
			subquery += " and b.tags like '%"+q+"%' ";
		}
		
		
		
		
		List<BoardVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select b.*, f.file_save_name from t_board b LEFT OUTER JOIN t_board_file f ON b.no = f.board_no  ");
		sql.append( subquery + " and f.file_save_name is not null order by f.no desc ");
		
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			ResultSet rs = pstmt.executeQuery();
		 	//System.out.println(sql.toString());
		 	
		 	while(rs.next()){
		 		int no = rs.getInt("no");
		 		String title = rs.getString("title");
		 		String writer = rs.getString("writer");
		 		String content = rs.getString("content");
		 		String regDate = rs.getString("reg_date");
		 		String imgs = rs.getString("file_save_name");
		 		String type = rs.getString("types");
		 		String tags = rs.getString("tags");
		 		
		 		
		 		// 번호, 제목, 작성자, 작성일을 가지는 Vo클래스 객체의 배열
		 		BoardVO board = new BoardVO();
		 		board.setNo(no);
		 		board.setTitle(title);
		 		board.setWriter(writer);
		 		board.setContent(content);
		 		board.setReg_date(regDate);
		 		board.setImgs(imgs);
		 		board.setTypes(type);
		 		board.setTags(tags);
		 		
		 		list.add(board);
		 		
		 	}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	 	return list;
	}
	
	
	public BoardVO selectNoBoard(int board_no){
		
		BoardVO board = new BoardVO();
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select b.*, f.file_save_name from t_board b LEFT OUTER JOIN t_board_file f ON b.no = f.board_no  ");
		sql.append( " where b.no = ? order by f.no desc ");
		
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			
			pstmt.setInt(1,board_no);
			ResultSet rs = pstmt.executeQuery();

		 	
		 	rs.next();
	 		int no = rs.getInt("no");
	 		String title = rs.getString("title");
	 		String writer = rs.getString("writer");
	 		String content = rs.getString("content");
	 		String regDate = rs.getString("reg_date");
	 		String imgs = rs.getString("file_save_name");
	 		String type = rs.getString("types");
	 		String tags = rs.getString("tags");
	 		
	 		
	 		// 번호, 제목, 작성자, 작성일을 가지는 Vo클래스 객체의 배열
	 		
	 		board.setNo(no);
	 		board.setTitle(title);
	 		board.setWriter(writer);
	 		board.setContent(content);
	 		board.setReg_date(regDate);
	 		board.setImgs(imgs);
	 		board.setTypes(type);
	 		board.setTags(tags);
		 		
		 		
		 	
		}catch(Exception e){
			e.printStackTrace();
		}
		
	 	return board;
	}
	
	public List<BoardVO> selectUserBoard(String userid){
		
		
		List<BoardVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select b.*, f.file_save_name from t_board b LEFT OUTER JOIN t_board_file f ON b.no = f.board_no  ");
		sql.append( "where b.regid = ? and f.file_save_name is not null order by f.no desc ");
		
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setString(1,userid);
			
			ResultSet rs = pstmt.executeQuery();
		 	//System.out.println("sql : "+sql.toString());
		 	
		 	while(rs.next()){
		 		int no = rs.getInt("no");
		 		String title = rs.getString("title");
		 		String writer = rs.getString("writer");
		 		String content = rs.getString("content");
		 		String regDate = rs.getString("reg_date");
		 		String imgs = rs.getString("file_save_name");
		 		String type = rs.getString("types");
		 		String tags = rs.getString("tags");
		 		
		 		
		 		// 번호, 제목, 작성자, 작성일을 가지는 Vo클래스 객체의 배열
		 		BoardVO board = new BoardVO();
		 		board.setNo(no);
		 		board.setTitle(title);
		 		board.setWriter(writer);
		 		board.setContent(content);
		 		board.setReg_date(regDate);
		 		board.setImgs(imgs);
		 		board.setTypes(type);
		 		board.setTags(tags);
		 		
		 		list.add(board);
		 		
		 	}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	 	return list;
	}
	
	
	
	
	public List<BoardVO> selectPost(int r_idx){

		String subquery = " where b.no = '" + r_idx + "'";
		
		List<BoardVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select b.*, f.file_save_name from t_board b LEFT OUTER JOIN t_board_file f ON b.no = f.board_no  ");
		sql.append( subquery + " and f.file_save_name is not null order by f.no desc ");
		
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.executeQuery(sql.toString());
			ResultSet rs = pstmt.executeQuery();
		 	//System.out.println(sql.toString());
		 	
		 	while(rs.next()){
		 		int no = rs.getInt("no");
		 		String title = rs.getString("title");
		 		String writer = rs.getString("writer");
		 		String content = rs.getString("content");
		 		String regDate = rs.getString("reg_date");
		 		String imgs = rs.getString("file_save_name");
		 		String type = rs.getString("types");
		 		String tags = rs.getString("tags");
		 		int view_cnt = rs.getInt("view_cnt");
		 		int like_cnt = rs.getInt("like_cnt");
		 		
		 		
		 		// 번호, 제목, 작성자, 작성일을 가지는 Vo클래스 객체의 배열
		 		BoardVO board = new BoardVO();
		 		board.setNo(no);
		 		board.setTitle(title);
		 		board.setWriter(writer);
		 		board.setContent(content);
		 		board.setReg_date(regDate);
		 		board.setImgs(imgs);
		 		board.setTypes(type);
		 		board.setTags(tags);
		 		board.setView_cnt(view_cnt);
		 		board.setLike_cnt(like_cnt);
		 		
		 		
		 		list.add(board);
		 		
		 	}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	 	return list;
	}
	
	/**
	 * 게시물 번호에 해당하는 게시물을 조회하는 메소드
	 * @param no
	 * @return 게시물VO
	 */
	
	public BoardVO selectByNo(int no){
		
		BoardVO board = new BoardVO();
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
		
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" select no, title, writer, content, view_cnt ");
			sql.append("        , to_char(reg_date,'yyyy-mm-dd') reg_date ");
			sql.append(" from t_board ");
			sql.append(" where no = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1,no);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			board.setNo(rs.getInt("no"));
			board.setTitle(rs.getString("title"));
			board.setWriter(rs.getString("writer"));
			board.setView_cnt(rs.getInt("view_cnt"));
			board.setContent(rs.getString("content"));
			board.setReg_date(rs.getString("reg_date"));
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCClose.close(conn,pstmt);
		}
		
		return board;
	}
	
	
	public void delete(int no){
		
		StringBuilder sql = new StringBuilder();
		sql.append(" delete from t_board ");
		sql.append(" where no = ? ");
		
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void viewcnt(int no){
		StringBuilder sql = new StringBuilder();
		sql.append(" update  t_board ");
		sql.append(" set view_cnt = view_cnt+1 where no = ?  ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void likecnt(int no){
		StringBuilder sql = new StringBuilder();
		sql.append(" update  t_board ");
		sql.append(" set like_cnt = like_cnt+1 where no = ?  ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void insert(BoardVO board){
		
		int loc = 1;
		
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into t_board (no, title, writer, content) ");
		sql.append(" values ( ?, ?, ?, ?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(loc++, board.getNo());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getContent());
			
			/*
			pstmt.setInt(l, board.getTitle());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getWriter());
			pstmt.setString(4, board.getContent());
			*/
			
			pstmt.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	public void insertBoard(BoardVO board){
		
		int loc = 1;
		
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into t_board (no, depth, board_no, title, writer, regid, content, tags, types) ");
		sql.append(" values ( ?, ?, ?, ?, ?, ?, ?, ?, ?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setInt(loc++, board.getNo());
			pstmt.setInt(loc++, board.getDepth());
			pstmt.setInt(loc++, board.getBoard_no());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getRegid());
			pstmt.setString(loc++, board.getContent());
			pstmt.setString(loc++, board.getTags());
			pstmt.setString(loc++, board.getTypes());
			
			pstmt.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
public void insertBoardLike(BoardVO board){
		
		int loc = 1;
		
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into t_board_like (no, board_no) ");
		sql.append(" values ( seq_t_board_like_no.nextval, ?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			
			pstmt.setInt(loc++, board.getNo());
			
			pstmt.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 게시판 테이블에 저장할 게시판 번호와, 첨부파일을 저장할 테이블의 게시판 번호를 같이 사용하기 위한
	 * 게시판 번호 추출
	 */
	
	public int selectNo(){
		String sql = " select seq_t_board_no.nextval from dual";
		int no = 0;
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		){
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			no = rs.getInt(1);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return no;
	}
	
	
	////// 첨부파일 관련된 CRUD /////////
	public void insertFile(BoardFileVO fileVO){
		
		
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into t_board_file( no, board_no, file_ori_name ");
		sql.append(" ,file_save_name, file_size) ");
		sql.append(" values( seq_t_board_file_no.nextval, ?, ?, ?, ?)   ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());	
		){
			int i = 1;
			
			pstmt.setInt(i++, fileVO.getBoard_no());
			pstmt.setString(i++, fileVO.getFile_ori_name());
			pstmt.setString(i++, fileVO.getFile_save_name());
			pstmt.setInt(i++, fileVO.getFile_size());
			System.out.println(sql.toString());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			
		}
		
		
	}
	
	public List<BoardFileVO> selectFileByNo(int boardNO){
		
		List<BoardFileVO> fileList = new ArrayList<>();
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select file_ori_name, file_save_name, file_size ");
		sql.append(" from t_board_file ");
		sql.append(" where board_no = ?");
		
		try{
			conn = new ConnectionFactory().getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNO);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setFile_ori_name(rs.getString("file_ori_name"));
				fileVO.setFile_save_name(rs.getString("file_save_name"));
				fileVO.setFile_size(rs.getInt("file_size"));
				
				fileList.add(fileVO);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCClose.close(conn, pstmt);
		}
		
		return fileList;
	}
	
	
	public List<BoardCommentVO> selectByComment(int no){
		
		List<BoardCommentVO> list = new ArrayList<>();
		
		
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * from T_BOARD_COMMENT where board_no = ? order by no desc ");
		
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
		){
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardCommentVO commentVO = new BoardCommentVO();
				
				commentVO.setNo(rs.getInt("no"));
				commentVO.setBoard_no(rs.getInt("board_no"));
				commentVO.setWriter(rs.getString("writer"));
				commentVO.setContent(rs.getString("content"));
				commentVO.setRegdate(rs.getString("reg_date"));
				
				list.add(commentVO);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		return list;
		
	}
	
	public void deleteComment(int no){
		
		StringBuilder sql = new StringBuilder();
		sql.append("delete from T_BOARD_COMMENT where no = ? ");
		
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
		){
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	public void insertComment(BoardCommentVO commentVO){
		
		
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into t_board_comment( no, board_no, writer, content ) ");
		sql.append("   values( seq_t_board_comment_no.nextval, ?, ?, ?)   ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());	
		){
			int i = 1;
			pstmt.setInt(i++, commentVO.getBoard_no());
			pstmt.setString(i++, commentVO.getWriter());
			pstmt.setString(i++, commentVO.getContent());
			System.out.println(sql.toString());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			
		}
		
		
	}
	
	public int selectlike(int no, String writer){
		
		int cnt = 100;
		
		
		
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) as cnt from T_BOARD_LIKE where board_no = ? and id like ? ");
		
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
		){
						
			writer = '|'+ writer+'|';
			pstmt.setInt(1, no);
			pstmt.setString(2, '%' + writer + '%');
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			cnt = rs.getInt("cnt");
							
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		return cnt;
		
	}
	
	
	public void updatelike(int no, String writer){
		
		writer = "|" + writer + "|";
		
		StringBuilder sql = new StringBuilder();
		sql.append("update t_board_like set id = id||? where board_no = ? ");
		
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
		){
			
			pstmt.setString(1, writer);
			pstmt.setInt(2, no);
			
			pstmt.executeUpdate();
				
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		
		
	}
	
	
	
	
}
