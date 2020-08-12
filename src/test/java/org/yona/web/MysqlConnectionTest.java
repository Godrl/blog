package org.yona.web;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MysqlConnectionTest {

<<<<<<< HEAD
	private static final String DRIVER = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
	//com.mysql.cj.jdbc.Driver
//	private static final String URL = "jdbc:log4jdbc:mysql://13.124.47.236:3306/blog?useSSL=false&serverTimezone=UTC";
	private static final String URL = "jdbc:log4jdbc:mysql://127.0.0.1:3306/blog?useSSL=false&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Seoul";
=======
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/blog?useSSL=false&serverTimezone=Asia/Seoul";
>>>>>>> 72db12440e0aa55882bb491d30c2f3ea5d3be1bf
	private static final String USER = "yona";
	private static final String PW = "0902";

	@Test
	public void testConnection() throws Exception {

		Class.forName(DRIVER);
<<<<<<< HEAD
 
=======

>>>>>>> 72db12440e0aa55882bb491d30c2f3ea5d3be1bf
		try (Connection con = DriverManager.getConnection(URL, USER, PW)) {

			System.out.println(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
<<<<<<< HEAD
}

=======
}
>>>>>>> 72db12440e0aa55882bb491d30c2f3ea5d3be1bf
