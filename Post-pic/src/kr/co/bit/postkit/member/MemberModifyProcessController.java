package kr.co.bit.postkit.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.postkit.DAO.MemberDAO;
import kr.co.bit.postkit.VO.MemberVO;
import kr.co.bit.controller.Controller;

public class MemberModifyProcessController implements Controller {
	
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		//고치지 않을 정보
		String name = "";
	    
		String id = request.getParameter("id");
	  	String password = request.getParameter("password");
	  	String email_id = request.getParameter("email_id");
	  	String email_domain = request.getParameter("email_domain");
	  	String tel1 = request.getParameter("tel1");
	  	String tel2 = request.getParameter("tel2");
	  	String tel3 = request.getParameter("tel3");
	  	String post = request.getParameter("post");
	  	String basic_addr = request.getParameter("basic_addr");
	  	String detail_addr = request.getParameter("detail_addr");      
	  	
		MemberDAO dao = new MemberDAO();
		MemberVO member = new MemberVO(id, name, password, email_id, email_domain, tel1, tel2, tel3, post, basic_addr, detail_addr);
		
		System.out.println("member : " + member);
		
		dao.changeMember(member);
		
		request.setAttribute("memberVO", member);
		
		return "/member/memberModifyProcess.jsp";
}
}
