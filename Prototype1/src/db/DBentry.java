/*
 * Program: CS485_lab4
 * Purpose: The program is designed to illustrate 1) the use of SQL connector 
 * to connect to and update on MySQL database; 2) the use of JSP to create a
 * Web page for data entry. To make the program work, both JDK, Apache, MySQL
 * need to be installed.
 * @copyright the program is intended for class use, it should not be distributed
 * outside the class without permission from the instructor, Dr. Mingrui Zhang  
 */
package db;
import java.sql.*;

public class DBentry {
	static DBentry instance = new DBentry();
	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	String dpwd = null;
	StringBuilder sb = new StringBuilder();
	
	//change URL to your database server as needed
	String dbPath="jdbc:mysql://localhost:3306/health_app?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	//cs485_lab?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
	//?useSSL=false
	
	public static DBentry getInstance() {
		if (instance==null) {
			instance = new DBentry();
		}
		return instance;
	}
	
	//Establish connection to MySQL server
	public Connection newConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			try {			
				dbconn = DriverManager.getConnection(dbPath,"root","lowerUPPER1");
				System.out.println("gain the connection");
				return dbconn;
			}
			catch (Exception s){
				s.printStackTrace();} //Changed to printStackTrace()
		}
		catch (Exception err){
			err.printStackTrace(); //Changed to printStackTrace()
		}
		return null;
	}
	
	public ResultSet selectStatement( String query ) {
		try {
			
			dbconn=instance.newConnection();
			sql=dbconn.prepareStatement(query);
			ResultSet results;
			results=sql.executeQuery();
			System.out.println("query="+query);
			
			if (results.next()) {
				System.out.println(results.getString("user"));
			}
	
			//WARNING!
			//Need to process ResultSet before closing connection
			dbconn.close();
			return results;
		}
		catch (Exception err) {
			System.out.println(err.getMessage());
			return null;
		}
	}

	public boolean DBentry( String query) throws Exception { //removed Exception handling
			System.out.println("query="+query);
			instance.newConnection();
			sql=dbconn.prepareStatement(query);
			sql.executeUpdate(query);
			dbconn.close();
			return true;
	}
	
	public boolean userlookup(String user, String pass) {
		try {
			
			dbconn=instance.newConnection();
			sql=dbconn.prepareStatement("select * from health_app.user where name='"+user+"' and password='"+pass+"';");
			ResultSet results;
			results=sql.executeQuery();
			System.out.println("query="+"select * from health_app.user where name='"+user+"' and password='"+pass+"';");
	
			String name=null;
			if (results.next())
				name = results.getString("name");
			//WARNING!
			//Need to process ResultSet before closing connection
			dbconn.close();
			if (name!=null)
				return true;
			else return false;
		}
		catch (Exception err) {
			System.out.println(err.getMessage());
			return false;
		}
	}
	
	public boolean userregister(String user, String pass) {
		try {
			instance.DBentry("insert into health_app.user (`name`,`password`)" +
								"values ('"+user+"','"+pass+"');");
			return true;
		}
		catch (Exception err) {
			err.printStackTrace();
			return false;
		}
	}
	
	public static void main(String[] args) {	
		//instance.entry("Golf");
	}
}