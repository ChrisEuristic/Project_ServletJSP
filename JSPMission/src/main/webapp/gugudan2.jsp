<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
int col;
int dan;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<%
	col = Integer.parseInt(request.getParameter("col"));
	for (int i = 2; i <= 9; i+=col){
		for (int j = 1; j <= 9; j++){
			for(int k = 0; k < col; k++){
				if(i + k > 9)
					continue;
	%>
	<span style="display: inline-block; width:150px;">
	<%= i + k %> * <%= j %> = <%= (i + k) * j %>
	</span>
	<%
			}
	%>
	<br>
	<%
		}
		%>
		<br>
	<%
	}
	%>
</div>
</body>
</html>