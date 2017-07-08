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
import model.SaveMark;

@WebServlet({"/SaveTestResult"})
public class SaveStudTestResult
  extends HttpServlet
{
  private static final long serialVersionUID = 1L;
   int ISsaved = 0;
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
     response.sendRedirect("Teacher/Testpanel.jsp");
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {  String branch=request.getParameter("branch");
     String testtype = request.getParameter("test");
    String teacherid = request.getParameter("teacherid");
     String studentid = request.getParameter("studid");
     String subjectid = request.getParameter("subid");
     String section = request.getParameter("section");
     String grade = request.getParameter("grade");
     float mark = Float.valueOf(request.getParameter("obtainedMark")).floatValue();
     float total = 0.0F;
     total = Float.valueOf(mark).floatValue();
    String res_Grade;
    
    if (grade.equals("9")) {
       res_Grade = "09";
    } else {
       res_Grade = grade;
    }
     float mass = 0.0F;
     if ((testtype.equals("t1")) || (testtype.equals("t2")) || (testtype.equals("pro"))) {
       mass = 10.0F;
     } else if ((testtype.equals("w1")) || (testtype.equals("w2"))) {
       mass = 15.0F;
     } else if (testtype.equals("mid")) {
       mass = 20.0F;
     } else if (testtype.equals("final")) {
       mass = 40.0F;
    } else if (testtype.equals("activity")) {
       mass = 5.0F;
    }
    try
    {
       Dbconnection dbcon = new Dbconnection();
       Connection con = dbcon.getConnection();
       Statement sts = con.createStatement();
       ResultSet rs = sts.executeQuery("select obtainedMark from TBL_Test where Stud_id='" + studentid + "' and type='" + testtype + "'");
       if (rs.next())
      {
         request.getSession().setAttribute("exists", "this students mark is already inserted");
         response.sendRedirect("Teacher/Testpanel.jsp?grade=" + res_Grade + section + "&test=" + testtype);
      }
      else
      {
       this.ISsaved = SaveMark.SaveTest(studentid, testtype, total, teacherid, subjectid, section, grade, mark, mass,branch);
         if ((this.ISsaved == 1))
        {
          if (grade.equals("9")) {
             grade = "0".concat(grade);
          }
           request.getSession().setAttribute("saved", "students' mark is successfully saved");
           response.sendRedirect("Teacher/Testpanel.jsp?grade=" + res_Grade + section + "&test=" + testtype);
        }
        else
        {
           request.getSession().setAttribute("notsaved", "students' mark is not saved");
           response.sendRedirect("Teacher/Testpanel.jsp?grade=" + res_Grade + section + "&test=" + testtype);
          
           return;
        }
      }
    }
    catch (ClassNotFoundException|SQLException e)
    {
       e.printStackTrace();
    }
  }
}



