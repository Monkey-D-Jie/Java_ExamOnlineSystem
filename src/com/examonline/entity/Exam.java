package com.examonline.entity;

public class Exam extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

	private String lessonName;

	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

}
