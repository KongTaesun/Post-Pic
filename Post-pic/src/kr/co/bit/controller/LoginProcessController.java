package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.postkit.DAO.LoginDAO;
import kr.co.bit.postkit.VO.LoginVO;



public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		
		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);
		loginVO.setPassword(password);
		
		
		// DB에서 로그인 수행
		LoginDAO dao = new LoginDAO();
		LoginVO userVO = dao.login(loginVO);
		
		String msg = "";
		String url = "";
		if(userVO == null){
			msg = "아이디 또는 패스워드가 잘못입력되었습니다";
			url = request.getContextPath()+"/login.do";
		}else{
			
			if(userVO.getType().equals("S"))
				msg = "관리자님 환영합니다.";
			else
				msg = userVO.getId() + "님 환영합니다";
			
			//url = "/Mission-Web-MVC";
			url = request.getContextPath();
			
			// 세션영역에 등록
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
			
		}
		request.setAttribute("msg",msg);
		request.setAttribute("url",url);
		
		return "/login/loginProcess.jsp";
		
	}

}
