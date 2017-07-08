/*    */ package model;
/*    */ 
/*    */ import databaseConnection.Dbconnection;
/*    */ import java.sql.*; 
/*    */ public class ChangePassword
/*    */ {
/* 11 */   static int passchanged = 0;

	/*    */
	/*    */ public int changePassword(String new_password, String tID, String user, String old_pass)
			/*    */ throws ClassNotFoundException, SQLException
	/*    */ {
		/* 14 */ Dbconnection dbconnection = new Dbconnection();
		/* 15 */ Connection connection = dbconnection.getConnection();
		/* 16 */ PreparedStatement ps = connection
				.prepareStatement("update TBL_Users set password=? where TeacherId=? and userName=? and password=?");
		/* 17 */ ps.setString(1, new_password);
		/* 18 */ ps.setString(2, tID);
		/* 19 */ ps.setString(3, user);
		/* 20 */ ps.setString(4, old_pass);
		/* 21 */ passchanged = ps.executeUpdate();
		/* 22 */
		/* 23 */ return passchanged;
		/*    */ }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     model.ChangePassword
 * JD-Core Version:    0.7.0.1
 */