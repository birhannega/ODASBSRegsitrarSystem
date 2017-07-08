<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.Year"%>
<%@ page import="java.sql.*"%>
    <%@ page import="java.util.Date" %>
      <%@ page import="databaseConnection.Dbconnection" %>
<%@page import="model.Homeroom_List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% if(session.getAttribute("registrar")==null) 
    {
    	
    	response.sendRedirect("../index.jsp");
    }
    else
    {
    	String branch=null;
    	Dbconnection dbconnection=new Dbconnection();
    	Statement statement=dbconnection.getConnection().createStatement();
    	ResultSet resultSet=statement.executeQuery("select branch from TBL_Users where userName='"+session.getAttribute("registrar").toString()+"'");
    	if(resultSet.next())
    	{
    		branch=resultSet.getString(1);
    	}
    
    %>
    
      
      
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



</head>


<body>
 
   <span class="col-lg-offset-2 col-sm-12 col-xs-12 text-center text-info"><strong> Home room Teacher Assignment form </strong></span><br>

     <div class="panel-body">
     
  
   
    <form class="form-group " action="${pageContext.request.contextPath}/HomeRoomAssignment" method="post">
    
    	<div class="clearfix"> <strong> <span style="color:red"> ${hralreadyassigned} ${Tidexists}</span > <span style="color:green">${hrsuccess}</span> 
      ${failed} </strong> </div>
    			
    			<%
    			request.getSession().setAttribute("hralreadyassigned", null);
    			request.getSession().setAttribute("hrsuccess", null);
    			request.getSession().setAttribute("Tidexists", null);
    			request.getSession().setAttribute("failed", null);

    			
    			%>
   
  <div class="form-group col-lg-3 col-md-3 ">
    <label for="techerid">Teacher</label>
    
    
    <select class="form-control" name="teacherid" required="required">
    <option value="">Teacher ID</option>
    <%
    Dbconnection dbconn=new Dbconnection();
    		Connection con=dbconn.getConnection();
    		Statement statement_T=con.createStatement();
    		ResultSet rs=statement_T.executeQuery("select TeacherId,FirstName, LastName from TBL_teacher where branch='"+branch+"' and Status='Active'");
    		
    		while(rs.next())
    		{
    			String id=rs.getString("TeacherId");
    			String name=rs.getString("FirstName");
    			String lname=rs.getString("LastName");
    			String Full_name=name+" "+lname;
    			%>
    			
    			<option><%=id %></option>
    		<%
   	}
    %>
    
    </select>
    
   
  </div>
  <div class="form-group col-lg-3 col-md-3">
    <label for="grade">Grade</label>
    <select class="form-control" name="grade" required="required">
   <option value="">select Grade</option>
   <%
   

	ResultSet rs_grade=statement.executeQuery("select Grade from TBL_grade");
	
	while(rs_grade.next())
	{
		String grade=rs_grade.getString("Grade");
		//String section=rs_grade.getString("Section_Id");
		
				%>
		
		<option> <%=grade %> </option>
<%
}
%>

</select>
  
  </div>
  
  <div class="form-group col-lg-3 col-md-3">
    <label for="section">Section</label>
    <select class="form-control" name="section" required="required">
   <option value="">---select section</option>
   <%
	ResultSet rs_sect=statement.executeQuery("select distinct Section_id from section");
	
	while(rs_sect.next())
	{
		//String grade=rs_grade.getString("Grade");
	String section=rs_sect.getString("Section_id");
		
				%>
		
		<option> <%=section %> </option>
<%
}

%>

</select>
  </div>  
  <input type="hidden" name="branch" value="<%=branch%>">
  <br><button type="submit" class="btn  btn-info">Assign home room</button>
</form>
    
</div>
 <div class="container-fluid">
 <table class="table table-bordered table-condensed table-striped">
 <thead><tr>
 <th>Teacher ID</th>

   <th>Home room</th>
 </tr>
 </thead>
 <tbody>
<%--  <%

 String TeacherID=null,fname=null,lastname=null,grade=null,section=null;
 Homeroom_List hrm=new Homeroom_List();
 boolean actionperformed=hrm.ListHomeRomm(branch);
//out.println(actionperformed);
if(actionperformed)
{
	TeacherID=hrm.getId();
	section=hrm.getSection();
	grade=hrm.getGrade();
	
	%>
	<tr>
	<td><%=TeacherID %></td>
	<td><%=grade.concat(section) %></td>
	</tr>
	 <%
}
%> --%>
<%
//list currently assigned teachers///


Date curedate=new Date();
SimpleDateFormat dateFormat=new SimpleDateFormat("Y");
String Year=dateFormat.format(curedate);
 String TeacherID=null,fname=null,lastname=null,grade=null,section=null;
Statement listAssigned=dbconn.getConnection().createStatement();
ResultSet resultSet2=listAssigned.executeQuery("select * from TBL_HomeRoom where Branch='"+branch+"' and AcadamicYear='"+Year+"'");
while(resultSet2.next())
{
	TeacherID=resultSet2.getString("TeacherId");	
	section=resultSet2.getString("Section_id");
	grade=resultSet2.getString("Grade");
%>
	<tr>
	<td><%=TeacherID %></td>
	<td><%=grade.concat(section) %></td>
	</tr>
<%
}

	

%>

 
 
 </tbody>
 </table>
 
 </div> 


</body>
<%} %>
</html>