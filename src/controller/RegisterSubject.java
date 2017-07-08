/*    */ package controller;
/*    */ 
/*    */ import databaseConnection.Dbconnection;
/*    */ import java.io.IOException;
/*    */ import java.io.PrintWriter;
/*    */ import java.sql.Connection;
/*    */ import java.sql.ResultSet;
/*    */ import java.sql.SQLException;
/*    */ import java.sql.Statement;
/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.annotation.WebServlet;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */
/*    */ import model.SubjectRegistration;
/*    */ 
/*    */ @WebServlet(description="register subject", urlPatterns={"/RegisterSubject"})
/*    */ public class RegisterSubject
/*    */   extends HttpServlet
/*    */ {
/*    */   private static final long serialVersionUID = 1L;
/*    */   
/*    */   protected void doGet(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {}
/*    */   
/*    */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {
/* 36 */     String grade = request.getParameter("grade");
/* 37 */     String name = request.getParameter("sub_name");
/*    */     
/* 39 */     String id = name.concat(grade);
/*    */     
/* 41 */     int result = 0;
/*    */     try
/*    */     {
/* 43 */       Dbconnection dbcon = new Dbconnection();
/* 44 */       Connection connection = dbcon.getConnection();
/* 45 */       Statement statement = connection.createStatement();
/* 46 */       ResultSet resultSet = statement.executeQuery("select Subject_id from TBL_SUBJ where Subject_id='" + id + "'");
/* 47 */       if (resultSet.next())
/*    */       {
/* 49 */         String exists = "<div class='alert alert-warning'>subject already registered</div>";
/* 50 */         request.getSession().setAttribute("subexists", exists);
/* 51 */         response.sendRedirect("RegistrarOffice/Registersubject.jsp");
/*    */       }
/*    */       else
/*    */       {
/* 56 */         result = SubjectRegistration.register(name, id, grade);
/*    */         
/* 58 */         PrintWriter out = response.getWriter();
/* 59 */         out.print(result);
/* 60 */         if (result >= 1)
/*    */         {
/* 62 */           String resmessage = "<div class='alert alert-success'>subject registered successfully</div>";
/* 63 */           request.getSession().setAttribute("subregistered", resmessage);
/* 64 */           response.sendRedirect("RegistrarOffice/Registersubject.jsp");
/*    */         }
/*    */         else
/*    */         {
/* 69 */           request.getSession().setAttribute("err", "<div class='alert alert-danger'>Subject registration not successful</div>");
/* 70 */           response.sendRedirect("RegistrarOffice/Registersubject.jsp");
/*    */         }
/*    */       }
/*    */     }
/*    */     catch (ClassNotFoundException|SQLException e)
/*    */     {
/* 81 */       e.printStackTrace();
/*    */     }
/*    */   }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     controller.RegisterSubject
 * JD-Core Version:    0.7.0.1
 */