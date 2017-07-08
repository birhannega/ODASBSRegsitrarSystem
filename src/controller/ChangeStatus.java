 package controller;
 
 import java.io.IOException;
 import java.sql.SQLException;
 import javax.servlet.ServletException;
 import javax.servlet.annotation.WebServlet;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 import model.ActiveStatus;
 
 @WebServlet(urlPatterns={"/ChangeStatus"})
 public class ChangeStatus
   extends HttpServlet
 {
   private static final long serialVersionUID = 1L;
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
   {}
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
   {
     String Status = "Active";String studid = request.getParameter("studid");
     String action = request.getParameter("action");
     try
     {
       int i = ActiveStatus.ReAdmission(Status, studid);
       if (i >= 1)
       {
         request.getSession().setAttribute("Active", "Student Re-Admission Successfully completed");
         response.sendRedirect("RegistrarOffice/StudManagement.jsp?action=" + action);
       }
       else
       {
         request.getSession().setAttribute("notActive", "Re-Admission not successfull");
         response.sendRedirect("RegistrarOffice/StudManagement.jsp?");
       }
     }
     catch (ClassNotFoundException|SQLException e)
     {
      e.printStackTrace();
     }
   }
 }


