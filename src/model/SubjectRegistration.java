 package model;
 
 import databaseConnection.Dbconnection;
 import java.sql.*;
 
 
 public class SubjectRegistration
 {
   static int status = 0;
   
   public static int register(String name, String id, String grade)
     throws ClassNotFoundException, SQLException
   {
     Dbconnection dbcon = new Dbconnection();
     PreparedStatement ps = dbcon.getConnection().prepareStatement("insert into TBL_SUBJ values(?,?,?)");
     ps.setString(1, id);
     ps.setString(2, name);
     ps.setString(3, grade);
     int rs = ps.executeUpdate();
     if (rs >= 1) {
       status = rs;
     } else {
       status = 0;
     }
     return status;
   }
 }


