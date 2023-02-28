package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCClientMySQL {

	public static void main(String[] args) throws Exception {
		// MySQL 접속을 위한 JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// MySQL Database 연결 객체 생성
		//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "musthave", "tiger");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musthave", "musthave", "tiger");
		
		// 질의를 위한 객체 생성 
		// 그냥 SQL문을 날릴때 씀.
		Statement st = con.createStatement();
		
		// SQL 질의
		ResultSet rs = st.executeQuery("select * from member");
		//ResultSet rs = st.executeQuery("select Name, Continent, Population, HeadOfState from country limit 10");
		
		// 커서 프로세싱
		// 질의 결과 Parsing
		while(rs.next()) { // 다음 결과 레코드로 이동
			for(int i = 1; i <= 4; i++) {
				if(i != 1) System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		
		// 생성된 객체 연결을 모두 해제
		rs.close();
		st.close();
		con.close();

	}

}
