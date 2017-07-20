package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.UpdateMarkPolicy;

/**
 * Servlet implementation class UpdatePolicy
 */
@WebServlet("/UpdatePolicy")
public class UpdatePolicy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String Grade=request.getParameter("Grade"),
			mark=request.getParameter("mark");
	
	int grade=Integer.valueOf(Grade);
	float marks=Float.valueOf(mark);
	UpdateMarkPolicy policy=new UpdateMarkPolicy();
	
	 Date date=new Date(); 
	 SimpleDateFormat dateFormat=new SimpleDateFormat("Y");
	 String curYear=dateFormat.format(date);
	 int year=Integer.valueOf(curYear);
	
	try {
		int updated=policy.updatePolicy(grade, marks,year);
		if(updated>=1)
		{
			request.getSession().setAttribute("updated", "scale updated successfully");
			response.sendRedirect("RegistrarOffice/ScaleManagement.jsp");
		}
		else
		{
			int created=policy.CreatePolicy(grade, marks,year);
			if(created>=1)
			{
				request.getSession().setAttribute("updated", "scale updated successfully");
				response.sendRedirect("RegistrarOffice/ScaleManagement.jsp");
			}
			else
			{
			request.getSession().setAttribute("updated", "scale not  updated");
			response.sendRedirect("RegistrarOffice/ScaleManagement.jsp");
		}
		}
	} catch (ClassNotFoundException | SQLException e) {
	
		e.printStackTrace();
	}
	
	}

}
