package com.examonline.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.examonline.entity.Answer;

@Controller
@Scope("prototype")
public class AnswerAction extends BaseAction<Answer> {
	
	private static final long serialVersionUID = 1L;
	

}
