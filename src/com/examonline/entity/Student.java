package com.examonline.entity;

import java.util.Date;

public class Student extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

	private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String stuNum;
	private String stuName;
	private String stuSex;
	private String secQue;
	private String secAns;
	private String IdCard;
	private String pwd;
	private String procession;
	private Date date = new Date();
	public String getStuNum() {
		return stuNum;
	}
	public void setStuNum(String stuNum) {
		this.stuNum = stuNum;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getStuSex() {
		return stuSex;
	}
	public void setStuSex(String stuSex) {
		this.stuSex = stuSex;
	}
	public String getSecQue() {
		return secQue;
	}
	public void setSecQue(String secQue) {
		this.secQue = secQue;
	}
	public String getSecAns() {
		return secAns;
	}
	public void setSecAns(String secAns) {
		this.secAns = secAns;
	}
	public String getIdCard() {
		return IdCard;
	}
	public void setIdCard(String idCard) {
		IdCard = idCard;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getProcession() {
		return procession;
	}
	public void setProcession(String procession) {
		this.procession = procession;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
