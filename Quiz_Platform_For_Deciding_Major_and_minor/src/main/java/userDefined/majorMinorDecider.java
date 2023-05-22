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

@WebServlet("/majorMinorDecider")
public class majorMinorDecider extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int uid = (int)session.getAttribute("sessionID");
		int majorBucket = (int)session.getAttribute("majorBucket");
		int minorBucket = (int)session.getAttribute("minorBucket");
		int majorSubjectList[] = new int[5];
		int minorSubjectList[] = new int[5];
		for(int i = 0; i < 5; i++) {
			majorSubjectList[i] = 0;
			minorSubjectList[i] = 0;
		}
		try {
			Connection con = connection.create();
			String sql = "select Subject from selectedSubjects where UID = ? and Bucket = ?";
			PreparedStatement get = con.prepareStatement(sql);
			get.setInt(1, uid);
			get.setInt(2, majorBucket);
			ResultSet rs = get.executeQuery();
			int count = 0;
			while(rs.next()){
				majorSubjectList[count] = rs.getInt("Subject");
				count++;
			}
			rs.close();
			get.close();
			get = con.prepareStatement(sql);
			get.setInt(1, uid);
			get.setInt(2, minorBucket);
			rs = get.executeQuery();
			count = 0;
			while(rs.next()) {
				minorSubjectList[count] = rs.getInt("Subject");
				count++;
			}
			System.out.println("#############");			
			for(int i = 0; i < 5; i++) {
				System.out.println("majorSubjectList[" + i + "] = " + majorSubjectList[i]);
			}
			System.out.println("#############");
			for(int i = 0; i < 5; i++) {
				System.out.println("minorSubjectList[" + i + "] = " + minorSubjectList[i]);
			}
			System.out.println("#############");
			RequestDispatcher req = request.getRequestDispatcher("majorMinorList.jsp");
			req.include(request,  response);
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
	}
}
