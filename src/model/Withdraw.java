 package model;
 
 import databaseConnection.Dbconnection;
 import java.sql.*;

 public class Withdraw
 {
   static int withdraw;
   
   public static int StudentWithdraw(String Status, String Studid)
     throws ClassNotFoundException, SQLException
   {
     Dbconnection dbcon = new Dbconnection();
     PreparedStatement pswithdraw = dbcon.getConnection().prepareStatement("update TBL_student set Status=?  where Stud_id=?");
    pswithdraw.setString(1, Status);
     pswithdraw.setString(2, Studid);
    
     withdraw = pswithdraw.executeUpdate();
     return withdraw;
   }
 }


