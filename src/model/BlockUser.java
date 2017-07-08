/*    */ package model;
/*    */ 
/*    */ import databaseConnection.Dbconnection;
/*    */ import java.sql.Connection;
/*    */ import java.sql.PreparedStatement;
/*    */ import java.sql.SQLException;
/*    */ 
/*    */ public class BlockUser
/*    */ {
/*    */   public static int result_1;
/*    */   public static int result_2;
/*    */   
/*    */   public int blockuser(String userid)
/*    */     throws ClassNotFoundException, SQLException
/*    */   {
/*  8 */     Dbconnection dbconnection = new Dbconnection();
/*  9 */     Connection connection = dbconnection.getConnection();
/* 10 */     PreparedStatement ps = connection
/* 11 */       .prepareStatement("update TBL_Users set currentState='Blocked' where TeacherId=?");
/* 12 */     ps.setString(1, userid);
/* 13 */     result_1 = ps.executeUpdate();
/* 14 */     return result_1;
/*    */   }
/*    */   
/*    */   public int ActivateUser(String Userid)
/*    */     throws ClassNotFoundException, SQLException
/*    */   {
/* 19 */     Dbconnection dbconnection = new Dbconnection();
/* 20 */     Connection connection = dbconnection.getConnection();
/* 21 */     PreparedStatement ps = connection
/* 22 */       .prepareStatement("update TBL_Users set currentState='Active' where TeacherId=?");
/* 23 */     ps.setString(1, Userid);
/* 24 */     result_2 = ps.executeUpdate();
/* 25 */     return result_2;
/*    */   }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     model.BlockUser
 * JD-Core Version:    0.7.0.1
 */