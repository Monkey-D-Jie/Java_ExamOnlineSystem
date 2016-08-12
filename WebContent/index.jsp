<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
	<title>网络在线考试</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
	<script type="text/javascript">
		function check(form){
			if (form.stuNum.value==""){
				alert("请输入准考证号!");
				form.stuNum.focus();
				return false;
			}
			if (form.pwd.value==""){
				alert("请输入密码!");
				form.pwd.focus();
				return false;
			}
		}
		
		</script>
</head>
<body>
	<table width="778" height="266" border="0" align="center"
		cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath }/Images/login_top.jpg">
		<tr>
			<td width="118" colspan="2">&nbsp;</td>
		</tr>
	</table>
	<table width="778" height="158" border="0" align="center"
		cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath }/Images/login_mid.jpg">
		<form action="${pageContext.request.contextPath }/student/StudentAction_main.do" method="post"  onsubmit="return check(this)">
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
						<tr>
							<td>&nbsp;</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td width="35%" height="30">&nbsp;</td>
							<td width="9%" height="30">准考证号：</td>
							<td width="27%">
								<input name="stuNum" class="logininput" size="25"/></td>
							<td width="29%">&nbsp;</td>
						</tr>
						<tr>
							<td height="30">&nbsp;</td>
							<td height="30">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
							<td>
								<input name="pwd" type="password" class="logininput" size="25"/>
							</td>
							<td>&nbsp;</td>
						</tr>
						<font color="red"><s:actionerror/></font>	
						<tr>
							<td height="31">&nbsp;</td>
							<td height="31" colspan="2" align="left">
								<input class="btn_grey" value="登录" type="submit"/> &nbsp;
								<input value="重置" class="btn_grey" type="reset"/> &nbsp;
								<input type="button" class="btn_grey"  value="注册" onclick="window.location.href='${pageContext.request.contextPath }/student/StudentAction_register.do'"/> &nbsp; 
								<input type="button" class="btn_grey" value="找回密码" onclick="location.href='student/StudentAction_step1.do'" />&nbsp;
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td height="40">&nbsp;</td>
							<td height="31" colspan="2" align="right" valign="bottom">
							<a href="<%=request.getContextPath() %>/login.jsp" class="word_orange">进入后台</a>
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
	<table width="778" height="196" border="0" align="center"
		cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath }/Images/login_top.jpg">
		<tr>
			<td height="182" background="${pageContext.request.contextPath }/Images/login_bottom.jpg">&nbsp;</td>
		</tr>
	</table>
</body>
</html>
