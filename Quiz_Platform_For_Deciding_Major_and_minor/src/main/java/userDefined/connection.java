package userDefined;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connection {
	public static Connection create() throws SQLException{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/majorminor", "root", "password");
		return con;
	}
}