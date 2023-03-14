<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>ImplicitForwardResult 페이지</h2>
	<h3>각 영역에 저장된 속성 읽기</h3>
	<ul>
		<li>Page 영역 : ${ pageScope.hello }</li>
		<li>Request 영역 : ${ requestScope.hello }</li>
		<li>Session 영역 : ${ sessionScope.hello }</li>
		<li>App 영역 : ${ applicationScope.hello }</li>
	</ul>
	<h3>영역 지정 없이 속성 읽기</h3>
	<ul>
		<li>${ hello }</li>
	</ul>
</body>
</html>