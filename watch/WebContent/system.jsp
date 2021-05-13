<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Properties" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Map<String, String> env = System.getenv();
%>
<%
for(String key : env.keySet()){
	String value = env.get(key);
%>
<div>
<%=key%>:<%=value%>	
</div>
<%
}
%>
<hr>
<hr>
<%
Properties env2 = System.getProperties();
%>
<%
for(Object key : env2.keySet()){
	Object value = env2.get(key);
%>
<div>
<%=key%>:<%=value%>	
</div>
<%
}
%>
</body>
</html>