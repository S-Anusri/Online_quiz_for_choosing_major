package userDefined;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class bucketSelector
 */
@WebServlet("/bucketSelector")
public class bucketSelector extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	private void setBucket(ResultSet rs, HttpSession session, String bucketName) throws SQLException{
		rs.next();
		int bucket = rs.getInt("buckets");
		System.out.println(bucketName+ " = "+bucket);
		session.setAttribute(bucketName, bucket);
	}
	
	private int bucketClash(Connection con, ResultSet rs, int clashNum) throws SQLException {
		String sql_bucket_freq_clash = "select Options, MAX(QID) from responses where Options = ? group by Options";
		int bucket = 0;
		int options[] = new int[clashNum];
		int i = 0;
		System.out.println("clashNum = " + clashNum);
		while(i < clashNum && rs.next()){
			options[i] = rs.getInt("buckets");
			System.out.println("options["+i+"] = " + options[i]);
			i++;
		}
		int maxQuestion[] = new int[clashNum];
		PreparedStatement bucketClash = con.prepareStatement(sql_bucket_freq_clash);
		ResultSet rs2;
		for(int j = 0; j < clashNum; j++) {
			bucketClash.setInt(1, options[j]);
			rs2 = bucketClash.executeQuery();
			rs2.next();
			maxQuestion[j] = rs2.getInt("MAX(QID)");
		}
		int maxIndex = 0;
		for(int j = 0; j < clashNum; j++) {
			if(maxQuestion[j] > maxQuestion[maxIndex]) {
				maxIndex = j;
			}
		}
		bucket = options[maxIndex];
		return bucket;
	}
	
	private void singleBucketClash(Connection con, ResultSet rs, HttpSession session, int clashedNum, String bucketName) throws SQLException{
		int bucket = bucketClash(con, rs, clashedNum);
		if(bucket == -1) {
			System.out.println(bucketName + " = " + bucket);
		}
		else {
			System.out.println(bucketName+ " = "+bucket);
			session.setAttribute(bucketName, bucket);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try(Connection con = connection.create();){
			//temporary variables used to store and pass values
			String major = "majorBucket";
			String minor = "minorBucket";
			int bucket = 0;
			int numSelected = 0;
			
			String sql = "select buckets from selectedBuckets where UID = ?";
			String sql_max_freq = "select MAX(freq) from selectedBuckets group by freq limit 2";
			
			//getting options selected
			PreparedStatement select = con.prepareStatement(sql);
			int uid = (int)session.getAttribute("sessionID");
			select.setInt(1, uid);
			ResultSet rs = select.executeQuery();
			
			//getting number of different options selected
			PreparedStatement check = con.prepareStatement("select UID, count(*) as selected from selectedBuckets where UID = ? group by UID");
			check.setInt(1, uid);
			ResultSet rs1 = check.executeQuery();
			rs1.next();
			numSelected = rs1.getInt("selected");
			System.out.println("numSelected = " + numSelected);
			
			//deciding the buckets based on selected options and patterns
			if(numSelected > 2){
				
				PreparedStatement getFreq = con.prepareStatement(sql_max_freq);
				ResultSet get = getFreq.executeQuery();
				get.next();
				int freq = get.getInt("MAX(freq)");
				get.next();
				int freq_2 = get.getInt("MAX(freq)");
				get.close();
				
				// 3 different options are selected
				if(numSelected == 3){
					System.out.println("Arrived @ 3");
					if(freq == 6){
						setBucket(rs, session, major);
						singleBucketClash(con, rs, session, 2, minor);
					}
					if(freq == 5){
						setBucket(rs, session, major);
						setBucket(rs, session, minor);
					}
					if(freq == 4){
						setBucket(rs, session, major);
						if(freq_2 == 2) {
							singleBucketClash(con, rs, session, 2, minor);
						}
						if(freq_2 == 3) {
							setBucket(rs, session, minor);
						}
					}
					if(freq == 3) {
						singleBucketClash(con, rs, session, 2, minor);
						setBucket(rs, session, minor);
					}
				}
				// 4 different options are selected
				if(numSelected == 4){
					System.out.println("Arrived @ 4");
					if(freq == 5) {
						setBucket(rs, session, major);
						singleBucketClash(con, rs, session, 3, minor);
					}
					if(freq == 4) {
						setBucket(rs, session, major);
						setBucket(rs, session, minor);
					}
					if(freq == 3) {
						if(freq_2 == 3) {
							singleBucketClash(con, rs, session, 2, major);
							singleBucketClash(con, rs, session, 2, minor);
						}
						if(freq_2 == 2) {
							setBucket(rs, session, major);
							singleBucketClash(con, rs, session, 2, minor);
						}
					}
					if(freq == 2) {
						bucket = bucketClash(con, rs, 2);
						if(bucket == -1) {
							System.out.println("bucket = " + bucket);
						}
						else {
							System.out.println("Major Bucket = "+bucket);
							session.setAttribute("majorBucket", bucket);
							System.out.println("Minor Bucket = "+bucket);
							session.setAttribute("minorBucket", bucket);
						}
					}
				}
				// 5 different options are selected
				if(numSelected == 5){
					System.out.println("Arrived @ 5");
					if(freq == 4) {
						setBucket(rs, session, major);
						singleBucketClash(con, rs, session, 4, minor);
					}
					if(freq == 3) {
						setBucket(rs, session, major);
						setBucket(rs, session, minor);
					}
					if(freq == 2) {
						singleBucketClash(con, rs, session, 3, major);
						singleBucketClash(con, rs, session, 2, minor);
					}
				}
				// 6 different options are selected
				if(numSelected == 6){
					System.out.println("Arrived @ 6");
					if(freq == 3) {
						setBucket(rs, session, major);
						singleBucketClash(con, rs, session, 5, minor);
					}
					if(freq == 2) {
						singleBucketClash(con, rs, session, 2, major);
						singleBucketClash(con, rs, session, 4, minor);
					}
				}
			}
			//2 different options are selected
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
			//only one option is selected for all the questions
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

}
