package com.examonline.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.examonline.dao.BaseDao;
import com.examonline.entity.Score;
import com.examonline.service.ScoreService;

@Service("scoreService")
public class ScoreServiceImpl extends BaseServiceImpl<Score> implements ScoreService {

	@Resource(name="scoreDao")
	@Override
	public void setBaseDao(BaseDao<Score> baseDao) {
		super.setBaseDao(baseDao);
	}
	
}
