package com.examonline.action;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.examonline.entity.Lesson;
import com.examonline.service.LessonService;

@Controller
@Scope("prototype")
public class LessonAction extends BaseAction<Lesson> {

	private static final long serialVersionUID = 1L;

	@Resource
	private LessonService lessonService;
	
	private List<Lesson> lessons;
	

	public String lesson(){
		//如果要用分页来显示数据的话
		this.lessons=this.lessonService.getSplitPage(pageInfo);//这个pageInfo是父类的
		//然后别忘了把pageInfo给到显示数据的页面
		this.requset.setAttribute("pageBean", pageInfo.getPageBean());;
		return "lesson";
	}
	
	public List<Lesson> getLessons() {
		
		return lessons;
	}
	
	
	public String lessonAdd (){
		return "lessonAdd";
	}

	public String doAdd(){
		this.lessonService.saveEntity(model);
		return "redirect";
	}
	
	public String doDel(){
		this.lessonService.delteEntity(model);
		return "redirect";
	}
	
}
