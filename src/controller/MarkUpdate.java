      package controller;
      
      import databaseConnection.Dbconnection;
      import java.io.IOException;
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
      import model.UpdateMarks;
      
      @WebServlet(description="mark update", urlPatterns={"/UpdateMark"})
      public class MarkUpdate
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
        String status = null;
              String branch=request.getParameter("branch");
        String id = request.getParameter("studentid");
        String grade = request.getParameter("grade");
        String section = request.getParameter("section");
        String teacherid = request.getParameter("teacherid");
        String semister = request.getParameter("semister");
          
      Date date = new Date();
       SimpleDateFormat sdf = new SimpleDateFormat("Y");
        String year = sdf.format(date);
       int Year = Integer.valueOf(year).intValue() - 7;
          
       float average = 0.0F;
        int rank = 1;
          
        UpdateMarks upmark = new UpdateMarks();
          
      
        Dbconnection connection = new Dbconnection();
          try
          {
          Statement statement = connection.getConnection().createStatement();
         ResultSet RsCheckIfIdExists = statement.executeQuery(
           "select Stud_id from TBL_mark where Stud_id='" + id + "'and semister='" + semister + "' and Grade='" + grade + "' ");
          if (RsCheckIfIdExists.next())
            {
            request.getSession().setAttribute("AlreadyInserted", "This students' result is already inserted ");
              
            response.sendRedirect("Teacher/Markform.jsp?semister=" + semister);
            }
            else
            {
              try
              {
              String scalemark = null;
              float scale = 0.0F;
                
              String oro = request.getParameter("subject0");String Am = request.getParameter("subject1");
              String bio = request.getParameter("subject2");String chem = request.getParameter("subject3");
              String chin = request.getParameter("subject4");String civ = request.getParameter("subject5");
            String draw = request.getParameter("subject6");String eng = request.getParameter("subject7");
             String hpe = request.getParameter("subject8");String ict = request.getParameter("subject9");
            String maths = request.getParameter("subject10");String phy = request.getParameter("subject11");
                
           float M_oro = Float.valueOf(oro).floatValue();float M_am = Float.valueOf(Am).floatValue();float M_maths = Float.valueOf(maths).floatValue();
             float M_eng = Float.valueOf(eng).floatValue();float M_bio = Float.valueOf(bio).floatValue();float M_chem = Float.valueOf(chem).floatValue();
            float M_phy = Float.valueOf(phy).floatValue();float M_draw = Float.valueOf(draw).floatValue();float M_civ = Float.valueOf(civ).floatValue();
              float M_it = Float.valueOf(ict).floatValue();float M_chin = Float.valueOf(chin).floatValue();float M_hpe = Float.valueOf(hpe).floatValue();
                
              float total_mark = 0.0F;
                
      
              String Aforomo = request.getParameter("sub0");String Amharic = request.getParameter("sub1");
              String Biology = request.getParameter("sub2");String Chemistry = request.getParameter("sub3");
              String Chinese = request.getParameter("sub4");String civics = request.getParameter("sub5");
              String drawing = request.getParameter("sub6");String English = request.getParameter("sub7");
              String Hpe = request.getParameter("sub8");String it = request.getParameter("sub9");
              String Mathematics = request.getParameter("sub10");String physics = request.getParameter("sub11");
                
              int isSaved = 0;
              int total_saved = 0;
             for (int i = 0; i < 12; i++)
                {
               String[] subjects = { Aforomo, Amharic, Biology, Chemistry, Chinese, civics, drawing, English, Hpe, it, Mathematics, physics };
                  
               float[] mark = { M_oro, M_am, M_bio, M_chem, M_chin, M_civ, M_draw, M_eng, M_hpe, M_it, M_maths, M_phy };
                  
               total_mark += mark[i];
              isSaved = upmark.RegisterMark(id, grade, section, teacherid, Year, semister, mark[i], subjects[i],branch);
                }
             average = total_mark / 12.0F;
             Statement stscale = connection.getConnection().createStatement();
             ResultSet rsscale = stscale.executeQuery("select min_ave from TBL_policy where Grade='" + grade+"' ");
             if (rsscale.next())
                {
               scalemark = rsscale.getString(1);
               scale = Float.valueOf(scalemark).floatValue();
                }
            if (average >= scale) {
               status = "pass";
                } else {
              status = "failed";
                }
                      //// i have something to do here
            total_saved = upmark.saveTotal(id, grade, total_mark, average, rank, semister, section, status, teacherid, Year,branch);
           if ((isSaved >= 1) && (total_saved >= 1))
                {
              request.getSession().setAttribute("updted", "Student mark  successfully Saved");
               response.sendRedirect("Teacher/Markform.jsp?semister=" + semister);
                }
                else
                {
               request.getSession().setAttribute("nupdted", "mark  update not successfull");
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
            return;
          }
          catch (ClassNotFoundException|SQLException e1)
          {
         e1.printStackTrace();
          }
        }
      }


 