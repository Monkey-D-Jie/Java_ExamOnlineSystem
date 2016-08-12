<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="com.examonline.util.PageBean"%>
<%@page import="com.examonline.util.PageInfo"%>
<html>
<head>
	<title>网络在线考试——后台管理</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/common.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/ajaxRequest.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/page.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/ajax.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/function.js" charset="gb2312"></script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tr>
			<td width="176" valign="top" bgcolor="#FFFFFF">
				<%@ include file="left.jsp"%>
			</td>
			<td width="602" align="right" valign="top" bgcolor="#FFFFFF"><table
					width="99%" height="487" border="0" cellpadding="0" cellspacing="0"
					align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="78%" class="word_grey">&nbsp;当前位置：<span
										class="word_darkGrey">管理员信息管理 &gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif" width="5" height="9">
										&nbsp;当前管理员：${user.realName } &nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<table width="92%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="84%" height="30" align="right">
										<img src="${pageContext.request.contextPath }/Images/add.gif" width="19" height="18">&nbsp;
									</td>
									<td width="16%">
										<a href="#" onclick="window.open('./manger/UserAction_add.do', '', 'width=200,height=200')">添加管理员信息</a>
									</td>
								</tr>
							</table>
							<s:form action="" namespace="" method="post" id="managerForm">
							<table width="91%" border="1" cellpadding="0" cellspacing="0"
								bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
								bordercolorlight="#67A8DB">
								<tr align="center" bgcolor="#A8D8FC">
									<td width="42%" height="26" bgcolor="#B2D6F1">登录名</td>
									<td width="42%" height="26" bgcolor="#B2D6F1">管理员名称</td>
									<td width="8%" bgcolor="#B2D6F1">修改</td>
									<td width="8%" bgcolor="#B2D6F1">删除</td>
								</tr>
								<s:iterator value="users" >
									<tr>
										<td align="center"><s:property value="userName"/></td>
										<td align="center"><s:property value="realName"/></td>
										<td align="center">
											<a href="#" onclick="window.open('./manger/UserAction_edit.do?id=<s:property value="id"/>', '', 'width=200,height=200')">修改</a>
										</td>
										<td align="center">
											<a href="#" onclick="if(confirm('你确定要删除？')){window.location='./manger/UserAction_del.do?id=<s:property value="id"/>'}">删除</a>
										</td>
									</tr>
								</s:iterator>
							</table>
							<table>
									<%	
										 PageBean pageBean=(PageBean)request.getAttribute("pageBean");
									%>
									<tr>
										 <td width="17%" align="left">总记录数：<%=pageBean.getTotalResult() %>条</td> 
										 <td width="2%" align="right"></td>      
							             <%if(pageBean.getFirstPage()){ %>           
								             <td width="8%" align="center">首页&nbsp;&nbsp;|</td>
								             <td width="12%" align="center">上一页&nbsp;&nbsp;&nbsp;|</td>
							             <%}else{ %>
								             <td width="8%" align="center"><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/TaotiAction_index.do','start','taoTiForm')">首页&nbsp;&nbsp;|</a></td>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/TaotiAction_index.do','prev','taoTiForm')">上一页&nbsp;&nbsp;&nbsp;|</a></td>
							             <%} %>
							             <%if(pageBean.getLastPage()){ %>
											 <td width="12%" align="center">下一页&nbsp;&nbsp;&nbsp;|</td>
								             <td width="8%" align="center">末页</td>
							             <%}else{ %>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/TaotiAction_index.do','next','taoTiForm')">下一页&nbsp;&nbsp;&nbsp;|</a></td>
								             <td width="8%" align="center"><u><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/TaotiAction_index.do','end','taoTiForm')">末页</a></td>
							             <%} %>
							             <td width="8%" align="center">第<%=pageBean.getPageNo()%>页</td>
							             <td width="8%" align="center">共<%=pageBean.getSumPage() %>页</td>
							             <td width="20%" align="right">至第<input size="1" type="text" name="goPage" >页
							             <a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/TaotiAction_index.do','go','taoTiForm')">确定</a></td>
							             
							             <td><input type="hidden" name="pageNO" value="<%=pageBean.getPageNo() %>" ></td> 
							             <td><input type="hidden" name="prevpageNO" value="<%=pageBean.getPageNo()-1 %>"></td>
							             <td><input type="hidden" name="nextpageNO" value="<%=pageBean.getPageNo()+1 %>"></td>
							             <td><input type="hidden" name="sumPage" value="<%=pageBean.getSumPage() %>" ></td>
							             <td><input type="hidden" name="pageSize" value=" " ></td> 
									</tr>
								</table>
							</s:form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<%@ include file="copyright.jsp"%>
</body>
</html>
