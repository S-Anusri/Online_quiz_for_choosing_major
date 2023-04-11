<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ page import = "java.sql.*, javax.servlet.*, javax.servlet.http.*, userDefined.*" %>
	<div class=" prop center1"><a href="homePage.jsp" target="_self">Home</a></div><br>
	<%! int question = 5; %>
	<%
	System.out.println("***********************");
	System.out.println("question = " + question);
		session = request.getSession();
		int majorStart = (int)session.getAttribute("majorStart");
		int minorStart = (int)session.getAttribute("minorStart");
		if(question == 5){
			session.setAttribute("currentQID", majorStart);
		}
		else if (question == 11){
			session.setAttribute("currentQID", minorStart);
		}
		else if(question >= 17){
			System.out.println("Arrived");
			RequestDispatcher req = request.getRequestDispatcher("/majorMinorDecider");
			req.include(request,  response);
		}
		else{
			int temp = (int)session.getAttribute("currentQID");
			temp++;
			session.setAttribute("currentQID", temp);
		}
		if(question < 17){
			int questionNumber = (int)session.getAttribute("currentQID");
			System.out.println("questionNumber = " + questionNumber);
			Question display = new Question(questionNumber);
			display.getQuestion(question);
			question++;
	%>
	<div id="center2">
	<div id="quizDiv">
		<div id="center2">
			<%= display.question %>
		</div>
		<form name="Form">
  <input type="radio" name="id" id="id1" value="1" required>
  <label for="id1"><%= display.option1 %></label>
  <br><br>
  <input type="radio" name="id" id="id2" value="2">
  <label for="id2"><%= display.option2 %></label>
  <br><br>
  <input type="radio" name="id" id="id3" value="3">
  <label for="id3"><%= display.option3 %></label>
  <br><br>
  <input type="radio" name="id" id="id1" value="4">
  <label for="id1"><%= display.option4 %></label>
  <br><br>
  <input type="radio" name="id" id="id1" value="5">
  <label for="id1"><%= display.option5 %></label>
  <br><br>
  <br>
		<button type="button" onclick="setResponse(2)">Next</button>
</form>
	</div>
	</div>
	<% } %>
	<div id="response"></div>
</body>
</html>