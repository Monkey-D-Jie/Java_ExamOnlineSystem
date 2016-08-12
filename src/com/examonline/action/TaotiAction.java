package com.examonline.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;

import org.springframework.stereotype.Controller;

import com.examonline.entity.Lesson;
import com.examonline.entity.Subject;
import com.examonline.entity.Taoti;
import com.examonline.service.LessonService;
import com.examonline.service.SubjectService;
import com.examonline.service.TaotiService;


@Controller
@Scope("prototype")
public class TaotiAction extends BaseAction<Taoti> {

	private static final long serialVersionUID = 1L;
	@Resource
	private TaotiService taotiService;
	private List<Taoti> taotis;
	
	@Resource
	private LessonService lessonService;

	
	public List<Taoti> getTaotis() {
		return taotis;
	}
	
	private List<Lesson> lessons;
	
	
	public List<Lesson> getLessons() {
		return lessons;
	}


	public void setLessons(List<Lesson> lessons) {
		this.lessons = lessons;
	}


	public void setTaotis(List<Taoti> taotis) {
		this.taotis = taotis;
	}


	public String index(){
		//如果要用分页来显示数据的话
		this.taotis=this.taotiService.getSplitPage(pageInfo);//这个pageInfo是父类的
		//然后别忘了把pageInfo给到显示数据的页面
		 this.requset.setAttribute("pageBean", pageInfo.getPageBean());;
		//this.taotis=this.taotiService.findAll();
		return "index";
	}
			
	
	public String add(){
		this.lessons=this.lessonService.findAll();
		return "add";
	}
	public String doAdd(){
		this.taotiService.saveTaoti(model);
		return "redirect";
	}
	
	
	public String taotis(){
		this.taotis=this.taotiService.findAll();
		return "taotis";
	}
	
	public String doDel(){
		this.taotiService.delteEntity(model);
		return "redirect";
	}
	
	public String edit(){
		this.lessons=this.lessonService.findAll();
		this.model=this.taotiService.getEntity(this.model.getId());
		return "edit";
	}
	
	public String doEdit(){
		this.taotiService.updateTaoti(model);
		return "redirect";
	}
}
