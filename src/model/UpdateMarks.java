/*    */ package model;
/*    */ 
/*    */ import databaseConnection.Dbconnection;
/*    */ import java.sql.Connection;
/*    */ import java.sql.PreparedStatement;
/*    */ import java.sql.SQLException;
/*    */ 
/*    */ public class UpdateMarks
/*    */ {
/*    */   int updated;
/*    */   int edited;
/*    */   
/*    */   public int RegisterMark(String id, String grade, String section, String teacherid, int year, String semister, float total, String subid,String branch)
/*    */     throws ClassNotFoundException, SQLException
/*    */   {
/* 16 */     Dbconnection dbcon = new Dbconnection();
/* 17 */     Connection connection = dbcon.getConnection();
/*    */     
/* 19 */     String query = "insert into TBL_mark values(?,?,?,?,?,?,?,?,?)";
/* 20 */     PreparedStatement ps = connection.prepareStatement(query);
/*    */     
/* 22 */     ps.setString(1, id);
/* 23 */     ps.setString(2, grade);
/* 24 */     ps.setString(3, section);
/* 25 */     ps.setString(4, teacherid);
/* 26 */     ps.setInt(5, year);
/* 27 */     ps.setString(6, semister);
/* 28 */     ps.setFloat(7, total);
/* 29 */     ps.setString(8, subid);
/*    */      ps.setString(9, branch);
/* 31 */     this.updated = ps.executeUpdate();
/* 32 */     return this.updated;
/*    */   }
/*    */   
/*    */   public int EditMark(String StudentID, String grade, String section, String teacherid, String year, String semister, float total, float average, int rank, String status, String sub1, String sub2, String sub3, String sub4, String sub5, String sub6, String sub7, String sub8, String sub9, String sub10, String sub11, String sub12)
/*    */     throws ClassNotFoundException, SQLException
/*    */   {
/* 41 */     Dbconnection dbcon = new Dbconnection();
/* 42 */     Connection connection = dbcon.getConnection();
/*    */     
/* 44 */     String queryedit = "update TBL_mark set Stud_id ";
/* 45 */     PreparedStatement psedit = connection.prepareStatement(queryedit);
/*    */     
/* 47 */     psedit.setString(1, StudentID);
/* 48 */     psedit.setString(2, grade);
/* 49 */     psedit.setString(3, section);
/*    */     
/* 51 */     psedit.setString(4, teacherid);
/* 52 */     psedit.setString(5, year);
/* 53 */     psedit.setString(6, semister);
/* 54 */     psedit.setFloat(7, total);
/* 55 */     psedit.setFloat(8, average);
/* 56 */     psedit.setInt(9, rank);
/* 57 */     psedit.setString(10, status);
/*    */     
/* 59 */     psedit.setString(11, sub1);
/* 60 */     psedit.setString(12, sub2);
/* 61 */     psedit.setString(13, sub3);
/* 62 */     psedit.setString(14, sub4);
/* 63 */     psedit.setString(15, sub5);
/* 64 */     psedit.setString(16, sub6);
/* 65 */     psedit.setString(17, sub7);
/* 66 */     psedit.setString(18, sub8);
/* 67 */     psedit.setString(19, sub9);
/* 68 */     psedit.setString(20, sub10);
/* 69 */     psedit.setString(21, sub11);
/* 70 */     psedit.setString(22, sub12);
/* 71 */     this.updated = psedit.executeUpdate();
/* 72 */     return this.edited;
/*    */   }
/*    */   
/*    */   public int saveTotal(String id, String grade, float total, float average, int rank, String section, String semister, String pf, String teacher, int year,String branch)
/*    */     throws ClassNotFoundException, SQLException
/*    */   {
/* 77 */     Dbconnection dbcon = new Dbconnection();
/* 78 */     Connection connection = dbcon.getConnection();
/* 79 */     PreparedStatement ps_save = connection.prepareStatement("insert into TBL_Total_Mark values (?,?,?,?,?,?,?,?,?,?,?) ");
/* 80 */     int saved = 0;
/*    */     
/* 82 */     ps_save.setString(1, id);
/* 83 */     ps_save.setString(2, grade);
/* 84 */     ps_save.setFloat(3, total);
/* 85 */     ps_save.setFloat(4, average);
/* 86 */     ps_save.setInt(5, rank);
/* 87 */     ps_save.setString(6, section);
/* 88 */     ps_save.setString(7, semister);
/* 89 */     ps_save.setString(8, pf);
/* 90 */     ps_save.setString(9, teacher);
/* 91 */     ps_save.setInt(10, year);
/*    */         ps_save.setString(11, branch);
/*    */ 
/* 94 */     saved = ps_save.executeUpdate();
/* 95 */     return saved;
/*    */   }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     model.UpdateMarks
 * JD-Core Version:    0.7.0.1
 */