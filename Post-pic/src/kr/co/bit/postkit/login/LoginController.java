package kr.co.bit.postkit.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.controller.Controller;

public class LoginController implements Controller{

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		return "/login/loginForm.jsp";
}

}