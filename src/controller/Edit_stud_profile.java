package controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.Studregistration;


@WebServlet(urlPatterns={"/Edit_stud_profile"})
public class Edit_stud_profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	           String id=request.getParameter("field0"),
	            fname=request.getParameter("field1"),
	            mdname=request.getParameter("field2"),
	            lname=request.getParameter("field3"),
	            bdate=request.getParameter("field4"),
	            gender=request.getParameter("field5"),
	            cperson=request.getParameter("field6"),
	            ayear=request.getParameter("field7"),
	            zone=request.getParameter("field8"),
	            
	            wereda=request.getParameter("field9"),
	             hobby=request.getParameter("field10"),
	            address=request.getParameter("field11"),
	            section=request.getParameter("field12"),
	            phone=request.getParameter("field13"),
	            oda=request.getParameter("field14"),
	            currentState=request.getParameter("field15");
	   
	            
	                Studregistration editprofile=new Studregistration();
	          try {
	      		int saveupdat=editprofile.EditStudProfile(fname,mdname, lname, bdate, gender, cperson, ayear, zone, wereda, phone, address,currentState,section,oda,id);
	      		if(saveupdat>=1){
	    			request.getSession().setAttribute("updated", " student profile successfuly updated");
	    			response.sendRedirect("RegistrarOffice/Edit_student_profile.jsp");
	    		}
	    		else{request.getSession().setAttribute("updated", " oops student profile  update failed");
	    		response.sendRedirect("RegistrarOffice/Edit_student_profile.jsp");
	    		}
	    	
				
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} 
	     
	     
	}

}
