package kr.co.bit.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.board.dao.BoardDAO;
import kr.co.bit.controller.Controller;

public class ModPicController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		
		//System.out.println("no : " + no);
		
		BoardDAO dao = new BoardDAO();
		BoardVO boardvo = dao.selectNoBoard(no);
		request.setAttribute("boardVO", boardvo);
		
		
	
		
		return "/board/modpic.jsp";
		
	}
}
