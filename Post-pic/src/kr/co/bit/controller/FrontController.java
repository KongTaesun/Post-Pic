package kr.co.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
	
	private HandlerMapping mappings;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		String configName = config.getInitParameter("configName");
		
		
		mappings = new HandlerMapping(configName);	
	}

	// alt shift s + v
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String context = request.getContextPath();
		//System.out.println("context : " + context);

		String uri = request.getRequestURI();
		uri = uri.substring(context.length());
		System.out.println("»£√‚µ» URI : " + uri);

		
		try{
						
			Controller control = mappings.getController(uri);
			String callPage = control.handleRequest(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
			dispatcher.forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
			throw new ServletException(e);
		}
	}



}
