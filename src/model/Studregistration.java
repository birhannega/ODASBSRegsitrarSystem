/*    */ package model;
/*    */ 
/*    */ import databaseConnection.Dbconnection;

/*    */ import java.sql.Connection;
/*    */ import java.sql.PreparedStatement;
import java.sql.SQLException;
/*    */ 
/*    */ public class Studregistration
/*    */ {

/*    */   public static int registerStudent(String stud_id, String firstName, String middlename,String lastName, String birhdate, String gender, String contactPerson, String academicYear, String zone, String wereda, String phone, String address, String status, int grade, String section_id, String hobby, float odascore, String branch)
/*    */   {
/* 12 */     int rowsaffected = 0;
/*    */     try
/*    */     {
/* 15 */       Dbconnection dbcon = new Dbconnection();
/*    */       
/* 17 */       PreparedStatement ps = dbcon.getConnection().prepareStatement("insert into TBL_student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
/* 18 */       ps.setString(1, stud_id);
/* 19 */       ps.setString(2, firstName);
                ps.setString(3, middlename);
/* 20 */       ps.setString(4, lastName);
/*    */       
/* 22 */       ps.setString(5, birhdate);
/* 23 */       ps.setString(6, gender);
/* 24 */       ps.setString(7, contactPerson);
/*    */       
/* 26 */       ps.setString(8, academicYear);
/* 27 */       ps.setString(9, zone);
/* 28 */       ps.setString(10, wereda);
/*    */       
/* 30 */       ps.setString(11, phone);
/* 31 */       ps.setString(12, address);
/* 32 */       ps.setString(13, status);
/*    */       
/* 34 */       ps.setInt(14, grade);
/* 35 */       ps.setString(15, section_id);
/* 36 */       ps.setString(16, hobby);
/* 37 */       ps.setFloat(17, odascore);
/* 38 */       ps.setString(18, branch);
/*    */       
/*    */ 
/* 41 */       rowsaffected = ps.executeUpdate();
/*    */     }
/*    */     catch (Exception e)
/*    */     {
/* 47 */       System.out.println(e.getMessage());
/*    */     }
     return rowsaffected;
           }
int checker;
public int EditStudProfile(String FirstName,String middlename,String lastname,String bdate,
		   String gender,String ContactPerson,String AcademicYear,String zone,String wereda,
		   String phone,String address, String Status, String section,String odascore, String id) throws ClassNotFoundException
{
	   Dbconnection dbconnection=new Dbconnection();
	   Connection connection=dbconnection.getConnection();
	   String updatesql="update tbl_student "
	   		+ "set "
	   		+ "FirstName=?,"
	   		+ "MiddleName=?,"
	   		+ "LastName=?,"
	   		+ "Birthdate=?,"
	   		+ "Gender=?,"
	   		+ "ContactPerson=?,"
	   		+ "AcademicYear=?,"
	   		+ "zone=?,"
	   		+ "wereda=?,"
	   		+ "phone=? , "
	   		+ "address=?, "
	   	    + "Status=?, "
			+ "Section_id=?, "
			+ "odascore=? "
	   		+ "where Stud_id=?";
	   try {
		PreparedStatement ps_update=connection.prepareStatement(updatesql);
		
		ps_update.setString(1, FirstName);
		ps_update.setString(2, middlename);
		ps_update.setString(3, lastname);
		ps_update.setString(4, bdate);
		ps_update.setString(5, gender);
		
		ps_update.setString(6, ContactPerson);
		ps_update.setString(7, AcademicYear);
		ps_update.setString(8, zone);
		ps_update.setString(9, wereda);
		ps_update.setString(10, phone);
		ps_update.setString(11, address);
		
		ps_update.setString(12, Status);
		ps_update.setString(13, section);
		ps_update.setString(14, odascore);
		ps_update.setString(15, id);
		checker=ps_update.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return checker;

	   
}
/*    */ }


