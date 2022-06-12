package score;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String path = "jdbc:mysql://localhost:3306/lecture";
	private String user = "hong";
	private String pwd = "1111";
	
	Connection conn; 
	public DBConn(){
		try {
			Class.forName(driver);
			this.conn = DriverManager.getConnection(path, user, pwd);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public Connection getConn() {
		return this.conn;
	}
}
