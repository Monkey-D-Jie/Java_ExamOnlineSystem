package com.examonline.entity;

import java.util.Date;

public class Subject extends BaseEntity {
	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private Date joinTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}



}
