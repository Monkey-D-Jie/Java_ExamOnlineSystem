package com.examonline.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.examonline.entity.User;

public class ExitAction extends BaseAction<User> implements SessionAware{

	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	
	
	public String exit(){
		session.clear();
		return "exit";
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session=arg0;
	}

	
}
