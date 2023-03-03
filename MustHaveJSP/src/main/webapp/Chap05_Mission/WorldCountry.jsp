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
	<h2>World - Country Table</h2>
	<table class="table table-striped-columns" style="width:70%">
	<tr>
		<th>Code</th>
		<th>Name</th>
		<th>Continent</th>
		<th>Region</th>
		<th>SurfaceArea</th>
		<th>IndepYear</th>
		<th>Population</th>
	</tr>
	<%
	WorldJDBCConnect jdbc = new WorldJDBCConnect(application);
	
	// 쿼리문 생성
	String sql = "SELECT Code, Name, Continent, Region, SurfaceArea, IndepYear, Population FROM country";
	Statement stmt = jdbc.con.createStatement();
	
	// 쿼리 수행
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		String Code = rs.getString("Code");
		String Name = rs.getString("Name");
		String Continent = rs.getString("Continent");
		String Region = rs.getString("Region");
		int SurfaceArea = rs.getInt("SurfaceArea");
		int IndepYear = rs.getInt("IndepYear");
		int Population = rs.getInt("Population");
		%>
		<tr>
			<td><%= Code %></td>
			<td><%= Name %></td>
			<td><%= Continent %></td>
			<td><%= Region %></td>
			<td><%= SurfaceArea %></td>
			<td><%= IndepYear %></td>
			<td><%= Population %></td>
		</tr>
		<%
	}
	
	// 연결 닫기
	jdbc.close();
	%>
	</table>
</body>
</html>