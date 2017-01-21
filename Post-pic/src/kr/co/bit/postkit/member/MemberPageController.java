package kr.co.bit.postkit.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.postkit.DAO.MemberDAO;
import kr.co.bit.postkit.VO.LoginVO;
import kr.co.bit.postkit.VO.MemberVO;
import kr.co.bit.controller.Controller;

public class MemberPageController implements Controller {
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  	
		LoginVO userVO = null;
		
		HttpSession session =  request.getSession();
		
		userVO = (LoginVO)session.getAttribute("userVO");
		
		MemberVO vo = new MemberVO();
		vo.setId(userVO.getId());
		MemberDAO dao = new MemberDAO();
		MemberVO memberVO = dao.mypage(vo);
		
		request.setAttribute("memberVO", memberVO);
	    	
		return "/member/memberPage.jsp";
	
	}
	
}
