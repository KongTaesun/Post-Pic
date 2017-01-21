package kr.co.bit.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.controller.Controller;

public class postsController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String no = request.getParameter("no");
				
		
		return "/ajax/posts.jsp?no="+no;
		
	}
}
