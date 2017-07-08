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
     import model.Sectioning;
     
     @WebServlet({"/sectioning"})
     public class AssignSection
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
         
       String section = null;
      String section_size = request.getParameter("size");
       int size = Integer.valueOf(section_size).intValue();
         
       Dbconnection dbcon = new Dbconnection();
         try
         {
         Connection connection = dbcon.getConnection();
        Statement statement = connection.createStatement();
           
        String query = "select Stud_id from TBL_student where Grade='" + grade + "'";
        ResultSet rs = statement.executeQuery(query);
         while (rs.next())
           {
           for (int i = 0; i <= size; i++) {
             section = "A";
             }
           String studentid = rs.getString(1);
             
           boolean rs_up = Sectioning.AssignSection(grade, section, studentid);
           if (rs_up)
             {
             request.setAttribute("SectionAssigned", "Section updated successfully");
             request.getRequestDispatcher("RegistrarOffice/section.jsp").include(request, response);
             }
           }
         request.setAttribute("SectionnotAssigned", "Section updated successfully");
         request.getRequestDispatcher("RegistrarOffice/section.jsp").include(request, response);
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


 