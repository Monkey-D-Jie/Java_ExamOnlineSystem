<%@page import="com.examonline.util.PageBean"%>
<%@page import="com.examonline.util.PageInfo"%>
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<html>
<head>
	<title>网络在线考试——后台管理</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/common.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/ajaxRequest.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/page.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/ajax.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/function.js" charset="gb2312"></script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tr>
			<td width="176" align="center" valign="top" bgcolor="#FFFFFF">
				<%@ include file="left.jsp"%>
			</td>
			<td width="602" valign="top" bgcolor="#FFFFFF">
				<table width="99%" height="487" border="0" cellpadding="0" cellspacing="0" align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="78%" class="word_grey">&nbsp;当前位置：<span
										class="word_darkGrey">课程信息管理 &gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif"width="5" height="9">
										&nbsp;当前管理员：${user.realName }&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<table width="96%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="90%" height="27" align="right">
										<img src="${pageContext.request.contextPath }/Images/add.gif" width="19" height="18">&nbsp;
									</td>
									<td width="10%">
										<a href="#" onclick="window.open('${pageContext.request.contextPath }/manger/LessonAction_lessonAdd.do', '', 'height=200,width=300' )">添加课程</a>
									</td>
								</tr>
								
							</table>
							<s:form action="LessonAction_doDel" namespace="/manger" method="post" id="lessonForm">
								<s:hidden name="id"/>
								<table width="96%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
									bordercolorlight="#67A8DB">
									<tr align="center" bgcolor="#A8D8FC">
										<td width="11%" height="26" bgcolor="#B2D6F1" align="center">ID</td>
										<td width="54%" bgcolor="#B2D6F1" align="center">课程名称</td>
										<td width="27%" bgcolor="#B2D6F1" align="center">加入时间</td>
										<td width="8%" bgcolor="#B2D6F1" align="center">选项</td>
									</tr>
									<s:iterator value = "lessons">
										<tr>
											<td align="center"><s:property value = "id"/>
											<td align="center"><s:property value = "lessonName"/>
											<td align="center"><s:date name="date" format="yyyy-MM-dd HH:mm:ss"/>
											<td align="center">
												<input type="checkbox" id = "delIdArray" value="<s:property value = "id"/>"/> 
											</td>
										</tr>
									</s:iterator>
								</table>
								<table width="94%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="60%" height="24">&nbsp;</td>
										<td width="40%" align="right">
											<input name="checkbox"
											type="checkbox" class="noborder"
											onClick="CheckAll(lessonForm.delIdArray,lessonForm.checkbox)">
											[全选/反选] 
											[<a style="color:red;cursor:hand;"
												onClick="checkdel(lessonForm.delIdArray,lessonForm)">删除</a>]
											<div id="ch">
												<input id="delIdArray" type="checkbox" class="noborder" value="0">
											</div>
										</td>
										<!--层ch用于放置隐藏的checkbox控件，因为当表单中只是一个checkbox控件时，应用javascript获得其length属性值为undefine-->
										<script language="javascript">
											ch.style.display = "none";
										</script>
									</tr>
								</table>
								<table>
									<%	
										 PageBean pageBean=(PageBean)request.getAttribute("pageBean");
									%>
									<tr>
										 <td width="17%" align="left">总记录数：<%=pageBean.getTotalResult() %>条</td> 
										 <td width="2%" align="right"></td>      
							             <%if(pageBean.getFirstPage()){ %>           
								             <td width="8%" align="center">首页&nbsp;&nbsp;|</td>
								             <td width="12%" align="center">上一页&nbsp;&nbsp;&nbsp;|</td>
							             <%}else{ %>
								             <td width="8%" align="center"><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/LessonAction_lesson.do','start','lessonForm')">首页&nbsp;&nbsp;|</a></td>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/LessonAction_lesson.do','prev','lessonForm')">上一页&nbsp;&nbsp;&nbsp;|</a></td>
							             <%} %>
							             <%if(pageBean.getLastPage()){ %>
											 <td width="12%" align="center">下一页&nbsp;&nbsp;&nbsp;|</td>
								             <td width="8%" align="center">末页</td>
							             <%}else{ %>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/LessonAction_lesson.do','next','lessonForm')">下一页&nbsp;&nbsp;&nbsp;|</a></td>
								             <td width="8%" align="center"><u><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/LessonAction_lesson.do','end','lessonForm')">末页</a></td>
							             <%} %>
							             <td width="8%" align="center">第<%=pageBean.getPageNo()%>页</td>
							             <td width="8%" align="center">共<%=pageBean.getSumPage() %>页</td>
							             <td width="20%" align="right">至第<input size="1" type="text" name="goPage" >页
							             <a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/LessonAction_lesson.do','go','lessonForm')">确定</a></td>
							             
							             <td><input type="hidden" name="pageNO" value="<%=pageBean.getPageNo() %>" ></td> 
							             <td><input type="hidden" name="prevpageNO" value="<%=pageBean.getPageNo()-1 %>"></td>
							             <td><input type="hidden" name="nextpageNO" value="<%=pageBean.getPageNo()+1 %>"></td>
							             <td><input type="hidden" name="sumPage" value="<%=pageBean.getSumPage() %>" ></td>
							             <td><input type="hidden" name="pageSize" value=" " ></td> 
									</tr>
								</table>
							</s:form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<%@ include file="copyright.jsp"%>
</body>
</html>
