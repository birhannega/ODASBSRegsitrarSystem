 package model;
 
 import databaseConnection.Dbconnection;
 import java.sql.*;

 
 public class subject_teacher
 {
   public static int AssignTeacher(String Teacher_id, String subject_id, int Grade, String Section, int year, String branch)
     throws SQLException, ClassNotFoundException
   {
    int status = 0;
     try
     {
      Dbconnection dbcon = new Dbconnection();
       PreparedStatement ps = dbcon.getConnection().prepareStatement("insert into TBL_Subject_Teacher values(?,?,?,?,?,?)");
       
       ps.setString(1, Teacher_id);
       ps.setString(2, subject_id);
       ps.setInt(3, Grade);
       ps.setString(4, Section);
       ps.setInt(5, year);
       ps.setString(6, branch);
       
       int rs = ps.executeUpdate();
      if (rs >= 1) {
         status = rs;
       }
     }
     catch (ClassNotFoundException|SQLException localClassNotFoundException) {}
     return status;
   }
 }


