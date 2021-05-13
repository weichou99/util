<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Arrays" %> 
<%@ page import="java.text.SimpleDateFormat" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String path = request.getParameter("path");
if(path==null){
  path = "";
}
%>
path:<%=path %>
<br>
<%
Properties env2 = System.getProperties();

String tmpdirBase = (String)env2.get("java.io.tmpdir");
File tmpdirBaseFile = new File(tmpdirBase);


File pathFile = new File(tmpdirBaseFile,path);

%>
<%=pathFile %>
<%
File[] files = pathFile.listFiles();

%>
<table style="border: 2px black solid;">
<%
Arrays.sort(files);
for(File f : files){
%>

<%
if(f.isFile()){
%>
	<tr>
		<td style="border: 1px black solid;">
<%=f.length()%>
		</td>
		<td style="border: 1px black solid;">
		<a href="downloadReport?filename=<%=path+"/"+f.getName()%>">
<%=f.getName()%>
		</a>
		</td>
	</tr>
<%
}
%>


<%
if(f.isDirectory()){
%>
	<tr>
		<td style="border: 1px black solid;">
		</td>
		<td style="border: 1px black solid;">
		<a href="report.jsp?path=<%=path+"/"+f.getName()%>">
<%=f.getName()%>
		</a>
		</td>
	</tr>
<%
}
%>


<%
}
%>
</table>
</body>
</html>