/**
 * 
 */
package bus_Booking;

import java.sql.DriverManager;
import java.sql.Connection;
/**
 * 
 */
public class connection {
	static Connection con;
	public static Connection dataBaseConnectionMethod() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "cscorner");

		} catch (Exception e) {
			e.getMessage();

		}
		return con;
	}
	

}
