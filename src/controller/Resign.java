/*    */ package controller;
/*    */ 
/*    */ import java.io.IOException;
/*    */ import java.sql.SQLException;
/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.annotation.WebServlet;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;

import model.AuthenticateUser;
/*    */ import model.ResignTeacher;
/*    */ 
/*    */ @WebServlet(urlPatterns={"/Resign"})
/*    */ public class Resign
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
/* 29 */     String Status = "Resigned"; String teacherid = request.getParameter("teacherid");
/*    */     try
/*    */     {
/* 31 */       int resigned = ResignTeacher.Resign(Status, teacherid);
/* 32 */       if (resigned >= 1)
/*    */       {
	             AuthenticateUser close_account=new AuthenticateUser();
	             int closed=close_account.closeAccount(teacherid);
	             if(closed>=1)
	             {
/* 33 */         request.getSession().setAttribute("resigned", "Teacher succsesfully Resigned");
/* 34 */         response.sendRedirect("RegistrarOffice/TeacherManagement.jsp");
/*    */       }
	             
}
/*    */       else
/*    */       {
/* 37 */         request.getSession().setAttribute("notresignd", "Teacher not resigned");
/* 38 */         response.sendRedirect("RegistrarOffice/TeacherManagement.jsp");
/*    */       }
/*    */     }
/*    */     catch (ClassNotFoundException|SQLException e)
/*    */     {
/* 42 */       e.printStackTrace();
/*    */     }
/*    */   }
/*    */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     controller.Resign
 * JD-Core Version:    0.7.0.1
 */