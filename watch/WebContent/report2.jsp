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
String userid = request.getParameter("userid");
%>
userid:<%=userid %>
<br>
<%
Properties env2 = System.getProperties();

String tmpdirBase = (String)env2.get("java.io.tmpdir");
File tmpdirBaseFile = new File(tmpdirBase);

SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
String dateStr = sdf.format(new Date());

File dateFile = new File(tmpdirBaseFile,dateStr);

File useridFile = new File(dateFile,userid);
%>
<%=useridFile %>
<%
File[] files = useridFile.listFiles();

%>
<table style="border: 2px black solid;">
<%
Arrays.sort(files);
for(File f : files){
%>
	<tr>
		<td style="border: 1px black solid;">
<%=f.length()%>
		</td>
		<td style="border: 1px black solid;">
		<a href="downloadReport?filename=<%=f.getName()%>&userid=${param.userid}">
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