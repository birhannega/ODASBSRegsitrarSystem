     package controller;
     
     import databaseConnection.Dbconnection;
     import java.io.IOException;
     import java.sql.Connection;
     import java.sql.ResultSet;
     import java.sql.SQLException;
     import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

     import javax.servlet.ServletException;
     import javax.servlet.annotation.WebServlet;
     import javax.servlet.http.HttpServlet;
     import javax.servlet.http.HttpServletRequest;
     import javax.servlet.http.HttpServletResponse;
     
     import model.HoomRoomAssignment;
     
     @WebServlet(description="home room assignment", urlPatterns={"/HomeRoomAssignment"})
     public class HrmAssignment
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
	          Date date=new Date();
	          String current_date=date.toString();
	           SimpleDateFormat simpleDateFormat=new SimpleDateFormat("y");
	           String Year=simpleDateFormat.format(date);
	          
	         int Acca_year=Integer.valueOf(Year);
       String grade = request.getParameter("grade"),branch=request.getParameter("branch");
       String section = request.getParameter("section");
       String teacherid = request.getParameter("teacherid");
       String hrid = grade.concat(section).concat(Year);
         
       Dbconnection dbcon = new Dbconnection();
         try
         {
         Connection connection = dbcon.getConnection();
         Statement st = connection.createStatement();
         ResultSet rs = st.executeQuery("select TeacherId from TBL_HomeRoom where TeacherId='" + teacherid + "' and AcadamicYear='"+Acca_year+"' and branch='"+branch+"'");
         if (rs.next())
           {
           request.getSession().setAttribute("Tidexists", "The selected teacher is already homeroom teacher for another class");
           response.sendRedirect("RegistrarOffice/EnrolTeacher.jsp");
           rs.close();
           st.close();
           }
					
           else
           {
          Statement statment = connection.createStatement();
           ResultSet rs_grade = statment.executeQuery("select TeacherId from TBL_HomeRoom where Section_id='" + section + "'and Grade='" + grade + "' and AcadamicYear='"+Acca_year+"' ");
           if (rs_grade.next())
             {
             String alreadyassigned = "This section has already homeroom teacher";
             request.getSession().setAttribute("hralreadyassigned", alreadyassigned);
               
             response.sendRedirect("RegistrarOffice/EnrolTeacher.jsp");
             }
             else
             {
             HoomRoomAssignment HRA = new HoomRoomAssignment();

           /*  Statement statement1=dbcon.getConnection().createStatement();
             ResultSet resultSet=statement1.executeQuery("select  ");*/
             
             int IsAssigned = HRA.AssignHRM(section, teacherid, grade, hrid, current_date,null,Acca_year,branch);
             if (IsAssigned >=1)
               {
               request.getSession().setAttribute("hrsuccess", "The home room teacher successfully assigned");
              response.sendRedirect("RegistrarOffice/EnrolTeacher.jsp");
               
               }
                  
                      
            
             }
           }
         
              }
         catch (ClassNotFoundException|SQLException e)
         {
        e.printStackTrace();
         }
       }
     }


 