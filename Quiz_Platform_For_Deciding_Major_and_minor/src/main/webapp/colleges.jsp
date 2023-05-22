<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>    
<%@page import="java.util.*"%> 
<%@page import="javax.servlet.*" %>
<%@page import="userDefined.connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Choose Colleges here!</title>
</head>
<body>
     <br>
     <p><b>Your list of colleges for selected subjects is: </b></p>
     <p><b>Please choose a college to get a list of faculty and anlumni and their contact details</b></p>
     <table>
	<tr>
	<th></th>
	<th>College</th>
	<th>Address</th>
	<th>Stream</th>
	</tr>
	<%
		int uid = (int)session.getAttribute("sessionID");
		int majorBucket = (int)session.getAttribute("majorBucket");
		int minorBucket = (int)session.getAttribute("minorBucket");
		String temp = request.getParameter("major");
		int majorSubject = Integer.parseInt(temp);
		temp = request.getParameter("minor");
		int minorSubject = Integer.parseInt(temp);
		String sql = "select CID, Name, Address, SID, BID from colleges, selectedSubjects where BID = Bucket and SID = Subject and UID = ? and Bucket = ? and Subject = ?";
		try{
			Connection con = connection.create();
			PreparedStatement get = con.prepareStatement(sql);
			ResultSet rs;
			get.setInt(1, uid);
			get.setInt(2, majorBucket);
			get.setInt(3, majorSubject);
			rs = get.executeQuery();
			while(rs.next()){
	%>
		<tr>
		<td><input type="radio" name="college" value="<%= rs.getInt("CID") %>"></td>
		<td><%= rs.getString("Name") %></td>
		<td><%= rs.getString("Address") %></td>
		<td>Major</td>
		</tr>
	<%
			}
			get.setInt(1, uid);
			get.setInt(2, minorBucket);
			get.setInt(3, minorSubject);
			rs = get.executeQuery();
			while(rs.next()){
	%>
		<tr>
		<td><input type="radio" name="college" value="<%= rs.getInt("CID") %>"></td>
		<td><%= rs.getString("Name") %></td>
		<td><%= rs.getString("Address") %></td>
		<td>Minor</td>
		</tr>
	<%
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	%>
	</table>
	<button onclick="getContacts()">Submit</button>
</body>
<script src="ajaxScripts.js"></script>
</html>