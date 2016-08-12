package com.examonline.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.examonline.dao.BaseDao;
import com.examonline.entity.Lesson;
import com.examonline.entity.User;
import com.examonline.service.LessonService;
import com.examonline.service.UserService;
import com.examonline.util.ValidateUtils;

@Service("lessonService")
public class LessonServiceImpl extends BaseServiceImpl<Lesson> implements LessonService {

	@Resource(name = "lessonDao")
	@Override
	public void setBaseDao(BaseDao<Lesson> baseDao) {
		super.setBaseDao(baseDao);
	}

}
