package userDefined;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class registrationHandler
 */

@WebServlet("/registrationHandler")
public class registrationHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	int uid = (int)session.getAttribute("sessionID");
    	String name = request.getParameter("name");
        String pno = request.getParameter("pno");
        String eid = request.getParameter("eid"); 
        Connection con = null;
        try {
  	  	    con = connection.create();
  	  	    try {
  	  	    	con.setAutoCommit(false);
  	  	    	PreparedStatement s;
  	  	    	String sql = "insert into register (UID, Name, Phone, EID) values (?, ?, ?, ?)";
  	  	    	s = con.prepareStatement(sql);
            	s.setInt(1, uid);
            	s.setString(2, name);
            	s.setString(3, pno);
            	s.setString(4, eid);
            	s.executeUpdate();
            	con.commit();
  	  	    }
  	  	    catch(SQLException x) {
  	  	    	con.rollback();
  	  	    	x.printStackTrace();
  	  	    }
  	  	    con.close();
        } catch(Exception e) {
        	System.out.println(e);
        }
        RequestDispatcher req = request.getRequestDispatcher("/results.jsp");
        req.include(request,  response);
    }
}
