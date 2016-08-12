package com.examonline.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.examonline.entity.Subject;
import com.examonline.service.SubjectService;

@Controller
@Scope("prototype")
public class SubjectAction extends BaseAction<Subject>{
	private static final long serialVersionUID = 1L;
	
	@Resource
	private SubjectService subjectService;
	private List<Subject> subjects;
	private List<Subject> getSubjects(){
		return subjects;
	}
	public String index(){
		this.subjects=this.subjectService.findAll();
		return "index";
	}
	public String add(){
		return "add";
	}
	public 	String doAdd(){
		this.subjectService.saveEntity(model);
		return "redirection";
	}
}
