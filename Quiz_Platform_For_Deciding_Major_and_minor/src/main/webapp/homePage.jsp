<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="ajaxScripts.js"></script>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%@include file="header.jsp" %>
<div id="quizDiv">
 <div id="prop">
 </div>
 <div>
    <div id="prop">
    <div class="p1 center">Welcome to the Major-Minor Guidance Portal!</div>
    	<p>To develop a student-friendly platform which will provide the students a facility to choose a major and a minor in college based on their personality, interests, 
    	school grades and career goals in the form of a quiz.</p><br>
    	<p>This platform will enable students to study one or more specialized areas along with additional vocational courses based on the results, which will provide a well-rounded development, adhering to their career development and hobbies in accordance with NEP 2020. 
    	This platform will also have the provision to consider the financial affordability of students along with the possible locations for colleges.</p>
    	<p>Take our quiz today to find the major(s) and minor(s) best suited for you!</p>
    	<p>We also provide the service of contacting colleges offering the courses along with the faculty / student community to help you make the right choice!</p>
    	<div></div> <br>
    	<div class="p1 center">
    		 <button type="button" id="btn" onclick="setSession('user')">Take the Quiz!</button>
    	</div><br><br>
    </div>
</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>