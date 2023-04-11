package userDefined;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/responseHandler")
public class responseHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userID = (int)session.getAttribute("sessionID");
		int qid = (int)session.getAttribute("currentQID");
		String input = request.getParameter("option");
		int option = Integer.parseInt(input);
		System.out.println("optionSelected="+option+"\tcurrentQID="+qid);
		System.out.println("***********************\n");
		Connection con;
		try{
			con = connection.create();
			con.setAutoCommit(false);
			try(PreparedStatement in = con.prepareStatement("INSERT INTO responses VALUES (?,?,?)");)
			{
				in.setInt(1, userID);
				in.setInt(2, qid);
				in.setInt(3, option);
				in.executeUpdate();
				con.commit();
				in.close();
			}
			catch(SQLException e) {
				try {
					con.rollback();
					e.printStackTrace();
					System.out.println("Try again server was busy");
				}
				catch(SQLException x) {
					x.printStackTrace();
				}
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
