 package controller;
 
 import java.io.IOException;
 import java.sql.SQLException;
 import javax.servlet.ServletException;
 import javax.servlet.annotation.WebServlet;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;

 import model.BlockUser;
 
 @WebServlet(description="Account blocking", urlPatterns={"/ManageAccounts"})
 public class BlockAccount
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
     String Teacherid = request.getParameter("teacherid");
     BlockUser blockUser = new BlockUser();
     try
     {
       if (Teacherid != null)
       {
         int rowsAffected = blockUser.blockuser(Teacherid);
         if (rowsAffected >= 1)
         {
           request.getSession().setAttribute("blocked", "Account blocked successfully");
           response.sendRedirect("RegistrarOffice/UserManagement.jsp");
         }
         else
         {
           request.getSession().setAttribute("notblocked", "Account not blocked");
           response.sendRedirect("RegistrarOffice/UserManagement.jsp");
         }
       }
       else
       {
        request.getSession().setAttribute("idnotfound", "No teacher id  block");
         response.sendRedirect("RegistrarOffice/UserManagement.jsp");
       }
     }
     catch (ClassNotFoundException e)
     {
       e.printStackTrace();
     }
     catch (SQLException e)
     {
       e.printStackTrace();
     }
   }
 }


