<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>添加管理员信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/function.js"></script>
</head>
<script type="text/javascript">
	function check(form) {
		if (form.userName.value == "") {
			alert("请输入管理员名称!");
			form.userName.focus();
			return;
		}
		if (form.password.value == "") {
			alert("请输入管理员密码!");
			form.password.focus();
			return;
		}
		if (form.confimpassword.value == "") {
			alert("请确认管理员密码!");
			form.confimpassword.focus();
			return;
		}
		if (form.confimpassword.value != form.password.value) {
			alert("您两次输入的管理员密码不一致，请重新输入!");
			form.confimpassword.focus();
			return;
		}
		//判断当前编辑用户操作是否修改了密码
	   
		form.submit();
		alert("点击确定刷新列表页面！"); 	
		//关闭窗体	 
		refreshOpener();
	}
</script>
<body>
	<table width="292" height="190" border="0" cellpadding="0"
		cellspacing="0" background="${pageContext.request.contextPath }/Images/subBG.jpg">
		<tr>
			<td valign="top">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="12%" height="47">&nbsp;</td>
						<td width="85%" valign="bottom">
							<table width="86%" height="31" border="0" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td class="word_white">修改管理员信息</td>
								</tr>
							</table>
						</td>
						<td width="3%">&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>
							<table width="100%" height="116" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="116" align="center" valign="top">
										<s:form action="UserAction_doedit" namespace="/manger" method="post" id="managerForm" >
											<s:hidden name="id"></s:hidden>
											<table height="116" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width="81" height="30" align="center">登录&nbsp;账户：</td>
													<td width="167">
														<s:textfield name="userName" readonly="true"/>
													</td>
												</tr>
												<tr>
													<td width="81" height="30" align="center">管理员名称：</td>
													<td width="167">
														<s:textfield name="realName" />
													</td>
												</tr>
												<tr>
													<td height="28" align="center">管理员密码：</td>
													<td>
														<s:password name="password" showPassword="true"/>
													</td>
												</tr>
												<tr>
													<td height="28" align="center">确认 &nbsp;密码：</td>
													<td>
														<s:password name="confimpassword" showPassword="true"/>
													</td>
												</tr>
												<tr>
													<td height="30" align="center">&nbsp;</td>
													<td>
														<input type="button" class="btn_grey" value="保存"
															onclick="check(managerForm)" /> &nbsp; 
														<input type="button" class="btn_grey" value="关闭"
															onclick="window.close();" />
													</td>
												</tr>
											</table>
										</s:form>
									</td>
								</tr>
							</table>
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
