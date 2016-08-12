package com.examonline.entity;

import java.util.Date;

public class Answer extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	private int id;//主键，策略自增
	private String answer;//用户提交的答案内容
	private boolean isTrue;//判断提交的答案是否是正确的
	private String type;//试题的类型，单选题或者多选题
	private Date examdate;
	
	//冗余字段----》非级联关系的查询用
	private String stuNum;//考试学生的学号
	private int LessonId;//选择的考试课程
	private int taotiId;//对应课程下的某一套试卷：比如1单元测试
	private int questionId;//试卷中题目的id
	
	
	public Date getExamdate() {
		return examdate;
	}
	public void setExamdate(Date examdate) {
		this.examdate = examdate;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public boolean getIsTrue() {
		return isTrue;
	}
	public void setIsTrue(boolean isTrue) {
		this.isTrue = isTrue;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStuNum() {
		return stuNum;
	}
	public void setStuNum(String stuNum) {
		this.stuNum = stuNum;
	}
	public int getLessonId() {
		return LessonId;
	}
	public void setLessonId(int lessonId) {
		LessonId = lessonId;
	}
	public int getTaotiId() {
		return taotiId;
	}
	public void setTaotiId(int taotiId) {
		this.taotiId = taotiId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	//再来个TOString的方法，便于调试时的检测
	@Override
	public String toString() {
		return "Answer [id=" + id + ", answer=" + answer + ", isTrue=" + isTrue + ", type=" + type + ", examdate="
				+ examdate + ", stuNum=" + stuNum + ", LessonId=" + LessonId + ", taotiId=" + taotiId + ", questionId="
				+ questionId + "]";
	}
	
	
	
}
