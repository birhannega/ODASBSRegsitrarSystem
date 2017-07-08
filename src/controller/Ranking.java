     package controller;
     
     import databaseConnection.Dbconnection;
     import java.io.IOException;
     import java.io.PrintWriter;
  
     import java.sql.*;
   
     import java.util.ArrayList;
     import javax.servlet.ServletException;
     import javax.servlet.annotation.WebServlet;
     import javax.servlet.http.HttpServlet;
     import javax.servlet.http.HttpServletRequest;
     import javax.servlet.http.HttpServletResponse;

     
     @WebServlet({"/RankRefresh"})
     public class Ranking
       extends HttpServlet
     {
       private static final long serialVersionUID = 1L;
       
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException
       {
    String grade = request.getParameter("grade");String year = request.getParameter("year");
         
     String section = request.getParameter("section");
     String semister = request.getParameter("semister");
     String branch=request.getParameter("branch");
     
     int Grade = Integer.valueOf(grade).intValue();
     Dbconnection dbconnection = new Dbconnection();
         try
         {
       int resultsupdated = 0;
        ArrayList<String> list = new ArrayList<String>();
       ArrayList<Float> average = new ArrayList<Float>();
        Statement statement = dbconnection.getConnection().createStatement();
       ResultSet resultSet = statement.executeQuery("select Stud_id,Average from TBL_Total_Mark where Grade='" + 
           Grade + "' " + "and Section_id='" + section + "' and semister='" + semister + 
          "' and AcademicYear='" + year + "' and branch='"+branch+"' order by Average desc");
        if (!resultSet.next())
           {
          PrintWriter out = response.getWriter();
          out.print("no students found");
           }
        int i = 0;
        int first = 0;
        int rank = 0;
        while (resultSet.next())
           {
           list.add(resultSet.getString("Stud_id"));
         average.add(Float.valueOf(resultSet.getFloat("Average")));
          if (rank == 0) {
           rank = 2;
             } else {
            rank = i + 2;
             }
          Statement str = dbconnection.getConnection().createStatement();
          resultsupdated = str.executeUpdate(
           "update TBL_total_Mark set Rank='" + rank + "'where Stud_id='" + (String)list.get(i) + "'");
         i++;
         first = str.executeUpdate("update TBL_total_Mark set Rank=1 where Average=(select max(Average) from TBL_total_Mark)");
           }
         if ((resultsupdated >= 1) && (first >= 1))
           {
     request.getSession().setAttribute("refreshed", "rank of students refreshed successfully");
         response.sendRedirect("Teacher/Markform.jsp?semister=" + semister);
           }
           else
           {
         request.getSession().setAttribute("notrefreshed", "rank of students not refreshed");
         response.sendRedirect("Teacher/Markform.jsp?semister=" + semister);
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

 