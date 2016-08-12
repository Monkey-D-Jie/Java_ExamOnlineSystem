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
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>网络在线考试</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/CSS/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/ajax.js"></script>
<script type="text/javascript">
	timer = window.setInterval("showStartTime();showRemainTime();", 1000);
	//此处需要加&nocache="+new Date().getTime()，否则将出现时间不自动走动的情况
	function showStartTime() {
		var loader = new net.AjaxRequest(
				"${pageContext.request.contextPath }/student/ExamAction_showStartTime.do?nocache="
						+ new Date().getTime(), deal_s, onerror, "GET");
	}
	function showRemainTime() {
		var loader1 = new net.AjaxRequest(
				"${pageContext.request.contextPath }/student/ExamAction_showRemainTime.do?nocache="
						+ new Date().getTime(), deal_r, onerror, "GET");
	}
	function onerror() {
		window.open(
						'${pageContext.request.contextPath }/index.jsp',
						'',
						'toolbar,menubar,scrollbars,resizable,status,location,directories,copyhistory,height=600,width=778');
		window.close();
	}
	function deal_s() {
		console.info(this.req.responseText);
		showStartTimediv.innerHTML = this.req.responseText;
	}
	function deal_r() {
		showRemainTimediv.innerHTML = this.req.responseText;
		if (this.req.responseText == "00:00:00") {
			questionsForm.submit();
		}
	}
</script>
<script type="text/javascript">
	function keydown() {
		if (event.keyCode == 8) {
			event.keyCode = 0;
			event.returnValue = false;
			alert("当前设置不允许使用退格键");
		}
		if (event.keyCode == 13) {
			event.keyCode = 0;
			event.returnValue = false;
			alert("当前设置不允许使用回车键");
		}
		if (event.keyCode == 116) {
			event.keyCode = 0;
			event.returnValue = false;
			alert("当前设置不允许使用F5刷新键");
		}
		if ((event.altKey)
				&& ((window.event.keyCode == 37) || (window.event.keyCode == 39))) {
			event.returnValue = false;
			alert("当前设置不允许使用Alt+方向键←或方向键→");
		}
		if ((event.ctrlKey) && (event.keyCode == 78)) {
			event.returnValue = false;
			alert("当前设置不允许使用Ctrl+n新建IE窗口");
		}
		if ((event.shiftKey) && (event.keyCode == 121)) {
			event.returnValue = false;
			alert("当前设置不允许使用shift+F10");
		}
	}
	function click() {
		event.returnValue = false;
		alert("当前设置不允许使用右键！");
	}
	document.oncontextmenu = click;
</script>

</head>
<!-- onLoad="showStartTime();showRemainTime();" body的onload事件 -->
<body  onkeydown="keydown()">
	<table width="770" border="0" cellpadding="0" cellspacing="0" align="center"
		bgcolor="#FFFFFF">
		<tr>
			<td width="40" height="39"
				background="${pageContext.request.contextPath }/Images/startExam_leftTop.jpg">&nbsp;</td>
			<td width="667" align="right"
				background="${pageContext.request.contextPath }/Images/startExam_top.jpg">&nbsp;
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="23%" nowrap height=23 align=right>考试时间：</td>
						<td width="14%" nowrap><font color="#FF0000">20</font>分钟</td>
						<td width="13%" nowrap>开始时间：</td>
						<td width="60" nowrap><div id="showStartTimediv">00:00:00</div>
						</td>
						<td width="16%" nowrap>剩余时间：</td>
						<td width="60" align=left nowrap><div id="showRemainTimediv"></div>
						</td>
					</tr>
				</table>
			</td>
			<td width="19" background="${pageContext.request.contextPath }/Images/startExam_top.jpg">&nbsp;</td>
			<td width="44" background="${pageContext.request.contextPath }/Images/startExam_rightTop.jpg">&nbsp;</td>
		</tr>
		<tr>
			<td height="435" rowspan="2"
				background="${pageContext.request.contextPath }/Images/startExam_left.jpg">&nbsp;</td>
			<td height="43" colspan="2"><img
				src="${pageContext.request.contextPath }/Images/startExam_ico.jpg" width="117" height="43"></td>
			<td rowspan="2" background="${pageContext.request.contextPath }/Images/startExam_right.jpg">&nbsp;</td>
		</tr>
		<tr>
			<td height="600" colspan="2" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center" class="title">
								
							&nbsp;&nbsp;考试卷</td>
					</tr>
					<tr>
						<td width="64%">&nbsp;</td>
						<td width="36%">&nbsp;满分<font color="red">100</font>分&nbsp;&nbsp;&nbsp;单选题<font
							color="red">40</font>分&nbsp;&nbsp;&nbsp;多选题<font color="red">60</font>分</td>
					</tr>
				</table>
				<s:form namespace="/student" action="ExamAction_endExam"  method="post" id="questionsForm">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<s:hidden name="taotiId"/>
						<tr>
							<td>
								<table id="single" width="90%" border="0" cellspacing="0"
									cellpadding="0" align=center>

									<tr>
										<td colspan="4" height=23 style="font-size:11pt;">一、单选题（<font
											color=red>每题<s:property value="getQueScore(40,singleQuestions)"/>分，答错不得分</font>）</td>
									</tr>
									<s:iterator var="qs" id="questions" value="singleQuestions" status="st">
										<tr>
											<td height=23 colspan="4" align=center nowrap>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="8%" align=right height=23>[&nbsp;<s:property value="#st.index+1"/>&nbsp;]</td>
														<td width="2%">&nbsp;</td>
														<!-- 输出问题的题目 -->
														<td width="90%" align=left nowrap style="font-size:11pt;">
															<s:property value="questionName"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<!-- 输出选项,设置list存选项标号 -->
										<s:set name="option" value="{'A','B','C','D'}"/>
										<s:iterator value="optionArray" status="sto">
											<tr>
												<td width="8%" height=23 nowrap>&nbsp;</td>
												<td width="3%" align=center nowrap>
													<!-- 名称:qd+当前问题的id -->
													<input type="radio" name="qd<s:property value="id"/>" value="<s:property value="#sto.index"/>">
												</td>
												<td width="3%" align=center nowrap>
													<s:property value="%{#option[#sto.index]}"/>.
												</td>
												<td width="86%" align=left nowrap>
													<s:property/>
												</td>
											</tr>
										</s:iterator>
									</s:iterator>
								</table>


								<table id="single" width="90%" border="0" cellspacing="0"
									cellpadding="0" align=center>

									<tr>
										<td colspan="4" height=23 style="font-size:11pt;">
										二、多选题（<font color=red>每题<s:property value="getQueScore(60,multipleQuestions)"/>分，答错不得分</font>）</td>
									</tr>
									<s:iterator var="qs" id="questions" value="multipleQuestions" status="st">
										<tr>
											<td height=23 colspan="4" align=center nowrap>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="8%" align=right height=23>[&nbsp;<s:property value="#st.index+1"/>&nbsp;]</td>
														<td width="2%">&nbsp;</td>
														<!-- 输出问题的题目 -->
														<td width="90%" align=left nowrap style="font-size:11pt;">
															<s:property value="questionName"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<!-- 输出选项,设置list存选项标号 -->
										<s:set name="option" value="{'A','B','C','D'}"/>
										<s:iterator value="optionArray" status="sto">
											<tr>
												<td width="8%" height=23 nowrap>&nbsp;</td>
												<td width="3%" align=center nowrap>
													<!-- 名称:qm+当前问题的id -->
													<input type="checkbox" multiple="multiple" name="qm<s:property value="id"/>" value="<s:property value="#sto.index"/>">
												</td>
												<td width="3%" align=center nowrap>
													<s:property value="%{#option[#sto.index]}"/>.
												</td>
												<td width="86%" align=left nowrap>
													<s:property/>
												</td>
											</tr>
										</s:iterator>
									</s:iterator>
								</table>
				<tr><td align="center"><input type="submit" value="交卷" /></td></tr>
				</s:form>
			</td>
		</tr>
		<tr>
			<td width="40" height="40"
				background="${pageContext.request.contextPath }/Images/startExam_leftBottom.jpg">&nbsp;</td>
			<td colspan="2" background="${pageContext.request.contextPath }/Images/startExam_bottom.jpg">&nbsp;</td>
			<td background="${pageContext.request.contextPath }/Images/startExam_rightBottom.jpg">&nbsp;</td>
		</tr>
	</table>
</body>
</html>
