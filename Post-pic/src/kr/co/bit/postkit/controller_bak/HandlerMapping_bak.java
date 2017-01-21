package kr.co.bit.postkit.controller_bak;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping_bak {

	private Map <String, Controller_bak> mappings = null; 

	public HandlerMapping_bak(){
		this("C:/Users/Zero/workspace/Mission-Board/bean.properties");
	}
	
	public HandlerMapping_bak(String configName){     
		
		mappings = new HashMap<>();
		Properties prop = new Properties(); 
		
		try{
			InputStream inStream = new FileInputStream(configName);
			prop.load(inStream);
		
			Set <Object> keys = prop.keySet();
			
			for(Object key : keys){
				String className = prop.getProperty(key.toString());
				Class<?> clz = Class.forName(className);
				System.out.println(className);
				mappings.put(key.toString(), (Controller_bak)clz.newInstance());
			}
			
		} catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public Controller_bak getController(String uri){
		
		return mappings.get(uri);
	}
}
