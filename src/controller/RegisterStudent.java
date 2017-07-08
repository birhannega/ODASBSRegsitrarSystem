 package controller; 
 import databaseConnection.Dbconnection;
 import java.io.IOException;
 import java.sql.Connection;
 import java.sql.ResultSet;
 import java.sql.SQLException;
 import java.sql.Statement;
 import javax.servlet.ServletException;
 import javax.servlet.annotation.WebServlet;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 import model.Studregistration;
 
 @WebServlet(description="studreg", urlPatterns={"/RegisterStudent"})
 public class RegisterStudent
   extends HttpServlet
 {
   private static final long serialVersionUID = 1L;
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
   {
     doPost(request, response);
   }
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
   {
     String branch = request.getParameter("branch");
     String middlename=request.getParameter("mname");
     String Stud_id = null;
     String FirstName = request.getParameter("fname");
     String lastName = request.getParameter("lname");
     String zone = request.getParameter("zone");
     String birhdate = request.getParameter("bdate");
     String Gender = request.getParameter("sex");
     String ContactPerson = request.getParameter("cname");
     String Section_id = "A";
     String Phone = request.getParameter("tel");
     String Address = request.getParameter("address");
     String Status = "active";
     String wereda = request.getParameter("wereda");
     String grade = request.getParameter("grade");
     String hobby = request.getParameter("hobby");
     String odascore = request.getParameter("odascore");
     String AcademicYear = request.getParameter("ayear");
     
     float score = Float.valueOf(odascore).floatValue();
     int Grade = Integer.valueOf(grade).intValue();
     
     int i = 0;
     Dbconnection dbcon = new Dbconnection();
     try
     {
       Connection connection = dbcon.getConnection();
       Statement st_year = connection.createStatement();
       ResultSet rs_year = st_year.executeQuery("select AcademicYear,studiditerator  from TBL_setup where calandar_status=1");
       if (rs_year.next())
       {
         String year = rs_year.getString(1);
         String iterator = rs_year.getString(2);
         if (iterator.length() == 1) {
           iterator = "000" + iterator;
         } else if (iterator.length() == 2) {
           iterator = "00" + iterator;
         } else if (iterator.length() == 3) {
           iterator = "0" + iterator;
         }
         Stud_id = "ODASBS/".concat(iterator) + "/".concat(year);
         
         i = Studregistration.registerStudent(Stud_id, FirstName,middlename, lastName, birhdate, Gender, ContactPerson, 
          AcademicYear, zone, wereda, Phone, Address, Status, Grade, Section_id, hobby, score, branch);
         if (i >= 1)
         {
           Statement update = connection.createStatement();
          update.executeUpdate("update TBL_setup set studiditerator=studiditerator+1");
           
           request.getSession().setAttribute("studregistered", "<span class='alert alert-success'>student registered successfully</span>");
           response.sendRedirect("RegistrarOffice/studeregistration.jsp");
         }
         else
         {
           request.getSession().setAttribute("oops", "student not registered ");
          response.sendRedirect("RegistrarOffice/studeregistration.jsp");
         }
       }
     }
     catch (ClassNotFoundException|SQLException e)
     {
       e.printStackTrace();
     }
   }
 }


