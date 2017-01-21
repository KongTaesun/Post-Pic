package kr.co.bit.postkit.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.postkit.DAO.LoginDAO;
import kr.co.bit.postkit.DAO.MemberDAO;
import kr.co.bit.postkit.VO.LoginVO;
import kr.co.bit.postkit.VO.MemberVO;
import kr.co.bit.controller.Controller;

public class MemberDeleteProcessController implements Controller{
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String pw = request.getParameter("password");
		
		HttpSession session =  request.getSession();
		LoginVO logVO = (LoginVO)session.getAttribute("userVO");
		String id = logVO.getId();
		
		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);
		loginVO.setPassword(pw);
		
		LoginDAO dao = new LoginDAO();
		LoginVO userVO = dao.login(loginVO);
		
		
		
		if(userVO == null) {
			return "/member/memberDeleteProcess.jsp?chk=f";
		} else {
		
			MemberDAO dao2 = new MemberDAO();
			dao2.deleteMember(id, pw);
			
			
			session.removeAttribute("userVO");
			session.invalidate(); // 전부 삭제
			
			
			return "/member/memberDeleteProcess.jsp?chk=t";
		}
		
	}

}
