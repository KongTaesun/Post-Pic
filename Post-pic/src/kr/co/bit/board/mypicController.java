package kr.co.bit.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.controller.Controller;
import kr.co.bit.postkit.VO.LoginVO;

public class mypicController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session =  request.getSession();
		LoginVO logVO = (LoginVO)session.getAttribute("userVO");
		String userid = logVO.getId();
		//System.out.println("id : " + userid);
		
		return "/ajax/mypic.jsp?userid="+userid;
		
	}
}
