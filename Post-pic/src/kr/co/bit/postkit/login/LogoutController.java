package kr.co.bit.postkit.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.controller.Controller;

public class LogoutController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//���� ����
		HttpSession session = request.getSession();
		session.removeAttribute("userVO");
		session.invalidate(); // ���� ����
		
		
		return "/login/logOut.jsp";
}
}
