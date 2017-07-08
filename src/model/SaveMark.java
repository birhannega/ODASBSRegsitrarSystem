 package model;
 
 import databaseConnection.Dbconnection;
 import java.sql.*;
 public class SaveMark
 {
   static int saved;
   
   public static int SaveTest(String Studid, String type, float total, String tID, String sub_id, String Section, String grade, float mark, float mass,String branch)
     throws ClassNotFoundException, SQLException
   {
     Dbconnection dbcon = new Dbconnection();
     PreparedStatement ps = dbcon.getConnection().prepareStatement("insert into TBL_Test values(?,?,?,?,?,?,?,?,?,?)");
     ps.setString(1, Studid);
     ps.setString(2, type);
     ps.setFloat(3, total);
    ps.setString(4, tID);
    ps.setString(5, sub_id);
     ps.setString(6, Section);
     ps.setString(7, grade);
     ps.setFloat(8, mark);
     ps.setFloat(9, mass);
     ps.setString(10, branch);
    saved = ps.executeUpdate();
    return saved;
   }
 }


