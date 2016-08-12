package com.examonline.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.examonline.dao.BaseDao;
import com.examonline.entity.Question;
import com.examonline.entity.Taoti;
import com.examonline.service.QuestionService;

@Service
public class QuestionServiceImpl extends BaseServiceImpl<Question> implements QuestionService{

	@Resource(name="questionDao")
	@Override
	public void setBaseDao(BaseDao<Question> baseDao) {
		super.setBaseDao(baseDao);
	}

	@Override
	public void saveQuestion(Question question) {
		Taoti taoti=new Taoti();
		taoti.setId(question.getTaotiId());
		question.setTaoti(taoti);
		
		baseDao.saveEntity(question);
		
	}

	@Override
	public void saveOrUpdateQuestion(Question question) {
		Taoti taoti=new Taoti();
		taoti.setId(question.getTaotiId());
		question.setTaoti(taoti);
		
		baseDao.saveOrUpdate(question);
	}

	@Override
	public void updateQuestion(Question question) {
		// TODO 自动生成的方法存根
		
	}

	@Override
	public List<Question> findQuestions(String type, int taotiId) {
		// TODO 自动生成的方法存根
		String hql = "from Question where type=? and taoti.id=?";
		return this.findEntiyByHql(hql, type, taotiId);
	}
	
}
