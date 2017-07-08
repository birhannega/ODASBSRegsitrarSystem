     package model;
     
     import databaseConnection.Dbconnection;
     import java.sql.*;
    
     public class ResignTeacher
     {
       static int resign;
       
       public static int Resign(String Status, String Teacherid)
         throws ClassNotFoundException, SQLException
       {
       Dbconnection dbcon = new Dbconnection();
       PreparedStatement ps = dbcon.getConnection().prepareStatement("update TBL_teacher set Status=? where TeacherId=?");
       ps.setString(1, Status);
      ps.setString(2, Teacherid);
       resign = ps.executeUpdate();
       return resign;
       }
     }


