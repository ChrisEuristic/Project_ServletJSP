<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.WorldJDBCConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body style="display: flex; flex-direction: column; align-items: center;">
	<h2>World - City Table</h2>
	<table class="table table-striped-columns" style="width:70%">
	<tr>
		<th>아이디</th>
		<th>도시</th>
		<th>국가코드</th>
		<th>지구</th>
		<th>인구</th>
	</tr>
	<%
	WorldJDBCConnect jdbc = new WorldJDBCConnect(application);
	
	// 쿼리문 생성
	String sql = "SELECT id, name, countrycode, district, population FROM city";
	Statement stmt = jdbc.con.createStatement();
	
	// 쿼리 수행
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		int id = rs.getInt("id");
		String name = rs.getString("name");
		String countrycode = rs.getString("countrycode");
		String district = rs.getString("district");
		int population = rs.getInt("population");
		%>
		<tr>
			<td><%= id %></td>
			<td><%= name %></td>
			<td><%= countrycode %></td>
			<td><%= district %></td>
			<td><%= population %></td>
		</tr>
		<%
	}
	
	// 연결 닫기
	jdbc.close();
	%>
	</table>
</body>
</html>