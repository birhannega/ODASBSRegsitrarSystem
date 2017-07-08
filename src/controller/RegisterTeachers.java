/*     */ package controller;
/*     */ 
/*     */ import databaseConnection.Dbconnection;
/*     */ import java.io.IOException;
/*     */ import java.io.InputStream;

/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import java.sql.Statement;
/*     */ import javax.servlet.ServletException;
/*     */ import javax.servlet.annotation.MultipartConfig;
/*     */ import javax.servlet.annotation.WebServlet;
/*     */ import javax.servlet.http.HttpServlet;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import javax.servlet.http.Part;
/*     */ import model.RegisterTeacher;
/*     */ 
/*     */ @WebServlet(description="teacher registration servelet", urlPatterns={"/RegisterTeacher"})
/*     */ @MultipartConfig(maxFileSize=16177215L)
/*     */ public class RegisterTeachers
/*     */   extends HttpServlet
/*     */ {
/*     */   private static final long serialVersionUID = 1L;
/*     */   
/*     */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/*  32 */     String status = "Active";
/*  33 */     String teacherId = null;
/*     */     
/*  35 */     InputStream inputStream = null;
/*  36 */     String branch = request.getParameter("branch");
/*  37 */     String firstname = request.getParameter("fname");
/*  38 */     String lname = request.getParameter("lname");
/*  39 */     String bdate = request.getParameter("bdate");
/*     */     
/*  41 */     String gender = request.getParameter("sex");
/*  42 */     String cperson = request.getParameter("cpname");
/*  43 */     String phone = request.getParameter("tel");
/*     */     
/*  45 */     String experience = request.getParameter("experience");
/*  46 */     String address = request.getParameter("aname");
/*  47 */     String qualification = request.getParameter("qualification");
/*     */     
/*  49 */     String hiredate = request.getParameter("hdate");
/*     */     
/*  51 */     Part filePart = request.getPart("photo");
/*  53 */     if (filePart != null)
/*     */     {
/*  55 */       System.out.println(filePart.getName());
/*  56 */       System.out.println(filePart.getSize());
/*  57 */       System.out.println(filePart.getContentType());
/*     */       
/*     */ 
/*  60 */       inputStream = filePart.getInputStream();
/*     */     }
/*     */     try
/*     */     {
/*  69 */       Dbconnection dbcon = new Dbconnection();
/*  70 */       Statement st = dbcon.getConnection().createStatement();
/*     */       
/*  72 */       String sql = "Select AcademicYear,teacheriterator from TBL_setup where calandar_status= '1'";
/*     */       
/*  74 */       ResultSet rs = st.executeQuery(sql);
/*  75 */       if (rs.next())
/*     */       {
/*  76 */         String year = rs.getString("AcademicYear");String index = rs.getString("teacheriterator");
/*  78 */         if (index.length() == 1) {
/*  79 */           index = "00".concat(index);
/*  81 */         } else if (index.length() == 2) {
/*  82 */           index = "0" + index;
/*     */         }
/*  85 */         teacherId = "R/".concat(index) + "/".concat(year);
/*     */       }
/*     */       else
/*     */       {
/*  90 */         System.out.println("error");
/*     */       }
/*     */     }
/*     */     catch (ClassNotFoundException|SQLException e)
/*     */     {
/*  95 */       e.printStackTrace();
/*     */     }
/*  98 */     int rowsinserted = RegisterTeacher.register(teacherId, firstname, lname, gender, bdate, cperson, hiredate, 
/*  99 */       address, qualification, phone, experience, inputStream, branch, status);
/* 100 */     if (rowsinserted >= 1)
/*     */     {
/* 103 */       Dbconnection dbcon = new Dbconnection();
/* 104 */       Statement st = null;
/*     */       try
/*     */       {
/* 108 */         st = dbcon.getConnection().createStatement();
/* 109 */         String sql = "update TBL_setup set teacheriterator=teacheriterator+1 ";
/* 110 */         int i = st.executeUpdate(sql);
/* 111 */         if (i <= 0) {
/*     */           return;
/*     */         }
/* 112 */         String message = "<span class=' alert alert-success'>Teacher successfully registered</span>";
/* 113 */         request.getSession().setAttribute("registered", message);
/* 114 */         response.sendRedirect("RegistrarOffice/registerTeacher.jsp");
/*     */       }
/*     */       catch (ClassNotFoundException|SQLException e1)
/*     */       {
/* 119 */         e1.printStackTrace();
/*     */       }
/*     */     }
/*     */     else
/*     */     {
/* 122 */       response.setContentType("text/html");
/* 123 */       request.getSession().setAttribute("notregistered", "Teacher not registered");
/* 124 */       response.sendRedirect("RegistrarOffice/registerTeacher.jsp");
/*     */     }
/*     */   }
/*     */   
/*     */   protected void doGet(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/* 130 */     response.setContentType("text/html");
/* 131 */     doPost(request, response);
/*     */   }
/*     */ }


/* Location:           C:\workspace\ODASBS\WebContent\WEB-INF\classes\
 * Qualified Name:     controller.RegisterTeachers
 * JD-Core Version:    0.7.0.1
 */