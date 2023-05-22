<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*, userDefined.connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
	<%
	int uid = (int) session.getAttribute("sessionID");
	int majorBucket = (int) session.getAttribute("majorBucket");
	int minorBucket = (int) session.getAttribute("minorBucket");
	try {
		Connection con = connection.create();
		String query = "select Subject, Name from finalSubjects where UID = ? and Bucket = ?";
		PreparedStatement s1 = con.prepareStatement(query);
		PreparedStatement s2 = con.prepareStatement(query);
		s1.setInt(1, uid);
		s1.setInt(2, majorBucket);
		s2.setInt(1, uid);
		s2.setInt(2, minorBucket);
		ResultSet rs1 = s1.executeQuery();
		ResultSet rs2 = s2.executeQuery();
	%>
	<form>
<!-- majorList -->
	<p>Choose one or more subjects among your results to obtain the list of colleges: </p>
		<table>
	<%
		while (rs1.next()) {
	%>
			<tr>
				<td style="text-align: left">
					<input type="radio" name="major" value="<%=rs1.getString("Subject")%>">
					<label for="<%=rs1.getString(1)%>"><%=rs1.getString("Name")%></label>
				</td>
			</tr>
	<%
		}
	%>
		</table>
		<br>
		<br>
<!-- minorList -->
		<table>
	<%
		while (rs2.next()) {
	%>
			<tr>
				<td style="text-align: left">
					<input type="radio" name="minor" value="<%=rs2.getString("Subject")%>">
					<label for="<%=rs2.getString(1)%>"><%=rs2.getString("Name")%></label>
				</td>
			</tr>
	<%
		}
	%>
		</table>
		<input type="button" onclick="getCollegeList()" value="Submit Choices!">
	</form>
	<%
		con.close();
		} catch (Exception e) {
			out.println("Error occurred" + e);
		}
	%>
</body>
<script src="ajaxScripts.js"></script>
</html>