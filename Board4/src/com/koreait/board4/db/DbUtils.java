package com.koreait.board4.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUtils {
		
	public static Connection getCon() throws ClassNotFoundException, SQLException {
		final String URL = "jdbc:mysql://localhost:3306/board3?serverTimezone=UTC";
		final String USER = "root";
		final String PW = "koreait2020";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PW);
		
		System.out.println("DB 연결 성공!");
		return con;
	}
	
	public static void close(Connection con, PreparedStatement ps) {
		if(ps != null) {
			try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		if(con != null) {
			try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
	}
	public static void close(Connection con, PreparedStatement ps, ResultSet rs) {
		if(rs != null) {
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
		}		
		close(con, ps);
	}
}






