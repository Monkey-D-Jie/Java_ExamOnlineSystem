<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
	if (session.getAttribute("student") == null) {
		response.sendRedirect("../index.jsp");
	}
%>