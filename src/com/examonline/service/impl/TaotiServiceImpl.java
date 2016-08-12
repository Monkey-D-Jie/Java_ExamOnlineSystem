package com.examonline.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.examonline.dao.BaseDao;
import com.examonline.entity.Lesson;
import com.examonline.entity.Question;
import com.examonline.entity.Subject;
import com.examonline.entity.Taoti;
import com.examonline.service.QuestionService;
import com.examonline.service.TaotiService;

@Service
public class TaotiServiceImpl extends BaseServiceImpl<Taoti> implements TaotiService{ 

	@Resource(name="taotiDao")
	@Override
	public void setBaseDao(BaseDao<Taoti> baseDao) {
		super.setBaseDao(baseDao);
	}

	@Override
	public void saveTaoti(Taoti model) {
		Lesson lesson=new Lesson();
		lesson.setId(model.getLessonId());
		model.setLesson(lesson);
		baseDao.saveEntity(model);
		
	}

	@Override
	public void updateTaoti(Taoti model) {
		Lesson lesson=new Lesson();
		lesson.setId(model.getLessonId());
		model.setLesson(lesson);
		baseDao.saveOrUpdate(model);
		
	}

	
}
