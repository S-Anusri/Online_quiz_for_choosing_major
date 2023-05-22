<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="subjectsList">
     <form name="RegForm" method="post" action="registrationHandler">
          <table>
          <tr><td><label for="name">Enter your Name: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label>
          <td><input type="text" placeholder="Enter your name" id="name" name="name">
          <span class="error">* </span></td></tr>
          <tr><td><label for="pno">Enter your Ph.Number:  &nbsp;</label>
          <td><input type="text" placeholder="Enter the phone number" id="pno" name="pno">
          <span class="error">* </span></td></tr>
          <tr><td><label for="eid">Enter your Email id:  &nbsp; &nbsp; &nbsp;</label>
          <td><input type="text" placeholder="Enter email id" id="eid" name="eid">
           <span class="error">* </span></td></tr>
          </table>  <br>
          &nbsp;<input type="submit" value="Submit">                        
   </form>
</div>
   <p id="demo" class="error"></p>
   <p id="demo1" class="error"></p>
</body>
</html>