<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*, userDefined.connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact List</title>
</head>
<body>
<div id="center2">
	<%
	String temp = request.getParameter("college");
	int cid = Integer.parseInt(temp);
	try(Connection con = connection.create()){
		Statement get = con.createStatement();
		ResultSet rs = get.executeQuery("SELECT * FROM Contacts WHERE CID = " + cid);
	%>
	<table>
		<tr>
			<th><b>Name</b></th>
			<th><b>Role</b></th>
			<th><b>Email ID</b></th>
			<th><b>Phone No.</b></th>
		</tr>
	<%
		while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("Name") %></td>
			<td><%= rs.getString("Type") %></td>
			<td><%= rs.getString("mailId") %></td>
			<td><%= rs.getString("PhoneNo") %></td>
		</tr>
	<%
		}
	}
	catch(SQLException e){
		e.printStackTrace();
	}
	%>
	</table>
</div>
</body>
</html>