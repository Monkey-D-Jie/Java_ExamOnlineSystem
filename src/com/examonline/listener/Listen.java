package com.examonline.listener;

import javax.annotation.Resource;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import com.examonline.entity.User;
import com.examonline.service.UserService;

@SuppressWarnings("rawtypes")
public class Listen implements ApplicationListener {
	@Resource
	private UserService userService;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if(event instanceof ContextRefreshedEvent ){
			User user=new User();
			user.setRealName("admin");
			user.setUserName("admin");
			user.setPassword("admin");
			userService.saveEntity(user);
		}
	}
	
}
