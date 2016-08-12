package com.examonline.entity;

import java.io.Serializable;
import java.util.Date;

public class Score implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//这是学生的一个实体类，别忘了为其加上hbm文件
	/*
	 * 1.设置属性
	 * 成绩表
		id、课程号、试卷的id、学生的学号、单选分、多选分、总分、考试时间
	 */
	private int id;//主键
	private String LessonName;//课程名
	
	private float SingleScore;
	private float MultipleScore;
	private float TotalScore;
	private Date Test_Date=new Date();
	
	//一些关键的ID，冗余字段
	private String stuNum;
	private int PaperID;//试卷的ID，说明是哪一门课程下的哪张试卷
	private int LessonID;//课程号----》由它来找到课程名
	/**
	 *说明：成绩表中的数据要在提交试卷的事件触发后，才获得其相应的值
	 *这里的paperID和lessonID分别由别的action类或者jsp界面传递值
	 *前者是说明选择的某一课程下的试卷ID(一门课可能有不同的试卷类型)
	 *后者是说明课程的名字
	 *这些值都是在 在线考试----》交卷 的流程中被存放下来，当提交事件被触发后就把这些数据给到该表中
	 *以完成对数据的存储
	 */
	
	
	
	//方便打印输出，以查看信息
	@Override
	public String toString() {
		return "Score [id=" + id + ", LessonNmae=" + LessonName + ", stuNum=" + stuNum + ", SingleScore=" + SingleScore
				+ ", MultipleScore=" + MultipleScore + ", TotalScore=" + TotalScore + ", Test_Date=" + Test_Date
				+ ", PaperID=" + PaperID + ", LessonID=" + LessonID + "]";
	}
	//2.构造其hbm映射文件
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLessonName() {
		return LessonName;
	}
	public void setLessonName(String lessonName) {
		LessonName = lessonName;
	}
	public float getSingleScore() {
		return SingleScore;
	}
	public void setSingleScore(float singleScore) {
		SingleScore = singleScore;
	}
	public float getMultipleScore() {
		return MultipleScore;
	}
	public void setMultipleScore(float multipleScore) {
		MultipleScore = multipleScore;
	}
	public float getTotalScore() {
		return this.SingleScore+this.MultipleScore;
	}
	public void setTotalScore(float totalScore) {
		TotalScore = totalScore;
	}
	public Date getTest_Date() {
		return Test_Date;
	}
	public void setTest_Date(Date test_Date) {
		Test_Date = test_Date;
	}
	public String getStuNum() {
		return stuNum;
	}
	public void setStuNum(String stuNum) {
		this.stuNum = stuNum;
	}
	public int getPaperID() {
		return PaperID;
	}
	public void setPaperID(int paperID) {
		PaperID = paperID;
	}
	public int getLessonID() {
		return LessonID;
	}
	public void setLessonID(int lessonID) {
		LessonID = lessonID;
	}

}
