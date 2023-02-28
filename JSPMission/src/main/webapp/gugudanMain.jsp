<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
int sel, val;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
sel = Integer.parseInt(request.getParameter("sel"));
val = Integer.parseInt(request.getParameter("val"));

switch(sel){
case 1:	response.sendRedirect("gugudan" + sel + ".jsp?dan=" + val); break;
case 2: response.sendRedirect("gugudan" + sel + ".jsp?col=" + val); break;
}

%>
</body>
</html>