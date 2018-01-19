package org.sup2is.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")

public class DBConnectionTest {

	
	private Connection conn;
	private Statement stat;
	private ResultSet rs;
	 
	@Test
	public final void testMySql() {
	    String dbUrl = "jdbc:mysql://127.0.0.1:3306/";
	    String id = "root";
	    String pwd = "1357";
	     
	    try {
	        Connection con = null;
	        con = DriverManager.getConnection(dbUrl, id, pwd);
	        stat = con.createStatement();
	         
	        // 현재 존재하는 DB 종류를 알아오는 쿼리
	        rs = stat.executeQuery("SHOW DATABASES");
	        if (stat.execute("SHOW DATABASES")) {
	            rs = stat.getResultSet();
	        }
	         
	        // RecordSet 에 담은 데이타를 출력한다.
	        while (rs.next()) {
	            String str = rs.getNString(1);
	            System.out.println(str);
	        }
	 
	    } catch (SQLException sqex) {
	        System.out.println("SQLException: " + sqex.getMessage());
	        System.out.println("SQLState: " + sqex.getSQLState());
	    }
	 
	}


	
}
