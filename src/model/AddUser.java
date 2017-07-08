/*    */ package model;
/*    */ 
/*    */ import databaseConnection.Dbconnection;
/*    */ import java.sql.Connection;
/*    */ import java.sql.PreparedStatement;
/*    */ import java.sql.SQLException;
/*    */ 
/*    */ public class AddUser
/*    */ {
/*    */   public static int result;
/*    */   
/*    */   public int CreateUser(String User, String password, String teacher, String branch, String state, String type)
/*    */     throws ClassNotFoundException, SQLException
/*    */   {
/* 13 */     Dbconnection dbcon = new Dbconnection();
/* 14 */     Connection con = dbcon.getConnection();
/*    */     
/*    */ 
/* 17 */     PreparedStatement ps = con.prepareStatement("insert into TBL_Users values(?,?,?,?,?,?)");
/* 18 */     ps.setString(1, User);
/* 19 */     ps.setString(2, password);
/* 20 */     ps.setString(3, teacher);
/* 21 */     ps.setString(4, branch);
/* 22 */     ps.setString(5, state);
/* 23 */     ps.setString(6, type);
/* 24 */     result = ps.executeUpdate();
/* 25 */     return result;
/*    */   }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     model.AddUser
 * JD-Core Version:    0.7.0.1
 */