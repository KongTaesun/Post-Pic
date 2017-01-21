package kr.co.bit.postkit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.postkit.controller_bak.Controller_bak;

public class indexController implements Controller_bak{
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {


		return "/index.jsp";
	}
}


