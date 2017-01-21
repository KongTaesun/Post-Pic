package kr.co.bit.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.controller.Controller;

public class mainpicController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String types = request.getParameter("types");
		String q = request.getParameter("q");		
		
		return "/ajax/mainpic.jsp?types="+types+"&q="+q;
		
	}
}
