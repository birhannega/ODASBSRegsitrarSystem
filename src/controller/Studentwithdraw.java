/*    */ package controller;
/*    */ 
/*    */ import java.io.IOException;
/*    */ import java.sql.SQLException;
/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.annotation.WebServlet;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import model.Withdraw;
/*    */ 
/*    */ @WebServlet(urlPatterns={"/Studentwithdraw"})
/*    */ public class Studentwithdraw
/*    */   extends HttpServlet
/*    */ {
/*    */   private static final long serialVersionUID = 1L;
/*    */   
/*    */   protected void doGet(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {
/* 22 */     doPost(request, response);
/*    */   }
/*    */   
/*    */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {
/* 24 */     String Status = "withdraw";String studid = request.getParameter("studid");
/* 25 */     String action = request.getParameter("action");
/*    */     try
/*    */     {
/* 27 */       int iswithdraw = Withdraw.StudentWithdraw(Status, studid);
/* 28 */       if (iswithdraw >= 1)
/*    */       {
/* 29 */         request.getSession().setAttribute("withdraw", "Student Succsessfully withdrawn");
/* 30 */         response.sendRedirect("RegistrarOffice/StudManagement.jsp?action=" + action);
/*    */       }
/*    */       else
/*    */       {
/* 33 */         request.getSession().setAttribute("notwithdraw", "Student cant't be withdraw");
/* 34 */         response.sendRedirect("RegistrarOffice/StudManagement.jsp?action" + action);
/*    */       }
/*    */     }
/*    */     catch (ClassNotFoundException|SQLException e)
/*    */     {
/* 38 */       e.printStackTrace();
/*    */     }
/*    */   }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     controller.Studentwithdraw
 * JD-Core Version:    0.7.0.1
 */