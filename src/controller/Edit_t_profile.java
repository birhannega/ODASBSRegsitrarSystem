package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RegisterTeacher;

@WebServlet(name = "ProfileEditor", urlPatterns = { "/ProfileEditor" })
public class Edit_t_profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String id=request.getParameter("field0"),
            fname=request.getParameter("field1"),
            lname=request.getParameter("field2"),
            bdate=request.getParameter("field3"),
            address=request.getParameter("field4"),
            gender=request.getParameter("field5"),
            hdate=request.getParameter("field6"),
            phone=request.getParameter("field7"),
            qualification=request.getParameter("field8"),
            experience=request.getParameter("field9"),
            c_person=request.getParameter("field10");
   
            
     RegisterTeacher edit=new RegisterTeacher();
          try {
			int rowsaffected=edit.editTeacherProfile(fname, lname, bdate, address, gender, hdate, phone, qualification, experience, c_person,id);
			if(rowsaffected>=1)
			{
				request.getSession().setAttribute("updated", "Profile Updated Successfully");
				response.sendRedirect("RegistrarOffice/editTeacherProfile.jsp?");
			}
			else
			{
				request.getSession().setAttribute("updated", "Profile Update not Successfull");
				response.sendRedirect("RegistrarOffice/editTeacherProfile.jsp?");
			}
			
		} catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		} 
     
     
	}

}
