/*    */ package model;
/*    */ 
/*    */ import databaseConnection.Dbconnection;
/*    */ import java.sql.Connection;
       
/*    */ import java.sql.PreparedStatement;
/*    */ import java.sql.SQLException;

/*    */ 
/*    */ public class HoomRoomAssignment
/*    */ {
/*  6 */   public static int result = 0;
/*    */   
/*    */   public int AssignHRM(String section, String teacherid, String grade, String hrid,String startDate,String endDate,int Year,String Branch)
/*    */     throws ClassNotFoundException, SQLException
/*    */   {
/*  9 */     Dbconnection dbcon = new Dbconnection();
/* 10 */     Connection con = dbcon.getConnection();
/* 11 */     PreparedStatement ps = con.prepareStatement("insert into TBL_HomeRoom values(?,?,?,?,?,?,?,?)");
/*    */      ps.setString(1, hrid);
/* 13 */     ps.setString(2, section);
/* 14 */     ps.setString(3, teacherid);
/* 15 */     ps.setString(4, grade);
/* 16 */     
             ps.setString(5,  startDate);
             ps.setString(6,  endDate);
             ps.setInt(7, Year);
             ps.setString(8, Branch);
/*    */     
/* 18 */     result = ps.executeUpdate();
/*    */     
/* 20 */     return result;
/*    */   }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     model.HoomRoomAssignment
 * JD-Core Version:    0.7.0.1
 */