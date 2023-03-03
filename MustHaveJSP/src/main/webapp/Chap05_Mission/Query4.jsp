<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
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
	<h2>English를 사용하는 나라의 수를 출력하세요</h2>
	<table class="table table-striped-columns" style="width:70%">
	<tr>
		<th>나라의 수</th>
	</tr>
	<%
	WorldJDBCConnect jdbc = new WorldJDBCConnect(application);
	
	// 쿼리문 생성
	String sql = "SELECT COUNTRY.REGION, COUNT(COUNTRY.NAME) ? FROM COUNTRYLANGUAGE, COUNTRY WHERE COUNTRYLANGUAGE.LANGUAGE = ? AND COUNTRYLANGUAGE.COUNTRYCODE = COUNTRY.CODE GROUP BY REGION ORDER BY COUNTRY.REGION ASC;";
	PreparedStatement stmt = jdbc.con.prepareStatement(sql);
	stmt.setString(1, "나라 수");
	stmt.setString(2, "ENGLISH");
	
	// 쿼리 수행
	ResultSet rs = stmt.executeQuery();
	
	while(rs.next()){
		String result = rs.getString(1);
		%>
		<tr>
			<td><%= result %></td>
		</tr>
		<%
	}
	
	// 연결 닫기
	jdbc.close();
	%>
	</table>
</body>
</html>