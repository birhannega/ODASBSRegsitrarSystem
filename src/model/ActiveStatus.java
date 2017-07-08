 package model;
 
 import databaseConnection.Dbconnection;
 import java.sql.*;

 
 public class ActiveStatus
 {
   static int status;
   
   public static int ReAdmission(String id, String stat)
    throws ClassNotFoundException, SQLException
   {
     Dbconnection dbcon = new Dbconnection();
     PreparedStatement ps = dbcon.getConnection().prepareStatement("update TBL_student set Status=? where Stud_id=?");
     ps.setString(1, id);
     ps.setString(2, stat);
     status = ps.executeUpdate();
     return status;
   }
 }


