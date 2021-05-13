<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Properties env2 = System.getProperties();

String catalinaBase = (String)env2.get("catalina.base");
File catalinaBaseFile = new File(catalinaBase);
File logsFile = new File(catalinaBaseFile,"logs");
%>
<%=logsFile %>
<%
File[] logfiles = logsFile.listFiles();

%>
<table style="border: 2px black solid;">
<%
Arrays.sort(logfiles);
for(File f : logfiles){
%>
	<tr>
		<td style="border: 1px black solid;">
<%=f.length()%>
		</td>
		<td style="border: 1px black solid;">
		<a href="download?filename=<%=f.getName()%>">
<%=f.getName()%>
		</a>
		</td>
	</tr>
<%
}
%>
</table>
</body>
</html>