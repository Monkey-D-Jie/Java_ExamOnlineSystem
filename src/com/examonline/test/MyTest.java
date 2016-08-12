package com.examonline.test;



import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.DigestUtils;

import com.examonline.entity.Lesson;
import com.examonline.entity.Question;
import com.examonline.entity.Student;
import com.examonline.entity.User;
import com.examonline.service.AnswerService;
import com.examonline.service.LessonService;
import com.examonline.service.QuestionService;
import com.examonline.service.StudentService;
import com.examonline.service.UserService;


public class MyTest {

	private ApplicationContext act=new ClassPathXmlApplicationContext("beans.xml");;

	
	@Test
	public void LessonTest(){
		LessonService student= act.getBean(LessonService.class);
		Lesson lesson=new Lesson();
		lesson.setLessonName("有机化学");
		lesson.setDate(new Date());
		student.saveEntity(lesson);
	}
	@Test
	public void Student(){
		StudentService student= act.getBean(StudentService.class);
		Student stu=new Student();
		stu.setStuName("宋婷玉");
		stu.setStuSex("女");
		stu.setPwd(DigestUtils.md5DigestAsHex("456789".getBytes()));
		stu.setProcession("孤独的寂寞");
		stu.setIdCard("741258963");
		stu.setSecQue("想当炼器师吗");
		stu.setSecAns("是嘛");
		stu.setDate(new Date());
		student.saveEntity(stu);
	}
	
	@Test
	public void StringTest(){
		String[] value={"0"};
		String temp="";
		if(value.length>0&&value!=null){
			for(int i=0;i<value.length;i++){
				temp=temp+value[i]+",";
			}
		}
		temp=temp.substring(0, temp.length()-1);
		System.out.println(temp);
	}
	@Test
	public void TrueTest(){
		AnswerService anser=act.getBean(AnswerService.class);
		System.out.println(anser.getEntity(14));
	}
	@Test
	public void UserTest(){
		UserService userservice=act.getBean(UserService.class);
		User  user=new User();
		user.setRealName("admin");
		user.setUserName("admin");
		String password=DigestUtils.md5DigestAsHex("123456".getBytes());
		user.setPassword(password);
		userservice.saveEntity(user);
		}
	
}
