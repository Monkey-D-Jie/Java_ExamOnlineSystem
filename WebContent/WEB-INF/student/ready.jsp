<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	if (session.getAttribute("student") == null) {
		response.sendRedirect(path + "/index.jsp");
	}
%>
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
									<td width="76%" class="word_grey">&nbsp;<img
										src="${pageContext.request.contextPath }/Images/f_ico.gif" width="8" height="8"> 当前位置：→ <span
										class="word_darkGrey">在线考试 → 准备考试 &gt;&gt;&gt;</span>
									</td>
									<td width="24%" align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif" width="5" height="9"> 
										<a onclick="history.back(-2)">返回首页</a>&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<form action="" method="post">
								<s:hidden name = "taotiId"/>
								<table width="100%" height="265" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="93" colspan="3" align="center" class="word_orange1">&nbsp;</td>
									</tr>
									<tr>
										<td width="12%">&nbsp;</td>
										<td width="77%" align="center" valign="top">准备好了吗？<br>
										<br>考生单击“开始考试”按钮，系统将立即记录本次考试并登记考试成绩！</td>
										<td width="11%">&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center" valign="top">
											<input type="button" class="btn_grey" value="开始考试"
												onclick="window.opener=null;window.close();window.open('${pageContext.request.contextPath }/student/ExamAction_startExam.do?taotiId=<s:property value="taotiId"/>','','');" />
											<input type="button" class="btn_grey" value="返回" onclick="history.back(-1)" />
										</td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table></td>
		</tr>
	</table>
	<%@ include file="copyright.jsp"%>
</body>
</html>
