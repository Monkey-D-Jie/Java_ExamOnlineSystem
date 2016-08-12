<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>网络在线考试</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
function checkForm(form){
	if(form.stuName.value==""){
		alert("请输入考生姓名!");form.stuName.focus();return false;
	}
	if(form.pwd.value==""){
		alert("请输入登录密码!");form.pwd.focus();return false;
	}
	if(form.pwd.value.length<6 || form.pwd.value.length>20){
		alert("您输入的密码不合法，密码必须大于6位，并且小于等20位!");form.pwd.focus();return false;
	}
	if(form.confimpwd.value==""){
		alert("请确认登录密码!");form.confimpwd.focus();return false;
	}		
	if(form.pwd.value!=form.confimpwd.value){
		alert("您两次输入的登录密码不一致，请重新输入!");form.pwd.focus();return false;
	}
	if(form.secQue.value==""){
		alert("请输入提示问题!");form.secQue.focus();return false;
	}
	if(form.secAns.value==""){
		alert("请输入问题答案!");form.secAns.focus();return false;
	}
	if(form.IdCard.value==""){
		alert("请输入身份证号！");form.IdCard.focus();return false;
	}
	if(form.IdCard.value.length!=18){
		alert("请输入合法的身份证号，必须为18位数！");form.IdCard.focus();return false;
	}
}
</script>
<body>
	<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="131" background="${pageContext.request.contextPath }/Images/top_bg.jpg">&nbsp;</td>
		</tr>
	</table>
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td valign="top" bgcolor="#FFFFFF"><table width="774"
					height="487" border="0" cellpadding="0" cellspacing="0"
					align="center">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="word_grey">&nbsp;
										<img src="${pageContext.request.contextPath }/Images/f_ico.gif"
										width="8" height="8"> 当前位置：→ <span class="word_darkGrey">考生注册
											&gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif" width="5" height="9">&nbsp;
										<a href="${pageContext.request.contextPath }/index.jsp">返回首页</a>&nbsp;
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
							<s:form action="StudentAction_stuAdd" namespace="/student" method="post" onsubmit="return checkForm(this)">
								<table width="57%" border="0" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
									bordercolorlight="#FFFFFF">
									<tr>
										<td height="30" align="left" style="padding:5px;">考生姓名：</td>
										<td align="left">
											<input name="stuName" type="text" size="20" />*
										</td>
									</tr>
									<tr>
										<td height="30" align="left" style="padding:5px;">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
										<td align="left">
											<input name="pwd" size="20" type="password" />（密码由6到20位的数字或字母组成） *
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">确认密码：</td>
										<td width="84%" align="left">
											<input id="confimpwd" size="20" type="password" />*
										</td>
									<tr>
									<tr>
										<td height="30" align="left" style="padding:5px;">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
										<td align="left">
											<select name="stuSex">
												<option value="男">男 </option>
												<option value="女">女 </option>
											</select>
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">提示问题：</td>
										<td width="84%" align="left">
											<input type="text" name="secQue" size="40" />（如我的生日） *
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">问题答案：</td>
										<td width="84%" align="left">
											<input type="text" name="secAns"size="40" />（如7月17日）*
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">专&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
										<td width="84%" align="left">
											<input type="text" name="procession" size="40" />
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">身份证号：</td>
										<td width="84%" align="left">
											<input name="IdCard" size="40" type="text"/>*
										</td>
									</tr>
									<tr align="center">
										<td width="100%" colspan="2">
											<s:actionerror/>
										</td>
									</tr>
									<tr>
										<td height="65" align="left" style="padding:5px;">&nbsp;</td>
										<td>
											<input type="submit" class="btn_grey" value="保存" />&nbsp; 
											<input type="reset" class="btn_grey" value="取消" /> &nbsp;
											<input type="button" class="btn_grey" value="返回" onclick="history.back()"/></td>
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
