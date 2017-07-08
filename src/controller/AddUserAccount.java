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
  
      import model.AddUser;
     
      
      @WebServlet(description="Add user account for teachers", urlPatterns={"/AddUserAccount"})
      public class AddUserAccount
        extends HttpServlet
      {
        private static final long serialVersionUID = 1L;
        byte[] encriptedpass;
        
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException
        {
        doPost(request, response);
        }
        
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException
        {
        String status = "Active";String TeacherID = request.getParameter("teacherid");
        String Username = request.getParameter("username1");
        String Password = request.getParameter("password1");
        String branch = request.getParameter("branch");
          
        String type = request.getParameter("type");
          
      
      
        //SecretKey secKey = null;
          try
          {
          //secKey = AESEncryption.getSecretEncryptionKey();
          }
          catch (Exception e2)
          {
          e2.printStackTrace();
          }
          try
          {
         // this.encriptedpass = AESEncryption.encryptText(Password, secKey);
          }
          catch (Exception e1)
          {
          e1.printStackTrace();
          }
        Dbconnection dbcon = new Dbconnection();
          try
          {
          Connection con = dbcon.getConnection();
          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery("select userName from TBL_Users where userName='" + Username + "'");
          if (rs.next())
            {
            request.getSession().setAttribute("UserNameexists", "user name already exists");
            response.sendRedirect("RegistrarOffice/AddUseraccount.jsp");
            }
            else
            {
            ResultSet rs1 = st.executeQuery("select TeacherId from TBL_Users where TeacherId='" + TeacherID + "'");
            if (rs1.next())
              {
             String idexists = "Teacher id already exists";
              request.getSession().setAttribute("idexists", idexists);
             response.sendRedirect("RegistrarOffice/AddUseraccount.jsp");
              }
              else
              {
            AddUser adduser = new AddUser();
                
      
      
              int actionPerformed = adduser.CreateUser(Username, Password, TeacherID, branch, status, type);
              if (actionPerformed >= 1)
                {
              String Created = "User account created successfully";
                request.getSession().setAttribute("added", Created);
                response.sendRedirect("RegistrarOffice/AddUseraccount.jsp");
                }
                else
                {
               String notCreated = "User account not created";
               request.getSession().setAttribute("notadded", notCreated);
               response.sendRedirect("RegistrarOffice/AddUseraccount.jsp");
               return;
                }
              }
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


 