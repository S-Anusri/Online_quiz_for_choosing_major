<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>    
<%@page import="java.util.*"%> 
<%@page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results handling</title>
<link rel="stylesheet" href="style1.css">
<script src="ajaxScripts.js"></script>
</head>
<body onload="loadSubjectList()">
<%@include file="header.jsp" %>
	<div id="subjectsList"></div>
	<div id="collegeList"></div>
	<div id="contactList"></div>
<%@include file="footer.jsp" %> 
</body>
</html>