package kr.co.bit.board;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.bit.board.dao.BoardDAO;
import kr.co.bit.controller.Controller;
import kr.co.bit.util.BitFileNamePolicy;

public class UploadokController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		
		request.setCharacterEncoding("UTF-8");
		
		
		String saveFolder = request.getSession().getServletContext().getRealPath("/upload"); 
		//String saveFolder = "C:/myjava/eclipse/workspace/Post-pic/WebContent/upload";
		MultipartRequest multi = new MultipartRequest(request,saveFolder,1024*1024*5,"utf-8",new BitFileNamePolicy());
		
		
		
		String tmp_depth = multi.getParameter("depth");
		String tmp_board_no = multi.getParameter("board_no");
		
		if(tmp_depth.equals(null)){
			tmp_depth = "0";
		}
		
		if(tmp_board_no.equals(null)){
			tmp_board_no = "0";
		}
		
		int depth = Integer.parseInt(tmp_depth);
		int board_no = Integer.parseInt(tmp_board_no);
		
		
		
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String regid = multi.getParameter("regid");
		String content = multi.getParameter("content");
		String tags = multi.getParameter("tags");
		String types = multi.getParameter("types");
		
		
		// seq �� ��������
		BoardDAO dao = new BoardDAO();
		int nextNo = dao.selectNo();
		
		// BoardVO ��ü ���� �� �ʱ�ȭ
		BoardVO board = new BoardVO();
		
		board.setNo(nextNo);
		board.setDepth(depth);
		board.setBoard_no(board_no);
		board.setTitle(title);
		board.setWriter(writer);
		board.setRegid(regid);
		board.setContent(content);
		board.setTags(tags);
		board.setTypes(types);
		
		// �Խñ� insert 
		dao.insertBoard(board);
		dao.insertBoardLike(board);
		
		// ���� ���ε�
				
		Enumeration files = multi.getFileNames();
		
		while(files.hasMoreElements()){
			System.out.println("��������");
			String fileName = (String)files.nextElement();
			File f = multi.getFile(fileName);
			
			if(f != null){
				String file_ori_name = multi.getOriginalFileName(fileName);
				String file_save_name = multi.getFilesystemName(fileName);
				int file_size = (int)f.length();
				
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setBoard_no(nextNo);
				fileVO.setFile_ori_name(file_ori_name);
				fileVO.setFile_save_name(file_save_name);
				fileVO.setFile_size(file_size);
				dao.insertFile(fileVO);
				
			}
		}
		
		
		
		return "/board/upload_ok.jsp";
	}

}
