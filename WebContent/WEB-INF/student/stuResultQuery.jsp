<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>网络在线考试</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
</head>
<body>

	<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="131" background="${pageContext.request.contextPath }/Images/top_bg.jpg">&nbsp;</td>
		</tr>
	</table>
	<table width="778" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tr>
			<td valign="top" bgcolor="#FFFFFF"><table width="774"
					height="487" border="0" cellpadding="0" cellspacing="0"
					align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="76%" class="word_grey">&nbsp;
										<img src="${pageContext.request.contextPath }/Images/f_ico.gif" width="8" height="8"> 当前位置：→ <span
										class="word_darkGrey">考生成绩查询 &gt;&gt;&gt;</span>
									</td>
									<td width="24%" align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif" width="5" height="9">
										<a onclick="history.back(-1)">返回首页</a>&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="84%">&nbsp;</td>
								</tr>
							</table>
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
											<td align="center"><s:property value="stuNum"/></td>
											<td align="center"><s:property value="LessonName"/></td>
											<td align="center">
												<s:date name="Test_Date" format="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td align="center"><s:property value="SingleScore"/></td>
											<td align="center"><s:property value="MultipleScore"/></td>
											<td align="center"><s:property value="TotalScore"/></td>
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
