 package controller;

 import java.io.IOException;
 import java.sql.SQLException;
 import javax.servlet.ServletException;
 import javax.servlet.annotation.WebServlet;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;

 import model.None_nine;
 @WebServlet({"/Exceptnine"})
 public class Exceptnine
   extends HttpServlet
 {
  private static final long serialVersionUID = 1L;
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
   {}
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
   {
    String grade = request.getParameter("grade");
             int Grade=Integer.valueOf(grade);
    String studentid = request.getParameter("studid");
    String section = "A";
    String year = request.getParameter("year");
     try
     {
       int register = None_nine.register(studentid, grade, section, year);
       if(register>=1)
       {
    	   request.getSession().setAttribute("registered", "student successfully registered");
           response.sendRedirect("RegistrarOffice/studeregistration.jsp?grade="+Grade);
         }
       else
       {
    	   request.getSession().setAttribute("Nregistered", "student not registered");
           response.sendRedirect("RegistrarOffice/GradeTenReg.jsp");
       }
     }
     
     
     catch (SQLException e)
     {
       e.printStackTrace();
     }
     catch (ClassNotFoundException e)
    {
      e.printStackTrace();
     }
   }
 }


