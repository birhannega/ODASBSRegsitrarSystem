/*     */ package controller;
/*     */ 
/*     */ import databaseConnection.Dbconnection;
/*     */ import java.io.IOException;
/*     */ import java.sql.Connection;
/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import java.sql.Statement;
/*     */ import java.text.SimpleDateFormat;
/*     */ import java.util.Date;

/*     */ import javax.servlet.ServletException;
/*     */ import javax.servlet.annotation.WebServlet;
/*     */ import javax.servlet.http.HttpServlet;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import model.subject_teacher;
/*     */ 
/*     */ @WebServlet(description="Teacher_Subject", urlPatterns={"/Subject_teacher_Assignment"})
/*     */ public class Subject_teacher_Assignment
/*     */   extends HttpServlet
/*     */ {
/*     */   private static final long serialVersionUID = 1L;
/*     */   
/*     */   protected void doGet(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/*  31 */     doPost(request, response);
/*     */   }
/*     */   
/*     */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/*  38 */     String teacher = request.getParameter("Teacherid");
/*  39 */     String grade = request.getParameter("grade");
/*  40 */     String section = request.getParameter("section");
/*  41 */     String branch = request.getParameter("branch");
/*  42 */     String subject = request.getParameter("subject");
/*  43 */     String subid = subject.concat(grade);
/*     */     
/*  45 */     int Grade = Integer.valueOf(grade).intValue();
/*  46 */     Date date = new Date();
/*  47 */     SimpleDateFormat sdf = new SimpleDateFormat("y");
/*  48 */     String year = sdf.format(date);
/*  49 */     int AcadamicYear = Integer.valueOf(year).intValue() - 7;
/*     */     
/*  51 */     String Section_number = null;
/*  52 */     int sectionCount = 0;
/*     */     try
/*     */     {
/*  54 */       String url = "subject=" + subject;
/*  55 */       request.getSession().setAttribute("address", url);
/*  56 */       String address = request.getSession().getAttribute("address").toString();
/*  57 */       address = address.replace("'", "");
/*  58 */       Dbconnection dbcon = new Dbconnection();
/*  59 */       Connection connnection = dbcon.getConnection();
/*  60 */       Statement statment = connnection.createStatement();
/*  61 */       String query = "select count(Section_id) from TBL_Subject_Teacher where TeacherId='" + teacher + "'";
/*  62 */       ResultSet rs = statment.executeQuery(query);
/*  63 */       if (rs.next())
/*     */       {
/*  67 */         Section_number = rs.getString(1);
/*  68 */         sectionCount = Integer.valueOf(Section_number).intValue();
/*  69 */         if (sectionCount >= 4)
/*     */         {
/*  71 */           request.getSession().setAttribute("overlimit", "This Teacher has reached maximum limit to be subject Teacher");
/*  72 */           response.sendRedirect("RegistrarOffice/enrol.jsp?" + address);
/*     */         }
/*     */         else
/*     */         {
/*  77 */           Statement statment1 = connnection.createStatement();
/*  78 */           ResultSet result = statment1.executeQuery("select TeacherId from TBL_Subject_Teacher  where Section_id='" + section + "' and Grade='" + grade + "' and Subject_id='" + subid + "' ");
/*  79 */           if (result.next())
/*     */           {
/*  81 */             request.getSession().setAttribute("alreadyassigned", "This Subject is already assigned ");
/*  82 */             response.sendRedirect("RegistrarOffice/enrol.jsp?" + address);
/*     */           }
/*     */           else
/*     */           {
/*  87 */             int res = subject_teacher.AssignTeacher(teacher, subid, Grade, section, AcadamicYear, branch);
/*  89 */             if (res >= 1)
/*     */             {
/*  92 */               String message_ass = "Teacher Assigned for subject ";
/*  93 */               request.getSession().setAttribute("assigned", message_ass);
/*  94 */               response.sendRedirect("RegistrarOffice/enrol.jsp?" + address);
/*     */             }
/*     */             else
/*     */             {
/* 102 */               request.setAttribute("notassigned", "Teacher not Assigned for subject ");
/* 103 */               response.sendRedirect("RegistrarOffice/enrol.jsp?" + address);
/*     */             }
/*     */           }
/*     */         }
/*     */       }
/* 113 */       else if (!rs.next())
/*     */       {
/* 118 */         Statement statment1 = connnection.createStatement();
/* 119 */         ResultSet result = statment1.executeQuery("select TeacherId from TBL_Subject_Teacher  where Section_id='" + section + "' and Grade='" + grade + "' and Subject_id='" + subid + "' ");
/* 120 */         if (result.next())
/*     */         {
/* 122 */           request.setAttribute("alreadyassigned", "This Subject is already assigned ");
/* 123 */           request.getRequestDispatcher("RegistrarOffice/Teacher_subject.jsp").forward(request, response);
/*     */         }
/*     */         else
/*     */         {
/* 128 */           int res = subject_teacher.AssignTeacher(teacher, subid, Grade, section, AcadamicYear, branch);
/* 130 */           if (res >= 1)
/*     */           {
/* 133 */             String message_ass = "Teacher Assigned for subject ";
/* 134 */             request.getSession().setAttribute("assigned", message_ass);
/* 135 */             response.sendRedirect("RegistrarOffice/enrol.jsp?" + address);
/*     */           }
/*     */           else
/*     */           {
/* 143 */             request.setAttribute("notassigned", "Teacher not Assigned for subject ");
/* 144 */             response.sendRedirect("RegistrarOffice/enrol.jsp?" + address);
/*     */           }
/*     */         }
/*     */       }
/*     */     }
/*     */     catch (ClassNotFoundException e)
/*     */     {
/* 156 */       e.printStackTrace();
/*     */     }
/*     */     catch (SQLException e)
/*     */     {
/* 159 */       e.printStackTrace();
/*     */     }
/*     */   }
/*     */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     controller.Subject_teacher_Assignment
 * JD-Core Version:    0.7.0.1
 */