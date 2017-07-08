/*    */ package controller;
/*    */ 
/*    */ import java.io.IOException;
/*    */ import java.sql.SQLException;
/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.annotation.WebServlet;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import model.GetSection;
/*    */ 
/*    */ @WebServlet(description="choose Grade and section", urlPatterns={"/ChooseSection"})
/*    */ public class ChooseSection
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
/* 31 */     String section = request.getParameter("grade");String subject = request.getParameter("subject");
/* 32 */     GetSection getsec = new GetSection();
/*    */     try
/*    */     {
/* 34 */       getsec.GetClass_section(section, subject);
/*    */     }
/*    */     catch (ClassNotFoundException|SQLException e)
/*    */     {
/* 39 */       e.printStackTrace();
/*    */     }
/*    */   }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     controller.ChooseSection
 * JD-Core Version:    0.7.0.1
 */