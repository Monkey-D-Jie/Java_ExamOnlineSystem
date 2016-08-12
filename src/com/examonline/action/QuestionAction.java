package com.examonline.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.examonline.entity.Question;
import com.examonline.entity.Taoti;
import com.examonline.entity.User;
import com.examonline.service.QuestionService;
import com.examonline.service.TaotiService;
import com.examonline.service.impl.QuestionServiceImpl;

@Controller
@Scope("protoType")
public class QuestionAction extends BaseAction<Question> {
	
	private static final long serialVersionUID = 1L;
	
	
	@Resource
	private QuestionService questionservice;
	
	
	@Resource
	private TaotiService taotiService;
	
	private List<Question> questions;
	
	private List<Taoti> taotis;
	
	private Question question;
	
	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}
	
	public List<Taoti> getTaotis() {
		return taotis;
	}

	public void setTaotis(List<Taoti> taotis) {
		this.taotis = taotis;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	
	
	public String index(){
		return "index";
	}
	
	public String questions(){
		//如果要用分页来显示数据的话
		this.questions=this.questionservice.getSplitPage(pageInfo);//这个pageInfo是父类的
		//然后别忘了把pageInfo给到显示数据的页面
		this.requset.setAttribute("pageBean", pageInfo.getPageBean());
		return "questions";
	}
	
	public String addques(){
		taotis=taotiService.findAll();
		return "addques";
	}
	
	public String doadd(){
		questionservice.saveQuestion(model);
		
		return "doadd";
	}
	
	public String edit(){
		taotis=taotiService.findAll();
		this.model=questionservice.getEntity(this.model.getId());
		return "edit";
	}
	
	public String doedit(){
		questionservice.saveOrUpdateQuestion(model);
		
		return "doedit";
	}
	
	public String del(){
		questionservice.delteEntity(model);
		return "del";
	}
	
}
