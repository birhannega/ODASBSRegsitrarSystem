 package controller;
 
 import databaseConnection.Dbconnection;
 import java.io.IOException;
 import java.io.InputStream;
 import java.sql.Blob;
 import java.sql.ResultSet;
 import java.sql.Statement;
 import javax.servlet.ServletException;
 import javax.servlet.ServletOutputStream;
 import javax.servlet.annotation.WebServlet;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 import javax.servlet.http.HttpSession;
 
 @WebServlet({"/imagetestServlet"})
 public class imagetestServlet
   extends HttpServlet
 {
   private static final long serialVersionUID = 1L;
   
   public void doGet(HttpServletRequest request, HttpServletResponse response)
     throws IOException, ServletException
   {
       Blob image = null;
       Statement stmt = null;
      ResultSet rs = null;
       Dbconnection db = new Dbconnection();
       ServletOutputStream out = response.getOutputStream();
     try
     {
         String id = request.getParameter("picid");
        stmt = db.getConnection().createStatement();
        HttpSession session = request.getSession();
         String ActiveUser = (String)session.getAttribute("user");
        Statement statement = db.getConnection().createStatement();
        ResultSet res = statement.executeQuery("select TeacherId from TBL_Users where userName='" + ActiveUser + "'");
       if (res.next())
       {
         String teacherid = res.getString(1);
           out.println(teacherid);
         
          rs = stmt.executeQuery("select image from TBL_teacher where TeacherId= 'r/000/2009'");
           if (rs.next())
         {
           image = rs.getBlob(1);
         }
         else
         {
            response.setContentType("text/html");
            out.println("image not found for given id" + id);
            return;
         }
          response.setContentType("image/gif");
          InputStream in = image.getBinaryStream();
          int length = (int)image.length();
         int bufferSize = 1024;
           byte[] buffer = new byte[bufferSize];
           while ((length = in.read(buffer)) != -1) {
             out.write(buffer, 0, length);
         }
          in.close();
           out.flush();
       }
     }
     catch (Exception e)
     {
       response.setContentType("text/html");
        out.println("");
         out.println("color='red'>Image Display Error=" + e.getMessage() + " ");
         return;
     }
   }
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
   {}
 }


 