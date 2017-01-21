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
		
		
		// DB���� �α��� ����
		LoginDAO dao = new LoginDAO();
		LoginVO userVO = dao.login(loginVO);
		
		String msg = "";
		String url = "";
		if(userVO == null){
			msg = "���̵� �Ǵ� �н����尡 �߸��ԷµǾ����ϴ�";
			url = request.getContextPath()+"/login.do";
		}else{
			
			if(userVO.getType().equals("S"))
				msg = "�����ڴ� ȯ���մϴ�.";
			else
				msg = userVO.getId() + "�� ȯ���մϴ�";
			
			//url = "/Mission-Web-MVC";
			url = request.getContextPath();
			
			// ���ǿ����� ���
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
			
		}
		request.setAttribute("msg",msg);
		request.setAttribute("url",url);
		
		return "/login/loginProcess.jsp";
		
	}

}
