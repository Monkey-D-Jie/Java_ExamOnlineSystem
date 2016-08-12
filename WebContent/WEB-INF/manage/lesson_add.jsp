<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<head>
<title>添加课程</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/function.js"></script>
</head>
<script type="text/javascript">
	function check(form) {
		if (form.lessonName.value == "") {
			alert("请输入课程名称!");
			form.lessonName.focus();
			return;
		}
		form.submit();
		alert("点击确定刷新列表页面！"); 	
		//关闭窗体	 
		refreshOpener();
	}
</script>
<body>
	<table width="292" height="200" border="0" cellpadding="0"
		cellspacing="0" background="${pageContext.request.contextPath }/Images/subBG.jpg">
		<tr>
			<td valign="top"><table width="100%" height="175" border="0"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="12%" height="47">&nbsp;</td>
						<td width="85%" valign="bottom"><table width="86%"
								height="31" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td class="word_white">添加课程</td>
								</tr>
							</table>
						</td>
						<td width="3%">&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><table width="100%" height="106" border="0"
								cellpadding="0" cellspacing="0">
								<tr>
									<td height="106" align="center" valign="middle">
										<form action="${pageContext.request.contextPath }/manger/LessonAction_doAdd.do" method="post" id="lessonForm">
											<table height="77" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width="67" height="30" align="center">课程名称：</td>
													<td width="181">
														<input name="lessonName" type="text" size="25">
													</td>
												</tr>
												<tr>
													<td height="47" align="center">&nbsp;</td>
													<td>
													<input type="button"class="btn_grey" value="保存" onclick="check(lessonForm)" /> &nbsp; 
													<input type="button" class="btn_grey" value="关闭" onclick="window.close();" />&nbsp; 
													</td>
												</tr>
											</table>
										</form>
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
