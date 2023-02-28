package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

class JDBCClient {
	protected String driver;
	protected Connection con;
	protected Statement statement;
	
	public ResultSet createStatement(String query) throws Exception {
		statement = con.createStatement();
		ResultSet rs = statement.executeQuery(query); 
		return rs;
	}
	
	public void close() throws Exception {
		statement.close();
	}
}

class JDBCClientMySQLLocal extends JDBCClient {
	
	JDBCClientMySQLLocal() throws Exception {
		this.driver = "com.mysql.cj.jdbc.Driver";
		this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musthave", "musthave", "tiger");
	}
}

class JDBCClientH2Local extends JDBCClient {
	JDBCClientH2Local() throws Exception{
		this.driver = "org.h2.Driver";
		this.con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/MustHave", "sa", "");
	}
}


public class JDBCClientGeneral {

	public static void main(String[] args) throws Exception {
		
		JDBCClient jdbc = null;
		System.out.println("사용할 DB를 선택해주세요.");
		System.out.println("1. MySQL   2. H2");
		System.out.print("==> ");
		Scanner sc = new Scanner(System.in);
		switch(sc.nextInt()) {
		case 1: jdbc = new JDBCClientMySQLLocal(); break;
		case 2: jdbc = new JDBCClientH2Local(); break;
		default: break;
		}
		sc.nextLine();
		
		
		System.out.println("쿼리문을 입력해주세요.");
		System.out.print("==> ");
		
		ResultSet rs = jdbc.createStatement(sc.nextLine());
		
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
		jdbc.close();

	}

}
