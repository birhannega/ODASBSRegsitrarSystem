/*    */ package model;

/*    */
/*    */ import databaseConnection.Dbconnection;
/*    */
/*    */ import java.sql.PreparedStatement;
/*    */ import java.sql.ResultSet;
import java.sql.SQLException;

/*    */
/*    */ public class AuthenticateUser
/*    */ {
	/* 6 */ static String encriptedpass = null;
	/*    */ static Dbconnection dbcon = new Dbconnection();

	/*    */ public static boolean validate(String name, String password, String branch, String type)
			/*    */ throws Exception
	/*    */ {
		/* 9 */ boolean status = false;
		/*    */ try
		/*    */ {
			/* 12 */
			/* 13 */ PreparedStatement ps = dbcon.getConnection().prepareStatement(
					"select * from TBL_Users where userName=? and password=? and branch=? and type=? and currentState='active' ");
			/* 14 */ ps.setString(1, name);
			/* 15 */ ps.setString(2, password);
			/* 16 */ ps.setString(3, branch);
			/* 17 */ ps.setString(4, type);
			/* 18 */ ResultSet rs = ps.executeQuery();
			/* 19 */ status = rs.next();
			/*    */ }
		/*    */ catch (Exception e)
		/*    */ {
			/* 23 */ System.out.println(e);
			/*    */ }
		/* 24 */ return status;
		/*    */ }

	public  int closeAccount(String Id) {
		try {
			PreparedStatement ps_close = dbcon.getConnection()
					.prepareStatement("update TBL_Users set [currentState]='closed' where TeacherID=?");
			ps_close.setString(1, Id);
			int i = ps_close.executeUpdate();
			if (i >= 1) {
				return 1;
			} else {
				return 0;
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}

		return 0;

	}
	/*    */ }

/*
 * Location: C:\workspace\ODASBS\WebContent\WEB-INF\classes\ Qualified Name:
 * model.AuthenticateUser JD-Core Version: 0.7.0.1
 */