package kr.co.bit.postkit.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.controller.Controller;

public class MemberDeleteController implements Controller{
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {


		return "/member/memberDelete.jsp";
	}
	
}
