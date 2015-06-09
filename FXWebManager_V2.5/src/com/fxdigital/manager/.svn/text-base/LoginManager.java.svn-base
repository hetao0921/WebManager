package com.fxdigital.manager;

import org.springframework.stereotype.Component;

@Component
public class LoginManager {
	
	public boolean check(String username,String password){
		if (("admin".equals(username)&&"123456".equals(password))||("supermanager".equals(username)&&"supermanager".equals(password))) {
			return true;
		} else{
			return false;
		}
	}
	
}
