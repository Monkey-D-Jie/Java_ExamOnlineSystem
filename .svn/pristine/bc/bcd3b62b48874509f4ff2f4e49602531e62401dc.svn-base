package com.examonline.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.examonline.entity.User;
import com.examonline.service.UserService;

@Controller
@Scope("prototype")
public class LoginAction extends BaseAction<User> implements SessionAware{

	private static final long serialVersionUID = 1L;
	
	@Resource
	private UserService userService;

	private Map<String, Object> session;

	public String login(){
		return "index";
	}
	
	public void validateLogin() {
		User user = userService.validateUserInfo(model);
		if(user!=null){
			session.put("user", user);
		}else{
			addActionError("用户名或密码错误");
		}
	}
	
	public String logout(){
		session.clear();
		return "logout";
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
}
