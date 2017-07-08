 package model;
 
 import databaseConnection.Dbconnection;
 import java.sql.*;

 
 public class GetSection
 {
   String id;
   String section;
   String Grade;
   String subject;
   boolean gs;
   
   public boolean GetClass_section(String Grade, String section)
     throws ClassNotFoundException, SQLException
   {
     Dbconnection connection = new Dbconnection();
     String query = "select * from TBL_mark where Grade=? and Section_id=?  ";
     PreparedStatement pssection = connection.getConnection().prepareStatement(query);
     this.gs = pssection.execute();
     
     return this.gs;
   }
 }


