package controller;

import databaseConnection.Dbconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ChangePassword;

@WebServlet({ "/ChangePassword" })
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String Username = request.getParameter("username1");
		String old_password = request.getParameter("password_old");
		String new_password = request.getParameter("password1");
		String teacherID = request.getParameter("teacherid");

		Dbconnection dbcon = new Dbconnection();
		try {
			Connection con = dbcon.getConnection();
			Statement statement = con.createStatement();
			ResultSet rs_check_id = statement
					.executeQuery("select * from TBL_Users where TeacherId='" + teacherID + "'");
			if (rs_check_id.next()) {
				String type = rs_check_id.getString("type");
				out.print(type);
				ChangePassword changepass = new ChangePassword();
				int bool = changepass.changePassword(new_password, teacherID, Username, old_password);
			          if(bool>=1 && type.equalsIgnoreCase("R"))
			          {
			        	  request.getSession().setAttribute("changed", "<div class='alert alert-success'>Password changed successfully</div>");
							response.sendRedirect("RegistrarOffice/changePassword.jsp");
			          }else{
			        	  out.print("opertation not succssfull");
			          }
			          
			} 
			else {
				request.setAttribute("notfound", "The id you entered does not have any corresponding account");
				response.sendRedirect("Teacher/Tindex.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
