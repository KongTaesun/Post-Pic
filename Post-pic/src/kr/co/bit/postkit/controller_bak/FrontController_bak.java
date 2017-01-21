package kr.co.bit.postkit.controller_bak;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController_bak extends HttpServlet{
	
private HandlerMapping_bak mappings;
	
	@Override  
	public void init(ServletConfig config) throws ServletException {  

		String configName = config.getInitParameter("configName");
		
		mappings = new HandlerMapping_bak(configName);
		
		
		super.init(config); 
	}

	@Override   
	protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String context = request.getContextPath();		
		String uri = request.getRequestURI();
		uri = uri.substring(context.length());  
		
		try{
			
		Controller_bak control = mappings.getController(uri);
		
		String callPage = control.handleRequest(request,response);
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);   
		dispatcher.forward(request, response);
		
		}catch(Exception e){
			throw new ServletException(e);
		}
	}

}
