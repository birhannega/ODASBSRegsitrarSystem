     package controller;
     import java.io.IOException;
     import java.sql.SQLException;
     import javax.servlet.ServletException;
     import javax.servlet.annotation.WebServlet;
     import javax.servlet.http.HttpServlet;
     import javax.servlet.http.HttpServletRequest;
     import javax.servlet.http.HttpServletResponse;
    
     import model.BlockUser;
     
     @WebServlet(description="Account blocking", urlPatterns={"/activateAccount"})
     public class ActivateUser
       extends HttpServlet
     {
       private static final long serialVersionUID = 1L;
       
       protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException
       {
      response.getWriter().append("Served at: ").append(request.getContextPath());
       }
       
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException
       {
      String Teacherid = request.getParameter("TeacherID");
      BlockUser blockUser = new BlockUser();
         try
         {
         if (Teacherid != null)
           {
           int rowsAffected = blockUser.ActivateUser(Teacherid);
           if (rowsAffected >= 1)
             {
             request.getSession().setAttribute("Activated", "Account Activated successfully");
           response.sendRedirect("RegistrarOffice/UserManagement.jsp");
             }
             else
             {
        request.getSession().setAttribute("notActivated", "Account not Activated");
            response.sendRedirect("RegistrarOffice/UserManagement.jsp");
             }
           }
           else
           {
         request.getSession().setAttribute("idnotfound", "No teacher id  to block");
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


 