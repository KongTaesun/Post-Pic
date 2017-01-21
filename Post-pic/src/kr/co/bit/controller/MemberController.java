package kr.co.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class MemberController implements Controller {
	
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		MemberDAO doa = new MemberDAO();
		List<MemberVO> list = doa.selectMember();
		
		request.setAttribute("list", list);
		
		return "/member/member.jsp";
	}
}


