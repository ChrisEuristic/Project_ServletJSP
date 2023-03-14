<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
BoardDAO dao = new BoardDAO(application);

List list = dao.selectListTemp();
request.setAttribute("list", list);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실습</title>
</head>
<body>
	<h2>데이터 불러오기</h2>
	<%
	for(int i = 0; i < list.size(); i++){
		request.setAttribute("i", i);
	%>
	<ul>
		<li>번호 : ${ requestScope.list[requestScope.i].num }</li>
		<li>제목 : ${ requestScope.list[requestScope.i].title }</li>
		<li>내용 : ${ requestScope.list[requestScope.i].content }</li>
		<li>아이디 : ${ requestScope.list[requestScope.i].id }</li>
		<li>날짜 : ${ requestScope.list[requestScope.i].postdate }</li>
		<li>조회수 : ${ requestScope.list[requestScope.i].visitcount }</li>
		<li>이름 : ${ requestScope.list[requestScope.i].name }</li>
	</ul>
	<%
	}
	%>
	
	
</body>
</html>