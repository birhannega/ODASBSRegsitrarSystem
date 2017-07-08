/*    */ package model;
/*    */ 
/*    */ import databaseConnection.Dbconnection;
/*    */ import java.sql.Connection;
/*    */ import java.sql.PreparedStatement;
/*    */ import java.sql.SQLException;
/*    */ 
/*    */ public class Sectioning
/*    */ {
/*  8 */   static boolean isAssigned = false;
/*    */   
/*    */   public static boolean AssignSection(String Grade, String Section, String StudentID)
/*    */     throws SQLException
/*    */   {
/* 11 */     Dbconnection dbcon = new Dbconnection();
/*    */     try
/*    */     {
/* 13 */       Connection connection = dbcon.getConnection();
/*    */       
/* 15 */       String sql = "update TBL_student set section_id=? where Stud_id=? and Grade=?";
/* 16 */       PreparedStatement pstatement = connection.prepareStatement(sql);
/*    */       
/* 18 */       pstatement.setString(1, Section);
/* 19 */       pstatement.setString(2, StudentID);
/* 20 */       pstatement.setString(3, Grade);
/*    */       
/* 22 */       int rowsaffecetd = pstatement.executeUpdate();
/* 23 */       if (rowsaffecetd >= 1) {
/* 25 */         isAssigned = true;
/*    */       }
/*    */     }
/*    */     catch (ClassNotFoundException e)
/*    */     {
/* 31 */       e.printStackTrace();
/*    */     }
/* 34 */     return isAssigned;
/*    */   }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     model.Sectioning
 * JD-Core Version:    0.7.0.1
 */