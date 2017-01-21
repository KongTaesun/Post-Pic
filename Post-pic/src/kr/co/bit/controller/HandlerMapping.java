package kr.co.bit.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {
	
	private Map<String,Controller> mappings = null;
	
	
	
	public HandlerMapping(){
		
		this("C:/myjava/eclipse/workspace/Post-pic/WebContent/bean.properties");
	}
	
	
	public HandlerMapping(String configName){
		
		mappings = new HashMap<>();
		Properties prop = new Properties();
		try{
			InputStream inStream = new FileInputStream(configName);
			prop.load(inStream);
			
			Set<Object> keys = prop.keySet();
			
			for(Object key : keys){
				//System.out.println(key + ":" +prop.getProperty(key.toString()));
				String className = prop.getProperty(key.toString());
				Class<?> clz = Class.forName(className);
				
				mappings.put(key.toString(), (Controller)clz.newInstance());
				
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		/*
		mappings = new HashMap<>();
		mappings.put("/list.do", new ListController());
		mappings.put("/writeForm.do", new WriteFormController());
		mappings.put("/write.do", new WriteController());
		mappings.put("/member.do", new MemberController());
		*/
	}

	public Controller getController(String uri){
		
		return mappings.get(uri);
		
	}
	
		
	public static void main(String[] args) throws Exception {
		/*
		Class<?> clz = Class.forName("kr.co.bit.controller.ListController");
		
		Controller obj = (Controller)clz.newInstance();
		System.out.println(obj.handleRequest(null, null));
		*/
	}
	
}
