package com.examonline.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.examonline.dao.BaseDao;
import com.examonline.entity.Exam;
import com.examonline.entity.Lesson;
import com.examonline.entity.User;
import com.examonline.service.ExamService;
import com.examonline.service.LessonService;
import com.examonline.service.UserService;
import com.examonline.util.ValidateUtils;

@Service("examService")
public class ExamServiceImpl extends BaseServiceImpl<Exam> implements ExamService {

	@Resource(name = "examDao")
	@Override
	public void setBaseDao(BaseDao<Exam> baseDao) {
		super.setBaseDao(baseDao);
	}

}
