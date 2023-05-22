<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question</title>
<script>
function validateForm(){
   var radios = document.getElementById("option");
   var formValid = false;
   for(var i = 0; i < radios.length; i++)
   {
	   if(radios[i].checked){
		   formValid = true;
		   break;
	   }
   }
   if(!formValid){
	   alert("Please select an option!");
	   return false;
   }
   return true;
}
</script>
</head>
<body>
	<%@ page import = "java.sql.*, javax.servlet.*, javax.servlet.http.*, userDefined.*" %>
	<%! int questionNumber = 0; %>
	<% int buckets[];
		buckets = new int[6];
		for(int i = 0; i < 6; i++){
			buckets[i] = 0;
		}
		for(int i = 0; i < 6; i++){
			System.out.println("bucket["+i+"] = "+buckets[i]);
		}
		String temp = request.getParameter("QID");
		int qid = Integer.parseInt(temp);
		questionNumber += qid;
		System.out.println("questionNumber = "+questionNumber+"\nqid = "+qid);
		Question display= new Question(questionNumber);
		session = request.getSession(false);
		session.setAttribute("currentQID", questionNumber);
		display.getQuestion(questionNumber);
	%>
	<div id="center2">
	<% if(questionNumber <= 8){ %>
	<div id="center2">
		<p style="font-weight: bold; font-size: 22px"><%= display.question %></p><br><br>
	</div>
	<div id="center22"><form name="Form">
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
  <input type="radio" name="id" id="id1" value="6">
  <label for="id1"><%= display.option6 %></label>
  <br><br>
	 <button type="button" onclick="setResponse(1)">Next</button>
	 <%	}
		else{
			RequestDispatcher req = request.getRequestDispatcher("/bucketSelector");
	    	req.include(request, response);
		}
	%>
</form></div>
	</div>
	<div id="response"></div>
</body>
</html>