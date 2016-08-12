package com.examonline.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.examonline.dao.BaseDao;
import com.examonline.entity.User;
import com.examonline.service.UserService;
import com.examonline.util.ValidateUtils;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

	@Resource(name = "userDao")
	@Override
	public void setBaseDao(BaseDao<User> baseDao) {
		super.setBaseDao(baseDao);
	}

	@Override
	public User validateUserInfo(User user) {
		String hql = "from User where userName=? and password=?";
		String password = user.getPassword();
		password = DigestUtils.md5DigestAsHex(password.getBytes());
		List<User> users = this.findEntiyByHql(hql, user.getUserName(), password);
		return ValidateUtils.isValidate(users) ? users.get(0) : null;
	}

}
