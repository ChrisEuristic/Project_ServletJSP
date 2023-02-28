package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class JDBCClientMySQL2 {


	public int printColumnName(ResultSet rs) throws Exception {
		ResultSetMetaData meta = rs.getMetaData();
		int count = meta.getColumnCount();
		
		StringBuilder sb = new StringBuilder("#");
		for (int i = 1 ; i <= count ; i++) {
			sb.append("," + meta.getColumnName(i));
		}
		System.out.println(sb);
		System.out.println("-".repeat(sb.length()));
		
		return count;
	}
	
	public void StudyStatement(Connection con) throws Exception {

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from country limit 10");
		
		int colCount = printColumnName(rs);
		int rowCount = 1;
		while(rs.next()) {
			for(int i = 1 ; i <= colCount ; i++) {
				if (i == 1)	System.out.print((rowCount++) + ",");
				else		System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		st.close();
	}

	public void StudyPrepareStatement(Connection con) throws Exception {

		// 가변형 WHERE 절이 있는 SQL 쿼리문 만드는 객체.
		PreparedStatement st = con.prepareStatement("select * from country where code=?");

		st.setString(1, "KOR");
		//st.setInt, .setDate
		
		ResultSet rs = st.executeQuery();

		int colCount = printColumnName(rs);
		int rowCount = 1;
		while(rs.next()) {
			for(int i = 1 ; i <= colCount ; i++) {
				if (i == 1)	System.out.print((rowCount++) + ",");
				else		System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		st.close();
	}
	
	public void EnglishCountry(Connection con) throws Exception {
		
		PreparedStatement st = con.prepareStatement("SELECT COUNT(*) `영어를 사용하는 국가 수` FROM COUNTRYLANGUAGE WHERE LANGUAGE = ?");

		st.setString(1, "English");
		
		ResultSet rs = st.executeQuery();

		int colCount = printColumnName(rs);
		int rowCount = 1;
		while(rs.next()) {
			for(int i = 1 ; i <= colCount ; i++) {
				if (i == 1)	System.out.print((rowCount++) + ",");
				else		System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		st.close();
	}
	
	public void ReturnKoreaLanguage(Connection con) throws Exception {
		
		PreparedStatement st = con.prepareStatement("SELECT COUNTRYLANGUAGE.LANGUAGE FROM COUNTRY, COUNTRYLANGUAGE WHERE COUNTRY.NAME = ? AND COUNTRY.CODE = COUNTRYLANGUAGE.COUNTRYCODE;");

		st.setString(1, "South Korea");
		
		ResultSet rs = st.executeQuery();

		int colCount = printColumnName(rs);
		int rowCount = 1;
		while(rs.next()) {
			for(int i = 1 ; i <= colCount ; i++) {
				if (i == 1)	System.out.print((rowCount++) + ",");
				else		System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		st.close();
	}
	
	public void ReturnEnglishIsOfficialLanguage(Connection con) throws Exception {
		
		PreparedStatement st = con.prepareStatement("SELECT COUNTRY.REGION, COUNTRY.NAME FROM COUNTRYLANGUAGE, COUNTRY WHERE COUNTRYLANGUAGE.LANGUAGE = ? AND COUNTRYLANGUAGE.ISOFFICIAL = ? AND COUNTRYLANGUAGE.COUNTRYCODE = COUNTRY.CODE ORDER BY COUNTRY.REGION ASC, COUNTRY.NAME ASC;");

		st.setString(1, "ENGLISH");
		st.setString(2, "T");
		
		ResultSet rs = st.executeQuery();

		int colCount = printColumnName(rs);
		int rowCount = 1;
		while(rs.next()) {
			for(int i = 1 ; i <= colCount ; i++) {
				if (i == 1)	System.out.print((rowCount++) + ",");
				else		System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		st.close();
	}
	
	public void ReturnEnglishCountryRegion(Connection con) throws Exception {
		
		PreparedStatement st = con.prepareStatement("SELECT COUNTRY.REGION, COUNT(COUNTRY.NAME) ? FROM COUNTRYLANGUAGE, COUNTRY WHERE COUNTRYLANGUAGE.LANGUAGE = ? AND COUNTRYLANGUAGE.COUNTRYCODE = COUNTRY.CODE GROUP BY REGION ORDER BY COUNTRY.REGION ASC;");

		st.setString(1, "나라 수");
		st.setString(2, "ENGLISH");
		
		ResultSet rs = st.executeQuery();

		int colCount = printColumnName(rs);
		int rowCount = 1;
		while(rs.next()) {
			for(int i = 1 ; i <= colCount ; i++) {
				if (i == 1)	System.out.print((rowCount++) + ",");
				else		System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		st.close();
	}
	
	public static void main(String[] args) throws Exception  {

		JDBCClientMySQL2 cli = new JDBCClientMySQL2();

		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "musthave", "tiger");) {
			
			System.out.println("\n<=== StudyStatement ===>");
			cli.StudyStatement(con);
			System.out.println();

			System.out.println("\n<=== StudyPrepareStatement ===>");
			cli.StudyPrepareStatement(con);
			
			System.out.println("\n<=== English를 사용하고 있는 나라의 수 출력 ===>");
			cli.EnglishCountry(con);
			
			System.out.println("\n<=== 대한민국이 사용하는 언어 출력 ===>");
			cli.ReturnKoreaLanguage(con);
			
			System.out.println("\n<=== English를 공식 언어로 사용하는 나라의 대륙과 이름 출력 ===>");
			cli.ReturnEnglishIsOfficialLanguage(con);
			
			System.out.println("\n<=== English를 사용하는 나라의 수를 대륙별로 출력 ===>");
			cli.ReturnEnglishCountryRegion(con);
		}		
	}
}
