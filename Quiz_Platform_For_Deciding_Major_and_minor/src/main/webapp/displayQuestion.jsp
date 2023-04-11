<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question</title>
</head>
<body>
	<%@ page import = "java.sql.*, javax.servlet.*, javax.servlet.http.*, userDefined.*" %>
	<div class=" prop center1"><a href="homePage.jsp" target="_self">Home</a></div><br>
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
	<div id=quizDiv>
	<div id="center2">
	<% if(questionNumber <= 4){ %>
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
  <input type="radio" name="id" id="id1" value="6">
  <label for="id1"><%= display.option6 %></label>
  <br><br>
  
  <br>
	<% }
		else{
			try(Connection con = connection.create();){
				int bucket = 0;
				String sql = "select buckets from selectedBuckets where UID = ?";
				PreparedStatement select = con.prepareStatement(sql);
				int uid = (int)session.getAttribute("sessionID");
				select.setInt(1, uid);
				ResultSet rs = select.executeQuery();
				PreparedStatement check = con.prepareStatement("select UID, count(*) as selected from selectedBuckets where UID = ? group by UID");
				check.setInt(1, uid);
				ResultSet rs1 = check.executeQuery();
				rs1.next();
				int numSelected = 0;
				numSelected = rs1.getInt("selected");
				System.out.println("numSelected = " + numSelected);
				if(numSelected > 2){
					if(numSelected == 3){
						System.out.println("Arrived @ 3");
						rs.next();
						bucket = rs.getInt("buckets");
						System.out.println("Major Bucket = "+bucket);
						session.setAttribute("majorBucket", bucket);
						while(rs.next()){
							bucket = rs.getInt("buckets");
							System.out.println("Bucket = " + bucket);
						}
						System.out.println("Minor Bucket = "+bucket);
						session.setAttribute("minorBucket", bucket);
					}
					if(numSelected == 4){
						System.out.println("Arrived @ 4");
						rs.next();
						rs.next();
						rs.next();
						bucket = rs.getInt("buckets");
						System.out.println("Minor Bucket = "+bucket);
						session.setAttribute("minorBucket", bucket);
						rs.next();
						bucket = rs.getInt("buckets");
						System.out.println("Major Bucket = "+bucket);
						session.setAttribute("majorBucket", bucket);
					}
				}
				else if(numSelected == 2){
					System.out.println("Arrived @ 2");
					rs.next();
					bucket = rs.getInt("buckets");
					System.out.println("Major Bucket = "+bucket);
					session.setAttribute("majorBucket", bucket);
					rs.next();
					bucket = rs.getInt("buckets");
					System.out.println("Minor Bucket = "+bucket);
					session.setAttribute("minorBucket", bucket);
				}
				else {
					System.out.println("Arrived @ 1");
					rs.next();
					bucket = rs.getInt("buckets");
					System.out.println("Major Bucket = "+bucket);
					session.setAttribute("majorBucket", bucket);
					System.out.println("Minor Bucket = "+bucket);
					session.setAttribute("minorBucket", bucket);
				}
				RequestDispatcher req = request.getRequestDispatcher("/questionSetSelector");
	  	        req.include(request,  response);
			}
			catch(SQLException e){
				e.printStackTrace();
			}
	 	} 
	 %>
	 <button type="button" onclick="setResponse(1)">Next</button>
</form>
	</div>
	</div>
	<div id="response"></div>
</body>
</html>