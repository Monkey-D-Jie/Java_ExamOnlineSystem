package com.examonline.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.examonline.entity.Answer;
import com.examonline.entity.Question;
import com.examonline.entity.Score;
import com.examonline.entity.Student;
import com.examonline.entity.Taoti;
import com.examonline.service.AnswerService;
import com.examonline.service.QuestionService;
import com.examonline.service.TaotiService;

@Controller
@Scope("prototype")
public class ExamAction extends BaseAction<Question> implements SessionAware,ParameterAware{
	//ParameterAware----》用于接收来自jsp页面中的所有可行参数
	private static final long serialVersionUID = 1L;

	public String examRule(){
		return "examRule";
	}
	
	public String ready(){
		return "ready";
	}

	
	@Resource
	private TaotiService taotiservice;
	private List<Taoti> taotis;
	public List<Taoti> getTaotis(){
		return taotis;
	}
	public String selectLesson(){
		this.taotis = this.taotiservice.findAll();
		return "selectLesson";
	}
	
	/**
	 * 让时间动起来
	 * ------Time-------Go-----
	 */
	public void showStartTime(){
		try {
			String startTime = (String) this.session.get("startTime");
			long time = Long.parseLong(startTime);
			Date date = new Date(time);
			SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
			String str = format.format(date);
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter();
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.flush();
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} 
	}
	
	public void showRemainTime(){
		try {
			String startTime = session.get("startTime").toString();
			long a = Long.parseLong(startTime);
			Date start = new Date(a);
			Date current = new Date();
			long yyTime = current.getTime()-start.getTime();
			Date total = new Date(20*60*1000);
			long remain = total.getTime()-yyTime-8*3600*1000;
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer = response.getWriter();
			SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
			writer.write(format.format(new Date(remain)));
			writer.flush();
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} 
	}
	//-----Time-------Go-----
	
	
	
	
	/**
	 * 开始考试对应的执行逻辑
	 * ------Exam-------Start--------
	 */
	@Resource
	private QuestionService questionservice;
	
	private List<Question> singleQuestions;//单选题
	private List<Question> multipleQuestions;//多选题
	//在方法examStart中找到后，再将这些题（由Spring根据它俩的get请求注入）给到这里的单选题组，多选题组
	//然后根据传入至这里的taotiID在question中找到题目
	//这里该怎样来获得传递过来的taotiId值喃？？用注入的方式
	//目前就以question类的方式来获得---->直接这样写的话，taotiId会注入到question中的指定字段吗？
	//我这里是以“能注入到”的前提来继续的-----》请注意：这里拦截到的model对象就是Question诶
	
	public List<Question> getSingleQuestions() {
		return singleQuestions;
	}
	public List<Question> getMultipleQuestions() {
		return multipleQuestions;
	}

	//设置单选题，多选题的分数----->以这种静态方法的形式，能在jsp页面端用
	//<s:property value="getQueScore(40,singleQuestions)的格式调用到这里的结果吗？
	public int getQueScore(int total,List<Question> question){
		int itemscore=0;//设置每个题目的分数
		if(!question.isEmpty()&&question.size()>0){
			 itemscore=total/question.size();
		}
		return itemscore;
	}
	public String startExam(){
		//接下来就是要展示试卷（试题：包括单选，多选，每题的分数，以及总分等等）和倒计时到指定的页面中了
		//开始考试之前需要由考生选择的taotiID来找到对应的套题中的题目，就包括多选和单选题
		String hql="from Question where taotiId=? and type=?";
		singleQuestions=this.questionservice.findEntiyByHql(hql, this.model.getTaotiId(),"单选题");
		System.out.println(singleQuestions.toString());
		multipleQuestions=this.questionservice.findEntiyByHql(hql, this.model.getTaotiId(),"多选题");
		System.out.println(multipleQuestions.toString());
		//记录考试开始的时间
		this.session.put("startTime",new Date().getTime()+"");
		/*
		 * 如果上述操作成功的话，那么就能够在试卷显示的页面由
			<s:iterator var="qs" id="questions" value="singleQuestion" status="st">
			等标签获得题目
		 */
		return "startExam";//这个逻辑视图名指定是跳转到了startExam的界面中，所以要提前吧数据处理好，然后注入改界
		//目前的一个小问题就是：界面上的提交按钮没能显示出来，考虑到时浏览器不兼容的问题
	}
	//* ------Exam-------Start--------

	
	
	/**
	 * 考试结束之后，提交按钮触发的执行逻辑
	 * 涵盖的过程：将答案保存到数据库的Aswer表中---》计算成绩----》将成绩及成绩表中关键字段进行一个传递
	 * ------Exam---------End----------
	 */
	@Resource
	private AnswerService answerservice;//操作答案入库的工具
	//这里涉及到要提交参数至本页面，提交的参数的类型就是：Map<String(单选或者多选)，String[](用户提交的答案数组，单选或者多选)>
	
	//这里之前的错误：用的@Resource注解，向Spring说明要注入这类对象，但是Spring所管理的是没有这类对象的（在考生提交试卷之前）
	//提交试卷之后由ParameterAware拦截jsp页面的参数传入
	private Map<String, String[]> questions;//用于存放考生提交的答案的参数
	public String endExam(){
		/**
		 * 思路：
		 * 1.获取到对应的冗余字段：包括考生学号（就是准考证号），考试课程ID（课程名），考试所选的taotiID，该套题中questionID（两部分：题类型+题号）
		 *对这些数据要进行一个预处理的操作-----》这些字段都是必要的，后续的操作中只是用到了而已，先给到数据库中的，可以避免后续
		 *处理逻辑中出现不必要的脏数据
		 */
		String stuNum=((Student)this.session.get("student")).getStuNum();//获得session中存入的考生的准考证号（学号）
		Score score=new Score();
		score.setStuNum(stuNum);
		//获取到套题ID
		score.setPaperID(this.model.getTaotiId());
		//获得LessonID，课程ID
		//根据套题ID可以在套题中找到对应的lessonID
		Taoti taoti = this.taotiservice.getEntity(this.model.getTaotiId());
		//这里出现的情况是：找到了数据库中对应的taoti了，但是它的lessonID为0---》数据库里其LessonId值为1
		System.out.println(taoti.toString());
		score.setLessonID(taoti.getLesson().getId());
		//这里注意了：数据库中taotis的lessonID字段只是作为一个关联外部表lesson的非持久性数据字段（就是无实际的值，只起关联的作用）
		//所以这里要要获得叨真正的lessonID值，就需要到该lessonID指定到的lesson中去获取到真正的id
		score.setTest_Date(new Date());//设置交卷时间
		
		/*第2.步:将答案的数据给到对应的数据库中
		 * 计算出成绩后再给到数据库中
		 */
		this.answerservice.saveAnswers(handleAnswer(),score);
		
		return "end";
	}
	
	//处理答案
	private List<Answer> handleAnswer(){
		List<Answer> results=new ArrayList<Answer>();
		Answer answer=null;//暂时设定一个存放答案的Answer对象
		//获取到传递至本页面的答案参数
		for(Entry<String, String[]> entry:questions.entrySet()){
			String key=entry.getKey();//考生提交参数的名称：qd+id（单选问题+题目编标） qm+id（多选问题+对应的题目编号）
			String[] value=entry.getValue();//考生提交的对应题目的答案---》这里暂定其提交的形式为：字符数组
			answer=new Answer();
			//接下来是要设置答案---》给到存储答案的数据库中：分为单选题和多选题
			//这里考虑到提交至本方法的参数为上述的参数类型，taotiID或其他ID是以hidden隐藏元素的形式的一并提交
			//所以要考虑到再不是taotiID类型的参数的情况下来设置问题的类型
			String temp="";
			if(!key.contains("taoti")){//这里先考虑到只有taotiID作为隐藏元素的情况
				if(value.length>0&&value!=null){
					for(int i=0;i<value.length;i++){
						temp=temp+value[i]+",";
					}
				}
//				System.out.println(temp);
				temp=temp.substring(0, temp.length()-1);//这里需要看看怎样来把生成字符串儿的最后一个逗号给去掉！--->已解决
					if(key.contains("qd")){//question单《好日怪的取法》，表单选
						answer.setType("单选题");	
						answer.setAnswer(temp);//字符串数组变字符串
						
					}
					if(key.contains("qm")){//question multiple--->多选题（中英结合命名法就是溜啊）
						answer.setType("多选题");
						answer.setAnswer(temp);
					}
			
			//接下来判断答案的正确性
			/*
			 * 说明：数据库中存储答案的方法为存放正确答案对应的下标，不过是以一个字符串来存的
			 * 思路：在该前提下，就可以在数据库中先去找到对应题目的正确答案，然后将答案进行分割。
			 * 在由分割后的正确答案数组和这里的提交得到的数组进行比对，然后来判断正误
			 */
			int questionID=Integer.parseInt(key.substring(2));//因为key值得类型为qd5或者qm3的形式
			answer.setQuestionId(questionID);
			boolean isTrueFlag=isTrueJudge(questionID,value);
			answer.setIsTrue(isTrueFlag);//这里的答案正确值好像没放对哦------》
			results.add(answer);
			answer=null;
			}
		}
		return results;
	}
	
	
	public boolean isTrueJudge(int id, String[] value) {
		//设定一个用于返回的标记
		boolean flag=true;
		//先要根据ID找到对应的题目
		Question ques=questionservice.getEntity(id);
		//得到其答案
		String rightanswer=ques.getRightAnswer();
		if(rightanswer!=null){
			if(value.length>0&&value!=null){//说明传入的提交答案是有效的
				if(rightanswer.contains(",")){
					String[] rightanswerArray=rightanswer.split(",");
					if(value.length!=rightanswerArray.length){
						flag=false;
					}
				}
				
				for(String str:value){
					if(!rightanswer.contains(str)){
						flag=false;
						break;
					}
				}
			}
		}
	return flag;
	}
	//* ------Exam---------End----------
	
	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO 自动生成的方法存根
		this.session = session;
	}
	
	
	//接收页面的参数----》获取到所选的题目些：questions
	@Override
	public void setParameters(Map<String, String[]> questions) {
		this.questions=questions;
		
	}
}
