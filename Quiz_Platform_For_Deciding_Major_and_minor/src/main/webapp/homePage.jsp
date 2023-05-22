<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="ajaxScripts.js"></script>
<meta charset="ISO-8859-1">
<title>Major-Minor Quiz Application</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<div class="container">
   <div class="left">
       <%@include file="header.jsp" %>
	<div id="quizDiv">
	    <div id="prop">
	    <div class="p1 center">Welcome to the Major-Minor Guidance Portal!</div>
	        <p>This platform which will provide the users a facility to choose a major and a minor in college based on their personality, interests, 
	        school grades and career goals in the form of a quiz.</p><br>
	        <p>Taking this quiz will enable students to study one or more specialized areas along with additional vocational courses based on the results, which will provide a well-rounded development, adhering to their career development and hobbies in accordance with NEP 2020. 
	        <p>Take our quiz today to find the major(s) and minor(s) best suited for you!</p><br>
	        <p>We also provide the service of contacting colleges offering the courses along with the faculty / student community to help you make the right choice!</p><br></div><br>
	        <div class="center1">
    	<div class="center">
    		 <button type="button" id="btn" onclick="setSession('user')">Take the Quiz!</button>
	        </div>
	    </div><br>
	<br>
   </div></div>
   <div class="right center1"><img src="/Quiz_Platform_For_Deciding_Major_and_minor/images/home.jpg" width="100%" height="50%"></div>
</div>
<%@include file="footer.jsp" %> 
</body>
</html>