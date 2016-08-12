<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<title>网络在线考试——后台管理</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
	<script type="text/javascript">
		function checkForm(form) {
			if (form.key.value == "") {
				alert("请输入查询条件!");
				form.key.focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tr>
			<td width="176" align="center" valign="top" bgcolor="#FFFFFF">
				<%@ include file="left.jsp"%>
			</td>
			<td width="602" valign="top" bgcolor="#FFFFFF"><table
					width="99%" height="487" border="0" cellpadding="0" cellspacing="0"
					align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="78%" class="word_grey">&nbsp;当前位置：<span
										class="word_darkGrey">考生成绩查询 &gt;&gt;&gt;</span>
									</td>
									<td align="right"><img src="${pageContext.request.contextPath }/Images/m_ico1.gif"
										width="5" height="9">&nbsp;当前管理员：${user.realName }&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<s:form namespace="/student" action="StudentAction_search" method="post" onsubmit="return checkForm(this)">
								<table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td align="left" valign="middle">&nbsp;查询条件： 
											<select name="queryIf">
													<option value="stuNo">准考证号</option>
													<option value="subjectName">考试课程</option>
											</select> &nbsp;关键字：
											<input name="key" />&nbsp;&nbsp; 
											<input type="submit" class="btn_grey" value="查询" />
										</td>
									</tr>
								</table>
							</s:form>

							<table width="98%" border="1" cellpadding="0" cellspacing="0"
								bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
								bordercolorlight="#67A8DB">
								<tr align="center">
									<td width="21%" height="27" bgcolor="#B2D6F1">准考证号</td>
									<td width="26%" bgcolor="#B2D6F1">所属课程</td>
									<td width="22%" bgcolor="#B2D6F1">考试时间</td>
									<td width="11%" bgcolor="#B2D6F1">单选题分数</td>
									<td width="11%" bgcolor="#B2D6F1">多选题分数</td>
									<td width="9%" bgcolor="#B2D6F1">合计分数</td>
								</tr>
								<s:iterator value="scores">
									<tr>
										<td><s:property value="stuNum"/></td>
										<td><s:property value="LessonID"/></td>
										<td>
											<s:date name="Test_Date" format="yyyy/MM/dd HH:mm:ss"/>
										</td>
										<td><s:property value="SingleScore"/></td>
										<td><s:property value="MultipleScore"/></td>
										<td><s:property value="TotalScore"/></td>
									</tr>
								</s:iterator>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<%@ include file="copyright.jsp"%>
</body>
</html>
