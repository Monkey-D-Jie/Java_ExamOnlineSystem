package com.examonline.entity;

import java.util.Date;

public class Lesson extends BaseEntity{

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String lessonName;
	private Date date = new Date();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLessonName() {
		return lessonName;
	}
	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
