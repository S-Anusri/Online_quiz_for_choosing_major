package userDefined;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Question {
	private int QID;
	public String question;
	public String option1;
	public String option2;
	public String option3;
	public String option4;
	public String option5;
	public String option6;
	
	
	public Question(int number) {
		QID = number;
	}
	
	public void getQuestion(int questionCount) {
		try {
			Connection con = connection.create();
			String personality = "SELECT * FROM personality_questions WHERE QID = ?";
			String questions = "SELECT * FROM question_pool WHERE QID = ?";
			con.setAutoCommit(false);
			PreparedStatement query;
			ResultSet rs;
			if(questionCount <= 4) {
				query = con.prepareStatement(personality);
				query.setInt(1, this.QID);
				con.commit();
				rs = query.executeQuery();
				while(rs.next()) {
					this.question = rs.getString("Question");
					this.option1 = rs.getString("Op1");
					this.option2 = rs.getString("Op2");
					this.option3 = rs.getString("Op3");
					this.option4 = rs.getString("Op4");
					this.option5 = rs.getString("Op5");
					this.option6 = rs.getString("Op6");
				}
			}
			else {
				query = con.prepareStatement(questions);
				query.setInt(1, this.QID);
				con.commit();
				rs = query.executeQuery();
				while(rs.next()) {
					this.question = rs.getString("Question");
					this.option1 = rs.getString("Option1");
					this.option2 = rs.getString("Option2");
					this.option3 = rs.getString("Option3");
					this.option4 = rs.getString("Option4");
					this.option5 = rs.getString("Option5");
				}
			}
		}
		catch(SQLException x) {
			x.printStackTrace();
		}
	}
}
