package com.examonline.service.impl;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.examonline.dao.BaseDao;
import com.examonline.entity.Student;
import com.examonline.service.StudentService;
import com.examonline.util.ValidateUtils;

@Service("studentService")
public class StudentServiceImpl extends BaseServiceImpl<Student> implements StudentService {

	@Resource(name = "studentDao")
	@Override
	public void setBaseDao(BaseDao<Student> baseDao) {
		super.setBaseDao(baseDao);
	}

	@Override
	public Student validateStudentInfo(Student student) {
		// TODO 自动生成的方法存根
		String hql = "from Student where stuNum=? and pwd=?";
		List<Student> students = this.findEntiyByHql(hql, student.getStuNum(), student.getPwd());
		return ValidateUtils.isValidate(students) ? students.get(0) : null;	
		
	}

//	@Override
//	public Student saveStudent(Student student) {
//		// TODO 自动生成的方法存根
//		
//		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
//		String date = df.format(new Date());
//		student.setStuName(date);
//		this.saveEntity(t);
//			
//		
//		
//		return null;
//	}

//	@Override
//	public User validateUserInfo(User user) {
//		String hql = "from User where userName=? and password=?";
//		String password = user.getPassword();
//		password = DigestUtils.md5DigestAsHex(password.getBytes());
//		List<User> users = this.findEntiyByHql(hql, user.getUserName(), password);
//		return ValidateUtils.isValidate(users) ? users.get(0) : null;
//	}

}
