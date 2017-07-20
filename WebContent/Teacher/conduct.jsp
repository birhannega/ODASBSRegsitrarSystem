<%@page import="databaseConnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>students conduct Evaluation</title>


<style type="text/css">
.error {
	color: red;
}
</style>
</head>

<%
if(session.getAttribute("user")==null)
{
	 response.sendRedirect("../index.jsp");	
}
else
{
	String ActiveUSer=(String)(session.getAttribute("user")),grade=null,section=null;
%>
<body>

	<div class="container-fluid">

		<strong>Students conduct Evaluation form</strong>
		<%
	Dbconnection dbcon_conduct=new Dbconnection();
	Connection connection=dbcon_conduct.getConnection();
	Statement conductstatement=connection.createStatement();
	String TeacherID=null;
	ResultSet rs=conductstatement.executeQuery("select TeacherId from TBL_USers where userName='"+ActiveUSer+"'");
	if(rs.next())
	{
		TeacherID=rs.getString(1);
	}
    String  query="select Grade,Section_id from TBL_HomeRoom where TeacherId='"+TeacherID+"'";
	ResultSet res_student=conductstatement.executeQuery(query);
      if(res_student.next())
      {
    	  grade=res_student.getString(1);
    	  section=res_student.getString(2);  
    	  ResultSet rs_section=conductstatement.executeQuery("select Stud_id, FirstName,LastName from TBl_student where Grade='"+grade+"'and Section_id='"+section+"'");
     %>
		<table class="table table-bordered" id="conduct">
			<%    	  
    	  while(rs_section.next())
      {
   	  %>
			<tr>
				<td><%=rs_section.getString(1) %></td>
				<td><%=rs_section.getString(2)+" "+rs_section.getString(3) %></td>
				<td>
					<div class="form-inline ">
						<form action="">
							<input type="hidden" name="studid"
								value="<%=rs_section.getString(1) %>%>"> <input
								type="number" max="5" min="0" name="rate" required="required"
								class="form-control "> <input type="submit"
								class="btn btn-primary ">
						</form>
					</div>
				</td>
			</tr>
			<% }%>
		</table>
		<% 
     }
      else
      {
     %>
		<div class="alert alert-warning">
			<strong>Sorry only home room teacers can do it</strong>
		</div>
		<%
      }
      
      
	%>



	</div>
	<script type="text/javascript">
	$(document).ready(function() {
		$('#conduct').bdt();

	})
</script>
	<script type="text/javascript" src="../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>
</body>
<%} %>
</html>