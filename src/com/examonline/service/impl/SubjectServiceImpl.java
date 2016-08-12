package com.examonline.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.examonline.dao.BaseDao;
import com.examonline.entity.Subject;
import com.examonline.entity.Taoti;
import com.examonline.service.SubjectService;
import com.examonline.service.TaotiService;

@Service("subjectService")
public class SubjectServiceImpl extends BaseServiceImpl<Subject> implements SubjectService {

	@Resource(name = "subjectDao")
	@Override
	public void setBaseDao(BaseDao<Subject> baseDao) {
		super.setBaseDao(baseDao);
	}



}
