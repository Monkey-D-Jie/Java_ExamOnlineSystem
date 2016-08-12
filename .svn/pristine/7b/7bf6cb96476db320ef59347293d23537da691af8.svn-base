<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
	<script type="text/javascript">
		function checkForm(form) {
			if (form.taotiId.value == "") {
				alert("请选择考卷!");
				form.taotiId.focus();
				return false;
			}
		}
	</script>
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
										<img
										src="${pageContext.request.contextPath }/Images/f_ico.gif" width="8" height="8"> 当前位置：→ <span
										class="word_darkGrey">在线考试 → 选择考试课程 &gt;&gt;&gt;</span>
									</td>
									<td width="24%" align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif"
										width="5" height="9"> 
									 	<a onclick="history.back(-2)">返回首页</a>&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<s:form namespace="/student" action="ExamAction_ready"  method="post" onsubmit="return checkForm(this)">
								<table width="100%" height="262" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="90" colspan="3" align="center"
											class="word_orange1">&nbsp;</td>
									</tr>
									<tr>
										<td width="12%">&nbsp;</td>
										<td width="77%" align="center" valign="top">请选择考试课程
										<s:select list="taotis" name="taotiId" listKey="id" listValue="name" headerKey="" headerValue="请选择考试题目"></s:select>
										</td>
										<td width="11%">&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center" valign="top">
											<input class="btn_grey" type="submit" value="确定" /> 
											<input type="button" class="btn_grey" value="返回"
												onclick="history.back(-1)" />
										</td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</s:form>
						</td>
					</tr>
				</table></td>
		</tr>
	</table>
	<%@ include file="copyright.jsp"%>
</body>
</html>
