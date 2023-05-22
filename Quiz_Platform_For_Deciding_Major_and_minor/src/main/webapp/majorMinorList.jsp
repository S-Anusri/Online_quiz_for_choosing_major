<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="userDefined.connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of major minors</title>
<script src="ajaxScripts.js"></script>
</head>
<body>
<div id="quizDiv">
	<p>Thank you for taking the Quiz!</p>
	<p>Based on your answers in the quiz, the Major(s) and Minor(s)
		suitable for you are:</p>
	<table>
		<tr>
			<th style="font-weight: bold">MAJOR(S)</th>
		</tr>
	<%
		int uid = (int) session.getAttribute("sessionID");
		int majorBucket = (int) session.getAttribute("majorBucket");
		int minorBucket = (int) session.getAttribute("minorBucket");
		try {
			Connection con = connection.create();
			String query = "select Name from finalSubjects where UID = ? and Bucket = ?";
			PreparedStatement s1 = con.prepareStatement(query);
			PreparedStatement s2 = con.prepareStatement(query);
			s1.setInt(1, uid);
			s1.setInt(2, majorBucket);
			s2.setInt(1, uid);
			s2.setInt(2, minorBucket);
			ResultSet rs1 = s1.executeQuery();
			ResultSet rs2 = s2.executeQuery();
			while (rs1.next()) {
	%>
		<tr>
			<td style="text-align: left"><%=rs1.getString(1)%></td>
		</tr>
	<%
			}
	%>
	</table>
	<br>
	<br>
	<table>
		<tr>
			<th style="font-weight: bold">MINOR(S)</th>
		</tr>
	<%
			while (rs2.next()) {
	%>
		<tr>
			<td style="text-align: left"><%=rs2.getString(1)%></td>
		</tr>
	<%
			}
	%>
	</table>
	<%
			con.close();
			} catch (Exception e) {
				out.println("Error occurred" + e);
			}
	%>
	<p>Would you like to check colleges which are suitable for you?</p>
	<button id="registerRedirect" onclick="redirectToRegistration()">REGISTER WITH US!</button>
</div>
</body>
</html>