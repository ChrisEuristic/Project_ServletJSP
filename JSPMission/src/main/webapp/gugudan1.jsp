<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
int dan;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>구구단 : <%= request.getParameter("dan") %>단</h1>
	<p></p>
	<ul>
	<%
	for (int i = 1; i <= 9; i++){
		dan = Integer.parseInt(request.getParameter("dan"));
	%>
		<li><%= dan %> * <%= i %> = <%= dan * i %></li>
	
	<%
	}
	%>
	</ul>
</body>
</html>