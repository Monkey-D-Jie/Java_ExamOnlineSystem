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
</head>
<script type="text/javascript">
function checkForm(form){
	if(form.name.value==""){
		alert("请输入考生姓名!");form.name.focus();return false;
	}
	if(form.pwd.value==""){
		alert("请输入登录密码!");form.pwd.focus();return false;
	}
	if(form.confimpwd.value==""){
		alert("请确认登录密码!");form.confimpwd.focus();return false;
	}		
	if(form.pwd.value!=form.confimpwd.value){
		alert("您两次输入的登录密码不一致，请重新输入!");form.pwd.focus();return false;
	}
	if(form.question.value==""){
		alert("请输入提示问题!");form.question.focus();return false;
	}
	if(form.answer.value==""){
		alert("请输入问题答案!");form.answer.focus();return false;
	}
	if(form.cardNo.value==""){
		alert("请输入身份证号！");form.cardNo.focus();return false;
	}
	if(form.cardNo.value.length!=18){
		alert("请输入合法的身份证号，必须为18位数！");form.cardNo.focus();return false;
	}
	//判断当前编辑用户操作是否修改了密码

	form.submit();
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
										width="8" height="8"> 当前位置：→ <span class="word_darkGrey">修改个人信息
											&gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif" width="5" height="9">&nbsp;
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
							<s:form action="StudentAction_finished" namespace="/student" method="post" onsubmit="return checkForm(this)">
								
								<s:hidden name="id"/>
								<s:hidden name="stuNum"/>
								<table width="57%" border="0" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
									bordercolorlight="#FFFFFF">
									<tr>
										<td height="30" align="left" style="padding:5px;">考生姓名：</td>
										<td align="left">
											<s:textfield name="stuName" size="20" readonly="true"/>*
										</td>
									</tr>
									<tr>
										<td height="30" align="left" style="padding:5px;">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
										<td align="left">
											<s:password name="pwd" size="20" showPassword="true" />（密码由6到20位的数字或字母组成） *
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">确认密码：</td>
										<td width="84%" align="left">
											<s:password name="pwd1" size="20" showPassword="true" />*
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
											<s:textfield name="secQue" size="40" />（如我的生日） *
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">问题答案：</td>
										<td width="84%" align="left">
											<s:textfield name="secAns" size="40" />（如7月17日）*
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">专&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
										<td width="84%" align="left">
											<s:textfield name="procession" size="40" />
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">身份证号：</td>
										<td width="84%" align="left">
											<s:textfield name="IdCard" size="40" readonly="true"/>*
										</td>
									</tr>
									<tr>
										<td height="65" align="left" style="padding:5px;">&nbsp;</td>
										<td>
											<input type="submit" class="btn_grey" value="保存" />&nbsp; 
											<input type="reset" class="btn_grey" value="取消" /> &nbsp;
											<input type="button" class="btn_grey" value="返回" onclick="history.back(-1)" />
										</td>
									</tr>
									<tr>
										
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
