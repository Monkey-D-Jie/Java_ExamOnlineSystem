<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%><
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
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td valign="top" bgcolor="#FFFFFF"><table width="774"
					height="474" border="0" cellpadding="0" cellspacing="0"
					align="center">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="word_grey">&nbsp;
										<img src="${pageContext.request.contextPath }/Images/f_ico.gif"
										width="8" height="8"> 当前位置：→ <span class="word_darkGrey">找回密码
											&gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif" width="5"
										height="9">&nbsp;
										<a href="${pageContext.request.contextPath }/index.jsp">返回首页</a>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="257" align="center" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="84%">&nbsp;</td>
								</tr>
							</table>
							<table width="57%" height="69" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="17%">
										<img src="${pageContext.request.contextPath }/Images/step4.jpg" width="73"
										height="30">
									</td>
									<td width="83%" class="word_orange1">成功找回密码</td>
								</tr>
							</table>
							<table width="57%" border="0" cellpadding="0" cellspacing="0"
								bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
								bordercolorlight="#FFFFFF">
								<tr align="center">
									<td width="22%" height="30" align="left" style="padding:5px;">准考证号：</td>
									<td width="78%" align="left">
										<s:property value="stuNum"/>
										<span class="word_orange1"> （只读）</span>
									</td>
								</tr>
								<tr>
									<td height="65" align="left" style="padding:5px;">&nbsp;</td>
									<td>&nbsp;
										<input type="button" value="返回" class="btn_grey"
										onClick="window.location.href='${pageContext.request.contextPath }/index.jsp'" />
									</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="141" align="right" valign="top"><img
							src="${pageContext.request.contextPath }/Images/seedPwd.gif" width="139" height="153">
						</td>
					</tr>
				</table></td>
		</tr>
	</table>
	<%@ include file="copyright.jsp"%>
</body>
</html>
