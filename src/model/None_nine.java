 package model;
 
 import databaseConnection.Dbconnection;
 import java.sql.*;

 
 public class None_nine
 {
   public static int result;
   
   public static int register(String Id, String Grade, String section, String year)
     throws SQLException, ClassNotFoundException
   {
     Dbconnection dbcon = new Dbconnection();
     PreparedStatement ps = dbcon.getConnection().prepareStatement("update TBL_Student set AcademicYear=?,Grade=?, Section_id=? where  Stud_id=?");
    ps.setString(1, year);
     ps.setString(2, Grade);
    ps.setString(3, section);
     ps.setString(4, Id);
     result = ps.executeUpdate();
     return result;
   }
 }


