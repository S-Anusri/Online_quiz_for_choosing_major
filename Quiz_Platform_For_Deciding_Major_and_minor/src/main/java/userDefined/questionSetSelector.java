package userDefined;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/questionSetSelector")
public class questionSetSelector extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection con = connection.create();
			HttpSession session = request.getSession();
			int majorBucket = (int)session.getAttribute("majorBucket");
			int minorBucket = (int)session.getAttribute("minorBucket");
			String sql = "select MIN(QID), BID from question_pool where BID = ? or BID = ? group by BID";
			PreparedStatement get = con.prepareStatement(sql);
			get.setInt(1, majorBucket);
			get.setInt(2, minorBucket);
			ResultSet rs = get.executeQuery();
			int majorStart = 0;
			int minorStart = 0;
			if(majorBucket == minorBucket){
				rs.next();
				majorStart = rs.getInt("MIN(QID)");
				minorStart = majorStart + 6;
			}
			else{
				while(rs.next()){
					if(rs.getInt("BID") == majorBucket){
						majorStart = rs.getInt("MIN(QID)");
					}
					if(rs.getInt("BID") == minorBucket){
						minorStart = rs.getInt("MIN(QID)"); 
					}
				}
			}
			System.out.println("majorStart = "+majorStart+"\tminorStart = "+minorStart);
			session.setAttribute("majorStart", majorStart);
			session.setAttribute("minorStart", minorStart);
			RequestDispatcher req = request.getRequestDispatcher("/displaySubjectQuestion.jsp");
			req.include(request, response);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
