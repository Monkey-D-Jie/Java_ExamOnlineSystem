package com.examonline.entity;



import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

public class Question   {
	
	private int id;
	private String questionName;
	private String type;
	private String options;
	private String rightAnswer;
	private Date jiondate;
	private String note;
	private Taoti taoti;
	private String[]optionArray=new String[4];
	
	
	@SuppressWarnings("deprecation")
	public Question(){
		SimpleDateFormat format=new SimpleDateFormat("yyyy/MM/dd HH:mm");
		try {
			jiondate=new Date(format.format(new Date()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public String[] getOptionArray() {
		if(options!=null&&!"".equals(options)){
			optionArray=options.split(",");
			for(int index=0;index<optionArray.length;index++){
				optionArray[index]=optionArray[index].replace(" ", "");
			}
			if(optionArray.length<4){
				String []temp=new String[4];
				System.arraycopy(optionArray, 0, temp, 0, optionArray.length);
				optionArray=temp;
			}
		}
		
		return optionArray;
	}

	public void setOptionArray(String[] optionArray) {
		
		this.optionArray = optionArray;
	}



	public Date getJiondate() {
		return jiondate;
	}
	public void setJiondate(Date jiondate) {
		this.jiondate = jiondate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQuestionName() {
		return questionName;
	}
	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getRightAnswer() {
		return rightAnswer;
	}
	public void setRightAnswer(String rightAnswer) {
		this.rightAnswer = rightAnswer;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}

	
	
	
	public Taoti getTaoti() {
		return taoti;
	}



	public void setTaoti(Taoti taoti) {
		this.taoti = taoti;
	}




	/***·ÇÓÀ¾Ã***/
	
	private int taotiId;


	public int getTaotiId() {
		return taotiId;
	}



	public void setTaotiId(int taotiId) {
		this.taotiId = taotiId;
	}



	@Override
	public String toString() {
		return "Question [id=" + id + ", questionName=" + questionName + ", type=" + type + ", options=" + options
				+ ", rightAnswer=" + rightAnswer + ", jiondate=" + jiondate + ", note=" + note + ", taoti=" + taoti
				+ ", optionArray=" + Arrays.toString(optionArray) + ", taotiId=" + taotiId + "]";
	}

	
	
	
	
	
	
	
	
}
